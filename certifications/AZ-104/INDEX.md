---
title: AZ-104 — Administrador de Microsoft Azure
tags: [certification]
certification: [AZ-104]
updated: 2026-09-28
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - https://learn.microsoft.com/en-us/training/courses/az-104t00
  - https://www.youtube.com/watch?v=0Knf9nub4-k
  - https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs
  - raw/savill-cert-materials/whiteboards/AZ-104-Whiteboard-v2.png
---

# AZ-104: Administrador de Microsoft Azure

## Descripción

Certificación para quien implementa, administra y supervisa el entorno Azure de una organización: redes virtuales, almacenamiento, cómputo, identidad, seguridad y gobernanza. Suele formar parte de un equipo más amplio y coordina con roles de redes, seguridad, bases de datos, desarrollo y DevOps.

## Objetivos

Familiaridad con sistemas operativos, redes, servidores y virtualización, más experiencia con PowerShell, Azure CLI, Azure Portal, plantillas ARM/Bicep y Microsoft Entra ID.

## Habilidades medidas

*Aptitudes medidas **desde el 17 de abril de 2026** según la guía oficial — composición verificada contra Microsoft Learn el 26/08/2026, sin cambios. Revisar de nuevo antes de programar el examen.*

| Área | Peso |
|---|---|
| Administración de identidades y gobernanza en Azure | 20-25% |
| Implementación y administración del almacenamiento | 15-20% |
| Implementación y administración de recursos de procesos de Azure | 20-25% |
| Implementación y administración de redes virtuales | 15-20% |
| Supervisión y mantenimiento de recursos de Azure | 10-15% |

## Módulos

Checklist secuencial del curso [AZ-104T00-A](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)): **28 módulos en 6 rutas oficiales** (composición verificada en Learn el 26/08/2026 — la ruta de prerrequisitos pasó de 1 a 2 módulos al incorporar el de plantillas ARM JSON). Cada línea: **módulo — Learn — mi nota**. El roadmap de estudio con bloques, objetivos y gaps está en [notes/AZ-104/roadmap.md](../../notes/AZ-104/roadmap.md).

Los vídeos de Savill para AZ-104 no se listan módulo a módulo (a diferencia de AZ-900): usar la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) (~20 h, buscar por tema) y el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k) como repaso final.

### Ruta 0 — [Prerrequisitos para administradores de Azure](https://learn.microsoft.com/en-us/training/paths/az-104-administrator-prerequisites/) ([ES](https://learn.microsoft.com/es-es/training/paths/az-104-administrator-prerequisites/)) (2 módulos)

