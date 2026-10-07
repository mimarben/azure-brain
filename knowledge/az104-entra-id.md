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

Módulo 03 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Comparación de Microsoft Entra ID con Active Directory DS, ediciones P1/P2 y exploración de Microsoft Entra Domain Services para administrar aplicaciones y dispositivos unidos a dominio en la nube.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Base de todo el área de identidad: administración de usuarios y grupos de Microsoft Entra
> - Distinguir Entra ID vs ADDS (pregunta clásica) y qué ediciones traen cada característica (SSPR, acceso condicional, PIM)

## Enlaces relacionados

**Módulo de Learn**: [Entender Microsoft Entra ID](https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/) ([ES](https://learn.microsoft.com/es-es/training/modules/understand-azure-active-directory/))

**Savill**: buscar "Entra ID" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Entra ID]] · [[Identidad, acceso y seguridad en Azure (AZ-900)]]

**Laboratorio**: Lab 01 (Entra ID) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Entra ID]]


# Examine Microsoft Entra ID.

Los alumnos deben estar familiarizados con Active Directory Domain Services (AD DS o simplemente "Active Directory"). AD DS es un servicio de directorio que proporciona los métodos para almacenar datos de directorio, como cuentas de usuario y contraseñas, y hace que estos datos estén disponibles para usuarios de red, administradores y otros dispositivos y servicios. Se ejecuta como un servicio en Windows Server denominado controlador de dominio.

Microsoft Entra ID forma parte de la oferta de plataforma como servicio (PaaS) y funciona como un servicio de directorio administrado por Microsoft en la nube. No forma parte de la infraestructura básica que los clientes poseen y administran, ni tampoco es una oferta de infraestructura como servicio. Aunque esto implica que se tiene menos control sobre su implementación, también significa que no se tienen que dedicar recursos a su implementación o mantenimiento.

Gracias a Microsoft Entra ID, también tiene acceso a un conjunto de características que no están disponibles de forma nativa en AD DS, como la compatibilidad con la autenticación multifactor, la protección de identidades y el autoservicio de restablecimiento de contraseña.

Puede usar Microsoft Entra ID con el fin de proporcionar un acceso más seguro a los recursos basados en la nube para organizaciones y usuarios mediante lo siguiente:

- Configuración del acceso a las aplicaciones
- Configuración del inicio de sesión único (SSO) en aplicaciones SaaS basadas en la nube
- Administración de usuarios y grupos
- Aprovisionamiento de usuarios
- Habilitación de la federación entre organizaciones
- Suministro de una solución de administración de identidades
- Identificación de la actividad de inicio de sesión irregular
- Configuración de la autenticación multifactor
- Ampliación de las implementaciones locales de Active Directory existentes a Microsoft Entra ID
- Configuración de Application Proxy para aplicaciones locales y en la nube
- Configuración del acceso condicional para usuarios y dispositivos

![[azure-active-directory-connect-stack-f1aae359.png]]

### Inquilinos de Microsoft Entra

A diferencia de AD DS, Microsoft Entra ID es multiinquilino por diseño y se implementa de forma específica para garantizar el aislamiento entre sus instancias de directorio individuales. Es el directorio multiinquilino más grande del mundo: hospeda más de un millón de instancias de servicios de directorio, con miles de millones de solicitudes de autenticación por semana. En este contexto, el término inquilino normalmente representa una empresa u organización que se ha registrado para una suscripción a un servicio de Microsoft basado en la nube, como Microsoft 365, Intune o Azure, cada uno de los cuales usa Microsoft Entra ID. En cambio, desde un punto de vista técnico, el término "inquilino" representa una instancia individual de Microsoft Entra. En una suscripción de Azure, se pueden crear varios inquilinos de Microsoft Entra. Tener varios inquilinos de Microsoft Entra puede ser conveniente si desea probar la funcionalidad de Microsoft Entra en un inquilino sin afectar a los demás.


