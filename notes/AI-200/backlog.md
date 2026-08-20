---
title: AI-200 — Backlog de conceptos
tags: [certification, backlog]
certification: [AI-200]
updated: 2026-07-07
sources: []
---

# Backlog de conceptos — AI-200

Conceptos extraídos de la skills outline ([INDEX.md](../../certifications/AI-200/INDEX.md)), el roadmap oficial ([roadmap.md](roadmap.md)) y la auditoría de documentación ([documentation-audit.md](documentation-audit.md)). Ninguno se desarrolla todavía en `knowledge/` — es solo el backlog priorizado, pendiente de aprobación (ver Novena tarea).

Prioridad: **Alta** (núcleo de la skills outline, alto peso), **Media** (soporte/transversal), **Baja** (contexto, bajo peso o fuera de la outline pero relevante).

| Concepto | Prioridad | Certificación | Servicio | Dependencias | Documentación | Ejemplos | Laboratorios |
|---|---|---|---|---|---|---|---|
| Azure Container Registry | Alta | AI-200 | ACR | — | `raw/azure-docs/articles/app-service/` (parcial); falta doc dedicada de ACR | `azure-cli/command_modules/acr` | Módulo "Store and manage containers in ACR" |
| Despliegue de contenedores en App Service | Alta | AI-200 | App Service | ACR | `raw/azure-docs/articles/app-service/` | — | Módulo "Deploy containers to Azure App Service" |
| Azure Container Apps (entornos, revisiones) | Alta | AI-200 | Container Apps | ACR | `raw/azure-docs/articles/container-apps/` | quickstart `microsoft.???` (verificar en quickstart-templates) | Ruta "Deploy and manage apps on Azure Container Apps" |
| KEDA / escalado por eventos | Media | AI-200 | Container Apps | Container Apps | `raw/azure-docs/articles/container-apps/` | — | Módulo "Scale containers in Azure Container Apps" |
| AKS — despliegue y configuración | Alta | AI-200, AZ-104 | AKS | ACR, VNet | **falta clonar** (ver missing-documentation.md) | `azure-quickstart-templates/quickstarts/microsoft.containerservice` | Ruta "Deploy and monitor apps on AKS". Página existente: [[AKS]] (stub) |
| AKS — monitorización y troubleshooting | Media | AI-200 | AKS, Azure Monitor | AKS | falta Azure Monitor local | — | Módulo "Monitor and troubleshoot apps on AKS" |
| Cosmos DB for NoSQL — queries SDK | Alta | AI-200 | Cosmos DB | — | **falta clonar** | `azure-sdk-for-python/sdk/cosmos/azure-cosmos/samples` | Ruta "Develop AI solutions with Cosmos DB" |
| Cosmos DB — vector search / embeddings | Alta | AI-200 | Cosmos DB | Azure OpenAI (embeddings) | falta clonar | mismo SDK, revisar samples de vector search | Módulo "Implement vector search on Cosmos DB" |
| Cosmos DB — optimización RU/índices/coherencia | Media | AI-200 | Cosmos DB | Cosmos DB | falta clonar | — | Módulo "Optimize query performance" |
| PostgreSQL + pgvector | Alta | AI-200 | Azure Database for PostgreSQL | — | falta clonar | `azure-quickstart-templates/quickstarts/microsoft.dbforpostgresql`, `azure-sdk-for-python/sdk/cosmosdbforpostgresql` (si aplica) | Ruta "Develop AI solutions with PostgreSQL" |
| Azure Managed Redis — datos y vectores | Media | AI-200 | Redis | — | `raw/azure-docs/articles/azure-cache-for-redis/` o `redis/` (verificar solape) | — | Ruta "Enhance AI solutions with Azure Managed Redis" |
| Azure Service Bus (colas, dead-letter, temas) | Alta | AI-200 | Service Bus | — | `raw/azure-docs/articles/service-bus-messaging/` | `azure-sdk-for-python/sdk/servicebus/azure-servicebus/samples` | Módulo "Queue and process AI operations with Service Bus" |
| Azure Event Grid | Alta | AI-200 | Event Grid | — | `raw/azure-docs/articles/event-grid/` | `azure-sdk-for-python/sdk/eventgrid/azure-eventgrid/samples` | Módulo "Event-driven AI workflows with Event Grid" |
| Azure Functions (triggers/bindings) | Alta | AI-200 | Functions | Service Bus, Event Grid | `raw/azure-docs/articles/azure-functions/` | — | Módulo "Build serverless AI backends with Functions" |
| Azure Key Vault (secretos, rotación) | Alta | AI-200, AZ-500 | Key Vault | Managed Identity | falta clonar | `azure-sdk-for-python/sdk/keyvault/*/samples` | Módulo "Manage app secrets with Key Vault". Página existente: [[Key Vault]] (stub) |
| Azure App Configuration | Media | AI-200 | App Configuration | Key Vault | `raw/azure-docs/articles/azure-app-configuration/` | `azure-sdk-for-python/sdk/appconfiguration/*/samples` | Módulo "Manage app settings with App Configuration" |
| OpenTelemetry SDK | Media | AI-200 | Azure Monitor / App Insights | Functions/Container Apps | falta Azure Monitor local | — | Módulo "Instrument an app with OpenTelemetry" |
| KQL para logs/métricas | Media | AI-200, AZ-104 | Azure Monitor / Log Analytics | OpenTelemetry | falta clonar | — | Módulo "Analyze app telemetry with logs and metrics" |
| Azure AI Foundry (proyectos, hubs) | Alta | AI-200 | AI Foundry | Entra ID, RBAC | **falta clonar** (no está en skills outline explícita pero es el servicio "paraguas" mencionado en el prompt de trabajo) | `azure-sdk-for-python/sdk/ai/azure-ai-projects/samples` | — |
| Azure OpenAI — despliegue de modelos | Alta | AI-200 | Azure OpenAI | AI Foundry | `raw/architecture-center/docs/ai-ml/openai/` | `azure-sdk-for-python/sdk/openai/azure-openai/samples` | — |
| Embeddings y búsqueda vectorial (patrón RAG) | Alta | AI-200 | Azure OpenAI + Cosmos DB/PostgreSQL/AI Search | Azure OpenAI, Cosmos DB/PostgreSQL | `raw/architecture-center/docs/ai-ml/guide/rag/` | — | — |
| Azure AI Search | Media | AI-200 | AI Search | Azure OpenAI (embeddings) | falta clonar | `azure-sdk-for-python/sdk/search/azure-search-documents/samples` | quickstart `microsoft.search` |
| Azure AI Agent Service | Media | AI-200 | AI Agents | AI Foundry, Azure OpenAI | falta clonar | `azure-sdk-for-python/sdk/ai/azure-ai-agents/samples` | quickstart `microsoft.azure-ai-agent-service` |
| Azure AI Content Safety | Baja | AI-200 | Content Safety | Azure OpenAI | falta clonar | — | — |
| Azure AI Document Intelligence | Media | AI-200 | Document Intelligence | Storage | falta clonar | — | `example-scenario/ai/extract-object-text.md` (architecture-center) |
| Managed Identity aplicada a IA | Alta | AI-200, AZ-500 | Managed Identity | RBAC, Entra ID | página existente [[Managed Identities]] | — | — |
| RBAC aplicado a servicios de IA | Alta | AI-200, AZ-500 | Azure RBAC | Entra ID | página existente [[Azure RBAC]] | — | — |
| Private Endpoints en arquitecturas de IA | Media | AI-200, AZ-500 | Private Link/VNet | VNet | página existente [[Private Endpoints]] | — | — |
| Well-Architected Framework para cargas de IA | Baja | AI-200 | transversal | todos los anteriores | `raw/well-architected/well-architected/ai/` (completo) | — | — |

## Relacionado

- [documentation-audit.md](documentation-audit.md)
- [missing-documentation.md](missing-documentation.md)
- [knowledge-graph.md](knowledge-graph.md)
- [INDEX.md](../../certifications/AI-200/INDEX.md)
