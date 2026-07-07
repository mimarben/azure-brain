---
title: AZ-900 — Microsoft Azure Fundamentals
tags: [certification]
certification: [AZ-900]
updated: 2026-07-07
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-900
---

# AZ-900: Microsoft Azure Fundamentals

## Descripción

Certificación de entrada para profesionales tecnológicos que quieren demostrar conocimientos básicos de conceptos cloud en general y de Microsoft Azure en particular. Punto de partida común antes de AZ-104, AZ-500, AZ-305 y el resto de certificaciones de este repositorio. No requiere experiencia técnica previa, aunque ayuda tener trabajo previo en infraestructura, bases de datos o desarrollo de software.

## Objetivos

- Describir los componentes arquitectónicos de Azure y sus servicios (cómputo, redes, almacenamiento).
- Describir las características y herramientas para proteger, gobernar y administrar Azure.

## Habilidades medidas

*Vigente a 20 de julio de 2026 según la guía oficial — verificar antes de programar el examen.*

| Área | Peso |
|---|---|
| Descripción de los conceptos de la nube | 25-30% |
| Descripción de la arquitectura y los servicios de Azure | 35-40% |
| Descripción de la administración y la gobernanza de Azure | 30-35% |

## Módulos

### Descripción de los conceptos de la nube (25-30%)

- [ ] **Informática en la nube**: definición, [[Shared Responsibility Model]], modelos de nube (público/privado/híbrido) y sus casos de uso, modelo basado en consumo, comparación de precios, computación serverless
- [ ] **Ventajas de los servicios en la nube**: alta disponibilidad y escalabilidad, confiabilidad y previsibilidad, seguridad y gobernanza, capacidad de administración
- [ ] **Tipos de servicio en la nube**: IaaS, PaaS, SaaS y casos de uso adecuados para cada uno

### Descripción de la arquitectura y los servicios de Azure (35-40%)

- [ ] **Componentes arquitectónicos principales**: regiones, region pairs, regiones soberanas, availability zones, datacenters, recursos y resource groups, suscripciones, management groups, jerarquía completa
- [ ] **Servicios de cómputo y redes**: contenedores vs VMs vs funciones, opciones de VM (Virtual Machines, Scale Sets, availability sets, [[Azure Virtual Desktop]]), opciones de hospedaje de apps, [[Azure Networking]] (VNets, subredes, peering, Azure DNS, VPN Gateway, ExpressRoute), endpoints públicos y privados ([[Private Endpoints]])
- [ ] **Servicios de almacenamiento**: comparación de servicios, tiers, opciones de redundancia (LRS/ZRS/GRS), tipos de cuenta de almacenamiento, herramientas de migración (AzCopy, Storage Explorer, Azure File Sync, Azure Migrate, Data Box)
- [ ] **Identidad, acceso y seguridad**: [[Entra ID]] y Microsoft Entra Domain Services, métodos de autenticación (SSO, MFA, passwordless), identidades externas, acceso condicional, [[Azure RBAC]], Confianza Cero, defensa en profundidad, Microsoft Defender for Cloud

### Descripción de la administración y la gobernanza de Azure (30-35%)

- [ ] **Gestión de costes**: factores que afectan al coste, Pricing Calculator, Cost Management, etiquetas
- [ ] **Gobernanza y cumplimiento**: Microsoft Purview, Azure Policy, bloqueos de recursos
- [ ] **Herramientas de gestión y despliegue**: Azure Portal, Cloud Shell, CLI, Azure PowerShell, Azure Arc, Infrastructure as Code, plantillas ARM ([[Terraform vs Bicep]])
- [ ] **Herramientas de supervisión**: Azure Advisor, Azure Service Health, Azure Monitor (Log Analytics, alertas, Application Insights)

## Progreso

Estado: **en curso** (piloto de este repositorio, iniciado 2026-07-07).

## Laboratorios

Ninguno todavía. Añadir en `certifications/AZ-900/labs/` a medida que se completen.

## Conceptos relacionados

- [[Shared Responsibility Model]]
- [[Azure RBAC]]
- [[Managed Identities]]
- [[Key Vault]]
- [[Entra ID]]
- [[Azure Networking]]
- [[Private Endpoints]]
- [[Terraform vs Bicep]]

## Ejemplos

Ninguno todavía. Añadir en `certifications/AZ-900/examples/` o referenciar `examples/` general.
