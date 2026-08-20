# Ejemplos — Bicep

Dos fuentes locales distintas:

- [Azure/bicep](https://github.com/Azure/bicep) (clon local en `raw/github/bicep`) — el compilador y lenguaje en sí (`docs/`, `src/`). Útil como referencia de sintaxis, no como ejemplo de arquitectura desplegable.
- [Azure/azure-quickstart-templates](https://github.com/Azure/azure-quickstart-templates) (clon local en `raw/github/azure-quickstart-templates`) — plantillas ARM/Bicep oficiales y desplegables. Esta es la fuente a usar para ejemplos reales.

Quickstarts relevantes para AI-200 en `quickstarts/`:

| Servicio | Carpeta |
|---|---|
| Azure AI Agent Service | `microsoft.azure-ai-agent-service` |
| Azure AI Services / Cognitive Services | `microsoft.cognitiveservices` |
| Azure AI Search | `microsoft.search` |
| Azure Cosmos DB | `microsoft.documentdb` |
| Azure Database for PostgreSQL | `microsoft.dbforpostgresql` |
| Azure Key Vault | `microsoft.keyvault` |
| Azure Kubernetes Service | `microsoft.containerservice` |
| Azure Container Registry | `microsoft.containerregistry` |
| Azure Health Data AI Services | `microsoft.healthdataaiservices` |

No hay quickstart local dedicado a Container Apps ni Azure Managed Redis — verificar en `application-workloads/` o directamente en [Microsoft Learn](https://learn.microsoft.com/en-us/azure/container-apps/) si se necesita.
