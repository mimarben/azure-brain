---
title: AZ-900 — Gobernanza y cumplimiento en Azure
aliases: ["Gobernanza y cumplimiento en Azure (AZ-900)"]
tags: [fundamentals, governance]
certification: [AZ-900]
updated: 2026-08-17
sources:
  - https://learn.microsoft.com/es-es/training/modules/describe-features-tools-azure-for-governance-compliance/
---

# AZ-900 — Gobernanza y cumplimiento en Azure

Módulo 10 del [AZ-900T00](https://learn.microsoft.com/es-es/training/courses/az-900t00) · Ruta 3 · Área: Descripción de la administración y la gobernanza de Azure (30–35%).

## Concepto

Azure Policy (iniciativas, efectos), bloqueos de recursos ( ReadOnly / CanNotDelete ) y Microsoft Purview para gobernanza y cumplimiento de datos.

## Resumen en mis palabras

> *En este módulo se presentan las herramientas que pueden ayudar con la gobernanza y el cumplimiento dentro de Azure.*
>
> Descripción del propósito de Microsoft Purview
> Describir el propósito de Azure Policy
> Describir el propósito de bloqueos de recursos
> Descripción de las ventajas del portal de confianza de servicios

## Por qué importa para el examen

> Describir el propósito de Microsoft Purview.
> Describir el propósito de Azure Policy.
> Describir el propósito de los bloqueos de recursos.
> Describir el propósito del portal de confianza del servicio.
> Explicar los límites de protección de gobernanza para los flujos de trabajo administrativos asistidos por IA.

## Enlaces relacionados

**Módulo de Learn**: [Descripción de las características y herramientas de Azure para la gobernanza y el cumplimiento](https://learn.microsoft.com/es-es/training/modules/describe-features-tools-azure-for-governance-compliance/)

**AZ-900 Full Course de Savill** (vídeo por tema, @duración):
- [Functionality and Usage of Azure Policy — 10:50](https://youtu.be/z7WMqHE3R8g)
- [Functionality and Usage of Resource Locks — 06:16](https://youtu.be/eF_KilJRxbE)
- [Purpose of Microsoft Purview — 10:47](https://youtu.be/mXjXcBr1ajY)
- [Governance Hierarchy Constructs — 06:13](https://youtu.be/ge8r_Z0LKxM)

**Páginas de `knowledge/`**: [[Componentes arquitectónicos de Azure (AZ-900)]] (la jerarquía que gobiernan estas herramientas)

**Proyecto guiado**: [Organización y protección de recursos con etiquetas y bloqueos](https://learn.microsoft.com/es-es/training/modules/guided-project-organize-resources-tags-locks/)

## Relacionado

- [Índice AZ-900](../certifications/AZ-900/INDEX.md)
- Laboratorio: [organización y protección con etiquetas y bloqueos](../labs/AZ-900/etiquetas-bloqueos/etiquetas-bloqueos.md)

## Descripción del propósito de Microsoft Purview.

Microsoft Purview es una familia de soluciones de gobernanza, riesgo y cumplimiento de datos que le ayudan a obtener una sola visión unificada de los datos. Microsoft Purview reúne información sobre los datos locales, multinube y software como servicio.

![Purview Funnel Streams](../../assets/images/AZ-900/purview-funnel-streams.png)

## Descripción del propósito de Azure Policy.

¿Cómo se asegura de que los recursos se mantengan conformes? ¿Puede recibir un aviso cuando la configuración de un recurso cambie?

Azure Policy es un servicio de Azure que permite crear, asignar y administrar directivas que controlan o auditan los recursos. Estas directivas aplican reglas diferentes en las configuraciones de recursos para que esas configuraciones sean compatibles con los estándares.

![Azure Policy Initiative Hierarchy](../../assets/images/AZ-900/azure-policy-initiative-hierarchy.png)

En esta iniciativa se incluyen las siguientes definiciones de directiva:

Supervisar base de datos SQL sin cifrar en el Centro de Seguridad Esta directiva supervisa bases de datos y servidores SQL sin cifrar.
Supervisión de los puntos vulnerables del sistema operativo en Security Center: esta directiva supervisa los servidores que no cumplen la línea base de la vulnerabilidad del sistema operativo configurada.
Supervisión de la falta de Endpoint Protection en Security Center Esta directiva supervisa los servidores que no tienen instalado un agente de Endpoint Protection.


## Descripción del propósito de bloqueos de recursos.
Los bloqueos de recursos impiden que se eliminen o modifiquen recursos por error.

![Resource Tag Use Cases](../../assets/images/AZ-900/resource-tag-use-cases.png)

Hay dos tipos de bloqueos de recursos, uno que impide que los usuarios eliminen un recurso y otro que impide que los usuarios lo cambien o eliminen.

- Eliminar significa que los usuarios autorizados pueden leer y modificar un recurso, pero no eliminarlo.
- ReadOnly significa que los usuarios autorizados solo pueden leer recursos, pero no actualizarlos ni eliminarlos. Aplicar este bloqueo es similar a restringir todos los usuarios autorizados a los permisos concedidos por el rol Lector.

![Resource Lock](../../assets/images/AZ-900/resource-lock.png)

## Descripción de las ventajas del portal de confianza de servicios.

El Portal de confianza de servicios de Microsoft es un portal que proporciona contenido, herramientas y otros recursos sobre las prácticas de seguridad, privacidad y cumplimiento de Microsoft.

El Portal de confianza de servicios contiene detalles sobre la implementación de controles y procesos de Microsoft que protegen nuestros servicios en la nube y los datos de los clientes. Para acceder a algunos de los recursos en el Portal de confianza de servicios, debe iniciar sesión como usuario autenticado con su cuenta de servicios en la nube de Microsoft (Cuenta profesional o educativa de Microsoft Entra). Deberá revisar y aceptar el acuerdo de no divulgación de Microsoft para acceder a los materiales de cumplimiento.

[Portal de confianza de servicios de Microsoft](https://servicetrust.microsoft.com/)


![Service Trust Portal](../../assets/images/AZ-900/service-trust-portal.png)