# Comparación de Microsoft Entra ID y Active Directory Domain Services

Puede considerar Microsoft Entra ID simplemente como el homólogo basado en la nube de AD DS. Sin embargo, aunque Microsoft Entra ID y AD DS comparten algunas características comunes, hay varias diferencias significativas entre estos servicios.

### Características de AD DS

AD DS es la implementación tradicional de Active Directory basado en Windows Server en un servidor físico o virtual. Aunque AD DS se considera principalmente un servicio de directorio, tan solo es un componente del conjunto de tecnologías de Windows Active Directory, que también incluye Servicios de certificados de Active Directory (AD CS), Active Directory Lightweight Directory Services (AD LDS), Servicios de federación de Active Directory (AD FS) y Active Directory Rights Management Services (AD RMS).

Al comparar AD DS con Microsoft Entra ID, es importante tener en cuenta las siguientes características de AD DS:

- AD DS es un verdadero servicio de directorio, con una estructura jerárquica basada en X.500.
- AD DS usa el Sistema de nombres de dominio (DNS) para buscar recursos, como controladores de dominio.
- Puede consultar y administrar AD DS mediante llamadas al Protocolo ligero de acceso a directorios (LDAP).
- AD DS usa principalmente el protocolo Kerberos para la autenticación.
- AD DS usa unidades organizativas y objetos de directiva de grupo para la administración.
- AD DS incluye objetos de equipo que representan equipos que se unen a un dominio de Active Directory.
- AD DS usa confianzas entre dominios para la administración delegada.



> [!NOTE] Nota:
> La implementación de AD DS en una máquina virtual de Azure requiere uno o varios discos de datos adicionales de Azure, ya que no debe usar la unidad C para el almacenamiento de AD DS. Estos discos son necesarios para almacenar la base de datos, los registros y la carpeta sysvol de AD DS. La configuración de Preferencia de caché de host para estos discos debe establecerse en Ninguna.

### Características de Microsoft Entra ID

Aunque Microsoft Entra ID tiene muchas semejanzas con AD DS, también hay muchas diferencias. Es importante tener en cuenta que usar Microsoft Entra no es lo mismo que implementar un controlador de dominio de Active Directory en una máquina virtual de Azure y agregarlo a su dominio local.

Al comparar Microsoft Entra ID con AD DS, es importante tener en cuenta las siguientes características de Microsoft Entra ID:

- Microsoft Entra ID es principalmente una solución de identidad y está diseñado para aplicaciones basadas en Internet mediante el uso de las comunicaciones HTTP (puerto 80) y HTTPS (puerto 443).
- Microsoft Entra ID es un servicio de directorio multiinquilino.
- Los usuarios y grupos de Microsoft Entra se crean en una estructura plana y no hay unidades organizativas ni GPO.
- No se puede consultar Microsoft Entra ID mediante LDAP; en su lugar, Microsoft Entra ID usa la API de REST a través de HTTP y HTTPS.
- Microsoft Entra ID no usa la autenticación de Kerberos, en su lugar, usa los protocolos HTTP y HTTPS, como SAML, WS-Federation y OpenID Connect, para la autenticación y OAuth para la autorización.
- Microsoft Entra ID incluye servicios de federación, y muchos servicios de terceros, como Facebook, se federan con Microsoft Entra ID y confían en este servicio.

# Comparación de los planes P1 y P2 de Microsoft Entra ID.

El nivel P1 o P2 de Microsoft Entra ID proporciona funcionalidad adicional en comparación con las ediciones Gratis y Office 365. Sin embargo, las versiones prémium conllevan un costo adicional por aprovisionamiento de usuarios. Microsoft Entra ID P1 o P2 viene en dos versiones P1 y P2. Puede adquirirla como una licencia adicional o como parte de Microsoft Enterprise Mobility + Security, que también incluye la licencia para Azure Information Protection e Intune.

