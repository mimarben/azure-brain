---
title: "Chuleta — AZ-104 Compute (VM, App Service, contenedores)"
aliases: [Chuleta AZ-104 Compute]
tags: [compute, containers, certification]
certification: [AZ-104]
updated: 2026-10-01
sources:
  - https://learn.microsoft.com/es-es/training/modules/configure-azure-container-instances/
  - raw/azure-docs/articles/app-service/overview-hosting-plans.md
  - labs/AZ-104/VM/Creación de una VM..md
---

# Chuleta — AZ-104 Compute (VM, App Service, contenedores)

Referencia rápida del Bloque 3. El razonamiento de "qué servicio elegir" está en la [guía de decisión de cómputo](../concepts/compute-decision-guide.md).

## Máquinas virtuales

```bash
az vm create -g rg-lab -n vm1 \
  --image Ubuntu2204 --size Standard_B2s \
  --admin-username azureuser --generate-ssh-keys \
  --vnet-name vnet-lab --subnet snet-default
az vm list -d -o table                                   # -d = detalles (IPs, estado)
az vm show -g rg-lab -n vm1 --query "id" -o tsv
az vm resize -g rg-lab -n vm1 --size Standard_B4s        # escalar vertical
az vm open-port -g rg-lab -n vm1 --port 80               # NSG rápido (mejor regla explícita)
az vm run-command invoke -g rg-lab -n vm1 --command-id RunShellScript --scripts "apt update"
```

Ciclo de vida — **la diferencia que cae en el examen**:

| Comando | Estado | ¿Se factura el cómputo? |
|---|---|---|
| `az vm deallocate` | Detenida (deasignada) — libera hardware | **No** (el disco sí) |
| `az vm stop` | Detenida **sin deasignar** | **Sí** |
| `az vm start` / `az vm restart` | Arranca / reinicia | Sí |

Discos: `az disk list -g rg-lab -o table`, `az disk create -g rg-lab -n d1 --size-gb 64 --sku Premium_LRS`.

Alta disponibilidad — reglas mnemotécnicas:
- **Availability zone** = separación física de DCs en la región (protege del fallo de DC; para VM individuales reparte por zona).
- **Availability set** = dentro de un DC: hasta **3 fault domains** (grupos de rack/energía) y **update domains** (hasta 20, se parchean por tandas) — las VMs del set se reparten para que una actualización no las tumbe a la vez.
- SLA: 99,9% (una VM con SSD premium) → 99,95% (availability set) → 99,99% (availability zones).

VMSS (a escala): `az vmss create -g rg-lab -n ss1 --image Ubuntu2204 --instance-count 2 --upgrade-policy-mode automatic`; autoscale → `az monitor autoscale create ...` con reglas de CPU.

## App Service

```bash
az appservice plan create -g rg-lab -n plan-lab --sku B1 --is-linux
az webapp create -g rg-lab -n app-lab --plan plan-lab --runtime "PYTHON:3.12"
az webapp up -g rg-lab -n app-lab --sku B1                # crea plan+app y despliega el directorio actual
az webapp log tail -g rg-lab -n app-lab
az webapp config appsettings set -g rg-lab -n app-lab --settings KEY=valor
az webapp deployment slot create -g rg-lab -n app-lab --slot staging
az webapp deployment slot swap -g rg-lab -n app-lab --slot staging --target-production
az appservice plan update -g rg-lab -n plan-lab --number-of-workers 4   # scale out
```

Tiers (facturación — lo que el examen pregunta):

| Nivel | Skus | Qué comparte la app | Escalar horizontal |
|---|---|---|---|
| Free / Shared | F1 / D1 | VM compartida con **otros clientes** (cuotas de CPU) | No — solo dev/test |
| Dedicated | B1–B3, S1–S3, P1v2–P4v2, P1v3–P4v4 | VMs dedicadas solo con apps del **mismo plan** | Sí (instancias del plan) |
| Isolated | I1v2–I3v2 | VMs + **VNet dedicada** (ASE) | Máximo |

La factura es **por instancia del plan**, no por app: N apps en un plan comparten las mismas instancias.

## Azure Container Instances

```bash
az container create -g rg-lab -n ci-hello \
  --image mcr.microsoft.com/azuredocs/aci-helloworld \
  --dns-name-label ci-lab-miguel --ports 80 --cpu 1 --memory 1.5
az container show -g rg-lab -n ci-hello --query ipAddress.fqdn -o tsv
az container logs -g rg-lab -n ci-hello
az container export -g rg-lab -n ci-hello --file grupo.yaml   # plantilla YAML del grupo
az container create -g rg-lab -n grupo2 --file grupo.yaml      # desplegar grupo desde YAML
az container delete -g rg-lab -n ci-hello --yes
```

- Recursos por contenedor: **0,1–4 vCPU y 0,1–16 GB** — se fijan al crear y valen para toda la vida del grupo.
- `--restart-policy`: `Always` (defecto) · `OnFailure` · `Never` — típica pregunta de examen (job → OnFailure/Never).
- **Grupo de contenedores** = varios contenedores en el mismo host: comparten ciclo de vida, **la misma IP** (sin mapeo de puertos entre ellos), FQDN y volúmenes (Azure Files). Como un pod de K8s.
- Desplegar en una VNet (Linux): `--vnet`/`--subnet` → sin IP pública, comunicación privada.
- Imagen privada: `--registry-username`/`--registry-password` o identidad gestionada con ACR.

## Container Apps y ACR (gap del examen)

```bash
az acr create -g rg-lab -n acrlab --sku Basic           # Basic/Standard/Premium — geo-replicación desde Standard
az acr build --registry acrlab --image app:v1 .          # build de imagen desde código
az containerapp env create -g rg-lab -n env-lab --location westeurope
az containerapp create -g rg-lab -n ca-lab --environment env-lab --image acrlab.azurecr.io/app:v1 --target-port 80 --ingress external
```

Container Apps escala con **KEDA** (HTTP, colas, CPU/mem… hasta **cero**) — sin exponer las APIs de Kubernetes.

## Relacionado

- [Guía de decisión — opciones de cómputo](../concepts/compute-decision-guide.md) · [Contenedores frente a VMs](../concepts/containers-vs-vms.md)
- Fichas: [VMs](../knowledge/az104-virtual-machines.md) · [Disponibilidad](../knowledge/az104-vm-availability.md) · [App Service](../knowledge/az104-app-service.md) · [Planes](../knowledge/az104-app-service-plans.md) · [ACI](../knowledge/az104-container-instances.md)
- Labs: [VM](../labs/AZ-104/VM/Creación de una VM..md) · [Web Apps](../labs/AZ-104/app-service/Lab09a-Implement-Web-Apps.md) · [Contenedores](../labs/AZ-104/containers/Contenedor.md)
