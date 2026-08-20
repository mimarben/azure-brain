---
title: Shared Responsibility Model
aliases: [Shared Responsibility Model]
tags: [security, governance, fundamentals]
certification: [AZ-900, AZ-500, AZ-305]
updated: 2026-07-07
sources:
  - raw/azure-docs/articles/security/fundamentals/shared-responsibility.md
---

# Shared Responsibility Model

Modelo que define qué tareas de seguridad gestiona Microsoft y cuáles gestiona el cliente, según el tipo de servicio (on-premises, IaaS, PaaS, SaaS). Es la base conceptual para entender por qué la nube reduce ciertos riesgos de seguridad pero no elimina la responsabilidad del cliente.

## Modelos de servicio

| Modelo | Qué gestiona el cliente | Ejemplos Azure |
|---|---|---|
| **IaaS** | VMs, sistema operativo, aplicaciones | Azure Virtual Machines, Azure Disk Storage, redes virtuales |
| **PaaS** | Solo la aplicación y su configuración | Azure App Service, Azure Functions, Azure SQL Database |
| **SaaS** | Solo datos y configuración de usuario | Microsoft 365, Dynamics 365 |

A medida que se avanza de IaaS → PaaS → SaaS, Microsoft asume más responsabilidad operativa y el cliente conserva menos control (y menos carga de gestión).

## Matriz de responsabilidad

| Área | On-premises | IaaS | PaaS | SaaS |
|---|---|---|---|---|
| Datos del cliente | Cliente | Cliente | Cliente | Cliente |
| Configuración | Cliente | Cliente | Cliente | Cliente |
| Identidades y usuarios | Cliente | Cliente | Cliente | Cliente |
| Dispositivos cliente | Cliente | Cliente | Cliente | Compartido |
| Aplicaciones | Cliente | Cliente | Compartido | Compartido |
| Controles de red | Cliente | Cliente | Compartido | Microsoft |
| Sistema operativo | Cliente | Cliente | Microsoft | Microsoft |
| Hosts físicos | Cliente | Microsoft | Microsoft | Microsoft |
| Red física | Cliente | Microsoft | Microsoft | Microsoft |
| Datacenter físico | Cliente | Microsoft | Microsoft | Microsoft |

## Lo que el cliente retiene siempre

Independientemente del modelo de despliegue:

- **Datos** — clasificación, protección, cifrado, cumplimiento normativo.
- **Endpoints** — dispositivos que acceden a los servicios cloud.
- **Cuentas** — alta, gestión y baja de usuarios.
- **Gestión de accesos** — RBAC, MFA, acceso condicional (ver [[Azure RBAC]]).

## Lo que Microsoft siempre gestiona

Seguridad física del datacenter, red física, hosts físicos, y el hipervisor que sustenta las VMs en IaaS/PaaS.

## Responsabilidad compartida en IA

En cargas de trabajo de IA, Microsoft asegura la infraestructura y el hosting del modelo; el cliente sigue siendo responsable de cómo se usa la IA — protección de datos sensibles, seguridad de prompts, mitigación de prompt injection y cumplimiento normativo.

## Por qué importa

Entender este modelo evita dos errores típicos:

- Asumir que "está en la nube, luego es seguro" (el cliente sigue teniendo responsabilidades).
- Sobre-invertir gestionando capas que Microsoft ya cubre (p. ej. parchear el hipervisor, que no es accesible ni responsabilidad del cliente).

## Relacionado

- [[Azure RBAC]] — control de acceso, una de las responsabilidades que el cliente retiene siempre.
- [[Managed Identities]] — reduce la superficie de responsabilidad del cliente sobre credenciales.
- [[Key Vault]] — herramienta para cumplir la responsabilidad de "datos" y cifrado.
