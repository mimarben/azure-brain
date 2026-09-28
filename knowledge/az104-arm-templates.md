---
title: AZ-104 — Implementación de la infraestructura de Azure mediante plantillas de ARM de JSON
aliases: ["Implementación de la infraestructura de Azure mediante plantillas de ARM de JSON (AZ-104)", "ARM Templates"]
tags: [associate, iac]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/create-azure-resource-manager-template-vs-code/
---

# AZ-104 — Implementación de la infraestructura de Azure mediante plantillas de ARM de JSON

Módulo 02 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 0 — Prerrequisitos · Sustenta el área: Implementación y administración de recursos de procesos de Azure (20–25%).

## Concepto

Creación de plantillas de Azure Resource Manager (ARM) con JSON usando Visual Studio Code, para desplegar infraestructura de manera coherente y repetible.

## Resumen en mis palabras

> Escriba plantillas de Azure Resource Manager de JSON con Visual Studio Code (plantillas de ARM) para implementar la infraestructura en Azure de forma coherente y confiable.

## Por qué importa para el examen

> - Interpreta una plantilla de Azure Resource Manager o un archivo Bicep
> - Modificación de una plantilla de Azure Resource Manager existente
> - Implementación de recursos mediante una plantilla ARM o un archivo Bicep
> - Exportación de una implementación como plantilla o conversión de ARM → Bicep

## Enlaces relacionados

**Módulo de Learn**: [Implementación de la infraestructura de Azure mediante plantillas de ARM de JSON](https://learn.microsoft.com/en-us/training/modules/create-azure-resource-manager-template-vs-code/) ([ES](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/))

**Savill**: buscar "ARM" / "Bicep" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[ARM Templates]] · [[Terraform vs Bicep]] · [[Herramientas de administración e implementación (AZ-900)]]

**Laboratorio**: Lab 03b (gestión de recursos con plantillas ARM) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md) · ejemplo propio en ARM JSON con parámetros y salidas (unidad 4): [parameters](../labs/AZ-104/arm-templates/parameters/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[ARM Templates]]
- [[Terraform vs Bicep]]

# Introduction

Las plantillas json de Azure Resource Manager (plantillas de ARM) permiten especificar la infraestructura del proyecto de forma declarativa y reutilizable. Puede crear versiones y guardar las plantillas en el mismo control de código fuente que el proyecto de desarrollo.