Microsoft proporciona un período de evaluación gratuita que se puede usar para probar todas las funcionalidades de Microsoft Entra ID edición P2. Las siguientes características están disponibles con la edición P1 de Microsoft Entra ID:

- **Administración de grupos de autoservicio**. Simplifica la administración de grupos al otorgar permisos a los usuarios para crear y administrar grupos. Los usuarios finales pueden crear solicitudes para unirse a otros grupos y los propietarios de los grupos pueden aprobarlas y mantener la pertenencia a sus grupos.
- **Informes y alertas de seguridad avanzados**. Puede supervisar y proteger el acceso a sus aplicaciones en la nube visualizando registros detallados que muestran informes avanzados de anomalías y patrones de acceso incoherentes. Los informes avanzados se basan en aprendizaje automático y pueden ayudarle a obtener una nueva percepción para mejorar la seguridad de acceso y responder a amenazas potenciales.
- **Autenticación multifactor**. La autenticación multifactor (MFA) completa funciona con aplicaciones locales (mediante una red privada virtual [VPN], RADIUS y otras), Azure, Microsoft 365, Dynamics 365 y aplicaciones de terceros de la galería de Microsoft Entra. No funciona con aplicaciones comerciales que no son de explorador, como Microsoft Outlook. La autenticación multifactor completa se trata con más detalle en las siguientes unidades de esta lección.
- **Licencias de Microsoft Identity Manager (MIM)**. MIM se integra con Microsoft Entra ID P1 o P2 para proporcionar soluciones de identidad híbrida. MIM puede enlazar varios almacenes de autenticación locales, como AD DS, LDAP, Oracle y otras aplicaciones con Microsoft Entra ID. Esto proporciona experiencias coherentes para aplicaciones de línea de negocio (LOB) locales y soluciones SaaS.
- **Acuerdo de Nivel de Servicio de Enterprise del 99,9 %.** Se garantiza al menos una disponibilidad del 99,9 % del servicio Microsoft Entra ID P1 o P2. El mismo Acuerdo de Nivel de Servicio se aplica a Microsoft Entra Basic.
- **Restablecimiento de contraseña con escritura diferida**. El autoservicio de restablecimiento de contraseña se rige por la directiva de contraseñas local de Active Directory.
- **Característica Cloud App Discovery de Microsoft Entra ID**. Esta característica detecta las aplicaciones basadas en la nube más usadas.
- **Acceso condicional basado en el dispositivo, el grupo o la ubicación**. Esto le permite configurar el acceso condicional para los recursos más importantes en función de varios criterios.
- **Microsoft Entra Connect Health**. Puede usar esta herramienta para obtener información operativa sobre Microsoft Entra ID. Funciona con alertas, contadores de rendimiento, patrones de uso y opciones de configuración, y presenta la información recopilada en el portal de Microsoft Entra Connect Health.

Además de estas características, la licencia de Microsoft Entra ID P2 proporciona funcionalidades adicionales:

- **Protección de Microsoft Entra ID**. Esta característica ofrece funcionalidades mejoradas de supervisión y protección de las cuentas de usuario. Puede definir directivas de riesgo de usuario y de inicio de sesión. También puede revisar el comportamiento de los usuarios y marcar a los usuarios como de riesgo.
- **Microsoft Entra Privileged Identity Management**. Esta funcionalidad le permite configurar niveles de seguridad adicionales para usuarios con privilegios, como los administradores. Con Privileged Identity Management, puede definir administradores permanentes y temporales. También puede definir el flujo de trabajo de una directiva que se activa cada vez que alguien quiere usar privilegios administrativos para realizar alguna tarea.

> [!NOTE] NOTA
> Los planes cambian con frecuencia. Consulte el sitio web de Microsoft para conocer los planes y las funcionalidades actuales.a Domain Services.


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

![[2026-10-06_07h39_04.png]]


![[2026-10-06_07h41_10.png]]


![[2026-10-06_07h43_44.png]]

![[Pasted image 20261006074734.png]]