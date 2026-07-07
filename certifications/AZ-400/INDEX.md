---
title: AZ-400 — Diseño e implementación de soluciones de Microsoft DevOps
tags: [certification]
certification: [AZ-400]
updated: 2026-07-07
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-400
---

# AZ-400: Diseño e implementación de soluciones de Microsoft DevOps

## Descripción

Certificación de ingeniero de DevOps: entrega continua de seguridad, integración, pruebas, entrega, despliegue, supervisión y feedback. Diseña flujo de trabajo, colaboración, control de código fuente y automatización, trabajando con desarrolladores, SREs, administradores Azure e ingenieros de seguridad.

## Objetivos

Experiencia en administración y desarrollo en Azure (fuerte en al menos una), más experiencia implementando soluciones GitHub y Azure DevOps.

## Habilidades medidas

*Vigente desde el 24 de abril de 2026 según la guía oficial — verificar antes de programar el examen.*

| Área | Peso |
|---|---|
| Diseño e implementación de procesos y comunicaciones | 10-15% |
| Diseño e implementación de una estrategia de control de código fuente | 10-15% |
| Diseño e implementación de canalizaciones de compilación y versión | 50-55% |
| Desarrollo de un plan de seguridad y cumplimiento | 10-15% |
| Implementación de una estrategia de instrumentación | 5-10% |

## Módulos

### Procesos y comunicaciones (10-15%)

- [ ] **Trazabilidad y flujo de trabajo**: GitHub flow, ciclos de feedback (notificaciones, issues), integración de work tracking (GitHub Projects, Azure Boards, repos), trazabilidad de origen/bug/calidad
- [ ] **Métricas y consultas**: dashboards (tiempos de ciclo, MTTR, lead time), métricas para planificación/desarrollo/pruebas/seguridad/entrega/operaciones
- [ ] **Colaboración**: documentación con Markdown/Mermaid, notas de versión y docs de API, generación desde historial Git, webhooks, integración Azure Boards↔GitHub, integración con Teams

### Estrategia de control de código fuente (10-15%)

- [ ] **Branching**: trunk-based, feature branching, release branching, políticas de PR y branch protection, reglas de merge
- [ ] **Repositorios**: Git LFS/git-fat, escalado (Scalar, repos compartidos), permisos, etiquetas, recuperación/eliminación de datos específicos

### Canalizaciones de compilación y despliegue (50-55%)

- [ ] **Gestión de paquetes**: GitHub Packages, Azure Artifacts, feeds/vistas, versionado (SemVer/CalVer), versionado de artefactos de pipeline
- [ ] **Estrategia de pruebas**: quality/release gates, pruebas unitarias/integración/carga, integración en pipeline, cobertura de código
- [ ] **Pipelines**: GitHub Actions vs Azure Pipelines, runners/agentes, integración GitHub↔Pipelines, triggers, YAML, paralelismo y multi-stage, escenarios híbridos, plantillas YAML reutilizables, environments con approvals
- [ ] **Despliegues**: blue-green, canary, ring, feature flags (Azure App Configuration Feature Manager), A/B testing, minimizar downtime, hotfix, resiliencia, despliegue en contenedores/binarios/scripts, tareas de BD
- [ ] **[[Terraform vs Bicep|Infrastructure as Code]]**: tecnología de configuración, estrategia de IaC (control de versiones + testing + deploy), desired state configuration (Azure Automation, ARM, Bicep, Machine Configuration), Azure Deployment Environments
- [ ] **Mantenimiento de pipelines**: monitorización de salud (fallos, duración, flaky tests), optimización de coste/duración/rendimiento/fiabilidad, concurrencia, retención de artefactos, migración de pipelines clásicas a YAML

### Plan de seguridad y cumplimiento (10-15%)

- [ ] **Autenticación y autorización**: entidades de servicio vs [[Managed Identities]], autenticación GitHub (Apps, GITHUB_TOKEN, PAT), service connections de Azure DevOps, permisos/roles en GitHub y Azure DevOps
- [ ] **Gestión de secretos**: [[Key Vault]], autenticación sin secretos (workload identity federation/OIDC) en GitHub Actions/Azure Pipelines, archivos seguros, prevención de fugas de información
- [ ] **Escaneo de seguridad**: dependencias/código/secretos/licencias, Defender for Cloud DevOps Security, GitHub Advanced Security, escaneo de contenedores (CodeQL), Dependabot

### Estrategia de instrumentación (5-10%)

- [ ] **Supervisión de DevOps**: Azure Monitor + logs integrados con herramientas DevOps, Application Insights, VM/Container/Storage/Network Insights, GitHub Insights, alertas en Actions/Pipelines
- [ ] **Análisis de métricas**: CPU/memoria/disco/red, telemetría de uso/rendimiento, distributed tracing con Application Insights, consultas KQL

## Progreso

Estado: **no iniciado**.

## Laboratorios

Ninguno todavía. Añadir en `certifications/AZ-400/labs/`.

## Conceptos relacionados

- [[Key Vault]]
- [[Managed Identities]]
- [[Terraform vs Bicep]]
- [[Azure RBAC]]

## Ejemplos

Ninguno todavía. Candidatos: pipeline YAML multi-stage con approvals, plantilla de GitHub Actions con OIDC a Azure.
