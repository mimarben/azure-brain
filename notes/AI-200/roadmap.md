---
title: AI-200 — Roadmap de estudio
tags: [certification, roadmap]
certification: [AI-200]
updated: 2026-07-07
sources:
  - https://learn.microsoft.com/en-us/training/courses/ai-200t00
  - https://learn.microsoft.com/en-us/training/paths/implement-container-app-hosting-azure/
  - https://learn.microsoft.com/en-us/training/paths/deploy-manage-apps-azure-container-apps/
  - https://learn.microsoft.com/en-us/training/paths/deploy-monitor-apps-azure-kubernetes-service/
  - https://learn.microsoft.com/en-us/training/paths/develop-ai-solutions-azure-cosmos-db/
  - https://learn.microsoft.com/en-us/training/paths/develop-ai-solutions-azure-database-postgresql/
  - https://learn.microsoft.com/en-us/training/paths/enhance-ai-solutions-azure-managed-redis/
  - https://learn.microsoft.com/en-us/training/paths/integrate-backend-services-ai-solutions/
  - https://learn.microsoft.com/en-us/training/paths/manage-app-secrets-configuration/
  - https://learn.microsoft.com/en-us/training/paths/observe-troubleshoot-apps/
---

# Roadmap de estudio — AI-200

Plan de estudio para AI-200 basado en el curso oficial **AI-200T00: Develop AI cloud solutions on Azure** (120h, nivel intermedio) y sus 9 rutas de aprendizaje oficiales de Microsoft Learn, que mapean 1:1 con las 4 áreas de la skills outline (ver [INDEX.md](../../certifications/AI-200/INDEX.md)).

**Cómo usar este documento**: marca los checkboxes según avances. Cada bloque tiene un apartado *Notas propias* — ahí es donde debes volcar tus apuntes del curso, vídeos o cosas que te hayan costado; no lo tocaré yo al actualizar el repositorio salvo que me pidas fusionarlo con `knowledge/`.

> Nota sobre fuentes locales: `raw/azure-docs` en este repo es un clon parcial y **no incluye** las carpetas `cosmos-db/`, `postgresql/`, `key-vault/` ni `aks/` (sí incluye `azure-cache-for-redis/`, `service-bus-messaging/`, `event-grid/`, `azure-functions/`, `container-apps/`, `app-service/`, `azure-app-configuration/`). Para esos cuatro temas los enlaces de abajo van directos a Microsoft Learn — si quieres, puedo clonar esas subcarpetas concretas para tenerlas offline.

## Progreso general

- [ ] Bloque 1 — Contenedores en Azure
- [ ] Bloque 2 — Servicios de datos para IA
- [ ] Bloque 3 — Conexión y consumo de servicios
- [ ] Bloque 4 — Seguridad y observabilidad
- [ ] Evaluación de práctica gratuita superada
- [ ] Examen AI-200 programado
- [ ] Examen AI-200 aprobado (fecha: _pendiente_)

---

## Bloque 1 — Desarrollo de soluciones en contenedores en Azure (20-25% del examen)

### 1.1 [Implement container application hosting on Azure](https://learn.microsoft.com/en-us/training/paths/implement-container-app-hosting-azure/) (2 módulos)

