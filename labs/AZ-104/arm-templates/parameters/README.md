---
title: ARM JSON con parámetros y salidas
tags: [certification, labs, iac]
certification: [AZ-104]
updated: 2026-09-28
sources:
  - https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/4-add-flexibility-arm-template?tabs=azure-cli
---

# ARM JSON con parámetros y salidas

Ejemplo en ARM JSON puro (sin Bicep) que sigue la [unidad 4 del módulo 02](https://learn.microsoft.com/es-es/training/modules/create-azure-resource-manager-template-vs-code/4-add-flexibility-arm-template?tabs=azure-cli): una plantilla reutilizable mediante **parámetros** y con valor de vuelta mediante **salidas**. Combinado con la "Opción 2: fichero de parámetros" del curso: **una plantilla, N entornos**.

## Ficheros

| Fichero | Qué es |
|---|---|
| `azuredeploy.json` | Plantilla: StorageV2 con `storageAccountName` obligatorio y `storageAccountType` (defaultValue + allowedValues), y un `output` con `reference()` |
| `dev.parameters.json` | Valores para dev (JSON de parámetros, formato "Opción 2") |
| `prod.parameters.json` | Valores para prod — misma plantilla, SKU `Standard_GRS` |
| `commands.sh` | Comandos: despliegue inline (unidad 4) y con fichero, `what-if`, consulta del output y limpieza |

## Qué hace Azure con `--parameters @dev.parameters.json`

```text
az deployment group create --template-file azuredeploy.json --parameters @dev.parameters.json
        │
        ▼
Lee azuredeploy.json
        ▼
Encuentra el parámetro storageAccountName (obligatorio, sin defaultValue)
        ▼
Lee dev.parameters.json
        ▼
Encuentra el valor avldevstorage001
        ▼
Sustituye en el recurso: "name": "[parameters('storageAccountName')]"
        ▼
Despliega (idempotente) y, al terminar, evalúa los outputs con reference()
```

Es parecido a llamar una función: `azuredeploy.json(storageAccountName='avldevstorage001', storageAccountType='Standard_LRS')`. Los parámetros con `defaultValue` (`storageAccountType`) pueden omitirse en el fichero; `storageAccountName` no, porque no tiene.

## Detalles que cruzan con la unidad 4

- Propiedades de un parámetro: `type` (obligatorio), `defaultValue`, `allowedValues`, `minValue`/`maxValue` (int), `minLength`/`maxLength` (string/array) y `metadata.description`.
- `storageAccountType` replica la unidad 4: `defaultValue: "Standard_LRS"` y `allowedValues` con las 4 SKUs (incluida `Premium_LRS`).
- La unidad 4 deja el nombre hardcodeado (`learntemplatestorage123`); aquí además se parametriza `storageAccountName` con `minLength`/`maxLength` — es el parámetro que alimenta el fichero `dev.parameters.json`.
- `output storageEndpoint` → `"[reference(parameters('storageAccountName')).primaryEndpoints]"`: `reference()` se evalúa en tiempo de ejecución, tras el despliegue, y devuelve el estado real del recurso.
- `--parameters clave=valor` (inline, "Opción 1") para valores que cambian por despliegue; `--parameters @fichero.json` ("Opción 2") para valores por entorno. Ambos se pueden mezclar en el mismo comando.
- Desplegar de nuevo la misma plantilla no recrea los recursos: son **idempotentes** (revisan el estado y solo aplican diferencias).

## Relacionado

- [Página de conocimiento del módulo 02](../../../../knowledge/az104-arm-templates.md)
- [Plantillas base del mismo lab](../) — `azuredeploy.json` (vacía) y `azure-storage-deploy.json` (recurso hardcodeado, paso previo de las unidades 2–3)
- [Índice de labs AZ-104](../../README.md)
