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

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Interpreta una plantilla de Azure Resource Manager o un archivo Bicep
> - Modificación de una plantilla de Azure Resource Manager existente
> - Implementación de recursos mediante una plantilla ARM o un archivo Bicep
> - Exportación de una implementación como plantilla o conversión de ARM → Bicep

## Enlaces relacionados

**Módulo de Learn**: [Implementación de la infraestructura de Azure mediante plantillas de ARM de JSON](https://learn.microsoft.com/en-us/training/modules/create-azure-resource-manager-template-vs-code/) ([ES](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/))

**Savill**: buscar "ARM" / "Bicep" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[ARM Templates]] · [[Terraform vs Bicep]] · [[Herramientas de administración e implementación (AZ-900)]]

**Laboratorio**: Lab 03b (gestión de recursos con plantillas ARM) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[ARM Templates]]
- [[Terraform vs Bicep]]

# Introduction

JSON Azure Resource Manager templates (ARM templates) allow you to specify your project's infrastructure in a declarative and reusable way. You can version and save the templates in the same source control as your development project.

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
