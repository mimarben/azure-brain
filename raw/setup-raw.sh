#!/usr/bin/env bash
# setup-raw.sh
# Sincroniza raw/ desde repos.txt: clona/actualiza repos git y descarga
# archivos sueltos (PDFs, vídeos, slides...). Pensado para ejecutarse igual en
# cualquier PC (casa/trabajo) y reproducir la misma base de conocimiento.
#
# Ejecutar desde la raiz del repo:
#   ./raw/setup-raw.sh                  sincroniza todo (git + archivos)
#   ./raw/setup-raw.sh --full           clones con historial completo (por defecto shallow)
#   ./raw/setup-raw.sh --reclone        re-clona los repos existentes (útil para
#                                       reducir un clone completo a shallow)
#   ./raw/setup-raw.sh --only <patrón>  solo las fuentes cuyo nombre contiene <patrón>
#   ./raw/setup-raw.sh --dry-run        solo muestra lo que haría
#   ./raw/setup-raw.sh --help
#
# Por defecto los clones son superficiales (--depth 1): raw/ es solo fuente de
# lectura y así no se baja el historial. Ojo: el ahorro es notable en repos con
# mucho historial, pero azure-docs pesa ~34 GB por su propio contenido (miles de
# artículos + imágenes) y shallow apenas lo reduce. Usa --full si necesitas
# git log/blame del original.
#
# Formato de raw/repos.txt (una fuente por línea; '#' = comentario):
#   git  <carpeta> <url> [rama]          clona/actualiza un repo git
#   file <ruta>   <url> [sha256]         descarga un archivo; lo re-descarga si cambia
# Si el primer token NO es 'git' ni 'file', se asume 'git' (compatibilidad).
#
# Requisitos: git. curl y sha256sum (solo si se usan fuentes 'file').

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RAW_DIR="$REPO_ROOT/raw"
CONFIG_FILE="$SCRIPT_DIR/repos.txt"

SHALLOW=true      # por defecto clones --depth 1 (raw/ es solo lectura)
DRY_RUN=false
ONLY=""
RECLONE=false

usage() {
  sed -n '2,/^# Requisitos/p' "$0" | sed 's/^# \{0,1\}//'
  exit 0
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --shallow)  SHALLOW=true; shift ;;   # default; se mantiene por compatibilidad
    --full)     SHALLOW=false; shift ;;
    --reclone)  RECLONE=true; shift ;;
    --dry-run)  DRY_RUN=true; shift ;;
    --only)     ONLY="${2:-}"; shift 2 ;;
    --help|-h)  usage ;;
    *) echo "Argumento desconocido: $1 (prueba --help)" >&2; exit 1 ;;
  esac
done

command -v git >/dev/null 2>&1 || { echo "Falta 'git'. Instálalo antes de ejecutar." >&2; exit 1; }

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "No encuentro $CONFIG_FILE" >&2
  exit 1
fi

mkdir -p "$RAW_DIR"

ok=0
skip=0
fail=0
declare -a expected_git=()

echo "== Sincronizando raw/ desde $(basename "$CONFIG_FILE") =="
if [[ "$SHALLOW" == true ]]; then
  echo "   (shallow: clones --depth 1; usa --full para historial completo)"
else
  echo "   (full: clones con historial completo)"
fi
[[ "$RECLONE" == true ]]  && echo "   (reclone: los repos existentes se borran y re-clonan)"
[[ "$DRY_RUN"  == true ]] && echo "   (dry-run: no se ejecuta nada)"
[[ -n "$ONLY"  ]]          && echo "   (filtro --only: '$ONLY')"

# ¿El primer token es un tipo de fuente conocido?
is_source_type() { [[ "$1" == "git" || "$1" == "file" ]]; }

