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
- [CLI de Azure](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/2-explore-template-structure?tabs=azure-cli#tabpanel_2_azure-cli)
- [PowerShell](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/2-explore-template-structure?tabs=azure-cli#tabpanel_2_azure-powershell)

Azure CLI

```
az group create \
  --name {name of your resource group} \
  --location "{location}"
```

Para iniciar una implementación de plantilla en el grupo de recursos, use el comando [az deployment group create](https://learn.microsoft.com/es-es/cli/azure/deployment/group#az-deployment-group-create) de la CLI de Azure o el comando [New-AzResourceGroupDeployment](https://learn.microsoft.com/es-es/powershell/module/az.resources/new-azresourcegroupdeployment) de Azure PowerShell.

 Sugerencia

La diferencia entre `az deployment group create` y `az group deployment create` es que `az group deployment create` es un comando antiguo que va a quedar en desuso y se reemplazará por `az deployment group create`. Por lo tanto, se recomienda usar `az deployment group create` para implementar recursos en el ámbito del grupo de recursos.

Ambos comandos requieren el grupo de recursos, la región y el nombre de la implementación para que pueda identificarla fácilmente en el historial de implementación. Para mayor comodidad, los ejercicios crean una variable que almacena la ruta de acceso al archivo de plantilla. Esta variable facilita la ejecución de los comandos de implementación, ya que no es necesario volver a escribir la ruta de acceso cada vez que se implementa. Veamos un ejemplo:

- [CLI de Azure](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/2-explore-template-structure?tabs=azure-cli#tabpanel_3_azure-cli)
- [PowerShell](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/2-explore-template-structure?tabs=azure-cli#tabpanel_3_azure-powershell)

Para ejecutar este comando de implementación, debe tener la [última versión](https://learn.microsoft.com/es-es/cli/azure/install-azure-cli) de la CLI de Azure.

Azure CLI

```
templateFile="{provide-the-path-to-the-template-file}"
az deployment group create \
  --name blanktemplate \
  --resource-group myResourceGroup \
  --template-file $templateFile
```

Las plantillas vinculadas se usan para implementar soluciones complejas. Puede dividir una plantilla en muchas e implementarlas a través de una plantilla principal. Cuando se implementa la plantilla principal, se desencadena la implementación de la plantilla vinculada. Puede almacenar y proteger la plantilla vinculada mediante un token de SAS.

Una canalización de CI/CD automatiza la creación e implementación de proyectos de desarrollo, lo que incluye proyectos de plantilla de ARM. Las dos canalizaciones más comunes que se usan para la implementación de plantillas son Azure Pipelines o [Acciones de GitHub](https://learn.microsoft.com/es-es/training/paths/github-actions/).

En otros módulos se describe más información sobre estos dos tipos de implementación.

## Adición de recursos a la plantilla

Para agregar un recurso a la plantilla, debe conocer el proveedor de recursos y sus tipos de recursos. La sintaxis de esta combinación tiene el formato _{proveedor_de_recursos}/{tipo_de_recurso}_. Por ejemplo, para agregar un recurso de cuenta de almacenamiento a la plantilla, necesita el proveedor de recursos `Microsoft.Storage`. Uno de los tipos de este proveedor es `storageAccount`. Por lo tanto, el tipo de recurso se muestra como `Microsoft.Storage/storageAccounts`. Puede usar una lista de [proveedores de recursos para servicios de Azure](https://learn.microsoft.com/es-es/azure/azure-resource-manager/management/azure-services-resource-providers) para encontrar los proveedores que necesita.

Después de definir el proveedor y el tipo de recurso, debe comprender las propiedades de cada tipo de recurso que quiera usar. Par obtener más información, consulte [Definición de recursos en plantillas de Azure Resource Manager](https://learn.microsoft.com/es-es/azure/templates). Para buscar el recurso, vea la lista en la columna izquierda. Observe que las propiedades se ordenan por versión de API.

![Captura de pantalla de una página de documentación de Microsoft que muestra la documentación de la cuenta de almacenamiento seleccionada.](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/media/2-resource-type-properties.png)

Este es un ejemplo de algunas de las propiedades enumeradas en la página Cuentas de almacenamiento:

![Recorte de pantalla de una página de documentación de Microsoft que muestra algunas de las propiedades de la cuenta de almacenamiento.](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/media/2-storage-account-properties.png)

Para este ejemplo de almacenamiento, la plantilla podría tener el aspecto siguiente:

JSON

```
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.1",
  "apiProfile": "",
  "parameters": {},
  "variables": {},
  "functions": [],
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2025-01-01",
      "name": "learntemplatestorage123",
      "location": "westus",
      "sku": {
        "name": "Standard_LRS"
      },
      "kind": "StorageV2",
      "properties": {
        "supportsHttpsTrafficOnly": true
      }
    }
  ],
  "outputs": {}
}
```
Para comandos reales de ejemplo (no solo código fuente), preferir la documentación oficial de cada comando en [Microsoft Learn — Referencia de Azure CLI](https://learn.microsoft.com/en-us/cli/azure/) o los quickstarts en [bicep/README.md](../bicep/README.md).
