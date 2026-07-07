---
title: AZ-500 — Tecnologías de seguridad de Microsoft Azure
tags: [certification]
certification: [AZ-500]
updated: 2026-07-07
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-500
---

# AZ-500: Tecnologías de seguridad de Microsoft Azure

> **Nota:** según la guía oficial, este examen se retira el 31 de agosto de 2026. Verificar vigencia antes de planificar el estudio.

## Descripción

Certificación para el ingeniero de seguridad de Azure: implementa, administra y supervisa la seguridad de recursos en entornos Azure, multinube e híbridos, con Microsoft Defender for Cloud y Microsoft Cloud Security Benchmark (MCSB) como referencia.

## Objetivos

- Gestionar la postura de seguridad.
- Implementar protección contra amenazas.
- Identificar y solucionar vulnerabilidades.
- Implementar controles de cumplimiento normativo (identidad, red, cómputo, almacenamiento, datos, apps, activos, backup/recovery, DevOps).

Requiere experiencia práctica con entornos Azure/híbridos y conocimientos sólidos de Entra ID, cómputo, red y almacenamiento.

## Habilidades medidas

*Vigente desde el 22 de enero de 2026 según la guía oficial — verificar antes de programar el examen.*

| Área | Peso |
|---|---|
| Protección de identidad y acceso | 15-20% |
| Protección de redes | 20-25% |
| Protección de procesos, almacenamiento y bases de datos | 20-25% |
| Protección de Azure mediante Microsoft Defender for Cloud y Microsoft Sentinel | 30-35% |

## Módulos

### Protección de identidad y acceso (15-20%)

- [ ] **Controles de identidad y acceso**: [[Azure RBAC]] y roles personalizados, Microsoft Entra Privileged Identity Management (PIM), MFA, acceso condicional
- [ ] **Apps de [[Entra ID]] e identidades administradas**: acceso a apps empresariales (OAuth), registro de apps y scopes, consentimiento, entidades de servicio, [[Managed Identities]]

### Protección de redes (20-25%)

- [ ] **Seguridad de redes virtuales**: NSG/ASG, Azure Virtual Network Manager, rutas definidas por el usuario, peering/VPN Gateway, Virtual WAN con hub seguro, VPN P2S/S2S, cifrado en ExpressRoute, firewall en recursos, Network Watcher
- [ ] **Acceso privado a recursos**: service endpoints, [[Private Endpoints]], Private Link, integración de red de App Service/Functions, ASE, Azure SQL Managed Instance
- [ ] **Acceso público a recursos**: TLS en App Service/API Management, Azure Firewall y Firewall Manager, Application Gateway, Azure Front Door + CDN, WAF, DDoS Protection Standard

### Protección de procesos, almacenamiento y bases de datos (20-25%)

- [ ] **Seguridad avanzada de cómputo**: Azure Bastion y acceso JIT a VMs, aislamiento de red en [[AKS]], autenticación de AKS, monitorización de seguridad de Container Instances/Apps, acceso a ACR, cifrado de disco (ADE, host, confidential disk encryption)
- [ ] **Seguridad de almacenamiento**: control de acceso, claves de cuenta, métodos de acceso a Files/Blob, protección de datos (eliminación temporal, backups, versionado, almacenamiento inmutable), BYOK, cifrado doble
- [ ] **Seguridad de Azure SQL**: autenticación Entra, auditoría, enmascaramiento dinámico, TDE, Always Encrypted

### Protección de Azure mediante Defender for Cloud y Sentinel (30-35%)

- [ ] **Cumplimiento de gobernanza**: Azure Policy (crear/asignar/interpretar), redes y acceso de [[Key Vault]] (RBAC vs políticas de acceso), certificados/secretos/claves y su rotación/backup, controles para activos
- [ ] **Postura de seguridad con Defender for Cloud**: inventario y puntuación, cumplimiento normativo, estándares personalizados, entornos híbridos/multinube (AWS, GCP), Defender EASM
- [ ] **Protección contra amenazas**: planes de protección de cargas de trabajo, Defender para servidores/bases de datos/Storage, escaneo sin agente de VMs, gestión de vulnerabilidades, Defender for Cloud DevOps Security (GitHub, Azure DevOps, GitLab)
- [ ] **Automatización y supervisión**: alertas y respuesta en Defender for Cloud, automatización de flujos de trabajo, Data Collection Rules en Azure Monitor, conectores/reglas de análisis/automatización en Microsoft Sentinel

## Progreso

Estado: **no iniciado**.

## Laboratorios

Ninguno todavía. Añadir en `certifications/AZ-500/labs/`.

## Conceptos relacionados

- [[Azure RBAC]]
- [[Entra ID]]
- [[Managed Identities]]
- [[Key Vault]]
- [[Private Endpoints]]
- [[Shared Responsibility Model]]
- [[AKS]]

## Ejemplos

Ninguno todavía. Candidatos: política de Azure Policy en Bicep, configuración de acceso condicional vía CLI.