- [x] 01 · Introducción a Azure Cloud Shell — [Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-cloud-shell/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-cloud-shell/)) — [[az104-Azure Cloud Shell]] (página de concepto, ya estudiado)
- [ ] 02 · Implementación de la infraestructura de Azure mediante plantillas de ARM de JSON — [Learn](https://learn.microsoft.com/en-us/training/modules/create-azure-resource-manager-template-vs-code/) ([ES](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/)) — [Mi nota](../../knowledge/az104-arm-templates.md)

### Ruta 1 — [Administración de identidades y gobernanza en Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-identities-governance/) ([ES](https://learn.microsoft.com/es-es/training/paths/az-104-manage-identities-governance/)) (6 módulos · área 20–25%)

- [ ] 03 · Entender Microsoft Entra ID — [Learn](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/) ([ES](https://learn.microsoft.com/es-es/training/modules/understand-azure-active-directory/)) — [Mi nota](../../knowledge/az104-entra-id.md)
- [ ] 04 · Crear, configurar y administrar identidades — [Learn](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/) ([ES](https://learn.microsoft.com/es-es/training/modules/create-configure-manage-identities/)) — [Mi nota](../../knowledge/az104-identities.md)
- [ ] 05 · Describir los componentes arquitectónicos principales de Azure — [Learn](https://learn.microsoft.com/en-us/training/modules/describe-core-architectural-components-of-azure/) ([ES](https://learn.microsoft.com/es-es/training/modules/describe-core-architectural-components-of-azure/)) — [Mi nota](../../knowledge/az900-azure-architecture.md) *(mismo módulo que el 04 de AZ-900 — ya estudiado)*
- [ ] 06 · Iniciativas de Azure Policy — [Learn](https://learn.microsoft.com/en-us/training/modules/sovereignty-policy-initiatives/) ([ES](https://learn.microsoft.com/es-es/training/modules/sovereignty-policy-initiatives/)) — [Mi nota](../../knowledge/az104-azure-policy.md)
- [ ] 07 · Protección de los recursos de Azure con Azure RBAC — [Learn](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/) ([ES](https://learn.microsoft.com/es-es/training/modules/secure-azure-resources-with-rbac/)) — [Mi nota](../../knowledge/az104-azure-rbac.md)
- [ ] 08 · Restablecimiento de contraseñas con SSPR — [Learn](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/) ([ES](https://learn.microsoft.com/es-es/training/modules/allow-users-reset-their-password/)) — [Mi nota](../../knowledge/az104-sspr.md)

### Ruta 2 — [Implementación y administración del almacenamiento en Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-storage/) ([ES](https://learn.microsoft.com/es-es/training/paths/az-104-manage-storage/)) (4 módulos · área 15–20%)

- [ ] 09 · Configuración de cuentas de almacenamiento — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-storage-accounts/)) — [Mi nota](../../knowledge/az104-storage-accounts.md)
- [ ] 10 · Configuración de Azure Blob Storage — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-blob-storage/)) — [Mi nota](../../knowledge/az104-blob-storage.md)
- [ ] 11 · Configurar la seguridad de Azure Storage — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-storage-security/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-storage-security/)) — [Mi nota](../../knowledge/az104-storage-security.md)
- [ ] 12 · Configuración de Azure Files — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-azure-files-file-sync/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-azure-files-file-sync/)) — [Mi nota](../../knowledge/az104-azure-files.md)

### Ruta 3 — [Implementación y administración de recursos de procesos de Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-compute-resources/) ([ES](https://learn.microsoft.com/es-es/training/paths/az-104-manage-compute-resources/)) (5 módulos · área 20–25%)

- [ ] 13 · Introducción a Azure Virtual Machines — [Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-virtual-machines/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-virtual-machines/)) — [Mi nota](../../knowledge/az104-virtual-machines.md)
- [ ] 14 · Configuración de la disponibilidad de las máquinas virtuales — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-virtual-machine-availability/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-virtual-machine-availability/)) — [Mi nota](../../knowledge/az104-vm-availability.md)
- [ ] 15 · Configuración de planes de Azure App Service — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-app-service-plans/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-app-service-plans/)) — [Mi nota](../../knowledge/az104-app-service-plans.md)
- [ ] 16 · Configuración de Azure App Service — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-azure-app-services/)) — [Mi nota](../../knowledge/az104-app-service.md)
- [ ] 17 · Configuración de Azure Container Instances — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-azure-container-instances/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-azure-container-instances/)) — [Mi nota](../../knowledge/az104-container-instances.md)

### Ruta 4 — [Configuración y administración de redes virtuales](https://learn.microsoft.com/en-us/training/paths/az-104-manage-virtual-networks/) ([ES](https://learn.microsoft.com/es-es/training/paths/az-104-manage-virtual-networks/)) (8 módulos · área 15–20%)