> [!NOTE] Bicep
> Bicep es un lenguaje para la definición de recursos de Azure. Ofrece una experiencia de creación más sencilla que JSON, junto con otras características que ayudan a mejorar la calidad de la infraestructura como código. Se recomienda que cualquier usuario nuevo en la infraestructura como código en Azure utilice Bicep en lugar de JSON. Para más información sobre Bicep, consulte la ruta de aprendizaje [Aspectos básicos de Bicep](https://learn.microsoft.com/es-es/training/paths/fundamentals-bicep/).

## Prerrequisitos

- Tener conocimientos de Azure, incluidos Azure Portal, las suscripciones, los grupos de recursos y las definiciones de recursos.
- Una cuenta de Azure. Puede obtener una cuenta gratuita [aquí](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_5f57c3df-9c14-af73-f8f8-da2369315010).
- [Visual Studio Code](https://code.visualstudio.com/) se instala localmente.
- Tener instaladas localmente una de las siguientes:
    - Las herramientas más recientes de la [CLI de Azure](https://learn.microsoft.com/es-es/cli/azure/install-azure-cli) instaladas localmente.
    - La versión más reciente de [Azure PowerShell](https://learn.microsoft.com/es-es/powershell/azure/install-az-ps) instalada localmente.


# Exploración de la estructura de plantillas de Azure Resource Manager

En esta unidad, aprenderá a usar las plantillas de Azure Resource Manager (plantillas de ARM) para implementar la infraestructura como código. Examinará las secciones de una plantilla de ARM, aprenderá a implementarla en Azure y profundizará en los detalles de su sección _resources_.
## ¿Qué es una plantilla de ARM?

Las plantillas de ARM son archivos de notación de objetos JavaScript (JSON) que definen la infraestructura y la configuración de la implementación. La plantilla usa una _sintaxis declarativa_. La sintaxis declarativa es una forma de crear la estructura y los elementos que describen el aspecto que tienen los recursos sin describir el flujo de control. La sintaxis declarativa es diferente de la _sintaxis imperativa_, en la que se usan comandos que el equipo debe ejecutar. El scripting imperativo se centra en especificar cada paso de la implementación de los recursos.

### Ventajas del uso de plantillas de ARM

Las plantillas de ARM permiten automatizar las implementaciones y usar el procedimiento de infraestructura como código (IaC). El código de plantilla se convierte en parte de los proyectos de infraestructura y desarrollo. Como sucede con el código de la aplicación, puede almacenar los archivos IaC en un repositorio de origen y crear una versión de él.

Las plantillas de ARM son _idempotentes_, lo que significa que puede implementar la misma plantilla muchas veces y obtener los mismos tipos de recursos en el mismo estado.

Resource Manager organiza la implementación de los recursos para que se creen en el orden correcto. Cuando sea posible, los recursos se crean en paralelo, por lo que las implementaciones de plantillas de ARM finalizan más rápido que las implementaciones con scripts.


![Diagrama que muestra una asignación del procedimiento de procesamiento de plantillas. Solo hay una llamada para procesar una plantilla en lugar de varias llamadas a los scripts de proceso.](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/media/2-template-processing.png)



También puede integrar las plantillas de ARM en herramientas de integración continua e implementación continua (CI/CD), como [Azure Pipelines](https://azure.microsoft.com/services/devops/pipelines), que permite automatizar las canalizaciones de versión para actualizaciones de aplicaciones e infraestructura rápidas y confiables. Mediante Azure DevOps y las tareas de plantilla de ARM, puede compilar e implementar los proyectos de forma continuada.


### ARM template file structure

When you're writing an ARM template, you need to understand all the parts that make up the template and what they do. ARM template files are made up of the following elements:

|Element|Description|
|---|---|
|**schema**|A required section that defines the location of the JSON schema file that describes the structure of JSON data. The version number you use depends on the scope of the deployment and your JSON editor.|
|**contentVersion**|A required section that defines the version of your template (such as 1.0.0.0). You can use this value to document significant changes in your template to ensure you're deploying the right template.|
|**apiProfile**|An optional section that defines a collection of API versions for resource types. You can use this value to avoid having to specify API versions for each resource in the template.|
|**parameters**|An optional section where you define values that are provided during deployment. You can provide these values in a parameter file, by command-line parameters, or in the Azure portal.|
|**variables**|An optional section where you define values that are used to simplify template language expressions.|
|**functions**|An optional section where you can define [user-defined functions](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-user-defined-functions) ([ES](https://learn.microsoft.com/es-es/azure/azure-resource-manager/templates/template-user-defined-functions)) that are available within the template. User-defined functions can simplify your template when complicated expressions are used repeatedly in your template.|
|**resources**|A required section that defines the actual items you want to deploy or update in a resource group or a subscription.|
|**output**|An optional section where you specify the values that are returned at the end of the deployment.|

## Deploy an ARM template to Azure

```bash
az login
```

> [!INFO] Sugerencia
> La diferencia entre `az deployment group create` y `az group deployment create` es que `az group deployment create` es un comando antiguo que va a quedar en desuso y se reemplazará por `az deployment group create`. Por lo tanto, se recomienda usar `az deployment group create` para implementar recursos en el ámbito del grupo de recursos.



```bash
az group create --name rg-arm-template --location northeurope
```


Create a file azuredeploy.json (minimun requirements).

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": []
}
```

```bash
templateFile="azuredeploy.json"
az deployment group create --name azuretemplate --resource-group rg-arm-template --template-file $templateFile
```

## Add a resource to the ARM template

In the previous task, you learned how to create a blank template and deploy it. Now, you're ready to deploy an actual resource. In this task, you add an Azure storage account resource to the ARM template.

1. In the _azuredeploy.json_ file in Visual Studio Code, update the file so it looks like:
   
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {},
  "functions": [],
  "variables": {},
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2026-04-01",
      "name": "armstorage1",
      "tags": {
        "displayName": "armstorage1"
      },
      "location": "[resourceGroup().location]",
      "kind": "StorageV2",
      "sku": {
        "name": "Standard_LRS"
      }
    }
  ],
  "outputs": {}
}
```

Cheking the api version:

```bash
az provider show --namespace Microsoft.Storage --query "resourceTypes[?resourceType=='storageAccounts'].apiVersions"

--output table Column1 Column2 Column3 Column4 Column5 Column6 Column7 Column8 Column9 Column10 Column11 Column12 Column13 Column14 Column15 Column16 Column17 Column18 Column19 Column20 Column21 Column22 Column23 Column24 Column25 Column26 Column27 Column28 Column29 Column30 Column31 ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ------------------ ---------- ---------- ---------- ---------- ------------------ ---------- ---------- ---------- ---------- ---------- ---------- ---------- ------------------ 2026-04-01 2025-08-01 2025-06-01 2025-01-01 2024-01-01 2023-05-01 2023-04-01 2023-01-01 2022-09-01 2022-05-01 2021-09-01 2021-08-01 2021-06-01 2021-05-01 2021-04-01 2021-02-01 2021-01-01 2020-08-01-preview 2019-06-01 2019-04-01 2018-11-01 2018-07-01 2018-03-01-preview 2018-02-01 2017-10-01 2017-06-01 2016-12-01 2016-05-01 2016-01-01 2015-06-15 2015-05-01-preview
```

### Deploy the updated ARM template

Here, you change the name of the deployment to better reflect what this deployment does.

Run the following Azure CLI commands in the terminal. This snippet is the same code you used previously, but the name of the deployment is changed.

```bash
templateFile="azure-storage-deploy.json"
today=$(date +"%d-%b-%Y")
DeploymentName="addstorage-"$today

az deployment group create --name $DeploymentName --resource-group rg-arm-template --template-file $templateFile
```

### Implementación de la plantilla en Azure

Azure PowerShell

```bash
New-AzResourceGroup -Name <ResourceGroupName> -Location <Location>
```

Reemplace por un nombre único para el grupo de recursos. Reemplaza con la región de Azure más cercana a ti. Por ejemplo, use eastus para Este de EE. UU.

Al establecer el grupo de recursos predeterminado, puede omitir ese parámetro de los comandos de la CLI de Azure en este ejercicio. Para establecer el grupo de recursos, ejecute el siguiente comando.

Azure PowerShell

```bash
Set-AzDefault -ResourceGroupName <ResourceGroupName>
```

reemplace `<ResourceGroupName>` por el nombre del grupo de recursos.

Implemente la plantilla en Azure mediante la ejecución de los comandos siguientes. La plantilla de ARM aún no tiene ningún recurso, por lo que no se han creado recursos.

```bash
$templateFile="azuredeploy.json" $today=Get-Date -Format "MM-dd-yyyy" $deploymentName="blanktemplate-"+"$today" New-AzResourceGroupDeployment -Name $deploymentName  -TemplateFile $templateFile
```

La sección superior del código anterior establece las variables de Azure PowerShell, que incluyen la ruta de acceso al archivo de la implementación y el nombre de la implementación. Posteriormente, el comando `New-AzResourceGroupDeployment` implementa la plantilla en Azure. Tenga en cuenta que el nombre de la implementación se `blanktemplate` con la fecha como sufijo.


## Adición de flexibilidad a la plantilla de Azure Resource Manager mediante parámetros y salidas.


En la unidad anterior, creó una plantilla de Azure Resource Manager (ARM) y le agregó una cuenta de Azure Storage. Es posible que detecte que hay un problema en la plantilla. El nombre de la cuenta de almacenamiento está codificado de forma rígida. Esta plantilla solo se puede usar para implementar la misma cuenta de almacenamiento cada vez. Para implementar una cuenta de almacenamiento con otro nombre, tiene que crear una plantilla, lo que no es una forma práctica de automatizar las implementaciones.



```json
"parameters": {
  "<parameter-name>": {
    "type": "<type-of-parameter-value>",
    "defaultValue": "<default-value-of-parameter>",
    "allowedValues": [
      "<array-of-allowed-values>"
    ],
    "minValue": <minimum-value-for-int>,
    "maxValue": <maximum-value-for-int>,
    "minLength": <minimum-length-for-string-or-array>,
    "maxLength": <maximum-length-for-string-or-array-parameters>,
    "metadata": {
      "description": "<description-of-the-parameter>"
    }
  }
}
```

Después, use el parámetro en la definición del recurso. La sintaxis es `[parameters('name of the parameter')]`. Entonces, al implementar se usa la función `parameters`. En el módulo siguiente, obtendrá más información sobre las funciones.

```json
"resources": [
  {
    "type": "Microsoft.Storage/storageAccounts",
    "apiVersion": "2025-01-01",
    "name": "learntemplatestorage123",
    "location": "[resourceGroup().location]",
    "sku": {
      "name": "[parameters('storageAccountType')]"
    },
    "kind": "StorageV2",
    "properties": {
      "supportsHttpsTrafficOnly": true
    }
  }
]
```

```json
templateFile="azuredeploy.json"
az deployment group create --name testdeployment1 --template-file $templateFile --parameters storageAccountType=Standard_LRS
```
## Salidas de plantilla de ARM

En la sección de salidas de la plantilla de ARM, puede especificar los valores que se devuelven después de una implementación correcta. Estos son los elementos que componen la sección de salidas.

```json
"outputs": {
  "<output-name>": {
    "condition": "<boolean-value-whether-to-output-value>",
    "type": "<type-of-output-value>",
    "value": "<output-value-expression>",
    "copy": {
      "count": <number-of-iterations>,
      "input": <values-for-the-variable>
    }
  }
}
```


|Elemento|Descripción|
|---|---|
|**nombre de salida**|Debe ser un identificador válido de JavaScript.|
|**condición**|(opcional) Un valor booleano que indica si se devuelve este valor de salida. Si es true, el valor se incluye en la salida de la implementación. Si es false, el valor de salida se omite para esta implementación. Si no se especifica, el valor predeterminado es true.|
|**tipo**|el tipo del valor de salida.|
|**value**|(Opcional) Una expresión de lenguaje de plantilla que se evalúa y se devuelve como valor de salida.|
|**copiar**|(Opcional) Copiar se utiliza para devolver más de un valor en una salida.|
### Uso de salidas en una plantilla de ARM

Este es un ejemplo para mostrar los puntos de conexión de la cuenta de almacenamiento.

```json
"outputs": {
  "storageEndpoint": {
    "type": "object",
    "value": "[reference('learntemplatestorage123').primaryEndpoints]"
  }
}
```

![[Pasted image 20260928142914.png]]