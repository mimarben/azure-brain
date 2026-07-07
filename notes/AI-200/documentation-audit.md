---
title: AI-200 — Auditoría de documentación disponible
tags: [certification, audit]
certification: [AI-200]
updated: 2026-07-07
sources:
  - raw/azure-docs/articles/
  - raw/architecture-center/docs/
  - raw/well-architected/well-architected/
  - raw/github/
---

# Auditoría de documentación — AI-200

Inventario de lo que ya existe en `raw/` (clones locales) frente a la skills outline de [INDEX.md](../../certifications/AI-200/INDEX.md). No se ha copiado ni movido nada; esto es solo un mapa de qué usar y de dónde.

## `raw/azure-docs/articles/` (146 carpetas, clon parcial)

Cubierto localmente y relevante para AI-200:

| Carpeta | Bloque AI-200 |
|---|---|
| `app-service/` | 1.1 Hosting de contenedores |
| `container-apps/` | 1.2 Container Apps |
| `azure-cache-for-redis/` (+ `redis/`) | 2.3 Azure Managed Redis |
| `service-bus-messaging/` | 3.1 Mensajería |
| `event-grid/` | 3.1 Eventos |
| `azure-functions/` | 3.1 Serverless |
| `azure-app-configuration/` | 4.1 Configuración |
| `role-based-access-control/` | 4.1/transversal — ya consolidado en [[Azure RBAC]] |
| `virtual-network/`, `private-link/` | transversal (seguridad de red) — ya consolidado en [[Private Endpoints]], [[Azure Networking]] |
| `api-management/` | 3.x consumo de servicios (no listado explícitamente en skills outline pero relevante para exponer backends) |
| `storage/` | dependencia común (blobs para ingestión de documentos, Document Intelligence, etc.) |

**No cubierto en este clon** (confirmado por [roadmap.md](roadmap.md), se repite aquí para consolidar): no hay carpetas `cosmos-db/`, `postgresql/`/`azure-sql`, `key-vault/`, `aks/`, `ai-services/`, `cognitive-services/`, `machine-learning/`, `search/` (Azure AI Search), `azure-monitor/` ni `active-directory/` (Entra ID completo — solo está `active-directory-b2c/`). Ver [missing-documentation.md](missing-documentation.md).

## `raw/architecture-center/docs/`

| Carpeta | Contenido | Relevancia |
|---|---|---|
| `ai-ml/openai/` | Arquitecturas de referencia con Azure OpenAI | Alta — RAG, chat, patrones de despliegue |
| `ai-ml/guide/rag/` | Guía de diseño de patrones RAG | Alta — 2.1/2.2 (vector search, embeddings) |
| `ai-ml/architecture/`, `ai-ml/idea/` | Arquitecturas y "ideas" de soluciones de IA (más orientadas a ML clásico/Azure ML que a AI-200) | Media — revisar caso a caso, gran parte es Azure Machine Learning (fuera del scope de AI-200, que es AI Foundry/OpenAI-céntrico) |
| `reference-architectures/ai/` | Arquitecturas antiguas (batch scoring, distributed DL con Python/Kubernetes) | Baja — parecen anteriores a Azure AI Foundry, más orientadas a MLOps clásico |
| `example-scenario/ai/` | Extracción de texto de objetos, detección de anomalías | Media — casos de uso con Document Intelligence / Cognitive Services |
| `data-guide/ai-services` | Guía de servicios de datos para IA | Media — revisar solape con Bloque 2 (Cosmos DB, PostgreSQL) |

## `raw/well-architected/well-architected/ai/`

Cubierto completo localmente (14 páginas): `get-started`, `design-principles`, `design-methodology`, `application-design`, `application-platform`, `data-platform`, `training-data-design`, `grounding-data-design`, `architecture-pattern`, `mlops-genaiops`, `operations`, `personas`, `responsible-ai`, `assessment`.

**Relevancia**: alta para el enfoque arquitectónico general (no está en la skills outline de AI-200 punto por punto, pero da contexto de diseño transversal — seguridad, observabilidad, well-architected pillars aplicados a soluciones de IA). Buen candidato para una página `knowledge/ai-workload-well-architected.md` más adelante (pendiente de aprobación, ver Novena tarea).

## `raw/github/` (5 repos clonados)

| Repo | Relevancia AI-200 | Rutas clave |
|---|---|---|
| `azure-sdk-for-python` | Alta | `sdk/ai/` (azure-ai-agents, azure-ai-inference, azure-ai-projects), `sdk/openai/azure-openai/`, `sdk/search/azure-search-documents/`, `sdk/cosmos/azure-cosmos/`, `sdk/appconfiguration/`, `sdk/eventgrid/`, `sdk/servicebus/`, `sdk/identity/`, `sdk/keyvault/` — todos con `samples/` |
| `azure-sdk-for-net` | Alta (C# es lenguaje secundario de la cert) | `sdk/ai/` (Azure.AI.Agents.Persistent, Azure.AI.Projects), `sdk/openai/`, `sdk/search/`, `sdk/appconfiguration/`, `sdk/eventgrid/`, `sdk/servicebus/`, `sdk/identity/`, `sdk/keyvault/` |
| `azure-cli` | Media | `src/azure-cli/azure/cli/command_modules/{cognitiveservices,containerapp,cosmosdb,keyvault,search,servicebus,eventgrid,appconfig,acr,appservice,monitor}` — código fuente de los comandos, útil para entender flags y comportamiento exacto, no son "ejemplos" per se |
| `azure-quickstart-templates` | Media-alta | `quickstarts/microsoft.azure-ai-agent-service/`, `microsoft.cognitiveservices/`, `microsoft.search/`, `microsoft.documentdb/`, `microsoft.dbforpostgresql/`, `microsoft.keyvault/`, `microsoft.containerservice/`, `microsoft.containerregistry/`, `microsoft.healthdataaiservices/` — plantillas ARM/Bicep oficiales desplegables |
| `bicep` | Baja-media | Repo del lenguaje/compilador en sí, no de plantillas — útil como referencia de sintaxis, no como ejemplo de arquitectura |

**No clonado**: no hay repo `azure-sdk-for-js`, `azuresdk/azure-samples-*` (ej. `azure-search-openai-demo`, `azureai-samples`), ni el provider de Terraform (`terraform-provider-azurerm`). Ver [missing-documentation.md](missing-documentation.md).

## Duplicados / redundancia detectados

- `azure-cache-for-redis/` y `redis/` en `raw/azure-docs/articles/` parecen solaparse (posible reorganización de Microsoft Learn en curso, o `redis/` es el servicio nuevo "Azure Managed Redis" vs. el legado "Azure Cache for Redis"). Verificar contenido antes de citar una u otra en `knowledge/`.
- `reference-architectures/ai/` (antiguo, Azure ML/batch scoring) vs. `ai-ml/openai/` (moderno, AI Foundry/OpenAI): para AI-200 priorizar siempre `ai-ml/openai/` y `ai-ml/guide/rag/`; el material de `reference-architectures/ai/` es de una generación anterior de servicios de IA en Azure y probablemente no aplica al temario actual.

## Relacionado

- [INDEX.md](../../certifications/AI-200/INDEX.md)
- [missing-documentation.md](missing-documentation.md)
- [backlog.md](backlog.md)
- [knowledge-graph.md](knowledge-graph.md)
