---
title: "Chuleta — Azure CLI transversal"
aliases: [Chuleta Azure CLI]
tags: [tools, devops]
certification: [AZ-104, AZ-900, AI-200]
updated: 2026-10-01
sources:
  - https://learn.microsoft.com/es-es/cli/azure/
  - labs/AZ-104/arm-templates/parameters/commands.sh
  - labs/AZ-900/crear-vm.sh
---

# Chuleta — Azure CLI transversal

Comandos que se repiten en cualquier laboratorio, con independencia del servicio. Los fragmentos por servicio están en las chuletas de [compute](az-104-compute.md), [storage](az-104-storage.md) e [identidad](az-104-identity-governance.md).

## Sesión y contexto

```bash
az login --tenant <tenant-id>          # login (abre navegador)
az account list -o table               # suscripciones disponibles
az account set --subscription "<id>"   # fijar suscripción activa
az account show -o json                # ¿dónde estoy?
az version && az upgrade               # versión (los labs exigen reciente)
az configure --defaults group=rg-lab location=westeurope   # valores por defecto
az configure                           # menú (output por defecto, etc.)
```

> En Cloud Shell ya estás autenticado y la CLI es siempre la última — los labs de AZ-104 se hacen ahí.

## Salida y consultas (--query / -o)

```bash
az vm list -o table                                        # tabla legible
az vm list -o tsv                                          # scripteable
az vm show -g rg-lab -n vm1 -o json --query "networkProfile"   # subárbol
az vm list -d --query "[].{Nombre:name, IP:publicIpAddress}" -o table   # proyección JMESPath
az vm show ... --query "id" -o tsv                         # capturar un valor en una variable
```

Trucos JMESPath que se repiten: `[]` recorre, `[].{col:campo}` construye columnas, `[?starts_with(name,'web')]` filtra.

## Grupos de recursos y recursos

```bash
az group create -n rg-lab -l westeurope
az group list -o table
az resource list -g rg-lab -o table
az resource show --id <resource-id>
az tag create --resource-id <id> --tags env=lab centro=coste-42   # etiquetar
az group delete -n rg-lab --yes --no-wait                 # limpieza del lab
```

Mover recursos (entre RGs o suscripciones; el examen lo pregunta: los recursos con la misma vida juntos, mover no cambia el recurso):

```bash
az resource move --destination-group rg-destino --ids <id1> <id2>
```

## Desplegar plantillas (ARM/Bicep)

```bash
az deployment group create -g rg-lab -f main.bicep                 # Bicep
az deployment group create -g rg-lab -f azuredeploy.json           # ARM JSON
az deployment group create -g rg-lab -f main.bicep -p dev.parameters.json    # .parameters.json con @
az deployment group create -g rg-lab -f main.bicep -p env=dev      # parámetro inline
az deployment group what-if -g rg-lab -f main.bicep -p prod.parameters.json  # vista previa
az deployment group list -g rg-lab -o table                         # historial
az deployment group show -g rg-lab -n despliegue1 --query properties.outputs -o json
```

## Bloqueos y protección

```bash
az lock create --lock-type CanNotDelete -n lock-prod -g rg-lab
az lock create --lock-type ReadOnly    -n lock-ro   -g rg-lab
az lock list -g rg-lab -o table
az lock delete --ids $(az lock list -g rg-lab --query "[?name=='lock-ro'].id" -o tsv)
```

## Ayuda rápida

```bash
az find "storage blob"                  # busca comandos por palabras
az storage blob --help                  # subcomandos y flags exactos
```

## Relacionado

- [Introducción a Azure Cloud Shell (AZ-104)](../knowledge/az104-azure-cloud-shell.md)
- Ejemplos con ficheros de parámetros: [labs/AZ-104/arm-templates/parameters/](../labs/AZ-104/arm-templates/parameters/README.md)
- Código fuente de cada comando (flags exactos): [examples/azure-cli](../examples/azure-cli/README.md) (clon de Azure/azure-cli en `raw/github/azure-cli`)
