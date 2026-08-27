---
title: AZ-900 — Componentes arquitectónicos de Azure
aliases: ["Componentes arquitectónicos de Azure (AZ-900)"]
tags: [fundamentals, governance]
certification: [AZ-900]
updated: 2026-08-17
sources:
  - https://learn.microsoft.com/en-us/training/modules/describe-core-architectural-components-of-azure/
---

# AZ-900 — Componentes arquitectónicos de Azure

Módulo 04 del [AZ-900T00](https://learn.microsoft.com/en-us/training/courses/az-900t00) · Ruta 2 · Área: Descripción de la arquitectura y los servicios de Azure (35–40%).

## Concepto

Infraestructura física (regiones, pares de regiones, zonas de disponibilidad, datacenters) y jerarquía lógica de recursos (recurso → grupo de recursos → suscripción → grupo de administración).

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> *(pendiente — rellenar al estudiar el módulo)*

## Enlaces relacionados

**Módulo de Learn**: [Describir los componentes arquitectónicos principales de Azure](https://learn.microsoft.com/en-us/training/modules/describe-core-architectural-components-of-azure/)

**AZ-900 Full Course de Savill** (vídeo por tema, @duración):
- [Benefits and Usage of Regions and Region Pairs — 13:08](https://youtu.be/4RjPOAN54AE)
- [Benefits and Usage of Availability Zones — 08:41](https://youtu.be/h0enGb17lnw)
- [Benefits and Usage of Resource Groups — 09:38](https://youtu.be/g6thrYZhPZY)
- [Benefits and Usage of Subscriptions — 08:19](https://youtu.be/9vKAYW_WkLo)
- [Benefits and Usage of Management Groups — 06:30](https://youtu.be/bPdDiEtCVhM)

## Introducción a las cuentas de Azure

![Niveles de alcance de cuenta de Azure](../../assets/images/AZ-900/account-scope-levels.png)

Para crear y usar los servicios de Azure, necesita una suscripción de Azure. Cuando trabaja con sus propias aplicaciones y cargas de trabajo, crea una cuenta de Azure y se le crea una suscripción. Después de crear una cuenta de Azure, puedes crear suscripciones adicionales. Por ejemplo, el equipo podría usar una sola cuenta de Azure y suscripciones independientes para cargas de trabajo de desarrollo, pruebas y producción. Una vez que has creado una suscripción de Azure, puedes empezar a crear recursos de Azure dentro de cada suscripción.



**Páginas de `knowledge/`**: [[Gobernanza y cumplimiento (AZ-900)]] (jerarquía aplicada a gobernanza)

## Relacionado

- [Índice AZ-900](../certifications/AZ-900/INDEX.md)

# What is Microsoft Azure.

Azure is a continually expanding set of cloud services that help you meet current and future IT challenges. Azure gives you the freedom to build, manage, and deploy applications on a massive global network using your favorite tools and frameworks.


## What does Azure offer?

**Limitless innovation.** Build intelligent apps and solutions with advanced technology, tools, and services to take your operations to the next level. Seamlessly unify your technology to simplify platform management and deliver innovations efficiently and securely on a trusted cloud.

- **Bring ideas to life:** Build on a trusted platform to advance your team's capabilities with industry-leading AI and cloud services.
- **Seamlessly unify:** Efficiently manage all your infrastructure, data, analytics, and AI solutions across an integrated platform.
- **Innovate on trust:** Rely on trusted technology from a partner who's dedicated to security and responsibility.

## What can I do with Azure?

Azure provides hundreds of services that enable you to do everything from running your existing applications on virtual machines to exploring new software paradigms, such as intelligent bots and generative AI.

![[azure-service-categories.png]]

# Get started with Azure accounts.

To create and use Azure services, you need an Azure subscription. When you're working with your own applications and workloads, you create an Azure account, and a subscription is created for you.

![[assets/images/AZ-104/account-scope-levels.png]]

# Describe Azure physical infrastructure

Completed100 XP

- 6 minutes

Azure's core architectural components can be broken down into two main groupings: the physical infrastructure and the management infrastructure. This unit covers the physical side — how Azure organizes its datacenters, regions, and availability zones to deliver reliable services worldwide.

## Physical infrastructure

The physical infrastructure for Azure starts with datacenters. These datacenters are facilities with servers arranged in racks, with dedicated power, cooling, and networking infrastructure — similar to an on-premises datacenter, but at a much larger scale.

As a global cloud provider, Azure has datacenters around the world. However, you don't interact with individual datacenters directly. Instead, datacenters are grouped into Azure Regions and Azure Availability Zones that provide resiliency and reliability for your workloads.

The [Global infrastructure](https://infrastructuremap.microsoft.com/) site gives you a chance to interactively explore the underlying Azure infrastructure.

![[azure-infrastructure-hierarchy.png]]


> [!NOTE] Regions
> Some services or virtual machine (VM) features are only available in certain regions, such as specific VM sizes or storage types. There are also some global Azure services that don't require you to select a particular region, such as Microsoft Entra ID, Azure Traffic Manager, and Azure DNS.

### Availability Zones.
Availability zones are physically separate datacenters within an Azure region. Each availability zone is made up of one or more datacenters equipped with independent power, cooling, and networking. An availability zone is set up to be an isolation boundary. If one zone goes down, the other continues working. Availability zones are connected through high-speed, private fiber-optic networks.
![[assets/images/AZ-104/availability-zones.png]]

![[assets/images/AZ-104/region-pairs.png]]

# Describe Azure management infrastructure.


## Azure resources and resource groups

A resource is the basic building block of Azure. Anything you create, provision, or deploy is a resource. VMs, virtual networks, databases, and Azure AI services are all examples of resources.

![[resource-group-rules.png]]
## Azure subscriptions.

![[subscription-boundaries.png]]


## Azure management groups.

Resources go into resource groups, and resource groups go into subscriptions. For a small environment, that's enough. But when you have many subscriptions across multiple teams or geographies, you need a way to manage access and policies at a higher level.

## Management group, subscriptions, and resource group hierarchy.

![[management-group-hierarchy.png]]

- **Apply a policy across subscriptions**. You could limit VM locations to the US West Region in a group called Production. This policy inherits to all subscriptions under that management group and applies to all VMs in those subscriptions. The resource or subscription owner can't override it, which strengthens governance.
- **Grant access to multiple subscriptions at once**. By placing subscriptions under a management group, you can create one Azure RBAC assignment on the group. All sub-management groups, subscriptions, resource groups, and resources underneath inherit those permissions — no need to script Azure RBAC across individual subscriptions.

