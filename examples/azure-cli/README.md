# Ejemplos — Azure CLI

Fuente: [Azure/azure-cli](https://github.com/Azure/azure-cli) (clon local en `raw/github/azure-cli`).

No contiene "ejemplos" como tal, sino el código fuente de cada comando — útil para ver flags exactos, valores por defecto y comportamiento real cuando la documentación pública se queda corta.

Módulos relevantes para AI-200 en `src/azure-cli/azure/cli/command_modules/`:

| Servicio | Módulo |
|---|---|
| Azure Container Registry | `acr` |
| App Service | `appservice` |
| Container Apps | `containerapp` |
| Cognitive Services / Azure AI | `cognitiveservices` |
| Cosmos DB | `cosmosdb` |
| Key Vault | `keyvault` |
| Azure AI Search | `search` |
| Service Bus | `servicebus` |
| Event Grid | `eventgrid` |
| App Configuration | `appconfig` |
| Azure Monitor | `monitor` |

Para comandos reales de ejemplo (no solo código fuente), preferir la documentación oficial de cada comando en [Microsoft Learn — Referencia de Azure CLI](https://learn.microsoft.com/en-us/cli/azure/) o los quickstarts en [bicep/README.md](../bicep/README.md).
