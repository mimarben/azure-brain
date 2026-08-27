---
title: AZ-104 — Crear, configurar y administrar identidades
aliases: ["Crear, configurar y administrar identidades (AZ-104)"]
tags: [associate, identity]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/
---
![[sc300-dynamic-groups.png]]![[sc300-dynamic-groups.png]]
# AZ-104 — Crear, configurar y administrar identidades

Módulo 04 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Control centralizado del acceso con una identidad definitiva para cada usuario y recurso: empleados y proveedores con el acceso justo para trabajar.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación de usuarios y grupos
> - Administración de propiedades de usuario y grupo
> - Administrar licencias en Microsoft Entra ID
> - Administración de usuarios externos (B2B)

## Enlaces relacionados

**Módulo de Learn**: [Crear, configurar y administrar identidades](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/)

**Savill**: buscar "users" / "groups" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Entra ID]] · [[Managed Identities]]

**Laboratorio**: Lab 01 (Entra ID) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Entra ID]]

# Introduction.

Transitioning workloads to the cloud involves more than just moving servers, websites, and data.

## Learning objectives

In this module, you'll:

- Create, configure, and manage users
- Create, configure, and manage groups
- Manage licenses
- Configure and manage device registration
- Explore custom security attributes and automatic provisioning

# Create, configure, and manage users.

You use the **Microsoft Entra admin center** to work with user objects. Keep in mind that you can only work with a single directory at a time. You can use the **Directory + Subscription** panel to switch directories. The admin center also has a **Switch directory** button in the toolbar, which makes it easy to switch to another available directory.![[all-users-dialog.png]]

Typically, Microsoft Entra ID defines users in three ways:

- **Cloud identities** - These users exist only in Microsoft Entra ID. Examples are administrator accounts and users that you manage yourself. Their source is **Microsoft Entra ID** or **External Microsoft Entra directory** if the user is defined in another Microsoft Entra instance but needs access to subscription resources controlled by this directory. When these accounts are removed from the primary directory, they're deleted.
- **Directory-synchronized identities** - These users exist in an on-premises Active Directory. A synchronization activity brings these users into Microsoft Entra ID. **Microsoft Entra Cloud Sync** is the recommended synchronization tool for most organizations—it uses a lightweight cloud-managed agent and supports multiple disconnected forests. **Microsoft Entra Connect Sync** remains available for complex scenarios such as device synchronization or groups with more than 50,000 members. Their source is **Windows Server AD**.
- **Guest users** - These users exist outside your organization. Examples are accounts from other cloud providers and Microsoft accounts. Their source is **Invited user**. This type of account is useful when external vendors or contractors need access to your organization's resources. Once their help is no longer necessary, you can remove the account and all of their access.
# Exercise - assign licenses to users
## Create a security group in Microsoft Entra ID

**Exercise environment needs** - this lab assumes you have a basic Microsoft Entra tenant with at least User Administrator rights to complete it. You can get a free trial subscription for at [Try Azure for Free](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_890c111e-2f36-0437-2672-3ab1ae612709).

## Create a new user in Microsoft Entra ID

You can skip creating this user if you created the same user in the earlier module.

