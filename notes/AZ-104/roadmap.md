---
title: AZ-104 — Roadmap de estudio
tags: [certification, roadmap]
certification: [AZ-104]
updated: 2026-07-31
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/azure-administrator/
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-104
  - https://learn.microsoft.com/es-es/training/courses/az-104t00
  - https://learn.microsoft.com/es-es/training/paths/az-104-administrator-prerequisites/
  - https://learn.microsoft.com/es-es/training/paths/az-104-manage-identities-governance/
  - https://learn.microsoft.com/es-es/training/paths/az-104-manage-storage/
  - https://learn.microsoft.com/es-es/training/paths/az-104-manage-compute-resources/
  - https://learn.microsoft.com/es-es/training/paths/az-104-manage-virtual-networks/
  - https://learn.microsoft.com/es-es/training/paths/az-104-monitor-backup-resources/
---

# Roadmap de estudio — AZ-104

Plan de estudio para AZ-104 por **autoestudio gratuito**: las 6 rutas de aprendizaje oficiales de Microsoft Learn (la opción gratuita de las "two ways to prepare"), que mapean con las 5 áreas de la skills outline vigente desde el **17 de abril de 2026** (ver [INDEX.md](../../certifications/AZ-104/INDEX.md)). Sin curso de pago: la preparación se complementa con los **labs oficiales** de Microsoft (`MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator`) y la **evaluación de práctica gratuita**.

**Cómo usar este documento**: marca los checkboxes según avances. Cada bloque tiene un apartado *Notas propias* — ahí vuelcas tus apuntes del portal, cosas que te hayan costado o fallos de laboratorio; no lo toco yo al actualizar el repositorio salvo que me pidas fusionarlo con `knowledge/`.

**Workflow por concepto** (la cadencia del brain): módulo de MS Learn → apuntes en *Notas propias* → crear/ampliar la página en [`knowledge/`](../../knowledge/) → tachar el checkbox del [INDEX](../../certifications/AZ-104/INDEX.md) → hacer el lab en [`labs/AZ-104/`](../../labs/AZ-104/) → guardar snippets de CLI/PowerShell/Bicep en [`examples/`](../../examples/).

> **El vídeo de preparación del examen.** `aka.ms/AZ104-ExamPrep` (sesión oficial de Microsoft Learn, *"Prepare for Microsoft Certification Exam AZ-104"*) **no es un curso**: trata de estrategia de examen (qué esperar, dónde fijarse, cómo abordar las preguntas). **Ahora** míralo en modo panorama (10–20 min) solo para calibrar; **en serio** lo ves entero 1–2 semanas antes de programar el examen (está listado más abajo en *Antes del examen*).

> **Nota sobre el clon local.** `raw/azure-docs/articles/` en este repo incluye carpetas para la mayoría de temas de AZ-104 (`storage/`, `virtual-network/`, `app-service/`, `application-gateway/`, `load-balancer/`, `dns/`, `backup/`, `site-recovery/`, `bastion/`, `container-apps/`, `containers/`, `azure-resource-manager/`, `role-based-access-control/`, `governance/`, `cost-management-billing/`). **No** incluye `active-directory` (Entra ID, solo b2c), `virtual-machines`, `azure-monitor` ni `network-watcher` — para esos los enlaces van directos a Microsoft Learn.

## Progreso general

- [x] Bloque 0 — Prerrequisitos (opcional, recomendado si AZ-900 no está fresco)
- [X] Bloque 1 — Identidad y gobernanza (20–25%)
- [ ] Bloque 2 — Almacenamiento (15–20%)
- [ ] Bloque 3 — Cómputo (20–25%)
- [ ] Bloque 4 — Redes virtuales (15–20%)
- [ ] Bloque 5 — Supervisión y backup (10–15%)
- [ ] Evaluación de práctica gratuita superada
- [ ] Examen AZ-104 programado
- [ ] Examen AZ-104 aprobado (fecha: _pendiente_)

---

## Bloque 0 — Prerrequisitos (opcional)

### 0.1 [AZ-104: Prerequisites for Azure administrators](https://learn.microsoft.com/en-us/training/paths/az-104-administrator-prerequisites/)

Módulos:
- [x] [Introduction to Azure Cloud Shell](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-cloud-shell/) — shell autenticado en el navegador (Bash/PowerShell) → [[Azure Cloud Shell]]

Repaso de fundamentos (portales, CLI/PowerShell, ARM, suscripciones/RGs). Si AZ-900 te sigue fresco, puedes saltártelo y entrar por el Bloque 1.

> **Notas propias:**

---

## Bloque 1 — Administración de identidades y gobernanza en Azure (20–25%)

### 1.1 [AZ-104: Manage identities and governance in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-identities-governance/) (6 módulos)

