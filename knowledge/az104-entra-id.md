---
title: AZ-104 — Entender Microsoft Entra ID
aliases: ["Entender Microsoft Entra ID (AZ-104)"]
tags: [associate, identity]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/
---

# AZ-104 — Entender Microsoft Entra ID

Módulo 03 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Comparación de Microsoft Entra ID con Active Directory DS, ediciones P1/P2 y exploración de Microsoft Entra Domain Services para administrar aplicaciones y dispositivos unidos a dominio en la nube.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Base de todo el área de identidad: administración de usuarios y grupos de Microsoft Entra
> - Distinguir Entra ID vs ADDS (pregunta clásica) y qué ediciones traen cada característica (SSPR, acceso condicional, PIM)

## Enlaces relacionados

**Módulo de Learn**: [Entender Microsoft Entra ID](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/)

**Savill**: buscar "Entra ID" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Entra ID]] · [[Identidad, acceso y seguridad en Azure (AZ-900)]]

**Laboratorio**: Lab 01 (Entra ID) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Entra ID]]


# Examine Microsoft Entra ID.

Microsoft Entra ID is part of the platform as a service (PaaS) offering and operates as a Microsoft-managed directory service in the cloud. It’s not a part of the core infrastructure that customers own and manage, nor is it an Infrastructure as a service offering. While this implies that you have less control over its implementation, it also means that you don’t have to dedicate resources to its deployment or maintenance.

You can use Microsoft Entra ID to provide more secure access to cloud-based resources for organizations and individuals by:

- Configuring access to applications
- Configuring single sign-on (SSO) to cloud-based SaaS applications
- Managing users and groups
- Provisioning users
- Enabling federation between organizations
- Providing an identity management solution
- Identifying irregular sign-in activity
- Configuring multi-factor authentication
- Extending existing on-premises Active Directory implementations to Microsoft Entra ID
- Configuring Application Proxy for cloud and local applications
- Configuring Conditional Access for users and devices.

![[azure-active-directory-connect-stack-f1aae359.png]]


# Compare Microsoft Entra ID and Active Directory Domain Services.

### Characteristics of AD DS

AD DS is the traditional deployment of Windows Server-based Active Directory on a physical or virtual server. Although AD DS is commonly considered being primarily a directory service, it’s only one component of the Windows Active Directory suite of technologies, which also includes Active Directory Certificate Services (AD CS), Active Directory Lightweight Directory Services (AD LDS), Active Directory Federation Services (AD FS), and Active Directory Rights Management Services (AD RMS).

When comparing AD DS with Microsoft Entra ID, it’s important to note the following characteristics of AD DS:

- AD DS is a true directory service, with a hierarchical X.500-based structure.
- AD DS uses Domain Name System (DNS) for locating resources such as domain controllers.
- You can query and manage AD DS by using Lightweight Directory Access Protocol (LDAP) calls.
- AD DS primarily uses the Kerberos protocol for authentication.
- AD DS uses OUs and GPOs for management.
- AD DS includes computer objects, representing computers that join an Active Directory domain.
- AD DS uses trusts between domains for delegated management.

### Characteristics of Microsoft Entra ID

Although Microsoft Entra ID has many similarities to AD DS, there are also many differences. It’s important to realize that using Microsoft Entra isn’t the same as deploying an Active Directory domain controller on an Azure virtual machine and adding it to your on-premises domain.

When comparing Microsoft Entra ID with AD DS, it’s important to note the following characteristics of Microsoft Entra ID:

- Microsoft Entra ID is primarily an identity solution, and it’s designed for internet-based applications by using HTTP (port 80) and HTTPS (port 443) communications.
- Microsoft Entra ID is a multi-tenant directory service.
- Microsoft Entra users and groups are created in a flat structure, and there are no OUs or GPOs.
- You can't query Microsoft Entra ID by using LDAP; instead, Microsoft Entra ID uses the REST API over HTTP and HTTPS.
- Microsoft Entra ID doesn't use Kerberos authentication; instead, it uses HTTP and HTTPS protocols such as SAML, WS-Federation, and OpenID Connect for authentication, and uses OAuth for authorization.
- Microsoft Entra ID includes federation services, and many third-party services such as Facebook are federated with and trust Microsoft Entra ID.

# Compare Microsoft Entra ID P1 and P2 plans.

The Microsoft Entra ID P1 or P2 tier provides extra functionality as compared to the Free and Office 365 editions. However, premium versions require additional cost per user provisioning. Microsoft Entra ID P1 or P2 comes in two versions P1 and P2. You can procure it as an extra license or as a part of the Microsoft Enterprise Mobility + Security, which also includes the license for Azure Information Protection and Intune.

