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

> *En este módulo, se le mostrarán los componentes arquitectónicos principales de Azure. Obtendrá información sobre el diseño físico de Azure: centros de datos, zonas de disponibilidad y regiones; y obtendrá información sobre la estructura de administración de Azure: recursos y grupos de recursos, suscripciones y grupos de administración.*

## Por qué importa para el examen

> *Después de completar este módulo, podrá:
> - Describir las regiones de Azure, los pares de regiones y las regiones soberanas.
> - Describir Zonas de Disponibilidad.
> - Describir los centros de datos de Azure.
> - Describir los recursos de Azure y los grupos de recursos.
> - Describir las suscripciones.
> - Describir los grupos de administración.
> - Describir la jerarquía de grupos de recursos, suscripciones y grupos de administración.*

## Enlaces relacionados

**Módulo de Learn**: [Describir los componentes arquitectónicos principales de Azure](https://learn.microsoft.com/en-us/training/modules/describe-core-architectural-components-of-azure/)

**AZ-900 Full Course de Savill** (vídeo por tema, @duración):
- [Benefits and Usage of Regions and Region Pairs — 13:08](https://youtu.be/4RjPOAN54AE)
- [Benefits and Usage of Availability Zones — 08:41](https://youtu.be/h0enGb17lnw)
- [Benefits and Usage of Resource Groups — 09:38](https://youtu.be/g6thrYZhPZY)
- [Benefits and Usage of Subscriptions — 08:19](https://youtu.be/9vKAYW_WkLo)
- [Benefits and Usage of Management Groups — 06:30](https://youtu.be/bPdDiEtCVhM)

**Páginas de `knowledge/`**: [[Gobernanza y cumplimiento (AZ-900)]] (jerarquía aplicada a gobernanza)

## Relacionado

- [Índice AZ-900](../certifications/AZ-900/INDEX.md)
# ¿Qué es Microsoft Azure?.

Azure es un conjunto de servicios en la nube que le ayudan a satisfacer los desafíos actuales y futuros de TI. Azure le ofrece la libertad de crear, administrar e implementar aplicaciones en una red global masiva mediante sus herramientas y marcos favoritos.

## ¿Qué ofrece Azure?

**Innovación ilimitada.** Cree aplicaciones inteligentes y soluciones con tecnología, herramientas y servicios avanzados para llevar sus operaciones al siguiente nivel. Unifique sin problemas su tecnología para simplificar la administración de plataformas y ofrecer innovaciones de forma eficaz y segura en una nube de confianza.

- **Traer ideas a la vida:** Cree una plataforma de confianza para avanzar las capacidades de su equipo con la inteligencia artificial y los servicios en la nube líderes del sector.
- **Unifique sin problemas:** Administre de forma eficaz toda la infraestructura, los datos, los análisis y las soluciones de inteligencia artificial en una plataforma integrada.
- **Innovación en la confianza:** Confíe en la tecnología de confianza de un asociado dedicado a la seguridad y la responsabilidad.

## ¿Qué puedo hacer con Azure?

Azure proporciona cientos de servicios que le permiten hacer todo, desde la ejecución de las aplicaciones existentes en máquinas virtuales hasta la exploración de nuevos paradigmas de software, como bots inteligentes y inteligencia artificial generativa.

![[azure-service-categories.png]]


Muchos equipos comienzan a explorar la nube moviendo sus aplicaciones existentes a máquinas virtuales (VM) que se ejecutan en Azure. Migrar las aplicaciones existentes a máquinas virtuales es un buen inicio, pero la nube es mucho más que un lugar diferente para ejecutar las máquinas virtuales.

A medida que aumentan las aptitudes, puede modernizar una carga de trabajo a la vez, como pasar de servidores administrados manualmente a bases de datos administradas, escalado automático de aplicaciones web o servicios controlados por eventos.

# Introducción a las cuentas de Azure

Para crear y usar los servicios de Azure, necesita una suscripción de Azure. Cuando trabaja con sus propias aplicaciones y cargas de trabajo, crea una cuenta de Azure y se le crea una suscripción. Después de crear una cuenta de Azure, puedes crear suscripciones adicionales. Por ejemplo, el equipo podría usar una sola cuenta de Azure y suscripciones independientes para cargas de trabajo de desarrollo, pruebas y producción. Una vez que has creado una suscripción de Azure, puedes empezar a crear recursos de Azure dentro de cada suscripción.

![Niveles de alcance de cuenta de Azure](../../assets/images/AZ-900/account-scope-levels.png)

Si no estás familiarizado con Azure, puedes registrarse para obtener una cuenta gratuita en el sitio web de Azure y, de este modo, empezar a explorar sin coste alguno. Cuando estés listo, puedes optar por actualizar la cuenta gratuita. También puedes crear una suscripción que te permita comenzar a pagar por los servicios de Azure que necesitas y a los que no puedes acceder con una cuenta gratuita.


# Descripción de la infraestructura física de Azure

Los componentes principales de la arquitectura de Azure se pueden dividir en dos agrupaciones principales: la infraestructura física y la infraestructura de administración. En esta unidad se describe el lado físico, cómo Azure organiza sus centros de datos, regiones y zonas de disponibilidad para ofrecer servicios confiables en todo el mundo.

## Infraestructura física

La infraestructura física de Azure comienza con los centros de datos. Estos centros de datos son instalaciones con servidores organizados en bastidores, con energía dedicada, refrigeración e infraestructura de red, similar a un centro de datos local, pero a una escala mucho mayor.

Como proveedor de nube global, Azure tiene centros de datos en todo el mundo. Sin embargo, no interactúa directamente con centros de datos individuales. En su lugar, los centros de datos se agrupan en regiones de Azure y zonas de disponibilidad de Azure que proporcionan resistencia y confiabilidad para las cargas de trabajo.

El sitio [de infraestructura global](https://infrastructuremap.microsoft.com/) le ofrece la oportunidad de explorar interactivamente la infraestructura subyacente de Azure.

![[azure-infrastructure-hierarchy.png]]
### Regiones

Una región es un área geográfica del planeta que contiene al menos un centro de datos, aunque podrían ser varios cercanos y conectados mediante una red de baja latencia. Azure asigna y controla los recursos de forma inteligente dentro de cada región para garantizar que las cargas de trabajo están bien compensadas.

Al implementar un recurso en Azure, es habitual tener que elegir la región en la que quiere que se implemente el recurso

> [!NOTE] Regions
> Algunos servicios o características de las máquinas virtuales (VM) solo están disponibles en determinadas regiones, como, por ejemplo, tipos de almacenamiento o tamaños de VM específicos. También hay algunos servicios globales de Azure que no requieren que seleccione una región concreta, como Microsoft Entra ID, Azure Traffic Manager o Azure DNS.

### Zonas de disponibilidad

Las zonas de disponibilidad son centros de datos separados físicamente dentro de una región de Azure. Cada zona de disponibilidad consta de uno o varios centros de datos equipados con alimentación, refrigeración y redes independientes. Una zona de disponibilidad se configura para constituir un límite de aislamiento. Si una zona deja de funcionar, la otra continúa trabajando. Las zonas de disponibilidad están conectadas a través de redes de fibra óptica de alta velocidad privadas.


![[assets/images/AZ-104/availability-zones.png]]


> [!NOTE] Importante
>Para garantizar la resistencia, se configuran un mínimo de tres zonas de disponibilidad independientes en todas las regiones habilitadas. Pero no todas las regiones de Azure admiten actualmente las zonas de disponibilidad.

#### Uso de zonas de disponibilidad para las cargas de trabajo

Al ejecutar su propia infraestructura local, configurar la redundancia significa comprar y mantener hardware duplicado. Con Azure, puede proteger las cargas de trabajo extendiéndolos entre zonas de disponibilidad dentro de una región.

Coloque las máquinas virtuales, el almacenamiento, las bases de datos y otros recursos en una zona de disponibilidad y las replique en otras zonas dentro de la misma región. Tenga en cuenta que podría haber un costo para duplicar los servicios y transferir datos entre zonas.

Los servicios de Azure que admiten zonas de disponibilidad se dividen en tres categorías:

- Servicios de zona: ancle el recurso a una zona específica (por ejemplo, máquinas virtuales, discos administrados, direcciones IP).
- Servicios de redundancia de zona: la plataforma se replica automáticamente entre zonas (por ejemplo, almacenamiento con redundancia de zona, SQL Database).
- Servicios no regionales: los servicios siempre están disponibles en las ubicaciones geográficas de Azure y son resistentes a las interrupciones de toda la zona, así como a las de toda la región.

![[Pasted image 20260929101648.png]]


### Pares de región

La mayoría de las regiones de Azure se emparejan con otra región de la misma zona geográfica (por ejemplo, EE. UU., Europa o Asia) que se encuentre como mínimo a 500 km de distancia. Este enfoque permite la replicación de recursos en una zona geográfica que ayuda a reducir la probabilidad de que se produzcan interrupciones provocadas por eventos como desastres naturales, disturbios sociales, cortes del suministro eléctrico o interrupciones de la red física que afecten a una región completa. Por ejemplo, si una región de una pareja se ve afectada por un desastre natural, los servicios pasarán automáticamente a la otra región de su pareja de regiones.

> [!NOTE] Imporante
> No todos los servicios de Azure replican automáticamente los datos ni pueden automáticamente transferirse de una región con problemas a otra región habilitada para la replicación cruzada. En estos escenarios, el cliente debe configurar la replicación y la recuperación.

Algunos ejemplos de pares de regiones en Azure son Oeste de EE. UU. emparejados con Este de EE. UU. y Sudeste asiático emparejados con Este de Asia. Dado que las dos regiones están conectadas directamente y lo suficientemente lejos como para aislarlo de desastres regionales, puede usar ambas para proporcionar servicios fiables y redundancia de datos.

![[assets/images/AZ-104/region-pairs.png]]
#### Ventajas adicionales de los pares de región:

- Si se produce una gran interrupción de Azure, se da prioridad a una región de cada par para asegurarse de que al menos una se restaure lo más rápido posible para las aplicaciones hospedadas en ese par de regiones.
- Las actualizaciones planeadas de Azure se implementan una a una en regiones emparejadas para minimizar el tiempo de inactividad y el riesgo de interrupción de la aplicación.
- Los datos continúan residiendo dentro de la misma geografía que su par (excepto Brasil Sur) con fines de residencia de datos y cumplimiento.


> [!NOTE] Importante
> La mayoría de las regiones están emparejadas en dos direcciones, lo que significa que actúan como respaldo para la región que a su vez les proporciona respaldo (Oeste de EE. UU. y Este de EE. UU. se respaldan mutuamente). Sin embargo, algunas regiones, como Brasil Sur, están emparejadas en una sola dirección. En un emparejamiento unidireccional, la región primaria no proporciona copia de seguridad para su región secundaria. Sur de Brasil es un caso único porque se empareja con una región fuera de su ubicación geográfica. La región secundaria de Sur de Brasil es Centro-sur de EE. UU. La región secundaria de Centro-sur de EE. UU. no es Sur de Brasil. Además, algunas regiones (como Norte de Italia, Centro de Polonia y Centro de Israel) no tienen un par de regiones tradicional y, en su lugar, dependen de zonas de disponibilidad y almacenamiento con redundancia geográfica para lograr resistencia.


### Regiones soberanas

Además de las regiones normales, Azure también tiene regiones soberanas. Las regiones soberanas son instancias de Azure que están aisladas de la instancia principal de Azure. Es posible que tenga que usar una región soberana con fines legales o de cumplimiento.

Entre las regiones soberanas de Azure se incluyen las siguientes:

- Us DoD Central, US Gov Virginia, US Gov Arizona, etc. Estas regiones son instancias físicas y lógicas aisladas de red de Azure para agencias y asociados gubernamentales de EE. UU. Estos centros de datos están operados por personal estadounidense sometido a evaluación e incluyen certificaciones de cumplimiento adicionales.
- Este de China, Norte de China y más: Estas regiones están disponibles gracias a una asociación exclusiva entre Microsoft y 21Vianet, por la cual Microsoft no mantiene directamente los centros de datos.

# Descripción de la infraestructura de administración de Azure

La infraestructura de administración incluye recursos de Azure y grupos de recursos, suscripciones y cuentas. Comprender esta jerarquía le ayuda a organizar los recursos, controlar quién puede acceder a lo que y administrar los costos a medida que crece el uso de Azure.

## Recursos y grupos de recursos de Azure

Un recurso es el bloque de construcción básico de Azure. Todo lo que cree, aprovisione o implemente es un recurso. Las máquinas virtuales, las redes virtuales, las bases de datos y los servicios de Azure AI son ejemplos de recursos.

![[resource-group-rules.png]]

Los grupos de recursos son agrupaciones de recursos. Cada recurso debe pertenecer exactamente a un grupo de recursos. Puede mover algunos recursos entre grupos, pero un recurso solo está asociado a un grupo a la vez. Los grupos de recursos no se pueden anidar y no se pueden cambiar de nombre después de la creación, por lo que elija una convención de nomenclatura clara desde el principio.

Las acciones que se aplican a un grupo de recursos afectan a todos los recursos que contiene. Al eliminar un grupo de recursos, se elimina todo lo que contiene. La concesión o denegación de acceso se aplica a todos sus recursos.

Por ejemplo, si va a configurar un entorno de desarrollo temporal, la agrupación de todos los recursos permite eliminar todo el grupo cuando haya terminado. Si ejecuta varios proyectos, cree un grupo de recursos independiente para cada uno para que cada equipo solo vea y administre sus propios recursos.

No hay reglas difíciles para estructurar grupos de recursos: elija el enfoque que mejor funcione para su situación.

## Suscripciones de Azure

En Azure, las suscripciones son una unidad de administración, facturación y escala. Las suscripciones permiten organizar grupos de recursos y controlar la facturación por separado del acceso.

![[subscription-boundaries.png]]


* El uso de Azure requiere una suscripción de Azure. Una suscripción proporciona acceso a los productos y servicios de Azure y actúa como una unidad de facturación. Una suscripción de Azure se vincula a una cuenta de Azure, que es una identidad de Microsoft Entra ID o en un directorio en el que confía Microsoft Entra ID.

Una cuenta puede tener varias suscripciones, pero solo se requiere una. En una cuenta de varias suscripciones, puede configurar diferentes modelos de facturación y directivas de acceso. Hay dos tipos de límites de suscripción:

- **Límite de facturación**: determina cómo se factura una cuenta de Azure. Puede crear varias suscripciones para distintos requisitos de facturación. Azure genera informes y facturas de facturación independientes para cada suscripción.
- **Límite de control de acceso**: Azure aplica directivas de administración de acceso en el nivel de suscripción. Por ejemplo, puede crear una suscripción para el trabajo de desarrollo y otra para producción, cada una con diferentes límites de gasto y reglas de acceso.

### Creación de una suscripción de Azure adicional

Puede crear suscripciones adicionales para separar:

- **Entornos**: suscripciones para fases de ciclo de vida, como espacio aislado, desarrollo, prueba y producción. El control de acceso se produce en el nivel de suscripción, lo que hace que sea un límite natural.
- **Límites de equipo y carga de trabajo**: asigne a cada proyecto su propia suscripción para que los costos sean fáciles de rastrear, o separar los entornos de prueba de los de producción.
- **Facturación**: cree suscripciones para realizar un seguimiento de los costos por separado, por ejemplo, una para cargas de trabajo de producción y otra para desarrollo y pruebas.

## Grupos de administración de Azure

Los recursos se agrupan en **grupos de recursos,** y estos a su vez, se integran en suscripciones. Para un entorno pequeño, es suficiente. Pero cuando tiene muchas suscripciones en varios equipos o zonas geográficas, necesita una manera de administrar el acceso y las directivas a un nivel superior.

Los grupos de administración de Azure se sitúan por encima de las suscripciones. Las suscripciones se organizan en grupos de administración y se aplican condiciones de gobernanza (como directivas de acceso o reglas de cumplimiento) al grupo. Todas las suscripciones de un grupo de administración heredan automáticamente esas condiciones, al igual que los recursos heredan la configuración de su grupo de recursos. Los grupos de administración pueden anidarse hasta en seis niveles (sin contar el nivel raíz ni el nivel de suscripción), lo que le permite crear una jerarquía que refleje la estructura de la organización.

Cada inquilino de Microsoft Entra tiene un único grupo raíz de inquilino de nivel superior. Todos los demás grupos de administración y suscripciones se agrupan bajo el grupo raíz, permitiendo aplicar políticas de gestión globalmente.

## Jerarquía de grupos de administración, suscripciones y grupos de recursos

Puede construir una estructura flexible de grupos de administración y suscripciones para organizar sus recursos en una jerarquía para una gestión unificada de políticas y acceso.

![[management-group-hierarchy.png]]

Ejemplos de cómo podría usar grupos de administración:

- **Aplicar una directiva en todas las suscripciones**. Podría limitar las ubicaciones de las máquinas virtuales a la región Oeste de EE. UU. en un grupo denominado Producción. Esta política se hereda a todas las suscripciones de ese grupo de administración y se aplica a todas las máquinas virtuales en dichas suscripciones. El propietario del recurso o la suscripción no puede invalidarlo, lo que refuerza la gobernanza.

- **Conceda acceso a varias suscripciones a la vez**. Al colocar suscripciones en un grupo de administración, puede crear una asignación de RBAC de Azure en el grupo. Todos los grupos de administración secundaria, las suscripciones, los grupos de recursos y los recursos subordinados heredan esos permisos; no es necesario crear scripts de RBAC de Azure para cada suscripción individual.

Datos importantes sobre los grupos de administración:
- Un único directorio admite hasta 10 000 grupos de administración.
- Cada grupo de administración y suscripción solo pueden admitir un elemento primario.

## Exploración con Copilot

> [!INFO] Sugerencia
> Pruebe una de estas indicaciones en Copilot Chat:
> - "Cree un mapa de concepto que conecte regiones, Zonas de disponibilidad, centros de datos, recursos, grupos de recursos, suscripciones y grupos de administración".
> - "Diseñar una estructura de suscripción y grupo de administración para una organización con varios departamentos y límites de cumplimiento".
> - "Explique los pares de regiones y las regiones soberanas y, a continuación, recomiende un enfoque de resistencia para una carga de trabajo con requisitos estrictos de residencia de datos".

✅ Si en un examen te preguntan dónde aplicar gobernanza a gran escala, la respuesta suele ser **Management Groups**.  
✅ Si preguntan por facturación y límites administrativos, **Subscriptions**.  
✅ Si preguntan por organización de recursos, **Resource Groups**.  
✅ Si preguntan por resiliencia dentro de una región, **Availability Zones**.  
✅ Si preguntan por resiliencia entre regiones, **Region Pairs**.




