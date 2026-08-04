---
title: Understand Microsoft Entra ID
aliases: [Understand Microsoft Entra ID, Understand Azure Active Directory]
tags: [certific ation, study-note, identity]
certification: [AZ-104]
updated: 2026-08-03
sources:
  - https://learn.microsoft.com/en-us/training/modules/understand-azure-active-directory/
---

# Understand Microsoft Entra ID

Nota de estudio para el módulo de Microsoft Learn **Understand Microsoft Entra ID** dentro de AZ-104.

Usa esta página para apuntes crudos del módulo, dudas, capturas mentales del portal y cosas que quieras recordar para el examen. Cuando una idea quede clara y sea conocimiento reutilizable, consolídala en [[Entra ID]] en vez de duplicarla aquí.

## Progreso

- [x] 1. Introduction
- [X] 2. Examine Microsoft Entra ID
- [ ] 3. Compare Microsoft Entra ID and Active Directory Domain Services
- [ ] 4. Examine Microsoft Entra ID as a directory service for cloud apps
- [ ] 5. Compare Microsoft Entra ID P1 and P2 plans
- [ ] 6. Examine Microsoft Entra Domain Services
- [ ] Knowledge check

## 1. Introducción.

¡Le damos la bienvenida al módulo de aprendizaje de Microsoft Entra ID! Microsoft Entra ID es el servicio de administración de identidad y acceso basado en la nube proporcionado por Microsoft. Microsoft Entra ID es una solución completa para administrar identidades, aplicar directivas de acceso y proteger las aplicaciones y los datos en la nube y en el entorno local.

Este módulo tiene como objetivo equiparle con un conocimiento completo de lo siguiente:

Descripción de Microsoft Entra ID.
Comparación de Microsoft Entra ID con Active Directory Domain Services (AD DS).
Describir cómo se usa Microsoft Entra ID como directorio para aplicaciones en la nube.
Describe Microsoft Entra ID P1 y P2.
Describir Microsoft Entra Domain Services.
Tanto si es un principiante como un profesional de TI experimentado, este módulo le proporciona los conocimientos y aptitudes necesarios para comprender Microsoft Entra ID de forma eficaz. Así que, ¡vamos a explorar el mundo emocionante de Microsoft Entra ID!


## 2. Examine Microsoft Entra ID.

Los alumnos deben estar familiarizados con Active Directory Domain Services (AD DS o simplemente "Active Directory"). AD DS es un servicio de directorio que proporciona los métodos para almacenar datos de directorio, como cuentas de usuario y contraseñas, y hace que estos datos estén disponibles para usuarios de red, administradores y otros dispositivos y servicios. Se ejecuta como un servicio en Windows Server denominado controlador de dominio.

## 3. Comparación de Microsoft Entra ID y Active Directory Domain Services.

Al comparar AD DS con Microsoft Entra ID, es importante tener en cuenta las siguientes características de AD DS:

* AD DS es un verdadero servicio de directorio, con una estructura jerárquica basada en X.500.
* AD DS usa el Sistema de nombres de dominio (DNS) para buscar recursos, como controladores de dominio.
* Puede consultar y administrar AD DS mediante llamadas al Protocolo ligero de acceso a directorios (LDAP).
* AD DS usa principalmente el protocolo Kerberos para la autenticación.
* AD DS usa unidades organizativas y objetos de directiva de grupo para la administración.
* AD DS incluye objetos de equipo que representan equipos que se unen a un dominio de Active Directory.
* AD DS usa confianzas entre dominios para la administración delegada.

### Características de Microsoft Entra ID
Aunque Microsoft Entra ID tiene muchas semejanzas con AD DS, también hay muchas diferencias. Es importante tener en cuenta que usar Microsoft Entra no es lo mismo que implementar un controlador de dominio de Active Directory en una máquina virtual de Azure y agregarlo a su dominio local.

Al comparar Microsoft Entra ID con AD DS, es importante tener en cuenta las siguientes características de Microsoft Entra ID:

* Microsoft Entra ID es principalmente una solución de identidad y está diseñado para aplicaciones basadas en Internet mediante el uso de las comunicaciones HTTP (puerto 80) y HTTPS (puerto 443).

* Microsoft Entra ID es un servicio de directorio multiinquilino.

* Los usuarios y grupos de Microsoft Entra se crean en una estructura plana y no hay unidades organizativas ni GPO.

* No se puede consultar Microsoft Entra ID mediante LDAP; en su lugar, Microsoft Entra ID usa la API de REST a través de HTTP y HTTPS.

* Microsoft Entra ID no usa la autenticación de Kerberos, en su lugar, usa los protocolos HTTP y HTTPS, como SAML, WS-Federation y OpenID Connect, para la autenticación y OAuth para la autorización.

* Microsoft Entra ID incluye servicios de federación, y muchos servicios de terceros, como Facebook, se federan con Microsoft Entra ID y confían en este servicio.




### Ideas clave

- 

### Dudas

- 

### Para comprobar en Azure Portal

- 

### Posibles preguntas de examen

- 

## Notas propias

- 

## Para consolidar en `knowledge/`

- [ ] Completar [[Entra ID]] con definición, casos de uso y relación con AD DS.
- [ ] Añadir comparación Entra ID vs Active Directory Domain Services.
- [ ] Añadir diferencias relevantes entre Microsoft Entra ID Free, P1 y P2.
- [ ] Añadir Microsoft Entra Domain Services como concepto relacionado si merece página propia.

## Relacionado

- [[Entra ID]]
- [[Azure RBAC]]
- [[Managed Identities]]
- [Roadmap AZ-104](roadmap.md)