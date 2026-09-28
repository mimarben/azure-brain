---
title: AZ-104 — Crear, configurar y administrar identidades
aliases: ["Crear, configurar y administrar identidades (AZ-104)"]
tags: [associate, identity]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/
---

# AZ-104 — Crear, configurar y administrar identidades

Módulo 04 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Control centralizado del acceso con una identidad definitiva para cada usuario y recurso: empleados y proveedores con el acceso justo para trabajar.

## Resumen en mis palabras

> *La transición de las cargas de trabajo a la nube conlleva algo más que mover servidores, sitios web y datos. Las empresas deben pensar en cómo proteger esos recursos mediante la definición de usuarios autorizados.*

## Por qué importa para el examen

> - Creación de usuarios y grupos
> - Administración de propiedades de usuario y grupo
> - Administrar licencias en Microsoft Entra ID
> - Administración de usuarios externos (B2B)

## Enlaces relacionados

**Módulo de Learn**: [Crear, configurar y administrar identidades](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/) ([ES](https://learn.microsoft.com/es-es/training/modules/create-configure-manage-identities/))

**Savill**: buscar "users" / "groups" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Entra ID]] · [[Managed Identities]]

**Laboratorio**: Lab 01 (Entra ID) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Entra ID]]

# # Introduction.

La transición de las cargas de trabajo a la nube conlleva algo más que mover servidores, sitios web y datos. Las empresas deben pensar en cómo proteger esos recursos mediante la definición de usuarios autorizados. A continuación, las empresas deben asegurarse de que los usuarios solo tienen acceso a los datos que necesitan, que la autorización de usuario solo está limitada a los servicios disponibles para ellos y que los usuarios solo realizan operaciones autorizadas para que realicen. El acceso a las cargas de trabajo basadas en la nube se controla de forma centralizada de dos maneras. En primer lugar, proporcione una identidad definitiva para cada usuario que use para cada servicio. En segundo lugar, garantiza que los empleados y proveedores tengan acceso suficiente para realizar sus trabajos.

## Objetivos de aprendizaje

En este módulo, descubrirá lo siguiente:

- Creación, configuración y administración de usuarios
- Creación, configuración y administración de grupos
- Administración de licencias
- Configuración y administración del registro de dispositivos
- Exploración de atributos de seguridad personalizados y aprovisionamiento automático

# Creación, configuración y administración de usuarios

Cada usuario que necesita acceso a los recursos necesita una cuenta de usuario en el identificador de Microsoft Entra. Una cuenta de usuario contiene toda la información necesaria para autenticar al usuario durante el proceso de inicio de sesión. Una vez autenticado, el identificador de Microsoft Entra crea un token de acceso para autorizar al usuario y determinar a qué recursos pueden acceder y a qué pueden hacer con esos recursos.

El Centro de **administración de Microsoft Entra** se usa para trabajar con objetos de usuario. Tenga en cuenta que solo puede trabajar con un único directorio a la vez. Puede usar el panel **Directorio y suscripción** para cambiar de directorio. El centro de administración también tiene un botón **Cambiar directorio** en la barra de herramientas, lo que facilita el cambio a otro directorio disponible.

## Visualización de usuarios

Para ver los usuarios de Microsoft Entra, seleccione la entrada **Usuarios** en **Identidad** y, a continuación, abra la vista **Todos los usuarios** .
![[all-users-dialog.png]]

Normalmente, Microsoft Entra ID define a los usuarios de tres maneras:

