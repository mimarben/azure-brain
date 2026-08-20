---
title: AZ-900 — Roadmap de estudio
tags: [certification, roadmap]
certification: [AZ-900]
updated: 2026-08-17
sources:
  - https://learn.microsoft.com/es-es/training/courses/az-900t00
  - https://learn.microsoft.com/es-es/training/paths/microsoft-azure-fundamentals-describe-cloud-concepts/
  - https://learn.microsoft.com/es-es/training/paths/azure-fundamentals-describe-azure-architecture-services/
  - https://learn.microsoft.com/es-es/training/paths/describe-azure-management-governance/
  - https://learn.microsoft.com/es-es/training/paths/introduction-cloud-infrastructure-apply-azure-skills-guided-projects/
---

# Roadmap de estudio — AZ-900

Plan de estudio por **autoestudio gratuito**: las 3 rutas de aprendizaje oficiales que componen el curso [AZ-900T00](https://learn.microsoft.com/es-es/training/courses/az-900t00) (~24 h de estimación oficial), que mapean 1:1 con las 3 áreas de la skills outline vigente desde el **20 de julio de 2026** (ver [INDEX.md](../../certifications/AZ-900/INDEX.md)). Sin curso de pago: la práctica se complementa con la **parte 4** de la serie (8 proyectos guiados con sandbox gratuito) y la **evaluación de práctica gratuita** del examen.

**Cómo usar este documento**: marca los checkboxes según avances. Cada bloque tiene un apartado *Notas propias* — ahí vuelcas tus apuntes del portal, cosas que te hayan costado o fallos de laboratorio; no lo toco yo al actualizar el repositorio salvo que me pidas fusionarlo con `knowledge/`.

**Mapa del examen**: [whiteboard de John Savill (MVP)](../../raw/savill-cert-materials/whiteboards/AZ-900-Whiteboard.png) — todo el ámbito del examen en una imagen — y su [handout de estudio](../../raw/savill-cert-materials/handouts/AZ900Handout.txt). Útiles como visión de conjunto antes de cada bloque y como repaso final.

**Sandbox**: los módulos incluyen ejercicios interactivos con sandbox gratuito de Microsoft Learn — no se necesita suscripción de Azure ni tarjeta para ninguno de los ejercicios de las rutas ni para los proyectos guiados del Bloque 4.

**Workflow por concepto** (la cadencia del brain): módulo de MS Learn → apuntes en *Notas propias* → crear/ampliar la página en [`knowledge/`](../../knowledge/) → tachar el checkbox del [INDEX](../../certifications/AZ-900/INDEX.md) → proyecto guiado relacionado en el Bloque 4 → guardar snippets de CLI/PowerShell en [`examples/`](../../examples/).

> **Si vienes de AZ-104**: con los bloques 0–1 ya hechos, gran parte del Bloque 2 de aquí te será familiar (componentes arquitectónicos, Entra ID, RBAC aparecen en ambas rutas). Úsalo como repaso rápido y dedica el tiempo extra a conceptos de nube (Bloque 1) y administración/gobernanza (Bloque 3), que AZ-900 cubre con más profundidad de lo que parece.

## Progreso general

- [X] Bloque 1 — Descripción de los conceptos de la nube (25–30%)
- [X] Bloque 2 — Descripción de la arquitectura y los servicios de Azure (35–40%)
- [X] Bloque 3 — Descripción de la administración y la gobernanza de Azure (30–35%)
- [X] Bloque 4 — Proyectos guiados (opcional, recomendado)
- [X] Evaluación de práctica gratuita superada
- [ ] Examen AZ-900 programado
- [ ] Examen AZ-900 aprobado (fecha: _pendiente_)

---

## Bloque 1 — Descripción de los conceptos de la nube (25–30%)

### 1.1 [Introducción a la infraestructura en la nube: Descripción de los conceptos de la nube](https://learn.microsoft.com/es-es/training/paths/microsoft-azure-fundamentals-describe-cloud-concepts/) (3 módulos)

- [X] [Descripción de la informática en la nube](https://learn.microsoft.com/es-es/training/modules/describe-cloud-compute/) — definición, modelos de implementación, responsabilidad compartida → [[Shared Responsibility Model]].

- [ ] [Descripción de las ventajas de usar servicios en la nube](https://learn.microsoft.com/es-es/training/modules/describe-benefits-use-cloud-services/) — alta disponibilidad, escalabilidad, confiabilidad, previsibilidad, seguridad, gobernanza.

- [ ] [Descripción de los tipos de servicio en la nube](https://learn.microsoft.com/es-es/training/modules/describe-cloud-service-types/) — IaaS, PaaS, SaaS y casos de uso de cada uno

**Objetivos del examen:** definir informática en la nube · modelos de nube (público/privado/híbrido) y casos de uso · modelo basado en consumo y comparación de precios · computación serverless · [[Shared Responsibility Model]] · ventajas (alta disponibilidad, escalabilidad, confiabilidad/previsibilidad, seguridad/gobernanza, capacidad de administración) · IaaS/PaaS/SaaS y cuál encaja en cada escenario.

> **Notas propias:**

---

## Bloque 2 — Descripción de la arquitectura y los servicios de Azure (35–40%)

### 2.1 [Introducción a la infraestructura en la nube: Descripción de la arquitectura y los servicios de Azure](https://learn.microsoft.com/es-es/training/paths/azure-fundamentals-describe-azure-architecture-services/) (5 módulos)

- [ ] [Describir los componentes arquitectónicos principales de Azure](https://learn.microsoft.com/es-es/training/modules/describe-core-architectural-components-of-azure/) — infraestructura física (regiones, region pairs, AZs), recursos, RGs, suscripciones, management groups
- [ ] [Descripción de los servicios de proceso de Azure](https://learn.microsoft.com/es-es/training/modules/describe-azure-compute-networking-services/) — contenedores vs VMs vs funciones, VMSS, [[Azure Virtual Desktop]], opciones de hospedaje
- [ ] [Descripción de los servicios de red de Azure](https://learn.microsoft.com/es-es/training/modules/describe-azure-networking-services/) — VNets, subredes, peering, DNS, VPN Gateway, ExpressRoute, endpoints públicos/privados → [[Azure Networking]] · [[Private Endpoints]]
- [ ] [Descripción de los servicios de almacenamiento de Azure](https://learn.microsoft.com/es-es/training/modules/describe-azure-storage-services/) — tipos de almacenamiento, tiers, redundancia (LRS/ZRS/GRS), AzCopy, Storage Explorer, Azure File Sync, Azure Migrate, Data Box
- [ ] [Descripción de la identidad, el acceso y la seguridad de Azure](https://learn.microsoft.com/es-es/training/modules/describe-azure-identity-access-security/) — [[Entra ID]], autenticación (SSO, MFA, passwordless), acceso condicional, [[Azure RBAC]], Confianza Cero, defensa en profundidad, Microsoft Defender for Cloud → [[Managed Identities]] · [[Key Vault]]

**Objetivos del examen:** jerarquía completa (recurso → RG → suscripción → management group) · regiones/region pairs/AZs · cómputo (VMs, VMSS, contenedores, [[AKS]], Functions, [[Azure Virtual Desktop]]) · redes (VNet, subredes, peering, DNS, VPN Gateway, ExpressRoute, public/private endpoints) · almacenamiento (cuentas, tiers, redundancia, migración) · identidad y seguridad (Entra ID, métodos de autenticación, acceso condicional, RBAC, Confianza Cero, Defender for Cloud).

Conceptos del repo: [[Azure Networking]] · [[Private Endpoints]] · [[Entra ID]] · [[Azure RBAC]] · [[AKS]] · [[Azure Virtual Desktop]] (stubs).
Docs: la mayoría de temas tienen copia local en `raw/azure-docs/articles/` (ver `storage/`, `virtual-network/`, `containers/`...); Entra ID sin copia local.

> **Notas propias:**

---

## Bloque 3 — Descripción de la administración y la gobernanza de Azure (30–35%)

### 3.1 [Introducción a la infraestructura en la nube: Descripción de la administración y la gobernanza de Azure](https://learn.microsoft.com/es-es/training/paths/describe-azure-management-governance/) (4 módulos)

- [ ] [Descripción de la administración de costos en Azure](https://learn.microsoft.com/es-es/training/modules/describe-cost-management-azure/) — factores de coste, Pricing Calculator, TCO Calculator, Cost Management, etiquetas
- [ ] [Descripción de las características y herramientas de Azure para la gobernanza y el cumplimiento](https://learn.microsoft.com/es-es/training/modules/describe-features-tools-azure-for-governance-compliance/) — Azure Policy, bloqueos de recursos, Microsoft Purview
- [ ] [Descripción de las características y herramientas para administrar e implementar recursos de Azure](https://learn.microsoft.com/es-es/training/modules/describe-features-tools-manage-deploy-azure-resources/) — Portal, [[Azure Cloud Shell]], Azure CLI/PowerShell, Azure Arc, IaC, plantillas ARM ([[Terraform vs Bicep]] · [[ARM Templates]])
- [ ] [Descripción de las herramientas de supervisión de Azure](https://learn.microsoft.com/es-es/training/modules/describe-monitoring-tools-azure/) — Azure Advisor, Azure Service Health, Azure Monitor (Log Analytics, alertas, Application Insights)

**Objetivos del examen:** factores que afectan al coste · calculadoras · Cost Management · etiquetas · Azure Policy y bloqueos · Purview · herramientas de gestión (Portal, Cloud Shell, CLI, PowerShell, Arc, IaC) · herramientas de supervisión (Advisor, Service Health, Azure Monitor y componentes).

Conceptos del repo: [[Azure Cloud Shell]] · [[ARM Templates]] · [[Terraform vs Bicep]] (stubs).
Docs: local en `raw/azure-docs/articles/` — `governance/`, `cost-management-billing/`, `azure-resource-manager/`, `azure-portal/`. Azure Monitor sin copia local.

> **Notas propias:**

---

## Bloque 4 — Proyectos guiados (opcional, recomendado)

### 4.1 [Aplicación de aptitudes de Azure en proyectos guiados](https://learn.microsoft.com/es-es/training/paths/introduction-cloud-infrastructure-apply-azure-skills-guided-projects/) (8 proyectos)

Práctica real con sandbox gratuito, guiada paso a paso. Cada proyecto consolida un área del examen — haz al menos 3–4, priorizando tus puntos débiles. Resultado de cada uno → anotarlo en [`labs/AZ-900/`](../../labs/AZ-900/).

- [X] [Implementación de un sitio web estático con Azure Blob Storage](https://learn.microsoft.com/es-es/training/modules/guided-project-deploy-static-website-blob-storage/) — hospedaje web en Blob Storage (Bloques 2–3)

- [X] [Organización y protección de recursos con etiquetas y bloqueos](https://learn.microsoft.com/es-es/training/modules/guided-project-organize-resources-tags-locks/) — tags + locks (Bloque 3)

- [X] [Creación de un punto de conexión de sitio web sencillo con Azure Functions](https://learn.microsoft.com/es-es/training/modules/guided-project-build-basic-website-endpoint-with-functions/) 

— serverless (Bloque 2)
- [X] [Configurar el nuevo acceso de los empleados (Id. de Entra y RBAC)](https://learn.microsoft.com/es-es/training/modules/guided-project-new-employee-access/) — privilegio mínimo (Bloque 2)

- [X] [Compartir archivos de forma segura](https://learn.microsoft.com/es-es/training/modules/guided-project-share-files-securely/) — blobs + directivas de acceso almacenadas + SAS (Bloques 2–3)

- [X] [Configuración de límites de protección de costos en Azure](https://learn.microsoft.com/es-es/training/modules/guided-project-cost-guardrails/) — presupuestos y alertas (Bloque 3)

- [ ] [Supervisión de Azure con alertas del registro de actividad y estado del servicio](https://learn.microsoft.com/es-es/training/modules/guided-project-monitor-service-health-activity-alerts/) 

— línea base de supervisión gratuita (Bloque 3)

- [ ] [Administración de recursos de Azure con Cloud Shell y la CLI de Azure](https://learn.microsoft.com/es-es/training/modules/guided-project-manage-resources-cloud-shell-cli/) — CLI desde línea de comandos (Bloque 3)

> **Nota:** esta ruta existe desde agosto de 2026 y la página del curso AZ-900T00 aún no la lista (seguía en 3 partes a 31/03/2026) — es oficial y parte de la misma serie.

> **Notas propias:**

---

## Plan de sesiones sugerido

Distribución orientativa (el curso oficial son 2 días instructor-led; en autoestudio, 1–2 semanas a ritmo pausado):

| Sesión | Contenido | Bloque |
|---|---|---|
| 1 | Conceptos de la nube (3 módulos) + repaso del whiteboard | 1 |
| 2 | Componentes arquitectónicos + servicios de proceso | 2 |
| 3 | Servicios de red + almacenamiento | 2 |
| 4 | Identidad, acceso y seguridad | 2 |
| 5 | Costes + gobernanza y cumplimiento | 3 |
| 6 | Herramientas de gestión/despliegue + supervisión | 3 |
| 7 | Proyectos guiados a elección (mínimo 3–4) | 4 |
| 8 | Repaso whiteboard + handout + evaluación de práctica | — |
| 9 | Repaso de puntos débiles | — |
| 10 | Examen | — |

---

## Antes del examen

- [ ] Completar la **evaluación de práctica gratuita** desde la [página oficial del examen AZ-900](https://learn.microsoft.com/es-es/credentials/certifications/exams/az-900/) y repasar donde falle
- [ ] Repasar el [whiteboard](../../raw/savill-cert-materials/whiteboards/AZ-900-Whiteboard.png) y el [handout](../../raw/savill-cert-materials/handouts/AZ900Handout.txt) de Savill completos
- [ ] Revisar que la skills outline en [INDEX.md](../../certifications/AZ-900/INDEX.md) sigue vigente (nota de cambio actual: 20/07/2026)
- [ ] Repasar los stubs de `knowledge/` completados durante el estudio ([[Shared Responsibility Model]], [[Entra ID]], [[Azure RBAC]], [[Azure Networking]], [[Private Endpoints]]...)
- [ ] Programar el examen desde [tu perfil de Microsoft Learn](https://learn.microsoft.com/es-es/users) (usa una cuenta personal MSA para no perder los registros)

## Relacionado

- [Índice de la certificación](../../certifications/AZ-900/INDEX.md) — resumen y skills outline oficial
- [Laboratorios AZ-900](../../labs/AZ-900/README.md) — proyectos guiados y resultados
- [[Shared Responsibility Model]] · [[Entra ID]] · [[Azure RBAC]] · [[Azure Networking]] · [[Private Endpoints]] · [[AKS]] · [[Azure Virtual Desktop]] · [[Azure Cloud Shell]] · [[Terraform vs Bicep]] · [[Key Vault]] · [[Managed Identities]]