- [ ] [Store and manage containers in Azure Container Registry](https://learn.microsoft.com/en-us/training/modules/store-manage-containers-azure-container-registry/)
- [ ] [Deploy containers to Azure App Service](https://learn.microsoft.com/en-us/training/modules/deploy-containers-azure-app-service/)

Docs: [Azure Container Registry](https://learn.microsoft.com/es-es/azure/container-registry/) · [App Service](https://learn.microsoft.com/es-es/azure/app-service/) · local: `raw/azure-docs/articles/app-service/`

> **Notas propias:**

### 1.2 [Deploy and manage apps on Azure Container Apps](https://learn.microsoft.com/en-us/training/paths/deploy-manage-apps-azure-container-apps/) (3 módulos)

- [ ] [Deploy containers to Azure Container Apps](https://learn.microsoft.com/en-us/training/modules/deploy-containers-azure-container-apps/)
- [ ] [Manage containers in Azure Container Apps](https://learn.microsoft.com/en-us/training/modules/manage-containers-azure-container-apps/)
- [ ] [Scale containers in Azure Container Apps](https://learn.microsoft.com/en-us/training/modules/scale-containers-azure-container-apps/) (incluye KEDA)

Docs: local `raw/azure-docs/articles/container-apps/`

> **Notas propias:**

### 1.3 [Deploy and monitor applications on Azure Kubernetes Service](https://learn.microsoft.com/en-us/training/paths/deploy-monitor-apps-azure-kubernetes-service/) (3 módulos)

- [ ] [Deploy applications to Azure Kubernetes Service](https://learn.microsoft.com/en-us/training/modules/deploy-apps-azure-kubernetes-service/)
- [ ] [Configure applications on Azure Kubernetes Service](https://learn.microsoft.com/en-us/training/modules/configure-apps-azure-kubernetes-service/)
- [ ] [Monitor and troubleshoot applications on Azure Kubernetes Service](https://learn.microsoft.com/en-us/training/modules/monitor-apps-azure-kubernetes-service/)

Concepto relacionado en el repo: [[AKS]] (stub — buen candidato para desarrollar con lo que aprendas aquí).

> **Notas propias:**

---

## Bloque 2 — Desarrollo de soluciones de IA mediante servicios de datos (25-30% del examen)

### 2.1 [Develop AI solutions with Azure Cosmos DB for NoSQL](https://learn.microsoft.com/en-us/training/paths/develop-ai-solutions-azure-cosmos-db/) (3 módulos)

- [ ] [Build queries for Azure Cosmos DB for NoSQL](https://learn.microsoft.com/en-us/training/modules/build-query-azure-cosmos-db/)
- [ ] [Implement vector search on Azure Cosmos DB for NoSQL](https://learn.microsoft.com/en-us/training/modules/implement-vector-search-azure-cosmos-db/) (VectorDistance, hybrid search, change feed)
- [ ] [Optimize query performance for Azure Cosmos DB for NoSQL](https://learn.microsoft.com/en-us/training/modules/optimize-query-performance-azure-cosmos-db/) (índices, niveles de coherencia)

Docs: [Azure Cosmos DB](https://learn.microsoft.com/es-es/azure/cosmos-db/) (no hay copia local en `raw/`)

> **Notas propias:**

### 2.2 [Develop AI solutions with Azure Database for PostgreSQL](https://learn.microsoft.com/en-us/training/paths/develop-ai-solutions-azure-database-postgresql/) (3 módulos)

- [ ] [Build and query with Azure Database for PostgreSQL](https://learn.microsoft.com/en-us/training/modules/build-query-azure-database-postgresql/)
- [ ] [Implement vector search with Azure Database for PostgreSQL](https://learn.microsoft.com/en-us/training/modules/implement-vector-search-azure-database-postgresql/) (pgvector)
- [ ] [Optimize vector search in Azure Database for PostgreSQL](https://learn.microsoft.com/en-us/training/modules/optimize-vector-search-azure-database-postgresql/) (índices, pooling)

Docs: no hay copia local en `raw/`; usar Microsoft Learn directamente.

> **Notas propias:**

### 2.3 [Enhance AI solutions with Azure Managed Redis](https://learn.microsoft.com/en-us/training/paths/enhance-ai-solutions-azure-managed-redis/) (3 módulos)

- [ ] [Implement data operations in Azure Managed Redis](https://learn.microsoft.com/en-us/training/modules/implement-data-operations-azure-managed-redis/)
- [ ] [Implement event messaging with Azure Managed Redis](https://learn.microsoft.com/en-us/training/modules/implement-event-messaging-azure-managed-redis/) (pub/sub, Streams)
- [ ] [Implement vector storage in Azure Managed Redis](https://learn.microsoft.com/en-us/training/modules/implement-vector-storage-azure-managed-redis/)

Docs: [Azure Cache for Redis](https://learn.microsoft.com/es-es/azure/azure-cache-for-redis/) · local: `raw/azure-docs/articles/azure-cache-for-redis/`

> **Notas propias:**

---

## Bloque 3 — Conexión y consumo de servicios de Azure (20-25% del examen)

### 3.1 [Integrate backend services for AI solutions](https://learn.microsoft.com/en-us/training/paths/integrate-backend-services-ai-solutions/) (3 módulos)

- [ ] [Queue and process AI operations with Azure Service Bus](https://learn.microsoft.com/en-us/training/modules/queue-process-operations-service-bus/)
- [ ] [Develop event-driven AI workflows with Azure Event Grid](https://learn.microsoft.com/en-us/training/modules/event-driven-workflows-event-grid/)
- [ ] [Build serverless AI backends with Azure Functions](https://learn.microsoft.com/en-us/training/modules/build-backends-azure-functions/)

Docs: [Service Bus](https://learn.microsoft.com/es-es/azure/service-bus-messaging/) · [Event Grid](https://learn.microsoft.com/es-es/azure/event-grid/) · [Azure Functions](https://learn.microsoft.com/es-es/azure/azure-functions/) — todas con copia local en `raw/azure-docs/articles/{service-bus-messaging,event-grid,azure-functions}/`

> **Notas propias:**

---

## Bloque 4 — Protección, supervisión y solución de problemas (20-25% del examen)

### 4.1 [Manage application secrets and configuration for AI solutions](https://learn.microsoft.com/en-us/training/paths/manage-app-secrets-configuration/) (2 módulos)

- [ ] [Manage application secrets with Azure Key Vault](https://learn.microsoft.com/en-us/training/modules/manage-app-secrets-key-vault/) — rotación, caching, managed identity
- [ ] [Manage application settings with Azure App Configuration](https://learn.microsoft.com/en-us/training/modules/manage-app-settings-app-config/) — feature flags, referencias a Key Vault

Concepto relacionado en el repo: [[Key Vault]] (stub — este es el módulo ideal para desarrollarlo).
Docs: [Azure App Configuration](https://learn.microsoft.com/es-es/azure/azure-app-configuration/) — local en `raw/azure-docs/articles/azure-app-configuration/`. Key Vault sin copia local.

> **Notas propias:**

### 4.2 [Observe and troubleshoot apps on Azure](https://learn.microsoft.com/en-us/training/paths/observe-troubleshoot-apps/) (2 módulos)

- [ ] [Instrument an app with OpenTelemetry](https://learn.microsoft.com/en-us/training/modules/instrument-app-opentelemetry/)
- [ ] [Analyze app telemetry with logs and metrics](https://learn.microsoft.com/en-us/training/modules/analyze-telemetry-logs-metrics/) (KQL, Application Insights)

> **Notas propias:**

---

## Plan de sesiones sugerido

El curso oficial dura 5 días (120h en formato self-paced). Una posible distribución en sesiones de estudio:

| Sesión | Contenido | Bloque |
|---|---|---|
| 1 | Container Registry, App Service, Container Apps | 1 |
| 2 | AKS (deploy, config, monitor) | 1 |
| 3 | Cosmos DB (queries, vector search, optimización) | 2 |
| 4 | PostgreSQL + pgvector | 2 |
| 5 | Azure Managed Redis | 2 |
| 6 | Service Bus, Event Grid, Azure Functions | 3 |
| 7 | Key Vault, App Configuration | 4 |
| 8 | OpenTelemetry, KQL, Application Insights | 4 |
| 9 | Repaso + evaluación de práctica gratuita | — |
| 10 | Repaso de puntos débiles según la práctica + examen | — |

## Antes del examen

- [ ] Completar la [evaluación de práctica gratuita](https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/ai-200)
- [ ] Revisar que la skills outline en [INDEX.md](../../certifications/AI-200/INDEX.md) sigue vigente (Microsoft actualiza las guías periódicamente)
- [ ] Repasar los stubs de `knowledge/` que se hayan ido completando durante el estudio ([[AKS]], [[Key Vault]], [[Managed Identities]])
- [ ] Programar el examen desde [tu perfil de Microsoft Learn](https://learn.microsoft.com/es-es/users)

## Relacionado

- [Índice de la certificación](../../certifications/AI-200/INDEX.md) — volver al resumen y skills outline
- [[AKS]]
- [[Key Vault]]
- [[Managed Identities]]
