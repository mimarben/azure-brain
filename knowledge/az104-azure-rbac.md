---
title: AZ-104 — Protección de los recursos de Azure con Azure RBAC
aliases: ["Protección de los recursos de Azure con Azure RBAC (AZ-104)"]
tags: [associate, identity, governance]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/
---

# AZ-104 — Protección de los recursos de Azure con Azure RBAC

Módulo 07 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Uso del control de acceso basado en roles (RBAC) de Azure para administrar el acceso a los recursos: roles integrados y asignación en distintos ámbitos.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Administración de roles de Azure integrados
> - Asignación de roles en distintos ámbitos (MG → suscripción → RG → recurso)
> - Interpretación de las asignaciones de acceso (quién hace qué sobre qué y desde dónde)

## Enlaces relacionados

**Módulo de Learn**: [Protección de los recursos de Azure con el control de acceso basado en roles de Azure (Azure RBAC)](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/)

**Savill**: buscar "RBAC" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Azure RBAC]] · [[Managed Identities]] · [[Identidad, acceso y seguridad en Azure (AZ-900)]]

**Laboratorio**: Lab 02a (suscripciones y RBAC) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Azure RBAC]]
- [[Entra ID]]
# What is Azure RBAC?.

RBAC = Role-Based Access Control

When it comes to identity and access, most organizations that are considering using the public cloud are concerned about two things:

1. Ensuring that when people leave the organization, they lose access to resources in the cloud.
2. Striking the right balance between autonomy and central governance. For example, giving project teams the ability to create and manage virtual machines in the cloud, while centrally controlling the networks those VMs use to communicate with other resources.

Microsoft Entra ID and Azure RBAC work together to make it simple to carry out these goals.

![[2-azuread-and-azure-roles.png]]

In the preceding diagram, a subscription is associated with only one Microsoft Entra tenant.

## What can I do with Azure RBAC?

Azure RBAC allows you to grant access to Azure resources that you control. Suppose you need to manage access to resources in Azure for the development, engineering, and marketing teams. You’ve started to receive access requests, and you need to quickly learn how access management works for Azure resources.

Here are some scenarios you can implement with Azure RBAC:

- Allow one user to manage virtual machines in a subscription and another user to manage virtual networks.
- Allow a database administrator group to manage SQL databases in a subscription.
- Allow a user to manage all resources in a resource group, such as virtual machines, websites, and subnets.
- Allow an application to access all resources in a resource group.


## Azure RBAC in the Azure portal.

![[2-resource-group-access-control.png]]


## How does Azure RBAC work?

You can control access to resources using Azure RBAC by creating role assignments, which control how permissions are enforced. To create a role assignment, you need three elements: a security principal, a role definition, and a scope. You can think of these elements as _who_, _what_, and _where_.

### 1. Security principal (who)

A _security principal_ is just a fancy name for a user, group, or application to which you want to grant access.

![An illustration showing security principal including user, group, and service principal.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-security-principal.png)

### 2. Role definition (what)

A _role definition_ is a collection of permissions. It's sometimes just called a role. A role definition lists the permissions the role can perform such as read, write, and delete. Roles can be high-level, like Owner, or specific, like Virtual Machine Contributor.

![An illustration listing different built-in and custom roles with zoom-in on the definition for the contributor role.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-role-definition.png)

Azure includes several built-in roles that you can use. The following lists four fundamental built-in roles:

- **Owner**: Has full access to all resources, including the right to delegate access to others.
- **Contributor**: Can create and manage all types of Azure resources, but can’t grant access to others.
- **Reader**: Can view existing Azure resources.
- **User Access Administrator**: Lets you manage user access to Azure resources.

If the built-in roles don't meet the specific needs of your organization, you can create your own custom roles.
### 3. Scope (where)

_Scope_ is the level where the access applies. This is helpful if you want to make someone a Website Contributor but only for one resource group.

In Azure, you can specify a scope at multiple levels: management group, subscription, resource group, or resource. Scopes are structured in a parent-child relationship. When you grant access at a parent scope, the child scopes automatically inherit those permissions. For example, if a group is assigned the Contributor role at the subscription scope, it will inherit the role for all resource groups and resources within the subscription.

![An illustration showing a hierarchical representation of different Azure levels to apply scope. The hierarchy, starting with the highest level, is in this order: Management group, subscription, resource group, and resource.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-scope.png)

### Role assignment

Once you have determined the who, what, and where, you can combine those elements to grant access. A _role assignment_ is the process of binding a role to a security principal at a particular scope for the purpose of granting access. To grant access, you'll create a role assignment. To revoke access, you'll remove a role assignment.

![[2-rbac-overview.png]]



