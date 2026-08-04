---
title: AZ-104 — Administrador de Microsoft Azure
tags: [certification]
certification: [AZ-104]
updated: 2026-07-31
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-104
---

# AZ-104: Administrador de Microsoft Azure

## Descripción

Certificación para quien implementa, administra y supervisa el entorno Azure de una organización: redes virtuales, almacenamiento, cómputo, identidad, seguridad y gobernanza. Suele formar parte de un equipo más amplio y coordina con roles de redes, seguridad, bases de datos, desarrollo y DevOps.

## Objetivos

Familiaridad con sistemas operativos, redes, servidores y virtualización, más experiencia con PowerShell, Azure CLI, Azure Portal, plantillas ARM/Bicep y Microsoft Entra ID.

## Habilidades medidas

*Vigente desde el 17 de abril de 2026 según la guía oficial — verificar antes de programar el examen.*

| Área | Peso |
|---|---|
| Administración de identidades y gobernanza en Azure | 20-25% |
| Implementación y administración del almacenamiento | 15-20% |
| Implementación y administración de recursos de cómputo | 20-25% |
| Implementación y administración de redes virtuales | 15-20% |
| Supervisión y mantenimiento de recursos de Azure | 10-15% |

## Módulos

### Administración de identidades y gobernanza en Azure (20-25%)

- [ ] **[[Entra ID]]**: usuarios y grupos, propiedades, licencias, usuarios externos, autoservicio de restablecimiento de contraseña (SSPR)
- [ ] **Acceso de usuarios a recursos**: [[Azure RBAC]] integrado, asignación de roles por ámbito, interpretación de asignaciones de acceso
- [ ] **Suscripciones y gobernanza**: Azure Policy, bloqueos de recursos, etiquetas, resource groups, suscripciones, alertas/presupuestos/Azure Advisor, management groups

### Implementación y administración del almacenamiento (15-20%)

- [ ] **Acceso al almacenamiento**: redes virtuales y firewalls de Storage, SAS tokens, directivas de acceso almacenadas, claves de acceso, acceso basado en identidad para Azure Files
- [ ] **Cuentas de almacenamiento**: creación/configuración, redundancia, replicación de objetos, cifrado, Storage Explorer y AzCopy
- [ ] **Azure Files y Blob Storage**: recursos compartidos, contenedores, tiers, eliminación suave, instantáneas, ciclo de vida de blobs, versionado

### Implementación y administración de recursos de cómputo (20-25%)

- [ ] **ARM/[[Terraform vs Bicep|Bicep]]**: interpretar y modificar plantillas, desplegar recursos, exportar/convertir plantillas
- [ ] **Máquinas virtuales**: creación, cifrado en el host, mover entre grupos/suscripciones/regiones, tamaños, discos, availability zones/sets, scale sets
- [ ] **Contenedores**: Azure Container Registry, Azure Container Instances, Azure Container Apps, escalado
- [ ] **Azure App Service**: plan y escalado, certificados/SSL, DNS personalizado, backup, configuración de red, deployment slots

### Implementación y administración de redes virtuales (15-20%)

- [ ] **VNets**: creación/configuración, peering, IPs públicas, rutas definidas por el usuario, troubleshooting de conectividad
- [ ] **Acceso seguro**: NSG y ASG, reglas efectivas, Azure Bastion, service endpoints y [[Private Endpoints]] para PaaS
- [ ] **Resolución de nombres y balanceo**: Azure DNS, load balancer interno/público, troubleshooting

### Supervisión y mantenimiento de recursos de Azure (10-15%)

- [ ] **Supervisión**: métricas y logs en Azure Monitor, reglas de alertas y grupos de acción, Azure Monitor Insights (VMs, storage, redes), Network Watcher
- [ ] **Backup y recuperación**: Recovery Services vault, Azure Backup vault y políticas, backup/restore, Azure Site Recovery, failover, informes y alertas

## Progreso

Estado: **en curso** — [roadmap de estudio](../../notes/AZ-104/roadmap.md) (autoestudio gratuito: 6 rutas oficiales de Microsoft Learn + labs de Microsoft + evaluación de práctica).

## Laboratorios

Índice y resultados en [`labs/AZ-104/`](../../labs/AZ-104/) (carpeta de primer nivel). Labs oficiales: [MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator).

## Conceptos relacionados

- [[Azure RBAC]]
- [[Entra ID]]
- [[Azure Networking]]
- [[Private Endpoints]]
- [[Terraform vs Bicep]]
- [[ARM Templates]]
- [[AKS]]
- [[Managed Identities]]
- [[Azure Cloud Shell]]

## Ejemplos

- [Registro de aplicación en Entra ID](../../examples/entra/README.md)
- Candidatos: plantilla Bicep de VM + VNet, script CLI de creación de storage account con redundancia GRS.
