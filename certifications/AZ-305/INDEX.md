---
title: AZ-305 — Diseño de soluciones de infraestructura de Microsoft Azure
tags: [certification]
certification: [AZ-305]
updated: 2026-07-07
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-305
---

# AZ-305: Diseño de soluciones de infraestructura de Microsoft Azure

## Descripción

Certificación de arquitecto de soluciones Azure: diseño de soluciones híbridas y en la nube (cómputo, red, almacenamiento, supervisión, seguridad). Traduce requisitos de negocio en diseños alineados con el Well-Architected Framework y el Cloud Adoption Framework, en colaboración con desarrolladores, administradores, ingenieros de seguridad y de datos.

## Objetivos

Experiencia avanzada en operaciones de TI: redes, virtualización, identidad, seguridad, continuidad de negocio, recuperación ante desastres, plataformas de datos y gobernanza — más experiencia con administración Azure, desarrollo Azure y procesos DevOps.

## Habilidades medidas

*Vigente desde el 17 de abril de 2026 según la guía oficial — verificar antes de programar el examen.*

| Área | Peso |
|---|---|
| Diseño de soluciones de identidad, gobernanza y supervisión | 25-30% |
| Diseño de soluciones de almacenamiento de datos | 20-25% |
| Diseño de soluciones de continuidad empresarial | 15-20% |
| Diseño de soluciones de infraestructura | 30-35% |

## Módulos

### Diseño de identidad, gobernanza y supervisión (25-30%)

- [ ] **Registro y supervisión**: solución de logging, enrutamiento de logs, solución de monitorización
- [ ] **Autenticación y autorización**: solución de autenticación, gestión de identidades, autorización de acceso a recursos Azure y on-premises, gestión de secretos/certificados/claves ([[Key Vault]])
- [ ] **Gobernanza**: estructura de management groups/suscripciones/resource groups y estrategia de etiquetado, solución de cumplimiento, gobernanza de identidad

### Diseño de soluciones de almacenamiento de datos (20-25%)

- [ ] **Datos relacionales**: solución de almacenamiento, nivel de cómputo/servicio de BD, escalabilidad, protección de datos
- [ ] **Datos semiestructurados y no estructurados**: solución de almacenamiento, balance características/rendimiento/coste, protección y durabilidad
- [ ] **Integración de datos**: solución de integración, solución de análisis de datos

### Diseño de soluciones de continuidad empresarial (15-20%)

- [ ] **Backup y DR**: recuperación para cargas híbridas/Azure según RTO/RPO, backup/recovery de cómputo, bases de datos y datos no estructurados
- [ ] **Alta disponibilidad**: solución de HA para cómputo, datos relacionales, datos semiestructurados/no estructurados

### Diseño de soluciones de infraestructura (30-35%)

- [ ] **Cómputo**: especificación de componentes según carga de trabajo, solución basada en VMs, en contenedores ([[AKS]]), serverless, procesamiento por lotes
- [ ] **Arquitectura de aplicación**: mensajería, arquitectura basada en eventos, integración de API, caching, gestión de configuración de apps, despliegue automatizado
- [ ] **Migraciones**: evaluación con Cloud Adoption Framework, evaluación de servidores/datos/apps on-premises, migración a IaaS/PaaS, migración de bases de datos y datos no estructurados
- [ ] **Redes**: conectividad a Internet, conectividad a redes on-premises, optimización de seguridad de red, enrutamiento y balanceo de carga ([[Azure Networking]], [[Hub-Spoke]])

## Progreso

Estado: **no iniciado**.

## Laboratorios

Ninguno todavía. Añadir en `certifications/AZ-305/labs/`.

## Conceptos relacionados

- [[Hub-Spoke]]
- [[Azure Networking]]
- [[Private Endpoints]]
- [[Azure RBAC]]
- [[Key Vault]]
- [[AKS]]
- [[Terraform vs Bicep]]

## Ejemplos

Ninguno todavía. Candidatos: diagrama Mermaid de arquitectura hub-spoke, matriz de decisión de cómputo (VM vs contenedor vs serverless).