- **Identidades en la nube** : estos usuarios solo existen en el identificador de Microsoft Entra. Algunos ejemplos son las cuentas de administrador y los usuarios que usted mismo administra. Su origen es **El identificador de Microsoft Entra** o el **directorio externo de Microsoft Entra** si el usuario está definido en otra instancia de Microsoft Entra, pero necesita acceso a los recursos de suscripción controlados por este directorio. Cuando estas cuentas se quitan del directorio principal, se eliminan.
- **Identidades sincronizadas por directorios** : estos usuarios existen en una instancia local de Active Directory. Una actividad de sincronización lleva a estos usuarios a Microsoft Entra ID. **Microsoft Entra Cloud Sync** es la herramienta de sincronización recomendada para la mayoría de las organizaciones: usa un agente administrado en la nube ligero y admite varios bosques desconectados. **Microsoft Entra Connect Sync** sigue estando disponible para escenarios complejos, como la sincronización de dispositivos o grupos con más de 50 000 miembros. Su origen es **Windows Server AD**.
- **Usuarios invitados** : estos usuarios existen fuera de la organización. Algunos ejemplos son cuentas de otros proveedores de nube y cuentas de Microsoft. Su origen es **Usuario invitado**. Este tipo de cuenta es útil cuando los proveedores externos o contratistas necesitan acceso a los recursos de la organización. Una vez que se puede prescindir de ellos, la cuenta correspondiente y todo el acceso del que disfrutan se puede quitar.



## Creación de un nuevo usuario en microsoft Entra ID

Puede omitir la creación de este usuario si creó el mismo usuario en el módulo anterior.

