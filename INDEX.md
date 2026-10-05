# Índice

Catálogo de todo el contenido del repositorio. Se actualiza en cada ingesta. Ver [CLAUDE.md](CLAUDE.md) para las convenciones.

## Knowledge

| Página | Tags | Estado |
|---|---|---|
| [[Shared Responsibility Model]] | security, governance, fundamentals | Completa |
| [[Azure RBAC]] | identity, governance | Stub |
| [[Managed Identities]] | identity, security | Stub |
| [[Key Vault]] | security, identity | Stub |
| [[Azure Networking]] | networking | Stub |
| [[AKS]] | containers, compute | Stub |
| [[Entra ID]] | identity | Stub |
| [[Hub-Spoke]] | networking, architecture | Stub |
| [[Private Endpoints]] | networking, security | Stub |
| [[Terraform vs Bicep]] | devops, iac | Stub |
| [[Azure Virtual Desktop]] | compute, end-user-computing | Stub |
| [[Azure Cloud Shell]] | devops, tools | Stub |
| [[ARM Templates]] | devops, iac | Stub |

Notas de estudio por módulo: 12 fichas `knowledge/az900-*.md` (AZ-900, plantilla `_template-az900.md`, enlaces Learn × vídeo de Savill) y 27 fichas `knowledge/az104-*.md` (AZ-104, plantilla `_template-az104.md`, enlaces Learn + labs oficiales) — contenido a rellenar al estudiar. Checklists de uso: [AZ-900](certifications/AZ-900/INDEX.md) · [AZ-104](certifications/AZ-104/INDEX.md).

## Concepts — guías de decisión y comparativas

Transversales: cruzan varios servicios o módulos. Enlazan a las fichas de `knowledge/`, no las duplican.

| Guía | Qué resuelve | Cert |
|---|---|---|
| [Contenedores frente a máquinas virtuales](concepts/containers-vs-vms.md) | Cuándo contenedor y cuándo VM | AZ-104, AZ-900 |
| [Guía de decisión — opciones de cómputo](concepts/compute-decision-guide.md) | VM/VMSS, App Service, ACI, Container Apps, AKS, Functions, AVD | AZ-104, AZ-900, AZ-305 |
| [Guía de decisión — almacenamiento](concepts/storage-decision-guide.md) | Servicio, redundancia, tier y mecanismo de acceso | AZ-104, AZ-900 |
| [Guía de decisión — identidad y gobernanza](concepts/identity-governance-decision-guide.md) | RBAC vs Policy vs locks vs tags | AZ-104, AZ-500 |
| [Modelo mental de red — Bloque 4](concepts/networking-primer.md) | Mapa previo al Bloque 4: VNet, NSG, rutas, peering, endpoints | AZ-104, AZ-700 |

## Cheatsheets

Referencia rápida por área — comandos y cifras, sin teoría.

| Chuleta | Ámbito |
|---|---|
| [Azure CLI](cheatsheets/azure-cli.md) | Transversal: sesión, `--query`, RG, plantillas, locks |
| [AZ-104 Compute](cheatsheets/az-104-compute.md) | VM/VMSS, App Service, ACI, Container Apps, ACR |
| [AZ-104 Storage](cheatsheets/az-104-storage.md) | Cuentas, redundancia, tiers, SAS, red, azcopy |
| [AZ-104 Identidad y gobernanza](cheatsheets/az-104-identity-governance.md) | `az ad`, RBAC, Policy, locks, presupuestos |
| [AZ-104 Resumen por módulo](cheatsheets/az-104-resumen-modulos.md) | Tipos y taxonomías de los 28 módulos (imprimible), foco de examen |

## Certifications

| Cert | INDEX.md | Habilidades medidas (oficial) | Progreso |
|---|---|---|---|
| [AZ-900](certifications/AZ-900/INDEX.md) | ✅ | ✅ | **Estudio completado** — examen pendiente · [roadmap](notes/AZ-900/roadmap.md) |
| [AZ-104](certifications/AZ-104/INDEX.md) | ✅ | ✅ | **En curso** — bloques 0–1 hechos · [roadmap](notes/AZ-104/roadmap.md) |
| [AZ-500](certifications/AZ-500/INDEX.md) | ✅ | ✅ | No iniciado |
| [AZ-140](certifications/AZ-140/INDEX.md) | ✅ | ✅ | No iniciado |
| [AZ-305](certifications/AZ-305/INDEX.md) | ✅ | ✅ | No iniciado |
| [AZ-400](certifications/AZ-400/INDEX.md) | ✅ | ✅ | No iniciado |
| [AZ-700](certifications/AZ-700/INDEX.md) | ✅ | ✅ | No iniciado |
| [AI-200](certifications/AI-200/INDEX.md) | ✅ | ✅ | **En curso** — [roadmap](notes/AI-200/roadmap.md) |
| [GH-900](certifications/GH-900/INDEX.md) | ✅ | ✅ | No iniciado |

Vista global de las 9 certificaciones por nivel y dependencias: [certifications/ROADMAP.md](certifications/ROADMAP.md).

Todas las skills outline se importaron desde las guías de estudio oficiales de Microsoft Learn (`learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/<cert>`) — ver `sources:` en cada INDEX.md para la fecha de vigencia. Verificar contra Microsoft Learn antes de programar cada examen, ya que cambian periódicamente.

## Raw sources

- `raw/repos.txt` — manifiesto de repositorios descargables
- `raw/setup-raw.sh` / `raw/setup-raw.ps1` — scripts para clonar o actualizar `raw/`
- `raw/azure-docs/` — MicrosoftDocs/azure-docs
- `raw/architecture-center/` — Azure Architecture Center
- `raw/well-architected/` — Well-Architected Framework
- `raw/savill-cert-materials/` — whiteboards de ámbito de examen de John Savill (MVP): AZ-900, AZ-104, AZ-500, AZ-700, AZ-305 + handout de AZ-900
