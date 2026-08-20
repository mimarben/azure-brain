---
title: AZ-140 — Configuración y funcionamiento de Microsoft Azure Virtual Desktop
tags: [certification]
certification: [AZ-140]
updated: 2026-07-07
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-140
---

# AZ-140: Configuración y funcionamiento de Microsoft Azure Virtual Desktop

## Descripción

Para administradores de escritorio/servidor que diseñan, implementan, administran y mantienen experiencias de [[Azure Virtual Desktop]] y aplicaciones remotas. Trabajan junto a administradores y arquitectos de Azure, administradores de Microsoft 365, ingenieros de seguridad y administradores de Azure Local.

## Objetivos

Experiencia con cómputo, redes, identidad, almacenamiento y resiliencia en Azure; capacidad de administrar entornos de escritorio de usuario final (entrega de apps, configuración de usuario) usando Azure Portal, plantillas, scripting y CLI.

## Habilidades medidas

*Vigente a 20 de julio de 2026 según la guía oficial — verificar antes de programar el examen.*

| Área | Peso |
|---|---|
| Planificación e implementación de infraestructura de AVD | 40-45% |
| Planificación e implementación de identidad y seguridad | 15-20% |
| Planificación e implementación de entornos y aplicaciones de usuario | 20-25% |
| Supervisión y mantenimiento de infraestructura de AVD | 10-15% |

## Módulos

### Planificación e implementación de infraestructura de AVD (40-45%)

- [ ] **Redes**: velocidad/capacidad requerida, configuración de red de session hosts, RDP Shortpath/Multipath/QoS, Private Link para AVD, troubleshooting de conectividad
- [ ] **Almacenamiento para datos de usuario**: planificación, componentes FSLogix, cuentas de almacenamiento, recursos compartidos de archivos, Azure NetApp Files
- [ ] **Grupos de hosts y session hosts (planificación)**: resource groups/suscripciones/management groups, SO recomendado, modelo de licencias, arquitectura de host pool, requisitos de rendimiento y capacidad de VM
- [ ] **Grupos de hosts y session hosts (implementación)**: creación vía Portal, automatización (PowerShell, CLI, ARM, Bicep), opciones de host pool, licencias (CAL de RDS)
- [ ] **Imágenes de session host**: creación manual y con Azure VM Image Builder, modificación, gestión del ciclo de vida, actualizaciones de SO/apps, Azure Compute Gallery

### Planificación e implementación de identidad y seguridad (15-20%)

- [ ] **Integración de identidad**: escenarios (AD DS, [[Entra ID]], Entra Domain Services), [[Azure RBAC]] para AVD, acceso condicional, autenticación passwordless/tarjeta inteligente/MFA, roles/grupos/asignaciones, SSO de Entra
- [ ] **Seguridad**: Microsoft Defender for Cloud, Defender Antivirus, Defender for Endpoint, seguridad de red (UDR, NSG, Azure Firewall), Azure Bastion/JIT, protección contra amenazas de Windows, VM confidencial y arranque seguro

### Planificación e implementación de entornos y aplicaciones de usuario (20-25%)

- [ ] **FSLogix**: configuración recomendada, contenedores de perfiles y ODFC, Cloud Cache, enmascaramiento de apps
- [ ] **Experiencia de usuario y cliente**: selección de cliente y método de implementación, redirección de dispositivos/multimedia, impresión universal, Intune/directiva de grupo, propiedades RDP y timeout, "Iniciar VM en conexión", asignación de escritorios personales
- [ ] **Apps en session host**: método de implementación, grupos de aplicaciones, RemoteApp, Microsoft 365 Apps, OneDrive multisesión, Teams (media optimization), navegadores, App Attach

### Supervisión y mantenimiento de infraestructura de AVD (10-15%)

- [ ] **Supervisión**: recopilación de logs, Azure Monitor, AVD Insights, optimización de capacidad/rendimiento, autoescalado, sesiones activas y grupos de apps
- [ ] **Actualizaciones, backup y DR**: estrategia de actualización de session hosts, plan de recuperación ante desastres, despliegue multirregión, estrategia de backup, restore de perfiles FSLogix/escritorios personales/imágenes

## Progreso

Estado: **no iniciado**.

## Laboratorios

Ninguno todavía. Añadir en `certifications/AZ-140/labs/`.

## Conceptos relacionados

- [[Azure Virtual Desktop]]
- [[Entra ID]]
- [[Azure RBAC]]
- [[Azure Networking]]

## Ejemplos

Ninguno todavía. Candidatos: script de creación de host pool con Bicep, configuración FSLogix con Azure Files.
