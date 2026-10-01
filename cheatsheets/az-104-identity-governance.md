---
title: "Chuleta — AZ-104 Identidad y gobernanza"
aliases: [Chuleta AZ-104 Identidad y gobernanza]
tags: [identity, governance, certification]
certification: [AZ-104]
updated: 2026-10-01
sources:
  - raw/azure-docs/articles/role-based-access-control/overview.md
  - raw/azure-docs/articles/governance/policy/overview.md
  - labs/AZ-104/RBAC/Role.md
---

# Chuleta — AZ-104 Identidad y gobernanza

Referencia rápida del Bloque 1. El mapa de "qué herramienta para qué pregunta": [guía de identidad y gobernanza](../concepts/identity-governance-decision-guide.md).

## Entra ID — usuarios y grupos

```bash
az ad user create --display-name "Ana García" --user-principal-name ana@midominio.onmicrosoft.com \
  --password "..." --force-change-password-next-sign-in true
az ad user list --filter "displayName eq 'Ana García'" -o table
az ad user show --id ana@midominio.onmicrosoft.com --query "[displayName, jobTitle]"

az ad group create --display-name "Lab-Admins" --mail-nickname lab-admins
az ad group member add --group "Lab-Admins" --member-id <object-id>
az ad group member list --group "Lab-Admins" -o table
```

- Usuarios externos (B2B): invitación desde el portal o Graph — consumen licencias al acceder a recursos de pago.
- SSPR y licencias (P1/P2 para grupos dinámicos, writeback…): se configuran en el portal de Entra — ficha [SSPR](../knowledge/az104-sspr.md).
- Grupos dinámicos (P1): membresía por atributos; estáticos: manual.

## RBAC

```bash
az role definition list --name "Contributor" --query "[].{Rol:roleName, Desc:description}"
az role assignment create \
  --assignee "ana@midominio.onmicrosoft.com" \
  --role "Contributor" \
  --scope "/subscriptions/<sub-id>/resourceGroups/rg-lab"
az role assignment list --assignee ana@midominio.onmicrosoft.com --all -o table
az role assignment list --resource-group rg-lab -o table       # quién manda en este RG
az role assignment delete --assignee <id> --role "Contributor" --scope <scope>
```

- **Asignación = principal + rol + ámbito** (MG · suscripción · RG · recurso; hereda hacia abajo; modelo aditivo).
- Roles del examen: **Owner** (todo + delegar) · **Contributor** (todo menos permisos) · **Reader** (leer) · **User Access Administrator** (solo permisos).
- Roles de datos separados: `Storage Blob Data Reader/Contributor` para el plano de datos.
- `az role assignment list --include-inherited` (PowerShell: `Get-AzRoleAssignment`) para ver la herencia — típico ejercicio de laboratorio: *¿por qué Ana tiene acceso?* → recorrer los ámbitos.

## Azure Policy

```bash
az policy assignment list -o table
az policy assignment create --name exigir-tag --policy "<definition-id>" \
  --scope "/subscriptions/<sub-id>/resourceGroups/rg-lab" --display-name "Exigir tag"
az policy state list --resource-group rg-lab -o table                  # compliance actual
az policy state trigger-scan --resource-group rg-lab                   # re-evaluar ya
az policy remediation create --name remediar --policy-assignment exigir-tag -g rg-lab
```

- Efectos: **Audit** (marca, no bloquea) · **Deny** (bloquea) · **Modify/DeployIfNotExists** (remedia lo existente).
- **Iniciativa** = conjunto de políticas con un solo ámbito de asignación.
- El examen confunde Policy con RBAC: Policy restringe **lo que puede crearse** (incluso por Owner); RBAC qué **puede hacer** cada identidad.

## Bloqueos, tags y costes

```bash
az lock create --lock-type CanNotDelete -n no-borrar -g rg-lab
az lock create --lock-type ReadOnly    -n solo-lectura -g rg-lab
az tag create --resource-id <id> --tags env=prod propietario=miguel

az consumption budget create --amount 100 --time-grain Monthly --category cost \
  --display-name "presupuesto-mensual" -g rg-lab
az advisor recommendation list -o table
```

- Locks heredan y **ni Contributor puede saltárselos** — para borrar, quitar el lock.
- Alertas de coste (portal) vs **presupuestos** con notificaciones por % vs **Advisor** (recomendaciones de optimización).

## Relacionado

- [Guía de decisión — identidad y gobernanza](../concepts/identity-governance-decision-guide.md)
- Fichas: [Entra ID](../knowledge/az104-entra-id.md) · [Identidades](../knowledge/az104-identities.md) · [RBAC](../knowledge/az104-azure-rbac.md) · [Policy](../knowledge/az104-azure-policy.md) · [SSPR](../knowledge/az104-sspr.md)
- Labs: [01 — Entra ID Identities](../raw/AZ-104T00/Instructions/Labs/LAB_01-Manage_Entra_ID_Identities.md) · [02a — Subscriptions and RBAC](../raw/AZ-104T00/Instructions/Labs/LAB_02a_Manage_Subscriptions_and_RBAC_Entra.md) · [02b — Governance via Policy](../raw/AZ-104T00/Instructions/Labs/LAB_02b-Manage_Governance_via_Azure_Policy.md) · [mi lab de RBAC](../labs/AZ-104/RBAC/Role.md)