Microsoft provides a free trial period that can be used to experience the full functionality of the Microsoft Entra ID P2 edition. The following features are available with the Microsoft Entra ID P1 edition:

- **Self-service group management**. It simplifies the administration of groups where users are given the rights to create and manage the groups. End users can create requests to join other groups, and group owners can approve requests and maintain their groups’ memberships.
- **Advanced security reports and alerts**. You can monitor and protect access to your cloud applications by viewing detailed logs that show advanced anomalies and inconsistent access pattern reports. Advanced reports are machine learning based and can help you gain new insights to improve access security and respond to potential threats.
- **Multi-factor authentication**. Full multi-factor authentication (MFA) works with on-premises applications (using virtual private network [VPN], RADIUS, and others), Azure, Microsoft 365, Dynamics 365, and third-party Microsoft Entra gallery applications. It doesn't work with non-browser off-the-shelf apps, such as Microsoft Outlook. Full multi-factor authentication is covered in more detail in the following units in this lesson.
- **Microsoft Identity Manager (MIM) licensing**. MIM integrates with Microsoft Entra ID P1 or P2 to provide hybrid identity solutions. MIM can bridge multiple on-premises authentication stores such as AD DS, LDAP, Oracle, and other applications with Microsoft Entra ID. This provides consistent experiences to on-premises line-of-business (LOB) applications and SaaS solutions.
- **Enterprise SLA of 99.9%**. You're guaranteed at least 99.9% availability of the Microsoft Entra ID P1 or P2 service. The same SLA applies to Microsoft Entra Basic.
- **Password reset with writeback**. Self-service password reset follows the Active Directory on-premises password policy.
- **Cloud App Discovery feature of Microsoft Entra ID**. This feature discovers the most frequently used cloud-based applications.
- **Conditional Access based on device, group, or location**. This lets you configure conditional access for critical resources, based on several criteria.
- **Microsoft Entra Connect Health**. You can use this tool to gain operational insight into Microsoft Entra ID. It works with alerts, performance counters, usage patterns, and configuration settings, and presents the collected information in the Microsoft Entra Connect Health portal.

In addition to these features, the Microsoft Entra ID P2 license provides extra functionalities:

- **Microsoft Entra ID Protection**. This feature provides enhanced functionalities for monitoring and protecting user accounts. You can define user risk policies and sign-in policies. In addition, you can review users’ behavior and flag users for risk.
- **Microsoft Entra Privileged Identity Management**. This functionality lets you configure additional security levels for privileged users such as administrators. With Privileged Identity Management, you define permanent and temporary administrators. You also define a policy workflow that activates whenever someone wants to use administrative privileges to perform some task.

> [!NOTE]
> Plans change frequently. Check Microsoft's website for the current plans and capabilities.

# Examine Microsoft Entra Domain Services.

Microsoft provides Microsoft Entra Domain Services as an alternative to these approaches. This service, which runs as part of the Microsoft Entra ID P1 or P2 tier, provides domain services such as Group Policy management, domain joining, and Kerberos authentication to your Microsoft Entra tenant. These services are fully compatible with locally deployed AD DS, so you can use them without deploying and managing additional domain controllers in the cloud.

![[azure-active-directory-virtual-network-340081c4.png]]


Microsoft Entra Domain Services provides several benefits for organizations, such as:

- Administrators don't need to manage, update, and monitor domain controllers.
- Administrators don't need to deploy and manage Active Directory replication.
- There’s no need to have Domain Admins or Enterprise Admins groups for domains that Microsoft Entra ID manages.

If you choose to implement Microsoft Entra Domain Services, you need to be aware of the service's current limitations. These include:

- Only the base computer Active Directory object is supported.
- It’s not possible to extend the schema for the Microsoft Entra Domain Services domain.
- The organizational unit (OU) structure is flat and nested OUs aren't currently supported.
- There’s a built-in Group Policy Object (GPO), and it exists for computer and user accounts.
- It’s not possible to target OUs with built-in GPOs. Additionally, you can't use Windows Management Instrumentation filters or security-group filtering.

By using Microsoft Entra Domain Services, you can freely migrate applications that use LDAP, NTLM, or the Kerberos protocols from your on-premises infrastructure to the cloud. You can also use applications such as Microsoft SQL Server or Microsoft SharePoint Server on VMs or deploy them in the Azure IaaS, without needing domain controllers in the cloud or a VPN to local infrastructure.

