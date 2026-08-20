---
title: AI-200 — Desarrollo de soluciones en la nube de IA en Azure
tags: [certification]
certification: [AI-200]
updated: 2026-07-07
sources:
  - https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/ai-200
---

# AI-200: Desarrollo de soluciones en la nube de IA en Azure

## Descripción

Certificación centrada en el desarrollo de soluciones de IA en Azure, con énfasis en servicios y componentes de back-end. El candidato contribuye a todas las fases del ciclo de vida: recopilación de requisitos, diseño, desarrollo, implementación, seguridad y supervisión.

## Objetivos

Demostrar experiencia en:

- SDKs de Azure y de terceros usados en Azure.
- Servicios de administración de datos de Azure (Cosmos DB, PostgreSQL, Redis).
- Monitorización y solución de problemas en Azure.
- Mensajería y eventos de Azure.
- Bases de datos vectoriales y patrones RAG.
- Programación en Python.
- Implementación de aplicaciones en contenedor en Azure.

## Habilidades medidas

> Outline oficial vigente a fecha de la fuente citada; verificar en Microsoft Learn antes de programar el examen.

| Área | Peso |
|---|---|
| Desarrollo de soluciones en contenedores en Azure | 20-25% |
| Desarrollo de soluciones de IA mediante servicios de administración de datos de Azure | 25-30% |
| Conexión y consumo de servicios de Azure | 20-25% |
| Protección, supervisión y solución de problemas de soluciones de Azure | 20-25% |

## Módulos

### Desarrollo de soluciones en contenedores en Azure (20-25%)

- [ ] **Hospedaje de aplicaciones de contenedor**: Azure Container Registry (build, almacenamiento, versionado, ACR Tasks), despliegue de contenedores en Azure App Service (variables de entorno y secretos)
- [ ] **Soluciones orquestadas por contenedores**: [[AKS]] mediante manifiestos, Azure Container Apps (entornos, revisiones, KEDA para escalado por eventos), supervisión y troubleshooting de AKS/Container Apps (logs, eventos, conectividad extremo a extremo)

### Desarrollo de soluciones de IA mediante servicios de administración de datos (25-30%)

- [ ] **Azure Cosmos DB para NoSQL**: conexión y consultas vía SDK, optimización de RU (índices, niveles de coherencia), almacenamiento/recuperación de embeddings y búsqueda de similitud vectorial, change feed processor
- [ ] **Azure Database for PostgreSQL**: conexión y consultas vía SDK, diseño de esquemas e índices, pgvector (latencia, coste de proceso), dimensionado de recursos para cargas vectoriales, búsqueda de similitud y patrones RAG con filtrado de metadatos, optimización de conexión
- [ ] **Azure Managed Redis en soluciones de IA**: operaciones de datos administradas (caché, expiración, invalidación), indexación de vectores para búsqueda de similitud

### Conexión y consumo de servicios de Azure (20-25%)

- [ ] **Soluciones basadas en eventos y mensajes**: Azure Service Bus (colas, dead-letter, temas/suscripciones), Azure Event Grid (filtros, eventos personalizados, reintentos)
- [ ] **Azure Functions**: APIs serverless (triggers y bindings), configuración y despliegue de function apps

### Protección, supervisión y solución de problemas (20-25%)

- [ ] **Soluciones seguras**: [[Key Vault]] (rotación y recuperación de secretos), Azure App Configuration
- [ ] **Supervisión y troubleshooting**: OpenTelemetry SDK para sistemas distribuidos, consultas KQL para logs y métricas

## Roadmap de estudio

Ver [notes/AI-200/roadmap.md](../../notes/AI-200/roadmap.md): las 9 rutas oficiales de Microsoft Learn (24 módulos) que cubren esta skills outline, con checkboxes de progreso y huecos para tus propias notas del curso AI-200T00.

## Progreso

Estado: **en curso**. Ver detalle y checkboxes por módulo en [notes/AI-200/roadmap.md](../../notes/AI-200/roadmap.md).

## Notas adicionales

- [notes/AI-200/documentation-audit.md](../../notes/AI-200/documentation-audit.md) — auditoría de qué documentación de `raw/` cubre ya esta certificación.
- [notes/AI-200/missing-documentation.md](../../notes/AI-200/missing-documentation.md) — fuentes oficiales relevantes que faltan clonar.
- [notes/AI-200/backlog.md](../../notes/AI-200/backlog.md) — backlog priorizado de conceptos pendientes de desarrollar en `knowledge/`.
- [notes/AI-200/knowledge-graph.md](../../notes/AI-200/knowledge-graph.md) — grafo de dependencias entre los servicios de la certificación.

## Laboratorios

Ver [labs/AI-200/README.md](../../labs/AI-200/README.md).

## Conceptos relacionados

- [[AKS]]
- [[Key Vault]]
- [[Managed Identities]]
- [[Shared Responsibility Model]]

## Ejemplos

Ninguno todavía. Candidatos por tecnología en [examples/README.md](../../examples/README.md); detalle de qué ejemplo usar en qué concepto en [notes/AI-200/backlog.md](../../notes/AI-200/backlog.md).