1. Vaya al menú Identidad del [Centro de administración de Microsoft Entra](https://entra.microsoft.com/).
    
2. En el panel de navegación izquierdo, en Seleccione **Usuarios** y, a continuación, **Todos los usuarios.**
    
3. En la página Usuarios, en el menú, seleccione + **Nuevo usuario** y **Crear nuevo usuario**.
    
4. Cree un usuario con esta información:
    
| **Setting**                 | **Value**                  |
| --------------------------- | -------------------------- |
| Nombre principal de usuario | ChrisG                     |
| Name                        | Chris Green                |
| Nombre                      | Chris                      |
| Apellido                    | Green                      |
| Password                    | crear una contraseña única |
    
5. Cuando haya finalizado, compruebe que la cuenta de Chris Green se muestra en la lista **Todos los usuarios** .
    

## Creación de un grupo de seguridad en Microsoft Entra ID

1. Vaya a la pantalla del centro de administración de Microsoft Entra.
    
2. En el panel de navegación izquierdo, en **Identidad**, seleccione **Grupos** y, a continuación, **Todos los grupos**.
    
3. En la pantalla Grupos, en el menú, seleccione **Nuevo grupo**.
    
4. Cree un grupo con esta información:

| **Setting**         | **Value**                                                           |
| ------------------- | ------------------------------------------------------------------- |
| Tipo de grupo       | Security                                                            |
| Nombre del grupo    | Marketing                                                           |
| Tipo de pertenencia | Assigned                                                            |
| Owners              | Asigne su propia cuenta de administrador como propietario del grupo |
| Members             | Chris Green                                                         |

## Asignación de una licencia a un grupo

La asignación de licencias a grupos se administra a través del Centro de administración de Microsoft 365.

1. Vaya al Centro de administración de Microsoft 365 en [https://admin.microsoft.com](https://admin.microsoft.com/).
2. Seleccione **Facturación** en el menú de la izquierda.
3. Seleccione **Licencias**.
4. En la lista de licencias que tiene disponibles, seleccione una.
5. Seleccione **Grupos** en la lista cerca de la parte superior de la pantalla.
6. En la página Grupos, seleccione **+ Asignar licencia**.
7. Busque y seleccione el grupo **marketing** que creó anteriormente.
8. Seleccione el botón **Asignar** situado en la parte inferior del cuadro de diálogo.
9. Debería recibir un mensaje que indica que las licencias se asignaron correctamente.
# Creación, configuración y administración de grupos

Un grupo de Microsoft Entra ayuda a organizar a los usuarios, lo que facilita la administración de permisos. El uso de grupos permite al propietario del recurso (o al propietario del directorio de Microsoft Entra), asignar un conjunto de permisos de acceso a todos los miembros del grupo, en lugar de tener que proporcionar los derechos uno a uno. Los grupos le permiten definir un límite de seguridad y, a continuación, agregar y quitar usuarios específicos para conceder o denegar el acceso con una cantidad mínima de esfuerzo. Aún mejor, el identificador de Entra de Microsoft admite la capacidad de definir la pertenencia en función de las reglas, como el departamento en el que trabaja un usuario o el puesto de trabajo que tienen.

Microsoft Entra ID permite definir dos tipos diferentes de grupos.

- **Grupos de seguridad:** el tipo de grupos más común y se usan para administrar el acceso a los recursos compartidos. Los miembros de un grupo de seguridad pueden incluir usuarios, dispositivos y entidades de servicio. Por ejemplo, puede crear un grupo de seguridad relativo a una directiva de seguridad específica. Al hacerlo de esta manera, puede conceder un conjunto de permisos a todos los miembros a la vez, en lugar de tener que agregar permisos a cada miembro individualmente. Esta opción requiere un administrador de Microsoft Entra.
- **Grupos de Microsoft 365** : proporcionan oportunidades de colaboración al conceder a los miembros acceso a un buzón compartido, calendario, archivos, sitio de SharePoint, etc. Esta opción también le permite conceder a las personas fuera de su organización acceso al grupo. Esta opción está disponible para los usuarios y administradores.

## Visualización de grupos disponibles

Puede ver todos los grupos a través del elemento **Grupos** en **Identidad** en el Centro de administración de Microsoft Entra. Una nueva implementación de Microsoft Entra ID no tiene ningún grupo definido.

![[groups-1.png]]



La segunda característica de un grupo que debe tener en cuenta es el Tipo de **pertenencia**. Esto especifica cómo se agregan miembros individuales al grupo. Los tres tipos son:

- **Asignado** - los miembros se agregan y mantienen manualmente.
- **Usuario dinámico:** los usuarios se agregan y quitan automáticamente en función de las reglas que evalúan atributos de usuario como departamento, puesto o ubicación.
- **Dispositivo dinámico** : los dispositivos se agregan y quitan automáticamente en función de las reglas que evalúan los atributos del dispositivo. Solo se aplica a los grupos de seguridad; Los grupos de Microsoft 365 admiten usuarios dinámicos, pero no dispositivos dinámicos.

## Grupos dinámicos

Con la pertenencia dinámica, Microsoft Entra ID agrega o quita automáticamente usuarios o dispositivos de un grupo en función de las reglas que defina. Cuando cambian los atributos de un miembro (por ejemplo, un usuario se mueve a otro departamento), se vuelven a evaluar todas las reglas de pertenencia dinámica del inquilino y el usuario se agrega o quita de grupos en consecuencia.

La pertenencia dinámica requiere una licencia **de Microsoft Entra ID P1** (o Intune for Education para reglas basadas en dispositivos).

![[Pasted image 20260928195138.png]]



![[groups-1.png]]


# E# Agregar grupos en Microsoft Entra ID

Completado100 XP

- 2 minutos

**Necesidades del entorno del ejercicio**: este laboratorio supone que tiene un inquilino básico de Microsoft Entra con al menos derechos de administrador de usuarios para completarlo. Puede obtener una suscripción de evaluación gratuita en [Probar Microsoft Azure de forma gratuita](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_2e0d0210-b96e-28e6-c403-6ee0e3ff4ca4).

## Creación de un grupo de Microsoft 365 en el identificador de Entra de Microsoft

1. Vaya al [Centro de administración de Microsoft Entra](https://entra.microsoft.com/).
    
2. En el panel de navegación izquierdo, en **Identidad**, seleccione **Grupos**.
    
3. En la página Grupos, en el menú, selecciona **Nuevo grupo**.
    
4. Cree un grupo con esta información:

|**Setting**|**Value**|
|---|---|
|Group type|Microsoft 365|
|Group name|Northwest Sales|
|Membership type|Assigned|
|Owners|Assign your own administrator account as the group owner|
|Members|Assign a member of this group|
![[create-office-365-group.png]]

5. Cuando termine, compruebe que el grupo denominado **Northwest Sales** aparece en la lista **Todos los grupos**.
    
6. Tiene que actualizar **todos los grupos** un par de veces para que aparezca el nuevo grupo.

# Configuración y administración del registro de dispositivos

Con la proliferación de dispositivos de todas las formas y tamaños y la proliferación de bring-your-own-device (BYOD), los profesionales de TI se enfrentan a dos objetivos algo opuestos:

- Permitir que los usuarios finales sean productivos siempre y cuando y en cualquier dispositivo
- Protección de los recursos de la organización

Para proteger estos recursos, el personal de TI debe administrar primero las identidades del dispositivo. El personal de TI puede basarse en la identidad del dispositivo con herramientas como Microsoft Intune para garantizar que se cumplen los estándares de seguridad y cumplimiento. Microsoft Entra ID permite el inicio de sesión único en dispositivos, aplicaciones y servicios desde cualquier lugar a través de estos dispositivos.

- Los usuarios obtienen acceso a los recursos de su organización que necesitan.
- El personal de TI obtiene los controles que necesitan para proteger su organización.

## Dispositivos registrados en Microsoft Entra

El objetivo de los dispositivos registrados de Microsoft Entra es proporcionar a los usuarios compatibilidad con los escenarios byOD o de dispositivos móviles. En estos escenarios, un usuario puede acceder a los recursos controlados de Microsoft Entra ID de su organización mediante un dispositivo personal.

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


[Enable passwordless security key](https://learn.microsoft.com/en-us/entra/identity/authentication/howto-authentication-passwordless-security-key-on-premises) ([ES](https://learn.microsoft.com/es-es/entra/identity/authentication/howto-authentication-passwordless-security-key-on-premises))
Los dispositivos registrados por Microsoft Entra inician sesión para usar una cuenta local como una cuenta de Microsoft en un dispositivo Windows 10 o más reciente, pero además tienen una cuenta de Microsoft Entra asociada para acceder a los recursos de la organización. El acceso a los recursos de la organización se puede limitar aún más en función de esa cuenta de Microsoft Entra y las directivas de acceso condicional aplicadas a la identidad del dispositivo.

Los administradores pueden proteger y controlar aún más estos dispositivos registrados de Microsoft Entra mediante herramientas de administración de dispositivos móviles (MDM), como Microsoft Intune. MDM proporciona una manera de aplicar las configuraciones que requiere la organización, como el cifrado del almacenamiento, la complejidad de las contraseñas y que el software de seguridad siempre esté actualizado.

El registro de id. de Entra de Microsoft se puede realizar al acceder a una aplicación de trabajo por primera vez o manualmente mediante el menú Configuración de Windows 10 o Windows 11.

### Escenarios para dispositivos registrados

Un usuario de su organización quiere acceder a las herramientas para el correo electrónico, notificar el tiempo de espera y beneficiarse de la inscripción desde su equipo doméstico. Su organización tiene estas herramientas detrás de una directiva de acceso condicional que requiere acceso desde un dispositivo compatible con Intune. El usuario agrega su cuenta de organización y registra su PC doméstico con Microsoft Entra ID, y se aplican las directivas de Intune necesarias, lo que proporciona al usuario acceso a sus recursos.

Otro usuario quiere acceder a su correo electrónico organizacional en su teléfono Android personal, que está infectado con un rootkit. Su empresa requiere un dispositivo compatible y ha creado una directiva de cumplimiento de Intune para bloquear los dispositivos rooteados. El empleado no puede acceder a los recursos de la organización con este dispositivo.

## Dispositivos unidos a Microsoft Entra

La unión a Microsoft Entra está pensada para aquellas organizaciones que quieran estar primero en la nube o solo en la nube. Cualquier organización puede implementar dispositivos unidos a Microsoft Entra, sin importar su tamaño ni su sector. La unión a Microsoft Entra permite el acceso tanto a aplicaciones en la nube como a los recursos locales.

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