- [ ] [Understand Microsoft Entra ID](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/) — Entra ID vs ADDS, P1/P2, Domain Services → [[Understand Microsoft Entra ID]] · [[Entra ID]]
- [ ] [Create, configure, and manage identities](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/) — usuarios, grupos, licencias, usuarios externos
- [ ] [Describe the core architectural components of Azure](https://learn.microsoft.com/en-us/training/modules/describe-core-architectural-components-of-azure/) — suscripciones, RGs, regiones, management groups
- [ ] [Azure Policy initiatives](https://learn.microsoft.com/en-us/training/modules/sovereignty-policy-initiatives/) — aplicar estándares y evaluar compliance
- [ ] [Secure your Azure resources with Azure RBAC](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/) — roles integrados, asignación por ámbito
- [ ] [Allow users to reset their password with SSPR](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/) — autoservicio de restablecimiento

**Objetivos del examen:** usuarios/grupos y propiedades · licencias · usuarios externos · SSPR · roles integrados y asignación por ámbito · interpretar asignaciones · Azure Policy · bloqueos · etiquetas · RGs/suscripciones/management groups · costes con alertas, presupuestos y Advisor.

Conceptos del repo: [[Entra ID]] (stub) · [[Azure RBAC]] (stub).
Docs: [Microsoft Entra ID](https://learn.microsoft.com/es-es/azure/active-directory/) · [Azure Policy](https://learn.microsoft.com/es-es/azure/governance/policy/) — local: `raw/azure-docs/articles/governance/`, `role-based-access-control/`, `cost-management-billing/`. Entra ID sin copia local.

> **Notas propias:**

---

## Bloque 2 — Implementación y administración del almacenamiento (15–20%)

### 2.1 [AZ-104: Implement and manage storage in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-storage/) (4 módulos)

- [ ] [Configure storage accounts](https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/) — creación, redundancia (LRS/GRS/GZRS...), endpoints
- [ ] [Configure Azure Blob Storage](https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/) — tiers, replicación de objetos, ciclo de vida, versionado
- [ ] [Configure Azure Storage security](https://learn.microsoft.com/en-us/training/modules/configure-storage-security/) — SAS tokens, directivas de acceso almacenadas, claves, firewalls/vNet
- [ ] [Configure Azure Files](https://learn.microsoft.com/en-us/training/modules/configure-azure-files-file-sync/) — file shares, Azure File Sync, acceso basado en identidad

**Objetivos del examen:** firewalls y redes virtuales de Storage · SAS tokens · directivas de acceso almacenadas · claves de acceso · acceso basado en identidad para Azure Files · redundancia y replicación de objetos · cifrado · Storage Explorer y AzCopy · tiers · eliminación suave (blobs/contenedores/files) · instantáneas · ciclo de vida · versionado.

Docs: [Azure Storage](https://learn.microsoft.com/es-es/azure/storage/) · [Blob Storage](https://learn.microsoft.com/es-es/azure/storage/blobs/) — local: `raw/azure-docs/articles/storage/` (y `storage-actions/`, `storage-mover/`, `storage-discovery/`).

> **Notas propias:**

---

## Bloque 3 — Implementación y administración de recursos de cómputo (20–25%)

### 3.1 [AZ-104: Deploy and manage Azure compute resources](https://learn.microsoft.com/en-us/training/paths/az-104-manage-compute-resources/) (5 módulos)

- [ ] [Introduction to Azure virtual machines](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-virtual-machines/) — decisiones previas, creación, extensiones
- [ ] [Configure virtual machine availability](https://learn.microsoft.com/en-us/training/modules/configure-virtual-machine-availability/) — availability sets/zones, escalado vertical y horizontal, VMSS
- [ ] [Configure Azure App Service plans](https://learn.microsoft.com/en-us/training/modules/configure-app-service-plans/) — pricing tiers y escalado
- [ ] [Configure Azure App Service](https://learn.microsoft.com/en-us/training/modules/configure-azure-app-services/) — config, monitoring, deployment slots
- [ ] [Configure Azure Container Instances](https://learn.microsoft.com/en-us/training/modules/configure-azure-container-instances/) — container groups, ACI
- [ ] [Author Azure Resource Manager templates by using VS Code](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/) — refuerzo del gap ARM/Bicep (fuera de la ruta oficial) → [[ARM Templates]]

**Objetivos del examen (la ruta es más ligera que el examen — ver *Gaps* abajo):** ARM/Bicep: interpretar/modificar/desplegar/exportar/convertir plantillas · VMs: creación, cifrado en el host, mover entre RG/suscripción/región, tamaños, discos, availability zones/sets, VMSS · contenedores: ACR, ACI, **Container Apps**, escalado · App Service: plan y escalado, certificados/TLS, DNS personalizado, backup, red, deployment slots.

Concepto del repo: [[Terraform vs Bicep]] (stub).
Docs: [App Service](https://learn.microsoft.com/es-es/azure/app-service/) · [Container Instances](https://learn.microsoft.com/es-es/azure/container-instances/) · [Container Apps](https://learn.microsoft.com/es-es/azure/container-apps/) · [VMs](https://learn.microsoft.com/es-es/azure/virtual-machines/) · [ARM templates](https://learn.microsoft.com/es-es/azure/azure-resource-manager/templates/) — local: `raw/azure-docs/articles/app-service/`, `container-apps/`, `containers/`, `azure-resource-manager/`. Sin copia local de `virtual-machines`.

> **Notas propias:**

---

## Bloque 4 — Implementación y administración de redes virtuales (15–20%)

### 4.1 [AZ-104: Configure and manage virtual networks for Azure administrators](https://learn.microsoft.com/en-us/training/paths/az-104-manage-virtual-networks/) (8 módulos)

- [ ] [Configure virtual networks](https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/) — VNets, subnets, direccionamiento IP
- [ ] [Configure network security groups](https://learn.microsoft.com/en-us/training/modules/configure-network-security-groups/) — NSG/ASG, reglas efectivas
- [ ] [Host your domain on Azure DNS](https://learn.microsoft.com/en-us/training/modules/host-domain-azure-dns/) — zonas y registros DNS
- [ ] [Configure Azure Virtual Network peering](https://learn.microsoft.com/en-us/training/modules/configure-vnet-peering/) — peering, tránsito, conectividad
- [ ] [Manage and control traffic flow with routes](https://learn.microsoft.com/en-us/training/modules/control-network-traffic-flow-with-routes/) — UDR (rutas definidas por el usuario)
- [ ] [Introduction to Azure Load Balancer](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-load-balancer/) — LB interno/público
- [ ] [Introduction to Azure Application Gateway](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-application-gateway/) — Application Gateway (cuándo elegirlo)
- [ ] [Introduction to Azure Network Watcher](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-network-watcher/) — diagnóstico y monitoring de red

**Objetivos del examen:** VNets/subnets · peering · IPs públicas · UDR · troubleshooting de conectividad · NSG/ASG y reglas efectivas · Azure Bastion · service endpoints · **private endpoints** para PaaS · Azure DNS · load balancer interno/público · troubleshooting de balanceo.

Conceptos del repo: [[Azure Networking]] (stub) · [[Private Endpoints]] (stub) · [[Hub-Spoke]] (stub).
Docs: [Virtual Network](https://learn.microsoft.com/es-es/azure/virtual-network/) · [DNS](https://learn.microsoft.com/es-es/azure/dns/) · [Bastion](https://learn.microsoft.com/es-es/azure/bastion/) · [Application Gateway](https://learn.microsoft.com/es-es/azure/application-gateway/) · [Load Balancer](https://learn.microsoft.com/es-es/azure/load-balancer/) — local: `raw/azure-docs/articles/virtual-network/` (y `virtual-network-manager/`), `dns/`, `bastion/`, `application-gateway/`, `load-balancer/`. Sin copia local de `network-watcher`.

> **Notas propias:**

---

## Bloque 5 — Supervisión y mantenimiento de recursos de Azure (10–15%)

### 5.1 [AZ-104: Monitor and back up Azure resources](https://learn.microsoft.com/en-us/training/paths/az-104-monitor-backup-resources/) (3 módulos)

- [ ] [Introduction to Azure Backup](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/) — Recovery Services vault vs Backup vault, políticas
- [ ] [Protect your virtual machines by using Azure Backup](https://learn.microsoft.com/en-us/training/modules/protect-virtual-machines-with-azure-backup/) — backup/restore de VMs y otros workloads
- [ ] [Monitor your Azure virtual machines with Azure Monitor](https://learn.microsoft.com/en-us/training/modules/monitor-azure-vm-using-diagnostic-data/) — métricas y logs de VM host/cliente

**Objetivos del examen (la ruta es la más ligera frente al examen — ver *Gaps*):** métricas en Azure Monitor · configurar logs · consultar y analizar logs (KQL) · reglas de alertas, action groups y alert processing rules · Insights de VMs/storage/redes · Network Watcher y Connection Monitor · Recovery Services vault · Backup vault · políticas de backup · backup/restore · Azure Site Recovery · failover a región secundaria · informes y alertas de backups.

Docs: [Azure Monitor](https://learn.microsoft.com/es-es/azure/azure-monitor/) · [Azure Backup](https://learn.microsoft.com/es-es/azure/backup/) · [Site Recovery](https://learn.microsoft.com/es-es/azure/site-recovery/) · [Network Watcher](https://learn.microsoft.com/es-es/azure/network-watcher/) — local: `raw/azure-docs/articles/backup/`, `site-recovery/`. Sin copia local de `azure-monitor`.

> **Notas propias:**

---

## Gaps detectados (importante — no cubiertos por las rutas oficiales)

Las rutas de Microsoft Learn son nivel *Beginner* y **no cubren todo lo que entra en el examen**. Lo que falta, cubrirlo con labs + docs oficiales (no ampliar las rutas, que no lo contemplan):

- [ ] **ARM/Bicep en profundidad** — interpretar/modificar plantillas, exportar deploy como plantilla, convertir ARM → Bicep (la ruta de cómputo apenas lo roza). Refuerzo: [`examples/bicep/`](../../examples/bicep/) y [ARM templates docs](https://learn.microsoft.com/es-es/azure/azure-resource-manager/templates/).
- [ ] **Azure Container Registry (ACR)** y **Azure Container Apps** — geo-replicación, tareas, escalado con KEDA. Docs: [ACR](https://learn.microsoft.com/es-es/azure/container-registry/), [Container Apps](https://learn.microsoft.com/es-es/azure/container-apps/).
- [ ] **Application Gateway** — routing HTTP/S, WAF, listeners (la ruta es solo intro).
- [ ] **Azure Site Recovery** — configurar, failover a región secundaria, informes.
- [ ] **Network Watcher / Connection Monitor** — troubleshooting de conectividad, IP flow verify, next hop.
- [ ] **Private endpoints** para PaaS — el examen los pide explícitamente; desarrollar la página [[Private Endpoints]].

Estos son además los mejores candidatos para desarrollar stubs de `knowledge/` y crear ejemplos en `examples/` mientras estudias.

---

## Laboratorios oficiales

Microsoft publica los labs prácticos alineados con AZ-104 en **[MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator)** (carpeta `Instructions/Labs`). Son la mejor forma de cubrir lo que las rutas dejan corto. Cada lab que hagas → anota resultado/comandos en [`labs/AZ-104/`](../../labs/AZ-104/).

---

## Plan de sesiones sugerido

Distribución orientativa (la ruta oficial son ~4 días de instructor-led; en autoestudio, repartir en 2–3 semanas):

| Sesión | Contenido | Bloque |
|---|---|---|
| 1 | Prerrequisitos (si hace falta) + Entra ID, identidades | 0–1 |
| 2 | RBAC, Azure Policy, gobernanza, costes | 1 |
| 3 | Storage accounts, Blob, seguridad, Files | 2 |
| 4 | VMs, availability, VMSS + ARM/Bicep | 3 |
| 5 | App Service, contenedores (ACR/ACI/Container Apps) | 3 |
| 6 | VNets, NSG, peering, DNS, UDR | 4 |
| 7 | Load Balancer, App Gateway, Bastion, private endpoints | 4 |
| 8 | Azure Monitor, alertas, Network Watcher | 5 |
| 9 | Backup, Site Recovery, failover | 5 |
| 10 | Repaso de puntos débiles + evaluación de práctica | — |
| 11 | Vídeo de estrategia de examen + huecos restantes | — |
| 12 | Examen | — |

---

## Antes del examen

- [ ] Completar la [evaluación de práctica gratuita](https://learn.microsoft.com/es-es/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21) (assessmentId 21) y repasar donde falle
- [ ] Ver entero el **[vídeo de preparación del examen](https://aka.ms/AZ104-ExamPrep)** (`aka.ms/AZ104-ExamPrep`, ~1–2 semanas antes)
- [ ] Revisar que la skills outline en [INDEX.md](../../certifications/AZ-104/INDEX.md) sigue vigente (Microsoft actualiza las guías periódicamente; nota de cambio vigente: 17/04/2026)
- [ ] Repasar los stubs de `knowledge/` completados durante el estudio ([[Entra ID]], [[Azure RBAC]], [[Azure Networking]], [[Private Endpoints]], [[Terraform vs Bicep]])
- [ ] Programar el examen desde [tu perfil de Microsoft Learn](https://learn.microsoft.com/es-es/users) (usa una cuenta personal MSA para no perder los registros)

## Relacionado

- [Índice de la certificación](../../certifications/AZ-104/INDEX.md) — resumen y skills outline oficial
- [[Entra ID]] · [[Azure RBAC]] · [[Azure Networking]] · [[Private Endpoints]] · [[Hub-Spoke]] · [[Terraform vs Bicep]] · [[ARM Templates]] · [[Managed Identities]] · [[Key Vault]] · [[Azure Cloud Shell]]
