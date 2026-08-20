# Azure Brain — instrucciones del mantenedor

Este repositorio es un cerebro técnico persistente sobre Microsoft Azure, construido en Markdown compatible con Obsidian. No es una colección de apuntes: es una wiki viva que se acumula durante años — aprendizaje desde cero, preparación de certificaciones, laboratorios, arquitecturas, buenas prácticas, troubleshooting e incidencias reales de trabajo.

Filosofía base: [karpathy.txt](karpathy.txt) (patrón "LLM Wiki"). Este documento adapta ese patrón al dominio Azure. Si hay conflicto entre ambos, este documento manda.

**Reglas duras: nunca generes HTML ni PDF. Siempre Markdown. Nunca dupliques conocimiento entre páginas — amplía la existente o crea un enlace, no copies contenido.**

## Las tres capas

### `raw/` — fuentes, inmutable

Documentación oficial de Microsoft, repos clonados, cursos, transcripciones, PDFs. **Nunca se edita.** Es la fuente de verdad que se cita, no se modifica.

Contenido actual:
- `raw/repos.txt` — manifiesto de repositorios que se pueden clonar o actualizar bajo `raw/`
- `raw/setup-raw.sh` / `raw/setup-raw.ps1` — scripts para sincronizar los repos listados en `raw/repos.txt`
- `raw/azure-docs/` — clon de [MicrosoftDocs/azure-docs](https://github.com/MicrosoftDocs/azure-docs)
- `raw/architecture-center/` — clon de architecture-center
- `raw/well-architected/` — clon de well-architected framework

Estos clones tienen su propio `.git` y están en `.gitignore` (son grandes y externos; no se versionan dentro de este repo). Al ingerir, cita la ruta del archivo fuente en el frontmatter (`sources:`).

### `knowledge/` — conocimiento consolidado

Un documento = un concepto. Contenido fusionado de múltiples fuentes, no un resumen de un único documento. Ejemplos: `azure-rbac.md`, `managed-identities.md`, `aks.md`, `hub-spoke.md`, `private-endpoints.md`.

Ante un concepto nuevo, decide siempre:
1. **¿Ya existe una página que lo cubre?** → amplíala, no dupliques.
2. **¿Es un concepto distinto?** → crea una página nueva y enlázala con las relacionadas.

### `certifications/` — rutas de estudio

Una carpeta por certificación, que contiene **únicamente** `INDEX.md` como guía de estudio (ver plantilla más abajo). No crear subcarpetas dentro de `certifications/<CERT>/` — notas y laboratorios viven en las carpetas de primer nivel `notes/` y `labs/` (ver abajo).

Certificaciones activas: AZ-104, AZ-500, AZ-140, AZ-305, AZ-400, AZ-700, AI-200, GH-900, AZ-900.

### `notes/` y `labs/` — material de estudio por certificación

Carpetas de primer nivel, con una subcarpeta por certificación activa: `notes/<CERT>/` (notas de estudio, roadmaps, auditorías de documentación, backlogs de conceptos) y `labs/<CERT>/` (índices y resultados de laboratorios prácticos). Se rellenan bajo demanda — no crear contenido hasta que exista material real, pero la subcarpeta de cada certificación activa se mantiene ya creada. El `INDEX.md` de cada certificación enlaza a su `notes/<CERT>/` y `labs/<CERT>/` correspondientes.

### Otras carpetas

- `examples/` — ejemplos de código reutilizables por tecnología (azure-cli, bicep, python, csharp, terraform, bash...), no atados a una certificación concreta.
- `assets/` — imágenes y diagramas exportados, cuando un diagrama no se pueda expresar en Mermaid.
- `log.md` — registro cronológico de ingestas, consultas y lints (ver formato abajo).
- `INDEX.md` — catálogo de todo el contenido de `knowledge/` y `certifications/`.
- Carpetas heredadas de un scaffold anterior (`agents/`, `architecture/`, `archive/`, `cheatsheets/`, `concepts/`, `processed/`, `prompts/`, `scripts/`, `templates/`) están vacías y en desuso por decisión explícita del usuario (se mantienen "por si acaso"). **No añadas contenido ahí** — si un concepto encaja en una de ellas, probablemente ya tiene su sitio natural en `knowledge/`, `certifications/`, `notes/`, `labs/` o `examples/`. Pregunta antes de reutilizar alguna.

## Frontmatter

Toda página de `knowledge/` y `certifications/*/INDEX.md` lleva YAML al inicio:

```yaml
---
title: Azure RBAC
aliases: [Azure RBAC]
tags: [identity, governance]
certification: [AZ-104, AZ-500, AZ-305]
updated: 2026-07-07
sources:
  - raw/azure-docs/articles/role-based-access-control/overview.md
---
```

- `title` — nombre legible del concepto (Title Case).
- `aliases` — igual al título. Necesario porque los ficheros usan kebab-case (`azure-rbac.md`) pero los enlaces de Obsidian usan Title Case (`[[Azure RBAC]]`); el alias es lo que hace que el enlace resuelva al fichero correcto.
- `tags` — categorías libres en minúscula (identity, networking, compute, security, governance, containers, storage, devops, ai, monitoring...).
- `certification` — qué certificaciones tocan este concepto (puede estar vacío).
- `updated` — fecha ISO de la última edición sustancial.
- `sources` — rutas dentro de `raw/` (o URLs) usadas para construir/actualizar la página.

## Nombres de fichero y enlaces

- Ficheros: kebab-case, sin espacios (`private-endpoints.md`, `hub-spoke.md`).
- Enlaces internos: siempre wikilinks en Title Case apoyados en el alias (`[[Azure RBAC]]`, `[[Managed Identities]]`), nunca rutas largas ni `.md` explícito.
- Cada página de `knowledge/` debe tener una sección `## Relacionado` con wikilinks a conceptos conectados. Los enlaces deben ser bidireccionales cuando tenga sentido: si A enlaza a B, revisa si B debería enlazar de vuelta a A.

## Plantilla de `certifications/<CERT>/INDEX.md`

```markdown
---
title: <CERT> — <Nombre oficial>
tags: [certification]
certification: [<CERT>]
updated: <fecha>
sources: []
---

# <CERT>: <Nombre oficial>

## Descripción
Qué es la certificación, a quién va dirigida, rol asociado.

## Objetivos
Qué demuestra quien la obtiene.

## Habilidades medidas
Áreas de la skills outline oficial con su peso aproximado (verificar contra Microsoft Learn antes del examen, cambian con el tiempo).

## Módulos
Lista de módulos/temas de estudio, cada uno con checkbox de progreso.

## Progreso
Estado actual: no iniciado / en curso / listo para examen / aprobado (con fecha).

## Laboratorios
Enlaces a `labs/<CERT>/` (carpeta de primer nivel).

## Conceptos relacionados
Wikilinks a páginas de `knowledge/` relevantes.

## Ejemplos
Enlaces a `examples/` relevantes (organizado por tecnología, no por certificación).
```

## Flujo de trabajo

### Ingesta (nueva fuente o curso)
1. Lee la fuente (en `raw/` o pegada por el usuario).
2. Identifica los conceptos que contiene.
3. Para cada concepto: amplía una página de `knowledge/` existente o crea una nueva.
4. Actualiza las certificaciones relacionadas (`certification:` en el frontmatter, sección "Conceptos relacionados" del INDEX).
5. Actualiza `INDEX.md` raíz.
6. Añade/revisa enlaces `## Relacionado` en ambas direcciones.
7. Añade una entrada a `log.md`.
8. Evita duplicados: si el concepto ya existe, no repitas contenido — mejora la página existente.

### Consulta
Busca primero en `INDEX.md`, luego abre las páginas relevantes de `knowledge/`. Si la respuesta genera una síntesis nueva de valor duradero (una comparación, un troubleshooting resuelto, una arquitectura discutida), ofrece guardarla como página nueva en vez de dejarla solo en el chat.

### Lint (bajo demanda)
Revisa: páginas huérfanas sin enlaces entrantes, contradicciones entre páginas, contenido desactualizado por versiones nuevas de Azure, conceptos mencionados repetidamente sin página propia, certificaciones sin `INDEX.md`.

## Formato de `log.md`

```markdown
## [2026-07-07] ingest | Shared Responsibility Model
Fuente: raw/azure-docs/articles/security/fundamentals/shared-responsibility.md
Páginas creadas: knowledge/shared-responsibility-model.md
Páginas actualizadas: certifications/AZ-900/INDEX.md, INDEX.md
```

Prefijo consistente (`## [YYYY-MM-DD] tipo | Título`) para poder usar `grep "^## \[" log.md`.

## Estilo de las páginas

- Documentos pequeños — un concepto por página, nada de páginas de miles de líneas.
- Tablas y listas antes que prosa larga.
- Diagramas Mermaid cuando aporten valor (arquitecturas, flujos, jerarquías).
- Ejemplos de código oficiales de Microsoft cuando existan: Azure CLI, PowerShell, Bicep, ARM, Terraform, C#, Python — en bloques con el lenguaje anotado.
- Cada página termina con `## Relacionado` (wikilinks) y opcionalmente `## Fuentes` si conviene detallar más allá del frontmatter.