# ---------------------------------------------------------------------------
# sync_git <name> <url> [branch]
#   devuelve: 0 actualizado/nuevo, 1 fallo, 2 omitido (dry-run)
# ---------------------------------------------------------------------------
sync_git() {
  local name="$1" url="$2" branch="${3:-}"
  local dest="$RAW_DIR/$name"
  expected_git+=("$name")

  # --reclone: borrar un repo existente y clonarlo de nuevo. Útil para reducir
  # un clone completo (~30 GB en azure-docs) a shallow (~1-2 GB). Destructivo:
  # solo con flag explícito, y solo borra bajo raw/.
  if [[ "$RECLONE" == true && -d "$dest/.git" ]]; then
    echo "-> [reclone] $name  <-  $url${branch:+ (rama $branch)}"
    if [[ "$DRY_RUN" == true ]]; then
      echo "   (dry-run) rm -rf \"$dest\"  &&  git clone ..."
      return 2
    fi
    case "$dest" in
      "$RAW_DIR"/*) rm -rf "$dest" ;;
      *) echo "   !! me niego a borrar fuera de raw/: $dest" >&2; return 1 ;;
    esac
  fi

  if [[ -d "$dest/.git" ]]; then
    echo "-> [pull] $name"
    if [[ "$DRY_RUN" == true ]]; then
      echo "   (dry-run) git -C \"$dest\" pull --ff-only"
      return 2
    fi
    # Aviso: clone completo cuando el modo es shallow (ver --reclone para reducir)
    if [[ "$SHALLOW" == true && "$(git -C "$dest" rev-parse --is-shallow-repository 2>/dev/null)" == "false" ]]; then
      echo "   (i) $name es clone completo; --reclone lo reduciría a shallow (--depth 1)"
    fi
    if [[ -n "$(git -C "$dest" status --porcelain)" ]]; then
      echo "   !! $name tiene cambios locales sin confirmar; no se toca." >&2
      git -C "$dest" status --short | sed 's/^/      /' >&2
      return 1
    fi
    local before after out
    before="$(git -C "$dest" rev-parse --short HEAD 2>/dev/null || echo "?")"
    if out="$(git -C "$dest" pull --ff-only 2>&1)"; then
      after="$(git -C "$dest" rev-parse --short HEAD 2>/dev/null || echo "?")"
      if [[ "$before" == "$after" ]]; then
        echo "   sin cambios ($after)"
      else
        echo "   actualizado: $before -> $after"
      fi
      return 0
    else
      echo "   !! fallo al actualizar $name:" >&2
      printf '%s\n' "$out" | sed 's/^/      /' >&2
      return 1
    fi
  else
    echo "-> [clone] $name  <-  $url${branch:+ (rama $branch)}"
    local clone_args=(clone)
    [[ "$SHALLOW" == true ]] && clone_args+=(--depth 1)
    [[ -n "$branch" ]] && clone_args+=(--branch "$branch")
    clone_args+=("$url" "$dest")
    if [[ "$DRY_RUN" == true ]]; then
      echo "   (dry-run) git ${clone_args[*]}"
      return 2
    fi
    if git "${clone_args[@]}" 2>&1 | sed 's/^/      /'; then
      echo "   clonado ok"
      return 0
    else
      echo "   !! fallo al clonar $name (URL incorrecta o repo no disponible)" >&2
      return 1
    fi
  fi
}

# ---------------------------------------------------------------------------
# sync_file <dest_relativo> <url> [sha256]
#   Re-descarga solo si el servidor reporta cambios (ETag / Last-Modified → 304).
#   devuelve: 0 descarga/ok, 1 fallo, 2 omitido (dry-run)
# ---------------------------------------------------------------------------
sync_file() {
  local dest_rel="$1" url="$2" expected="${3:-}"
  local dest="$RAW_DIR/$dest_rel"
  local etag="$dest.etag"   # sidecar con el ETag para re-validar (304)
  local exists="nuevo"
  [[ -f "$dest" ]] && exists="existe"

  echo "-> [file:$exists] $dest_rel  <-  $url"

  if [[ "$DRY_RUN" == true ]]; then
    if [[ -f "$dest" ]]; then
      echo "   (dry-run) curl re-validación (If-None-Match / If-Modified-Since)"
    else
      echo "   (dry-run) curl -> $dest"
    fi
    [[ -n "$expected" ]] && echo "   (dry-run) verificar sha256 = $expected"
    return 2
  fi

  if ! command -v curl >/dev/null 2>&1; then
    echo "   !! falta 'curl' para descargar archivos 'file'." >&2
    return 1
  fi
  mkdir -p "$(dirname "$dest")"

  # Re-validación condicional: si el archivo existe, pedimos al servidor que solo
  # devuelva contenido si hay cambios. Combinamos If-None-Match (ETag) e
  # If-Modified-Since (Last-Modified): el que soporte el servidor decidirá.
  # Resultado 304 = sin cambios (no se reescribe el archivo).
  local http_code curl_args=(-sSL -o "$dest" -w '%{http_code}')
  if [[ -f "$dest" ]]; then
    curl_args+=(-z "$dest" --etag-save "$etag")
    [[ -f "$etag" ]] && curl_args+=(--etag-compare "$etag")
  else
    curl_args+=(--etag-save "$etag")
  fi
  http_code="$(curl "${curl_args[@]}" "$url" || true)"

  case "$http_code" in
    200) echo "   descargado/actualizado (HTTP 200)" ;;
    304) echo "   sin cambios (HTTP 304)" ;;
    000) echo "   !! fallo de red al descargar $url (¿sin conexión?)" >&2; return 1 ;;
    *)   echo "   !! fallo HTTP $http_code al descargar $url" >&2; return 1 ;;
  esac

  if [[ -n "$expected" ]]; then
    verify_sha256 "$dest" "$expected" || return 1
  fi
  return 0
}

verify_sha256() {
  local file="$1" expected="$2" actual
  if ! actual="$(sha256sum "$file" 2>/dev/null | awk '{print $1}')"; then
    echo "   !! no se pudo calcular sha256 de $file" >&2
    return 1
  fi
  if [[ "$actual" != "$expected" ]]; then
    echo "   !! checksum incorrecto en $(basename "$file")" >&2
    echo "      esperado: $expected" >&2
    echo "      actual:   $actual" >&2
    return 1
  fi
  echo "   sha256 ok ($actual)"
}

# ---------------------------------------------------------------------------
# Bucle principal
# ---------------------------------------------------------------------------
while IFS= read -r line || [[ -n "${line:-}" ]]; do
  [[ "$line" =~ ^[[:space:]]*# ]] && continue
  [[ -z "${line// /}" ]] && continue

  # tokenizar respetando comillas/espacios
  read -r -a tokens <<< "$line"
  [[ ${#tokens[@]} -lt 2 ]] && { echo "   !! línea inválida (se ignora): $line" >&2; continue; }

  src_type=""; name=""; url=""; extra=""
  if is_source_type "${tokens[0]}"; then
    src_type="${tokens[0]}"; name="${tokens[1]}"; url="${tokens[2]:-}"; extra="${tokens[3]:-}"
  else
    src_type="git"; name="${tokens[0]}"; url="${tokens[1]}"; extra="${tokens[2]:-}"
  fi

  [[ -z "$url" ]] && { echo "   !! falta URL para '$name' (se ignora)" >&2; continue; }
  [[ -n "$ONLY" && "$name" != *"$ONLY"* ]] && continue

  rc=0
  case "$src_type" in
    git)  sync_git  "$name" "$url" "$extra" || rc=$? ;;
    file) sync_file "$name" "$url" "$extra" || rc=$? ;;
  esac
  case $rc in
    0) ok=$((ok+1)) ;;
    2) skip=$((skip+1)) ;;
    *) fail=$((fail+1)) ;;
  esac
done < "$CONFIG_FILE"

# ---------------------------------------------------------------------------
# Aviso de clones huérfanos: presentes en raw/ pero no en repos.txt
# ---------------------------------------------------------------------------
if [[ "$DRY_RUN" != true ]]; then
  orphan=()
  while IFS= read -r d; do
    name="$(basename "$d")"
    found=false
    for e in "${expected_git[@]:-}"; do [[ "$e" == "$name" ]] && { found=true; break; }; done
    [[ "$found" == false ]] && orphan+=("$name")
  done < <(find "$RAW_DIR" -maxdepth 2 -name .git -type d 2>/dev/null | sed 's:/.git$::')

  if [[ ${#orphan[@]} -gt 0 ]]; then
    echo ""
    echo "== Clones huérfanos en raw/ (no están en repos.txt) =="
    printf '   %s\n' "${orphan[@]}"
    echo "   (se conservan; bórralos a mano si ya no los quieres)"
  fi
fi

echo ""
echo "== Resumen: $ok OK · $skip sin cambios/dry-run · $fail fallidos =="
[[ $fail -gt 0 ]] && exit 1
exit 0
