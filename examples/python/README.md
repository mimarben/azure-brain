# Ejemplos — Python

Fuente: [Azure/azure-sdk-for-python](https://github.com/Azure/azure-sdk-for-python) (clon local en `raw/github/azure-sdk-for-python`).

Rutas de `samples/` relevantes para AI-200:

| SDK | Ruta |
|---|---|
| Azure AI Agents / Inference / Projects | `sdk/ai/azure-ai-agents/samples`, `sdk/ai/azure-ai-inference/samples`, `sdk/ai/azure-ai-projects/samples` |
| Azure OpenAI | `sdk/openai/azure-openai/samples` |
| Azure AI Search | `sdk/search/azure-search-documents/samples` |
| Azure Cosmos DB | `sdk/cosmos/azure-cosmos/samples` |
| Azure App Configuration | `sdk/appconfiguration/azure-appconfiguration/samples`, `sdk/appconfiguration/azure-appconfiguration-provider/samples` |
| Azure Event Grid | `sdk/eventgrid/azure-eventgrid/samples` |
| Azure Service Bus | `sdk/servicebus/azure-servicebus/samples` |
| Azure Identity (Managed Identity) | `sdk/identity/azure-identity/samples` |
| Azure Key Vault | `sdk/keyvault/azure-keyvault-keys/samples`, `azure-keyvault-certificates/samples`, `azure-keyvault-administration/samples` |

Sin SDK Python dedicado en el clon local: Azure Database for PostgreSQL (usar `psycopg`/`asyncpg` estándar + `pgvector`, ver [notes/AI-200/missing-documentation.md](../../notes/AI-200/missing-documentation.md)).
