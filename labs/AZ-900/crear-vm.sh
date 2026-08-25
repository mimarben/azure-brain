#!/bin/bash
# Laboratorio AZ-900: Creación de una Máquina Virtual (IaaS)

# 1. Crear grupo de recursos
az group create --name LaboratorioAZ900 --location eastus

# 2. Crear Máquina Virtual Ubuntu y generar llaves SSH automáticamente
az vm create \
  --resource-group LaboratorioAZ900 \
  --name VM-AZ900 \
  --image Ubuntu2204 \
  --admin-username mimarben \
  --generate-ssh-keys \
  --public-ip-sku Standard

# 3. Abrir puerto 22 para poder conectarnos por SSH
az vm open-port --resource-group LaboratorioAZ900 --name VM-AZ900 --port 22