1. Browse to the Identity menu in the [Microsoft Entra admin center](https://entra.microsoft.com/).
    
2. In the left navigation, under select **Users**, then **All Users.**
    
3. Within the Users page, on the menu, select + **New user** and **Create new user**.
    
4. Create a user using the following information:

| **Setting**         | **Value**   |
| ------------------- | ----------- |
| User principal name | ChrisG      |
| Name                | Chris Green |
| First name          | Chris       |
| Last name           | Green       |
| Password            | Kaho589256  |

5. Browse to the Microsoft Entra admin center screen.    
6. In the left navigation, under **Identity**, select **Groups** and then **All groups**.    
7. In the Groups screen, on the menu, select **New group**.    
8. Create a group using the following information:
9. When complete, verify the account for Chris Green is shown in the **All users** list.
## Assign a license to a group

License assignment to groups is managed through the Microsoft 365 admin center.

1. Go to the Microsoft 365 admin center at [https://admin.microsoft.com](https://admin.microsoft.com/).
2. Select **Billing** from the menu on the left.
3. Select **Licenses**.
4. From the list of licenses you have available, select one.
5. Select **Groups** from the list near the top of the screen.
6. On the Groups page, select **+ Assign license**.
7. Search for and select the **Marketing** group you created earlier.
8. Select the **Assign** button at the bottom of the dialog.
9. You should get a message that licenses were successfully assigned.
# Create, configure, and manage groups.

A Microsoft Entra group helps organize users, which makes it easier to manage permissions. Using groups lets the resource owner (or Microsoft Entra directory owner), assign a set of access permissions to all the members of the group, instead of having to provide the rights one-by-one.

Microsoft Entra ID allows you to define two different types of groups.

- **Security groups** - the most common type of groups and are used to manage access to shared resources. Members of a security group can include users, devices, and service principals. For example, you can create a security group for a specific security policy. By doing it this way, you can give a set of permissions to all the members at once, instead of having to add permissions to each member individually. This option requires a Microsoft Entra administrator.

- **Microsoft 365 groups** - provide collaboration opportunities by giving members access to a shared mailbox, calendar, files, SharePoint site, and more. This option also lets you give people outside of your organization access to the group. This option is available to users and admins.

## View available groups.

You can view all groups through the **Groups** item under **Identity** in the Microsoft Entra admin center. A new Microsoft Entra ID deployment has no groups defined.

![[groups-1.png]]



The second characteristic of a group that you need to be aware of is the **Membership Type**. This specifies how individual members are added to the group. The three types are:

- **Assigned** - members are added and maintained manually.
- **Dynamic User** - users are added and removed automatically based on rules that evaluate user attributes such as department, job title, or location.
- **Dynamic Device** - devices are added and removed automatically based on rules that evaluate device attributes. Applies to security groups only; Microsoft 365 groups support dynamic users but not dynamic devices.

## Dynamic groups

With dynamic membership, Microsoft Entra ID automatically adds or removes users or devices from a group based on rules you define. When a member's attributes change—for example, a user moves to a different department—all dynamic membership rules in the tenant are reevaluated, and the user is added to or removed from groups accordingly.

Dynamic membership requires a **Microsoft Entra ID P1** license (or Intune for Education for device-based rules).

![[groups-1.png]]


# Exercise - add groups in Microsoft Entra ID

Completed100 XP

- 2 minutes

**Exercise environment needs** - this lab assumes you have a basic Microsoft Entra tenant with at least User Administrator rights to complete it. You can get a free trial subscription at [Try Microsoft Azure for free](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_2e0d0210-b96e-28e6-c403-6ee0e3ff4ca4).

## Create a Microsoft 365 group in Microsoft Entra ID

1. Browse to the [Microsoft Entra admin center](https://entra.microsoft.com/).
    
2. In the left navigation, under **Identity**, select **Groups**.
    
3. In the Groups page, on the menu, select **New group**.
    
4. Create a group using the following information:

|**Setting**|**Value**|
|---|---|
|Group type|Microsoft 365|
|Group name|Northwest Sales|
|Membership type|Assigned|
|Owners|Assign your own administrator account as the group owner|
|Members|Assign a member of this group|
![[create-office-365-group.png]]

5. When complete, verify the group named **Northwest sales** is shown in the **All groups** list.
    
6. You have to refresh the **All groups** a couple of times for the new group to show up.

# Configure and manage device registration.

With the proliferation of devices of all shapes and sizes and the proliferation of bring-your-own-device (BYOD), IT professionals are faced with two somewhat opposing goals:

- Allow end users to be productive wherever and whenever and on any device
- Protect the organization's assets

## Microsoft Entra registered devices

The goal of Microsoft Entra registered devices is to provide your users with support for the BYOD or mobile device scenarios. In these scenarios, a user can access your organization’s Microsoft Entra ID controlled resources using a personal device.

|**Microsoft Entra registered**|**Description**|
|---|---|
|Definition|Registered to Microsoft Entra ID without requiring organizational account to sign in to the device|
|Primary audience|Applicable to Bring your own device (BYOD), and Mobile devices|
|Device ownership|User or Organization|
|Operating systems|Windows 10 or newer, macOS 10.15 or newer, iOS 15 or newer, Android, Linux (Ubuntu 20.04/22.04/24.04 LTS, Red Hat Enterprise Linux 8/9 LTS)|
|Device sign in options|End-user local credentials, Password, Windows Hello, PIN, Biometrics|
|Device management|Mobile Device Management (example: Microsoft Intune), Mobile Application Management|
|Key capabilities|SSO to cloud resources, Conditional Access when enrolled in Intune, Conditional Access via App protection policy|
![[azure-active-directory-registered-device.png]]


[Enable passwordless security key](https://learn.microsoft.com/en-us/entra/identity/authentication/howto-authentication-passwordless-security-key-on-premises)

# Manage licenses.

Microsoft paid cloud services, such as Microsoft 365, Enterprise Mobility + Security, Dynamics 365, and other similar products, require licenses.

## License requirements

You must have one of the following licenses to use group-based licensing:

- Paid or trial subscription for Microsoft Entra ID Premium P1 and greater
- Paid or trial edition Office 365 Enterprise E3 or greater

### An example

An organization has 1,000 users. All users require Office 365 Enterprise E3 licenses. Currently the organization has a PowerShell script running on premises, adding and removing licenses from users as they come and go. However, the organization wants to replace the script with group-based licensing so licenses can be managed automatically by Microsoft Entra ID.

Here is what the migration process could look like:

1. Using the Azure portal, assign the Office 365 E3 license to the **All users** group in Microsoft Entra ID.
    
2. Confirm that license assignment has completed for all users. Go to the overview page for the group, select **Licenses**, and check the processing status at the top of the **Licenses** page.
    
    - Look for “Latest license changes have been applied to all users" to confirm processing has completed.
    - Look for a notification on top about any users for whom licenses were not successfully assigned. Did we run out of licenses for some users? Do some users have conflicting license plans that prevent them from inheriting group licenses?
3. You need to check a few users to verify that they have both the direct and group licenses applied. Go to the profile page for a user, select Licenses, and examine the state of licenses.
    

- This is the expected user state during migration:

![Screenshot of the Licenses page. See the license has direct assignments to some users, and that it has inherited users from a group.](https://learn.microsoft.com/en-us/training/wwl-sci/create-configure-manage-identities/media/expected-user-state.png)

4. After confirming that both direct and group licenses are equivalent, you can start removing direct licenses from users. You can test this by removing them for individual users in the portal and then run automation scripts to have them removed in bulk. Here's an example of the same user with the direct licenses removed through the portal. Notice that the license state remains unchanged, but we no longer see direct assignments.

![Screenshot of the Licenses page in Microsoft Entra ID after the migration is completed.](https://learn.microsoft.com/en-us/training/wwl-sci/create-configure-manage-identities/media/direct-licenses-removed.png)

## Change license assignments for a user or group in Microsoft Entra ID

This section describes how to move users and groups between service license plans in Microsoft Entra ID. The goal is to ensure that there's no loss of service or data during the license change. Users should switch between services seamlessly. The license plan assignment steps in this section describe changing a user or group on Office 365 E1 to Office 365 E3, but the steps apply to all license plans. When you update license assignments for a user or group, the license assignment removals and new assignments are made simultaneously so that users don't lose access to their services during license changes or see license conflicts between plans.

Before you update the license assignments, verify certain assumptions are true for all of the users or groups to be updated. If the assumptions aren't true for all of the users in a group, the migration might fail for some. As a result, some of the users might lose access to services or data. Ensure that:

- Users have the current license plan that's assigned to a group and inherited by the user and not assigned directly.
- You have enough available licenses for the license plan you're assigning. If you don't have enough licenses, some users might not be assigned the new license plan. You can check the number of available licenses.
- Always confirm users don't have assigned service licenses that can conflict with the desired license or prevent removal of the current license. For example, a license from a service such as Workplace Analytics or Project Online that has a dependency on other services.
- If you manage groups on-premises and sync them into Microsoft Entra ID via Microsoft Entra Connect, then you add or remove users by using your on-premises system. It can take some time for the changes to sync with Microsoft Entra ID to be picked up by group licensing.
- If you're using Microsoft Entra dynamic group memberships, you add or remove users by changing their attributes, but the update process for license assignments remains the same.# Create custom security attributes

Completed100 XP

- 4 minutes

![Screenshot of the Custom Security Attributes dialog. Create new security attributes of type String, Integer, or Boolean.](https://learn.microsoft.com/en-us/training/wwl-sci/create-configure-manage-identities/media/custom-security-attributes.png)

## What is a custom security attribute?

Custom security attributes in Microsoft Entra ID are business-specific attributes (key-value pairs) that you can define and assign to Microsoft Entra objects. These attributes can be used to store information, categorize objects, or enforce fine-grained access control over specific Azure resources.

### Why use custom security attributes?

- Extend user profiles, such as add Hourly Salary to all my employees.
- Ensure only administrators can see the Hourly Salary attribute in my employees' profiles.
- Categorize hundreds or thousands of applications to easily create a filterable inventory for auditing.
- Grant users access to the Azure Storage blobs belonging to a project.

### What can I do with custom security attributes?

- Define business-specific information (attributes) for your tenant.
- Add custom security attributes to Microsoft Entra users and enterprise applications (service principals).
- Manage Microsoft Entra objects using custom security attributes with queries and filters.
- Provide attribute governance so attributes determine who can get access.

Custom security attributes are **not** supported in Microsoft Entra Domain Services, SAML token claims, or JSON Web Token (JWT) claims.

### Features of custom security attributes

- Available tenant-wide
- Include a description
- Support different data types: Boolean, integer, string
- Support single value or multiple values
- Support user-defined free-form values or predefined values
- Assign custom security attributes to directory synced users from an on-premises Active Directory.

# Explore automatic user creation.

![[automatic-user-provisioning.png]]


### Components of SCIM (System for Cross-Domain Identity Management)
- **HCM system** - Applications and technologies that enable Human Capital Management process and practices that support and automate HR processes throughout the employee lifecycle.
- **Microsoft Entra Provisioning Service** - Uses the SCIM 2.0 protocol for automatic provisioning. The service connects to the SCIM endpoint for the application, and uses the SCIM user object schema and REST APIs to automate provisioning and deprovisioning of users and groups.
- **Microsoft Entra ID** - User repository used to manage the lifecycle of identities and their entitlements.
- **Target system** - Application or system that has SCIM endpoint and works with the Microsoft Entra provisioning to enable automatic provisioning of users and groups.
### Why use SCIM?
System for Cross-Domain Identity Management (SCIM) is an open standard protocol for automating the exchange of user identity information between identity domains and IT systems. SCIM ensures that employees added to the Human Capital Management (HCM) system automatically have accounts created in Microsoft Entra ID or Windows Server Active Directory.
### API-driven inbound provisioning
Not all HR systems expose a SCIM endpoint. For these scenarios, Microsoft Entra ID supports **API-driven inbound provisioning**, which reached general availability in March 2024. Instead of requiring the source system to push data via SCIM, any automation tool, or script can retrieve workforce data from any system of record and send it to the Microsoft Entra provisioning API.

