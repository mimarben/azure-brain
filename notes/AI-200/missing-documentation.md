---
title: AI-200 — Documentación oficial que falta clonar
tags: [certification, audit]
certification: [AI-200]
updated: 2026-07-07
sources: []
---

# Documentación faltante — AI-200

Listado de fuentes oficiales relevantes para AI-200 que **no** existen todavía en `raw/`. No se ha descargado nada; esto es un backlog de qué clonar cuando el usuario lo decida.

## Documentación conceptual (Microsoft Learn / azure-docs)

| Servicio | URL oficial | Carpeta recomendada en `raw/` |
|---|---|---|
| Azure AI Foundry | https://learn.microsoft.com/en-us/azure/ai-foundry/ | `raw/azure-docs/articles/ai-foundry/` |
| Azure OpenAI Service | https://learn.microsoft.com/en-us/azure/ai-services/openai/ | `raw/azure-docs/articles/ai-services/openai/` |
| Azure AI Search | https://learn.microsoft.com/en-us/azure/search/ | `raw/azure-docs/articles/search/` |
| Azure AI Agent Service | https://learn.microsoft.com/en-us/azure/ai-services/agents/ | `raw/azure-docs/articles/ai-services/agents/` |
| Azure AI Content Safety | https://learn.microsoft.com/en-us/azure/ai-services/content-safety/ | `raw/azure-docs/articles/ai-services/content-safety/` |
| Azure AI Document Intelligence | https://learn.microsoft.com/en-us/azure/ai-services/document-intelligence/ | `raw/azure-docs/articles/ai-services/document-intelligence/` |
| Azure Cosmos DB | https://learn.microsoft.com/en-us/azure/cosmos-db/ | `raw/azure-docs/articles/cosmos-db/` |
| Azure Database for PostgreSQL | https://learn.microsoft.com/en-us/azure/postgresql/ | `raw/azure-docs/articles/postgresql/` |
| Azure Key Vault | https://learn.microsoft.com/en-us/azure/key-vault/ | `raw/azure-docs/articles/key-vault/` |
| Azure Kubernetes Service (AKS) | https://learn.microsoft.com/en-us/azure/aks/ | `raw/azure-docs/articles/aks/` |
| Azure Monitor | https://learn.microsoft.com/en-us/azure/azure-monitor/ | `raw/azure-docs/articles/azure-monitor/` |
| Microsoft Entra ID (completo, no solo B2C) | https://learn.microsoft.com/en-us/entra/identity/ | `raw/azure-docs/articles/active-directory/` |
| Azure SQL Database | https://learn.microsoft.com/en-us/azure/azure-sql/database/ | `raw/azure-docs/articles/azure-sql/` |

> Nota: `raw/azure-docs` en este repo es un **clon parcial** de MicrosoftDocs/azure-docs (146 de las carpetas totales del repo oficial). Estas rutas ya existen en el repo oficial upstream — solo falta traerlas al clon local, no hay que "crear" documentación nueva.

## Repositorios GitHub oficiales no clonados

| Repositorio | URL | Carpeta recomendada |
|---|---|---|
| Azure-Samples/azureai-samples | https://github.com/Azure-Samples/azureai-samples | `raw/github/azureai-samples` |
| Azure-Samples/azure-search-openai-demo | https://github.com/Azure-Samples/azure-search-openai-demo | `raw/github/azure-search-openai-demo` |
| Azure/azure-sdk-for-js | https://github.com/Azure/azure-sdk-for-js | `raw/github/azure-sdk-for-js` |
| hashicorp/terraform-provider-azurerm | https://github.com/hashicorp/terraform-provider-azurerm | `raw/github/terraform-provider-azurerm` |
| Azure/azure-rest-api-specs | https://github.com/Azure/azure-rest-api-specs | `raw/github/azure-rest-api-specs` |
| microsoft/kernel-memory o Azure/azure-ai-agent-service-labs (verificar nombre exacto vigente) | https://github.com/microsoft (buscar labs oficiales de AI Agent Service) | `raw/github/` (a determinar) |

## Relacionado

- [documentation-audit.md](documentation-audit.md)
- [backlog.md](backlog.md)
- [INDEX.md](../../certifications/AI-200/INDEX.md)
