---
title: "Chuleta — AZ-104 Storage"
aliases: [Chuleta AZ-104 Storage]
tags: [storage, certification]
certification: [AZ-104]
updated: 2026-10-01
sources:
  - raw/azure-docs/articles/storage/common/storage-redundancy.md
  - raw/azure-docs/articles/storage/blobs/access-tiers-overview.md
  - raw/azure-docs/articles/storage/common/storage-sas-overview.md
  - labs/AZ-104/MicrosoftAzureAdministrator/AZ-104-MicrosoftAzureAdministrator..md
---

# Chuleta — AZ-104 Storage

Referencia rápida del Bloque 2. El razonamiento (servicio/redundancia/tier/acceso) en la [guía de decisión de almacenamiento](../concepts/storage-decision-guide.md).

## Cuenta de almacenamiento

```bash
az storage account create -g rg-lab -n stlabmiguel001 \
  --sku Standard_LRS --kind StorageV2 -l westeurope \
  --https-only true --min-tls-version TLS1_2 --allow-shared-key-access true
az storage account show-connection-string -g rg-lab -n stlabmiguel001 -o tsv
az storage account keys list -g rg-lab -n stlabmiguel001 --query "[0].value" -o tsv
az storage account keys renew -g rg-lab -n stlabmiguel001 --key key1     # rotar clave
```

Redundancia (`--sku`): `Standard_LRS · Standard_ZRS · Standard_GRS · Standard_GZRS` (+`RA_` = lectura en secundaria) — tabla comparativa en la [guía de decisión de almacenamiento](../concepts/storage-decision-guide.md).

## Contenedores y blobs

```bash
az storage container create --account-name stlabmiguel001 --name datos --public-access off
az storage blob upload --account-name stlabmiguel001 -c datos -f ./foto.png -n foto.png
az storage blob list --account-name stlabmiguel001 -c datos -o table
az storage blob download --account-name stlabmiguel001 -c datos -n foto.png -f ./descarga.png
az storage blob url --account-name stlabmiguel001 -c datos -n foto.png   # URL con SAS
az storage blob delete --account-name stlabmiguel001 -c datos -n foto.png
```

> Preferir `--auth-mode login` (Entra ID + RBAC de datos) a las claves en los comandos.

## Tiers y ciclo de vida

```bash
az storage blob upload ... --tier Cool          # fijar tier al subir
az storage blob set-tier --account-name stlabmiguel001 -c datos -n foto.png --tier Archive
az storage account management-policy create --account-name stlabmiguel001 -g rg-lab --policy @politica.json
```

| Tier | Mínimo | Recuperación |
|---|---|---|
| Hot | — | inmediata |
| Cool | 30 días | inmediata |
| Cold | 90 días | inmediata |
| Archive | 180 días | **horas** — rehidratar primero |

La *management policy* (ciclo de vida) automatiza los movimientos ("sin acceso 90 días → Cool").

## SAS y acceso

```bash
az storage blob generate-sas --account-name stlabmiguel001 -c datos -n foto.png \
  --permissions r --expiry 2026-10-08T00:00Z --https-only
az storage account generate-sas --services b --resource-types o \
  --permissions rl --expiry 2026-10-08T00:00Z          # SAS de cuenta
az storage container policy create --account-name stlabmiguel001 -c datos -n politica1 \
  --permissions r --start 2026-10-01 --expiry 2027-10-01   # stored access policy
az storage container generate-sas -c datos --policy-name politica1 ...    # SAS desde la política
```

- SAS directa: permisos + ventana; **no revocable** salvo rotando claves → la emitida desde *stored access policy* sí (se cambia la política).
- Tres tipos: **service SAS** (un servicio) · **account SAS** (varios servicios, permisos a nivel cuenta) · **user delegation SAS** (firmada con Entra ID, la más segura — sin clave).

## Firewalls y red

```bash
az storage account update -g rg-lab -n stlabmiguel001 --default-action Deny
az storage account network-rule add -g rg-lab -n stlabmiguel001 --ip-address 203.0.113.5
az storage account network-rule add -g rg-lab -n stlabmiguel001 --subnet <subnet-id>   # service endpoint
az storage account network-rule list -g rg-lab -n stlabmiguel001 -o table
```

Private endpoint (aislamiento total): `az network private endpoint create ...` — ver [Private Endpoints](../knowledge/private-endpoints.md).

## Protección de datos

```bash
az storage account blob-service-properties update -g rg-lab -n stlabmiguel001 \
  --enable-delete-retention true --delete-retention-days 7          # soft delete de blobs
  --enable-container-delete-retention true --container-delete-retention-days 7 \
  --enable-versioning true
az storage blob snapshot --account-name stlabmiguel001 -c datos -n foto.png
```

## AzCopy (transferencias masivas)

```bash
azcopy login                              # con Entra ID
azcopy copy './datos/*' 'https://stlabmiguel001.blob.core.windows.net/datos?<SAS>'
azcopy sync './datos' 'https://.../datos?<SAS>' --delete-destination false
```

## Relacionado

- [Guía de decisión — almacenamiento](../concepts/storage-decision-guide.md)
- Fichas: [Cuentas](../knowledge/az104-storage-accounts.md) · [Blob](../knowledge/az104-blob-storage.md) · [Seguridad](../knowledge/az104-storage-security.md) · [Files](../knowledge/az104-azure-files.md)
- Lab: [07 — Manage Azure Storage](../labs/AZ-104/MicrosoftAzureAdministrator/AZ-104-MicrosoftAzureAdministrator..md) · [Almacenamiento público](../labs/AZ-104/Blob-Storage/alamcenamiento-publico.md)
