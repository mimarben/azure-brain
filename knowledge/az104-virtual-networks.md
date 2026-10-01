---
title: AZ-104 — Configuración de redes virtuales
aliases: ["Configuración de redes virtuales (AZ-104)"]
tags: [associate, networking]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/
---

# AZ-104 — Configuración de redes virtuales

Módulo 18 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 4 — Configuración y administración de redes virtuales · Área: Implementación y administración de redes virtuales (15–20%).

## Concepto

Configuración de redes y subredes virtuales, incluido el direccionamiento IP (espacios de dirección, IPs públicas y privadas).

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación y configuración de redes virtuales y subredes
> - Configuración de direcciones IP públicas (SKU básica/estándar)

> **Gap del examen**: los **service endpoints** y **private endpoints** para PaaS son objetivos explícitos del área sin módulo propio en la ruta — cubrir con docs y desarrollar [[Private Endpoints]].

## Enlaces relacionados

**Módulo de Learn**: [Configuración de redes virtuales](https://learn.microsoft.com/en-us/training/modules/configure-virtual-networks/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-virtual-networks/))

**Savill**: buscar "VNet" / "virtual network" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Azure Networking]] · [[Hub-Spoke]] · [[Servicios de red de Azure (AZ-900)]]

**Laboratorio**: Lab 04 (Implement Virtual Networking) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

# Introducción

Las redes virtuales de Azure son un componente esencial para crear redes privadas en Azure. Permiten que diferentes recursos de Azure se puedan comunicar de forma segura entre ellos, con Internet y con redes en el entorno local.

Supongamos que trabaja para una empresa en el sector sanitario. Su empresa está buscando migrar su infraestructura local a Azure. Quieren garantizar una comunicación segura entre sus recursos en Azure y su red local. La empresa también se preocupa por la escalabilidad y la disponibilidad. Mediante el uso de redes virtuales de Azure, pueden crear una red privada en Azure y conectar sus recursos de forma segura.

Los temas descritos en este módulo incluyen la subred, la creación de redes virtuales y el uso de direcciones IP privadas y públicas. También obtendrá información sobre los distintos escenarios en los que se pueden usar las redes virtuales. Estos escenarios incluyen la creación de una red de solo nube privada dedicada o la extensión de un centro de datos de forma segura. El módulo proporciona una explicación detallada de las subredes y sus ventajas, y cómo planear el direccionamiento IP para los recursos de Azure.

Al final de este módulo, tendrás una clara comprensión de cómo crear y configurar redes virtuales preparadas para IA en Azure. Puede usar subredes de forma eficaz, asignar direcciones IP y garantizar una comunicación segura entre los recursos de Azure y la red local.


# Planear redes virtuales,

Un incentivo importante para adoptar soluciones en la nube como Azure consiste en permitir que los departamentos de tecnologías de la información muevan los recursos de servidor a la nube. Cuando se migran recursos a la nube, se puede ahorrar dinero y simplificar las operaciones administrativas. La reubicación de recursos elimina la necesidad de mantener centros de datos costosos con sistemas de alimentación ininterrumpida, generadores, varios sistemas de seguridad a prueba errores o servidores de bases de datos en clúster. En el caso de las pequeñas y medianas empresas, que podrían no tener la experiencia necesaria para mantener una infraestructura sólida propia, la migración a la nube es especialmente interesante.

### Aspectos que se deben conocer sobre las redes virtuales de Azure

Puede implementar Azure Virtual Network para crear una representación virtual de la red en la nube. Con algún [planeamiento](https://learn.microsoft.com/es-es/azure/virtual-network/virtual-network-vnet-plan-design-arm), puede implementar redes virtuales y conectar los recursos que necesita de forma más eficaz. Vamos a examinar algunas características de las redes virtuales en Azure.

- Una red virtual de Azure es un aislamiento lógico de los recursos en la nube de Azure.
    
- Puede usar redes virtuales para aprovisionar y administrar redes privadas virtuales (VPN) en Azure.
    
- Cada red virtual tiene su propio bloque de enrutamiento de interdominios sin clases (CIDR) y se puede vincular a otras redes virtuales y redes locales.
    
- Puede vincular redes virtuales con una infraestructura de TI local para crear soluciones híbridas o entre entornos locales, cuando los bloques CIDR de las redes de conexión no se superponen.
    
- Puede controlar la configuración del servidor DNS para las redes virtuales y la segmentación de la red virtual en subredes.
    

En la ilustración siguiente se muestra una red virtual que tiene una subred que contiene dos máquinas virtuales. La red virtual tiene conexiones a una infraestructura local y a una red virtual independiente.

![Diagrama de una red virtual con una subred de dos máquinas virtuales. La red se conecta a una infraestructura local y a una red virtual independiente.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-virtual-networks/media/virtual-networks-c016972b.png)

### Aspectos que se deben tener en cuenta al usar redes virtuales

Las redes virtuales se pueden usar de muchas formas. A medida que piense en el plan de configuración de las redes virtuales y subredes, tenga en cuenta los siguientes escenarios.

| Escenario                                                        | Descripción                                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| _Creación de una red virtual de solo nube privada dedicada_      | A veces no necesita una configuración entre entornos para su solución. Cuando crea una red virtual, los servicios y las máquinas virtuales de la red virtual pueden comunicarse de manera directa y segura entre sí en la nube. Aun así, puede configurar conexiones de punto de conexión para las máquinas virtuales y los servicios que requieren la comunicación con Internet, como parte de la solución. |
| _Ampliar de forma segura el centro de datos con redes virtuales_ | Puede crear VPN de sitio a sitio tradicionales para escalar la capacidad del centro de datos de forma segura. Las redes privadas virtuales de sitio a sitio usan IPSEC para proporcionar una conexión segura entre la puerta de enlace VPN corporativa y Azure.                                                                                                                                              |
| _Habilitación de escenarios de nube híbrida_                     | Las redes virtuales ofrecen flexibilidad para admitir distintos escenarios de nube híbrida. Puede conectar de forma segura aplicaciones basadas en la nube a cualquier tipo de sistema local como grandes sistemas y sistemas Unix.                                                                                                                                                                          |


## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Azure Networking]]
- [[Hub-Spoke]]