- [ ] 18 · Configuración de redes virtuales — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-virtual-networks/)) — [Mi nota](../../knowledge/az104-virtual-networks.md)
- [ ] 19 · Configuración de grupos de seguridad de red — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-network-security-groups/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-network-security-groups/)) — [Mi nota](../../knowledge/az104-network-security-groups.md)
- [ ] 20 · Hospedaje de su dominio en Azure DNS — [Learn](https://learn.microsoft.com/en-us/training/modules/host-domain-azure-dns/) ([ES](https://learn.microsoft.com/es-es/training/modules/host-domain-azure-dns/)) — [Mi nota](../../knowledge/az104-azure-dns.md)
- [ ] 21 · Configuración del emparejamiento de Azure Virtual Network — [Learn](https://learn.microsoft.com/en-us/training/modules/configure-vnet-peering/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-vnet-peering/)) — [Mi nota](../../knowledge/az104-vnet-peering.md)
- [ ] 22 · Administración y control del flujo de tráfico con rutas — [Learn](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/) ([ES](https://learn.microsoft.com/es-es/training/modules/control-network-traffic-flow-with-routes/)) — [Mi nota](../../knowledge/az104-user-defined-routes.md)
- [ ] 23 · Introducción a Azure Load Balancer — [Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-load-balancer/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-load-balancer/)) — [Mi nota](../../knowledge/az104-load-balancer.md)
- [ ] 24 · Introducción a Azure Application Gateway — [Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-application-gateway/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-application-gateway/)) — [Mi nota](../../knowledge/az104-application-gateway.md)
- [ ] 25 · Introducción a Azure Network Watcher — [Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-network-watcher/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-network-watcher/)) — [Mi nota](../../knowledge/az104-network-watcher.md)

### Ruta 5 — [Supervisión y copia de seguridad de recursos de Azure](https://learn.microsoft.com/en-us/training/paths/az-104-monitor-backup-resources/) ([ES](https://learn.microsoft.com/es-es/training/paths/az-104-monitor-backup-resources/)) (3 módulos · área 10–15%)

- [ ] 26 · Introducción a Azure Backup — [Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/)) — [Mi nota](../../knowledge/az104-azure-backup.md)
- [ ] 27 · Protección de las máquinas virtuales con Azure Backup — [Learn](https://learn.microsoft.com/en-us/training/modules/protect-virtual-machines-with-azure-backup/) ([ES](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/)) — [Mi nota](../../knowledge/az104-vm-backup.md)
- [ ] 28 · Supervisión de las máquinas virtuales de Azure con Azure Monitor — [Learn](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/) ([ES](https://learn.microsoft.com/es-es/training/modules/monitor-azure-vm-using-diagnostic-data/)) — [Mi nota](../../knowledge/az104-vm-monitoring.md)

### Repaso final

- [ ] Ver el [AZ-104 Administrator Associate Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k) de Savill (~4 h) como repaso global
- [ ] Repasar la [whiteboard de ámbito del examen](../../raw/savill-cert-materials/whiteboards/AZ-104-Whiteboard-v2.png) (copia local en `raw/savill-cert-materials/`)
- [ ] Cubrir los **gaps** de las rutas oficiales (ARM/Bicep en profundidad, ACR, Container Apps, Application Gateway, Site Recovery, Network Watcher, private endpoints) — lista en el [roadmap](../../notes/AZ-104/roadmap.md)
- [ ] Ver entero el [vídeo de preparación del examen](https://aka.ms/AZ104-ExamPrep) (`aka.ms/AZ104-ExamPrep`, 1–2 semanas antes)
- [ ] Superar la [evaluación de práctica gratuita](https://learn.microsoft.com/en-us/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21) ([ES](https://learn.microsoft.com/es-es/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21)) y repasar donde falle

## Progreso

Estado: **en curso — reiniciado el 28/09/2026**; empezar por el módulo 01, Introducción a Azure Cloud Shell. Se reinicia el seguimiento, no las notas ni los conceptos ya consolidados. Plan de estudio: [notes/AZ-104/roadmap.md](../../notes/AZ-104/roadmap.md) — autoestudio gratuito: 6 rutas oficiales de Microsoft Learn + labs oficiales + evaluación de práctica.

Material de apoyo: [whiteboard de ámbito del examen](../../raw/savill-cert-materials/whiteboards/AZ-104-Whiteboard-v2.png) de John Savill (MVP) — visión de conjunto para antes de cada bloque y repaso final.

## Laboratorios

Índice y resultados en [`labs/AZ-104/`](../../labs/AZ-104/README.md) (carpeta de primer nivel). Labs oficiales: [MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — la mejor forma de cubrir lo que las rutas dejan corto.

## Conceptos relacionados

- [[Azure RBAC]]
- [[Entra ID]]
- [[Azure Networking]]
- [[Private Endpoints]]
- [[Terraform vs Bicep]]
- [[ARM Templates]]
- [[AKS]]
- [[Managed Identities]]
- [[az104-Azure Cloud Shell]]
- [[Hub-Spoke]]

## Ejemplos

- [Registro de aplicación en Entra ID](../../examples/entra/README.md)
- Candidatos: plantilla Bicep de VM + VNet, script CLI de creación de storage account con redundancia GRS.
