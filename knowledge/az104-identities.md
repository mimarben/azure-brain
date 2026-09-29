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


# Agregar grupos en Microsoft Entra ID

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

Los servicios en la nube de pago de Microsoft, como Microsoft 365, Enterprise Mobility + Security, Dynamics 365 y otros productos similares, requieren licencias. Estas licencias se asignan a cada usuario que necesita acceso a estos servicios. Para administrar licencias, los administradores usan el [Centro de administración de Microsoft 365](https://admin.microsoft.com/) o PowerShell y Microsoft Graph API. Microsoft Entra ID es la infraestructura subyacente que admite la administración de identidades para todos los servicios en la nube de Microsoft. Microsoft Entra ID almacena información sobre los estados de asignación de licencias de los usuarios.

**Sin licencias basadas en grupos, la asignación de licencias en el nivel de usuario individual dificulta la administración a gran escala. Por ejemplo, para agregar o quitar licencias de usuario en función de los cambios de la organización, como los usuarios que se unen o abandonan la organización o un departamento, un administrador a menudo debe escribir un script complejo de PowerShell. Este script realiza llamadas individuales al servicio en la nube.**

Para abordar esos desafíos, el identificador de Microsoft Entra ahora incluye licencias basadas en grupos. Puede asignar una o varias licencias de producto a un grupo. Microsoft Entra ID garantiza que las licencias se asignen a todos los miembros del grupo. A todos los miembros nuevos que se unan al grupo se les asignarán las licencias correspondientes. Cuando salen del grupo, se quitan esas licencias. La administración de licencias elimina la necesidad de automatizar la administración de licencias a través de PowerShell para reflejar los cambios que se producen en la organización y en la estructura de departamento por cada usuario.

## Requisitos de licencia

Debe tener una de las siguientes licencias para usar licencias basadas en grupos:

- Suscripción de pago o de prueba para Microsoft Entra ID Premium P1 y versiones posteriores
- Edición de pago o de prueba de Office 365 Enterprise E3 o posterior

### Número necesario de licencias

Para cualquier grupo con licencia, también debes tener una licencia para cada miembro único. Si bien no tiene que asignar una licencia a cada miembro del grupo, debe tener al menos suficientes licencias para incluir a todos los miembros. Por ejemplo, si tiene 1000 miembros exclusivos que forman parte de grupos con licencia en su inquilino, debe tener al menos 1000 licencias para cumplir el contrato de licencia.

## Features

A continuación se indican las características principales de las licencias basadas en grupos:

- Se pueden asignar licencias a todos los grupos de seguridad en Microsoft Entra ID. Los grupos de seguridad se pueden sincronizar desde el entorno local mediante **Microsoft Entra Cloud Sync** (recomendado) o **Microsoft Entra Connect Sync**. También puede crear grupos de seguridad directamente en microsoft Entra ID (también denominados grupos solo en la nube) o automáticamente a través de la característica de grupo dinámico de Microsoft Entra.

- Cuando se asigna una licencia de producto a un grupo, el administrador puede deshabilitar uno o varios planes de servicio del producto. Normalmente, esta asignación se realiza cuando la organización aún no está lista para empezar a usar un servicio incluido en un producto. Por ejemplo, el administrador podría asignar Microsoft 365 a un departamento, pero deshabilitar temporalmente el servicio Viva Engage.

- Se admiten todos los Servicios en la nube de Microsoft que requieren licencias a nivel de usuario. Esta compatibilidad incluye todos los productos de Microsoft 365, Enterprise Mobility + Security y Dynamics 365.

- Las licencias basadas en grupos solo están disponibles actualmente a través del [Centro de administración de Microsoft 365](https://admin.microsoft.com/).

- Microsoft Entra ID administra automáticamente las modificaciones de licencia resultantes de los cambios de pertenencia a grupos. Habitualmente, las modificaciones de licencia entran en vigor minutos después de un cambio en la pertenencia.

- Un usuario puede ser miembro de varios grupos con directivas de licencia especificadas. Un usuario también puede tener algunas licencias que se asignaron directamente, fuera de cualquier grupo. El estado de usuario resultante es una combinación de todas las licencias de producto y servicio asignadas. Si a un usuario se le asigna la misma licencia de varios orígenes, la licencia solo se consume una vez.

- En algunos casos, no se pueden asignar licencias a un usuario. Por ejemplo, puede que no haya suficientes licencias disponibles en el inquilino o que los servicios en conflicto se asignen al mismo tiempo. Los administradores tienen acceso a información sobre usuarios para los que Microsoft Entra ID no pudo procesar íntegramente las licencias de grupo. Pueden realizar acciones correctivas según esa información.

Algunos servicios de Microsoft no están disponibles en todas las ubicaciones. El administrador, antes de asignar una licencia a un usuario, debe especificar la ubicación de uso en el perfil de usuario.

En el caso de la asignación de licencias de grupo, cualquier usuario sin una ubicación de uso especificada heredará la ubicación del directorio. Si tiene usuarios en varias ubicaciones, se recomienda establecer siempre la ubicación de uso como parte de la creación del usuario. La ubicación de uso ayuda a garantizar que el resultado de la asignación de licencias es siempre correcto y los usuarios no reciben servicios en ubicaciones que no están permitidas.

## Cambio de la asignación de licencia de grupo

1. Abra [https://entra.microsoft.com](https://entra.microsoft.com/) para acceder al Centro de administración de Microsoft Entra.
2. En el panel de navegación izquierdo, abra **Grupos**.
3. Seleccione **Todos los grupos**, después seleccione uno de los grupos disponibles.
4. En el panel de navegación izquierdo, en **Administrar**, seleccione **Licencias**.

Verá una lista de las asignaciones de licencias que se realizan actualmente. Y encuentra que tiene que usar el Centro de administración de Microsoft 365 para hacer actualizaciones.

5. Revise las asignaciones actuales y, luego, seleccione **+ Asignaciones** en el menú.
6. Abra [https://admin.microsoft.com](https://admin.microsoft.com/) para abrir el Centro de administración de Microsoft 365.
7. Seleccione **Facturación**. A continuación, seleccione **Licencias**.
8. Seleccione una licencia disponible de la lista.
9. Seleccione **Grupos** en el menú situado cerca de la parte superior de la página.
10. Seleccione la opción **+ Asignar licencias**.
11. Elija el grupo que estaba viendo anteriormente en Microsoft Entra. Después seleccione el botón **Asignar** en la parte inferior de la página.
12. Revise el cambio en la página Licencias del grupo. Debería poder ver el cambio tanto en el Centro de administración Microsoft Entra como en el Centro de administración Microsoft 365.
## Identificación y resolución de problemas de asignación de licencias para un grupo en Microsoft Entra ID

Las licencias basadas en grupos en Microsoft Entra ID presentan el concepto de usuarios en un estado de error de licencia. En esta sección, se explican los motivos por los que los usuarios pueden terminar en este estado.

Al asignar licencias directamente a usuarios individuales, sin usar licencias basadas en grupos, es posible que se produzcan errores en la operación de asignación. Por ejemplo, al ejecutar el cmdlet de PowerShell `Set-MgUserLicense` en un objeto del usuario, el cmdlet puede generar un error por diversos motivos relacionados con la lógica de negocios. Por ejemplo, puede haber un número insuficiente de licencias o un conflicto entre dos planes de servicio que no se pueden asignar al mismo tiempo. El problema se le notifica inmediatamente.

Cuando se usan licencias basadas en grupo se pueden producir los mismos errores, pero ocurren en segundo plano mientras el servicio Microsoft Entra está asignando las licencias. Por este motivo, los errores no se pueden comunicar de forma inmediata. En su lugar, se graban en el objeto de usuario y luego se notifican a través del portal administrativo. La intención original de licenciar al usuario nunca se pierde, pero se registra en un estado de error para futuras investigaciones y resoluciones.

## Escasez de licencias

**Problema**: no hay suficientes licencias disponibles para uno de los productos especificados en el grupo. Debe comprar más licencias para el producto o liberar licencias sin usar de otros usuarios o grupos.

Para ver cuántas licencias están disponibles, vaya a **Microsoft Entra - Identidad - Facturación**, luego a **Licencias** y, por último, a **Todos los productos**.

Para ver qué usuarios y grupos consumen licencias, seleccione un producto. En **Usuarios con** licencia, verá una lista de todos los usuarios que tienen licencias asignadas directamente o a través de uno o varios grupos. En **Grupos con licencias**, se muestran todos los grupos que tienen asignadas licencias de producto.

**PowerShell**: los cmdlets de PowerShell informan este error como _CountViolation_.

## Planes de servicio en conflicto

**Problema**: uno de los productos especificados en el grupo contiene un plan de servicio que entra en conflicto con otro plan de servicio que ya está asignado al usuario a través de un producto diferente. Algunos planes de servicio están configurados de forma que no se pueden asignar al mismo usuario que otro plan de servicio relacionado.

Considere el ejemplo siguiente. Un usuario tiene asignada directamente una licencia para Office 365 Enterprise _E1_, con todos los planes habilitados. El usuario se agrega a un grupo que tiene asignado el producto Office 365 Enterprise _E3_ . El producto E3 contiene planes de servicio que no pueden superponerse con los planes incluidos en E1, por lo que la asignación de licencia de grupo genera el error **Planes de servicio en conflicto**. En este ejemplo, los planes de servicio en conflicto son los siguientes:

- SharePoint Online (plan 2) entra en conflicto con SharePoint Online (plan 1).
- Exchange Online (plan 2) entra en conflicto con Exchange Online (plan 1).

Para resolver este conflicto, debe deshabilitar dos de los planes. Puede deshabilitar la licencia E1 asignada directamente al usuario. Otra opción sería modificar la asignación de licencia de grupo completa y deshabilitar los planes en la licencia E3. Como alternativa, puede decidir quitar la licencia E1 del usuario si es redundante en el contexto de la licencia E3.

La decisión sobre cómo resolver las licencias de producto en conflicto la toma siempre el administrador. Microsoft Entra ID no resuelve automáticamente los conflictos de licencias.

**PowerShell**: los cmdlets de PowerShell informan este error como _MutuallyExclusiveViolation_.

## Dependencia a esta licencia de otros productos

**Problema**: uno de los productos especificados en el grupo contiene un plan de servicio que debe habilitarse para otro plan de servicio, en otro producto, para funcionar. Este error se produce cuando Microsoft Entra ID intenta quitar el plan de servicio subyacente. Por ejemplo, puede ocurrir al quitar al usuario del grupo.

Para solucionar este problema, debe asegurarse de que el plan necesario se sigue asignando a los usuarios a través de otro método o de que los servicios dependientes están deshabilitados para esos usuarios. Después de hacerlo, puede quitar correctamente la licencia de grupo de esos usuarios.

**PowerShell**: los cmdlets de PowerShell informan este error como _DependencyViolation_.

## Ubicación de uso no permitida

**Problema**: algunos servicios de Microsoft no están disponibles en todas las ubicaciones debido a las leyes y los reglamentos locales. Antes de poder asignar una licencia a un usuario, debe especificar la propiedad **Ubicación de uso** para el usuario. Puede especificar la ubicación en la sección **Usuario**, **Perfil** y luego **Editar** en Azure Portal.

Cuando Microsoft Entra ID intenta asignar una licencia de grupo a un usuario cuya ubicación de uso no se admite, se produce un error y se registra un error en el usuario.

Para solucionar este problema, quite usuarios de ubicaciones no compatibles del grupo con licencia. Como alternativa, si los valores de ubicación de uso actuales no representan la ubicación real del usuario, puede modificarlos para que las licencias se asignen correctamente la próxima vez (si se admite la nueva ubicación). Puede especificar la ubicación de uso en la pestaña **Propiedades** del usuario en el [Centro de administración de Microsoft Entra](https://entra.microsoft.com/).

**PowerShell**: los cmdlets de PowerShell informan este error como _ProhibitedInUsageLocationViolation_.

Nota:

Cuando Microsoft Entra ID asigna licencias de grupo, los usuarios sin una ubicación de uso especificada heredan la ubicación del directorio. Se recomienda que los administradores establezcan los valores de ubicación de uso correctos para los usuarios antes de usar licencias basadas en grupos para cumplir con las leyes y normativas locales.

## Direcciones de proxy duplicadas

Si usa Exchange Online, es posible que algunos usuarios de su organización estén mal configurados con el mismo valor de dirección de proxy. Cuando el sistema de licencias basadas en grupos intenta asignar una licencia a un usuario de este tipo, se produce un error y se muestra un mensaje que indica que la dirección proxy ya está en uso".

Después de resolver cualquier problema de direcciones proxy para los usuarios afectados, asegúrese de forzar el procesamiento de licencias en el grupo para asegurarse de que las licencias ahora se pueden aplicar.

## Cambio de atributo de Correo de Microsoft Entra y ProxyAddresses

**Problema**: al actualizar la asignación de licencias en un grupo o un usuario, es posible que vea que se han cambiado los atributos Mail y ProxyAddresses de Microsoft Entra de algunos usuarios.

La actualización de la asignación de licencias en un usuario hace que se active el cálculo de la dirección de proxy, lo que puede cambiar los atributos de usuario.

## Exception en registros de auditoría

**Problema**: el usuario tiene LicenseAssignmentAttributeConcurrencyException como asignación de licencia en los registros de auditoría. Cuando la licencia basada en grupos intenta procesar la asignación simultánea de la misma licencia para un usuario, se registra esta excepción en el usuario. Esto suele suceder cuando un usuario es miembro de más de un grupo con la misma licencia asignada. Microsoft Entra ID vuelve a intentar procesar la licencia de usuario y resolverá el problema. No se requiere ninguna acción del cliente para corregir este problema.

## Más de una licencia de producto asignada a un grupo

Puede asignar más de una licencia de producto a un grupo. Por ejemplo, puede asignar Office 365 Enterprise E3 y Enterprise Mobility + Security a un grupo para habilitar fácilmente todos los servicios incluidos para los usuarios.

Microsoft Entra ID intenta asignar todas las licencias especificadas en el grupo a cada usuario. Si Microsoft Entra ID no puede asignar uno de los productos debido a problemas de lógica de negocios, tampoco asignará las otras licencias del grupo. Por ejemplo, si no hay suficientes licencias para todos o si entra en conflicto con otros servicios que están habilitados para el usuario.

Puede ver a qué usuarios no se les asignó el producto y comprobar qué productos se ven afectados por este problema.

## Eliminación de un grupo con licencia

Debe quitar todas las licencias asignadas a un grupo antes de poder eliminar el grupo. Sin embargo, la eliminación de licencias de todos los usuarios del grupo puede tardar tiempo. Pueden producirse errores si el usuario tiene asignada una licencia dependiente. Si un usuario tiene una licencia que depende de otra licencia, la cual se va a quitar debido a la eliminación de un grupo, la asignación de la licencia al usuario cambia de ser heredada a directa.

Por ejemplo, considere la posibilidad de un grupo que tenga asignado Office 365 E3/E5 con un plan de servicio Skype Empresarial habilitado. Además, imagine que algunos miembros del grupo tienen licencias de audioconferencia asignadas directamente. Cuando se elimina el grupo, las licencias basadas en grupos intentan quitar Office 365 E3/E5 de todos los usuarios. Dado que Audioconferencia depende de Skype Empresarial, para cualquier usuario con Audioconferencia asignada, las licencias basadas en grupos convierten las licencias de Office 365 E3/E5 en asignaciones de licencias directas.

## Administración de licencias de productos con requisitos previos

Algunos productos de Microsoft Online que puede que tengas son _complementos_. Los complementos requieren un plan de servicio previo para habilitarse para un usuario o grupo antes de que se les pueda asignar una licencia. Con las licencias basadas en grupos, el sistema requiere que los planes de servicio de requisitos previos y de complementos estén presentes en el mismo grupo a fin de garantizar que los usuarios que se agreguen al grupo puedan recibir el producto totalmente operativo. Consideremos el siguiente ejemplo:

**Microsoft Workplace Analytics** es un producto complemento. Contiene un único plan de servicio con el mismo nombre. Solo podemos asignar este plan de servicio a un usuario o grupo cuando también se asigne uno de los siguientes requisitos previos:

- Exchange Online (plan 1)
- Exchange Online (plan 2)

Si intentamos asignar este producto por sí solo a un grupo, el portal devuelve un mensaje de notificación. Si seleccionamos los detalles del elemento, se muestra el siguiente mensaje de error:

License operation failed (Error en la operación de licencia). Asegúrese de que el grupo tiene los servicios necesarios antes de agregar o quitar un servicio dependiente. **El servicio Microsoft Workplace Analytics necesita que Exchange Online (plan 2) también esté habilitado**.

Para asignar esta licencia de complemento a un grupo, debemos asegurarnos de que el grupo también contenga el plan de servicio de requisito previo. Por ejemplo, podemos actualizar un grupo existente que ya contenga el producto Office 365 E3 completo y, después, agregarle el producto del complemento.

También es posible crear un grupo independiente que contenga solo los productos mínimos necesarios para que el complemento funcione. Después se puede usar para proporcionar la licencia del producto complementario solo a los usuarios seleccionados. Según el ejemplo anterior, asignaría los siguientes productos al mismo grupo:

- Office 365 Enterprise E3 solo con el plan de servicio Exchange Online (plan 2) habilitado
- Microsoft Workplace Analytics

A partir de ahora, todos los usuarios agregados a este grupo consumirán una licencia del producto E3 y una licencia del producto Workplace Analytics. Al mismo tiempo, esos usuarios pueden ser miembros de otro grupo que les proporcione el producto E3 completo y, aun así, consumir solo una licencia para ese producto.

Sugerencia

Puede crear varios grupos para cada plan de servicio de requisito previo. Por ejemplo, si usa Office 365 Enterprise E1 y Office 365 Enterprise E3 para los usuarios, puede crear dos grupos para licenciar Microsoft Workplace Analytics: uno que use E1 como requisito previo y el otro E3. Esto le permite distribuir el complemento a los usuarios de E1 y E3 sin consumir más licencias.

## Forzado del proceso de licencias de grupo para resolver errores

En función de los pasos que se realicen para resolver los errores, es posible que sea necesario desencadenar manualmente el procesamiento de un grupo para actualizar el estado del usuario.

Por ejemplo, si libera algunas licencias quitando las asignaciones de licencias directas a los usuarios, deberá desencadenar el procesamiento de grupos que anteriormente no licenciaban completamente a todos los miembros del usuario. Para volver a procesar un grupo, vaya al panel de grupo, abra **Licencias** y, después, seleccione el botón **Reprocesar** en la barra de herramientas.

## Forzado del proceso de licencias de usuario para resolver errores

En función de los pasos que se realicen para resolver los errores, es posible que sea necesario desencadenar manualmente el procesamiento de un usuario para actualizar el estado del usuario.

Por ejemplo, después de resolver el problema de dirección de proxy duplicado para un usuario afectado, debe desencadenar el procesamiento del usuario. Para volver a procesar un grupo, vaya al panel de usuario, abra **Licencias** y, después, seleccione el botón **Reprocesar** en la barra de herramientas.

## Migración de usuarios con licencias individuales a licencias de grupo

Puede tener licencias existentes implementadas para los usuarios de las organizaciones a través de la asignación directa; es decir, mediante scripts de PowerShell u otras herramientas para asignar licencias de usuario individuales. Antes de empezar a usar licencias basadas en grupos para administrar licencias en su organización, puede usar este plan de migración para reemplazar sin problemas las soluciones existentes por licencias basadas en grupos.

Tenga en cuenta que debe evitar una situación en la que la migración a licencias basadas en grupos da lugar a que los usuarios pierdan temporalmente sus licencias asignadas actualmente. Cualquier proceso que produzca la eliminación de licencias debe evitarse para eliminar el riesgo de que los usuarios pierdan acceso a los servicios y sus datos.

### Proceso de migración recomendado

1. Tiene automatización existente (por ejemplo, PowerShell) que administra la asignación y eliminación de licencias para los usuarios. Déjelo funcionando como está.
    
2. Cree un nuevo grupo de licencias (o decida qué grupos existentes usar) y asegúrese de que todos los usuarios necesarios se agregan como miembros.
    
3. Asigne las licencias necesarias a esos grupos; su objetivo debe ser reflejar el mismo estado de licencia que aplica su automatización existente (por ejemplo, PowerShell) a esos usuarios.
    
4. Compruebe que las licencias se aplican a todos los usuarios de esos grupos. Esta aplicación se puede hacer comprobando el estado de procesamiento en cada grupo y los registros de auditoría.
    
    - Puede realizar una comprobación aleatoria de algunos usuarios individuales examinando los detalles de sus licencias. Observará que tienen las mismas licencias asignadas "directamente" o "heredadas" de los grupos.
    - Puede ejecutar un script de PowerShell para [comprobar cómo se asignan las licencias a los usuarios](https://learn.microsoft.com/es-es/azure/active-directory/enterprise-users/licensing-group-advanced).
    - Cuando se asigna la misma licencia de producto al usuario directamente y a través de un grupo, el usuario solo consume una licencia. Por lo tanto, no se requieren más licencias para realizar la migración.
    
5. Compruebe que no se ha producido ningún error en las asignaciones de licencia comprobando si cada grupo tiene usuarios en estado de error.
    

Considere quitar las asignaciones directas originales. Le recomendamos que lo haga gradualmente y que supervise primero el resultado en un subconjunto de usuarios. Si deja las asignaciones directas originales a los usuarios, cuando los usuarios abandonen sus grupos con licencia, conservarán las licencias asignadas directamente, y puede que no sea lo que quiere.

### Un ejemplo

Una organización tiene 1000 usuarios. Todos los usuarios necesitan licencias **Office 365 Enterprise E3.** Actualmente, la organización tiene un script de PowerShell que se ejecuta de forma local, que agrega y quita licencias de los usuarios a medida que entran y salen. Sin embargo, la organización quiere reemplazar el script por licencias basadas en grupos para que Microsoft Entra ID pueda administrar automáticamente las licencias.

El proceso de migración podría ser como el siguiente:

1. Con Azure Portal, asigne la licencia de Office 365 E3 al grupo **Todos los usuarios** de Microsoft Entra ID.
    
2. Confirme que la asignación de licencia se ha completado para todos los usuarios. Vaya a la página de información general del grupo, seleccione **Licencias** y compruebe el estado de procesamiento en la parte superior de la página **Licencias**.
    
    - Busque "Latest license changes have been applied to all users" ("Los últimos cambios de licencia se han aplicado a todos los usuarios") para confirmar que se ha completado el procesamiento.
    - Busque una notificación en la parte superior acerca de los usuarios para quienes las licencias no se asignaron correctamente. ¿Nos quedamos sin licencias para algunos usuarios? ¿Algunos usuarios tienen planes de licencia en conflicto que les impiden heredar licencias de grupo?
3. Deberá revisar algunos usuarios para verificar que tengan aplicadas tanto licencias directas como de grupo. Vaya a la página de perfil de un usuario, seleccione Licencias y examine el estado de estas.
    

- Este es el estado de usuario esperado durante la migración:

![Recorte de la página](https://learn.microsoft.com/es-es/training/wwl-sci/create-configure-manage-identities/media/expected-user-state.png)

4. Después de confirmar que las licencias directas y de grupo son equivalentes, puede empezar a quitar licencias directas de usuarios. Puede probar esto quitándolas para usuarios individuales en el portal y luego ejecutando scripts de automatización para que se eliminen en masa. Este es un ejemplo del mismo usuario con sus licencias directas eliminadas desde el portal. Observe que el estado de licencia no cambia, pero ya no vemos las asignaciones directas.

![Recorte de pantalla de la página Licencias en Microsoft Entra ID una vez finalizada la migración.](https://learn.microsoft.com/es-es/training/wwl-sci/create-configure-manage-identities/media/direct-licenses-removed.png)

## Cambio de las asignaciones de licencia de un usuario o grupo en Microsoft Entra ID

En esta sección, se describe cómo trasladar usuarios y grupos entre planes de licencia de servicio en Microsoft Entra ID. El objetivo es asegurarse de que no haya pérdida de servicio o datos durante el cambio de licencia. Los usuarios deberían cambiar entre servicios sin problemas. Los pasos de la asignación del plan de licencia que aparecen en esta sección describen el cambio de un usuario o grupo en Office 365 E1 a Office 365 E3, pero se aplican a todos los planes de licencia. Al actualizar las asignaciones de licencias de un usuario o grupo, las eliminaciones de asignaciones de licencias y las nuevas asignaciones se realizan simultáneamente para que los usuarios no pierdan el acceso a sus servicios durante los cambios de licencia o vean conflictos de licencia entre planes.

Antes de actualizar las asignaciones de licencia, debe comprobar que se cumplen ciertas suposiciones para todos los usuarios o grupos que se van a actualizar. Si no se cumplen las suposiciones para todos los usuarios de un grupo, es posible que algunos no puedan realizar la migración. Como resultado, algunos de los usuarios podrían perder el acceso a los servicios o a los datos. Asegúrese de lo siguiente:

- Los usuarios tienen el plan de licencia actual que se asigna a un grupo y hereda el usuario, y no uno asignado directamente.

- Tiene suficientes licencias disponibles para el plan de licencias que va a asignar. Si no tiene suficientes licencias, es posible que a algunos usuarios no se les asigne el nuevo plan de licencias. Puede comprobar el número de licencias disponibles.

- Confirme siempre que los usuarios no tengan otras licencias de servicio asignadas que puedan entrar en conflicto con la licencia deseada o impedir la eliminación de la licencia actual. Por ejemplo, una licencia de un servicio como Workplace Analytics o Project Online que tiene una dependencia en otros servicios.

- Si administra grupos locales y los sincroniza con Microsoft Entra ID a través de Microsoft Entra Connect, agregue o quite usuarios mediante el sistema local. Los cambios pueden tardar algún tiempo en sincronizarse con Microsoft Entra ID para que se apliquen en las licencias de grupo.

- Si usa pertenencias dinámicas a grupos de Microsoft Entra, se agregan o quitan usuarios cambiando sus atributos, pero el proceso de actualización de las asignaciones de licencias sigue siendo el mismo.

# Cambiar las asignaciones de licencias de usuario

**Necesidades del entorno del ejercicio**: este laboratorio supone que tiene un inquilino básico de Microsoft Entra con al menos derechos de administrador de usuarios para completarlo. Puede obtener una suscripción de evaluación gratuita en [Probar Microsoft Azure de forma gratuita](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_7a2f247d-253d-2c7d-0bb0-a083a6355e75)


## Creación de un nuevo usuario en microsoft Entra ID

1. Vaya al [Centro de administración de Microsoft Entra](https://entra.microsoft.com/).
    
2. En el panel de navegación izquierdo, en **Identidad**, seleccione **Usuarios**.
    
3. En la página Usuarios, en el menú, seleccione **+ Nuevo usuario** y, a continuación, **Crear nuevo usuario**.
    
4. Cree un usuario con esta información:

|**Configuración**|**Valor**|
|---|---|
|Nombre de usuario|DominiqueK|
|Nombre|Dominique Koch|
|Nombre|Dominique|
|Apellido|Koch|
|Contraseña|Crear una contraseña única para el usuario|
|Ubicación de uso|Selección de la ubicación de uso preferida|
5. Cuando haya finalizado, verifique que la cuenta de Dominique Koch se muestra en la lista **Todos los usuarios**.

## Actualización de las asignaciones de licencias de usuario

La asignación de licencias a usuarios individuales se administra a través del Centro de administración de Microsoft 365.

1. Abra el [Centro de administración de Microsoft 365](https://admin.microsoft.com/).
2. Seleccione **Facturación** y, después, **Licencias**.
3. Seleccione una licencia disponible de la lista.
4. Seleccione **Usuarios con licencia** en el menú situado cerca de la parte superior de la página.
5. Seleccione **+ Asignar licencias**.
6. Busque y seleccione **Dominique Koch**, luego seleccione **Asignar** en la parte inferior de la página.
7. Cuando haya finalizado, compruebe que la licencia aparece en el perfil de Dominique Koch en el Centro de administración de Microsoft Entra en **Identidad**>**Usuarios**>, seleccione el usuario y luego >**Licencias**.

# Creación de atributos de seguridad personalizados.

![[Pasted image 20260929085302.png]]

## ¿Qué es un atributo de seguridad personalizado?

Los atributos de seguridad personalizados de Microsoft Entra ID son atributos específicos de la empresa (pares clave-valor) que puede definir y asignar a objetos de Microsoft Entra. Estos atributos se pueden usar para almacenar información, clasificar objetos o aplicar un control de acceso específico sobre recursos específicos de Azure.

### ¿Por qué se utilizan los atributos de seguridad personalizados?

- Amplíe los perfiles de usuario, añada por ejemplo el salario por hora de todos los empleados.
- Asegúrese de que solo los administradores puedan ver el atributo Salario por hora en los perfiles de mis empleados.
- Clasifique cientos o miles de aplicaciones para crear fácilmente un inventario que se pueda filtrar para auditoría.
- Conceda a los usuarios acceso a los blobs de Azure Storage que pertenecen a un proyecto.

### ¿Qué puedo hacer con los atributos de seguridad personalizados?

- Defina información específica del negocio (atributos) para el inquilino.
- Agregue atributos de seguridad personalizados a usuarios de Microsoft Entra y a aplicaciones empresariales (principales de servicio).
- Administre objetos de Microsoft Entra mediante atributos de seguridad personalizados con consultas y filtros.
- Proporcione gobernanza de atributos para que los atributos determinen quién puede obtener acceso.

Los atributos de seguridad personalizados **no** se admiten en reclamaciones de Microsoft Entra Domain Services, reclamaciones de token SAML o JSON Web Token (JWT).

### Características de atributos de seguridad personalizados

- Están disponibles para todo el inquilino
- Incluir una descripción
- Compatibilidad con diferentes tipos de datos: booleano, entero, cadena
- Compatibilidad con un valor único o varios valores
- Compatibilidad con valores de forma libre definidos por el usuario o valores predefinidos
- Asignación de atributos de seguridad personalizados a los usuarios sincronizados de directorio desde un Active Directory local.

# Exploración de la creación automática de usuarios.

![[Pasted image 20260929090101.png]]

### Componentes de SCIM (sistema para administración de identidades entre dominios)

- **Sistema HCM** : aplicaciones y tecnologías que permiten el proceso y las prácticas de gestión de capital humano que admiten y automatizan procesos de RR. HH. a lo largo del ciclo de vida de los empleados.

- **Microsoft Entra Provisioning Service** : usa el protocolo SCIM 2.0 para el aprovisionamiento automático. El servicio se conecta al punto de conexión SCIM de la aplicación y usa el esquema de objetos de usuario de SCIM y las API REST para automatizar el aprovisionamiento y desaprovisionamiento de usuarios y grupos.

- **Microsoft Entra ID** : repositorio de usuarios que se usa para administrar el ciclo de vida de las identidades y sus derechos.

- **Sistema de destino** - Aplicación o sistema que tiene el punto de conexión SCIM y funciona con el aprovisionamiento de Microsoft Entra para habilitar el aprovisionamiento automático de usuarios y grupos.

### ¿Por qué usar SCIM?

**System for Cross-Domain Identity Management (SCIM)** es un protocolo estándar abierto para automatizar el intercambio de información de identidad de usuario entre dominios de identidad y sistemas de TI. SCIM garantiza que los empleados agregados al sistema de Administrador de conexiones híbridas (HCM) tengan cuentas creadas automáticamente en Microsoft Entra ID o en Windows Server Active Directory. Los atributos y perfiles de usuario se sincronizan entre los dos sistemas, la actualización o la eliminación de usuarios en función del estado de usuario o el cambio de rol.

La clave es mantener actualizados los sistemas de identidad. Si un usuario se puede desaprovisionar automáticamente de Microsoft Entra ID tan pronto como se quite de los sistemas de RR. HH., tendrá menos preocupación sobre una posible infracción.

### Aprovisionamiento de entrada controlado por API

No todos los sistemas de RR. HH. exponen un punto de conexión SCIM. En estos escenarios, microsoft Entra ID admite el **aprovisionamiento entrante controlado por API**, que alcanzó la disponibilidad general en marzo de 2024. En lugar de requerir que el sistema de origen inserte datos a través de SCIM, cualquier herramienta de automatización o script puede recuperar datos de recursos de cualquier sistema de registro y enviarlos a la API de aprovisionamiento de Microsoft Entra. Entre los orígenes autoritativos admitidos se incluyen **Workday, SAP SuccessFactors** y cualquier sistema de RR. HH. personalizado integrado a través de la API. Este enfoque ofrece a las organizaciones flexibilidad para automatizar la administración del ciclo de vida de las identidades, independientemente de las funcionalidades de integración nativas de su plataforma de RR. HH.


## Recursos

Use estos recursos para encontrar más información:

- [Inicio rápido: Creación y asignación de una cuenta de usuario](https://learn.microsoft.com/es-es/entra/identity/enterprise-apps/add-application-portal-assign-users)
    
- [Creación masiva de usuarios en Microsoft Entra ID](https://learn.microsoft.com/es-es/entra/identity/users/users-bulk-add)
    
- [Creación de un grupo básico y adición de miembros mediante el identificador de Entra de Microsoft](https://learn.microsoft.com/es-es/entra/fundamentals/how-to-manage-groups)
    
- [Crear o actualizar un grupo de pertenencia dinámica en Microsoft Entra ID](https://learn.microsoft.com/es-es/entra/identity/users/groups-create-rule)
    
- [¿Qué es Microsoft Entra Cloud Sync?](https://learn.microsoft.com/es-es/entra/identity/hybrid/cloud-sync/what-is-cloud-sync)
    
- [Administración de solicitudes de licencia](https://learn.microsoft.com/es-es/microsoft-365/commerce/licenses/manage-license-requests)
    
- [Asignación de licencias a usuarios: Centro de administración de Microsoft 365](https://learn.microsoft.com/es-es/microsoft-365/admin/manage/assign-licenses-to-users)
    
- [Planear la implementación de dispositivos de Microsoft Entra](https://learn.microsoft.com/es-es/entra/identity/devices/plan-device-deployment)
    
- [Conceptos de aprovisionamiento de entrada controlados por API](https://learn.microsoft.com/es-es/entra/identity/app-provisioning/inbound-provisioning-api-concepts)
