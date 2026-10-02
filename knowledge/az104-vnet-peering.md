---
title: AZ-104 — Configuración del emparejamiento de Azure Virtual Network
aliases: ["Configuración del emparejamiento de Azure Virtual Network (AZ-104)"]
tags: [associate, networking]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-vnet-peering/
---

# AZ-104 — Configuración del emparejamiento de Azure Virtual Network

Módulo 21 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 4 — Configuración y administración de redes virtuales · Área: Implementación y administración de redes virtuales (15–20%).

## Concepto

Configurar una conexión de emparejamiento (peering) entre VNets y solucionar problemas de tránsito y conectividad.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación y configuración del emparejamiento de red virtual (global peering, tránsito no transitivo)

## Enlaces relacionados

**Módulo de Learn**: [Configuración del emparejamiento de Azure Virtual Network](https://learn.microsoft.com/en-us/training/modules/configure-vnet-peering/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-vnet-peering/))

**Savill**: buscar "peering" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Azure Networking]] · [[Hub-Spoke]] · [[Servicios de red de Azure (AZ-900)]]

**Laboratorio**: Lab 05 (Implement Intersite Connectivity) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

# Introducción

El emparejamiento de Azure Virtual Network permite conectar redes virtuales en las mismas regiones o en regiones diferentes. El emparejamiento de Azure Virtual Network proporciona una comunicación segura entre los recursos de las redes emparejadas.

Supongamos que su empresa de ingeniería está migrando servicios a Azure. La empresa va a implementar servicios en redes virtuales de Azure independientes. Todavía no se configura la conectividad privada entre las redes virtuales. Varias unidades de negocio identificaron servicios en las redes virtuales que deben comunicarse entre sí.

Es su responsabilidad implementar una solución de emparejamiento de red virtual de Azure y habilitar la conectividad entre las redes virtuales. Dos de sus objetivos estratégicos incluyen evitar que los servicios queden expuestos en Internet y mantener la integración lo más simple posible. La solución debe abordar los problemas de tránsito y conectividad.

El objetivo de este módulo es implementar correctamente el emparejamiento de Azure Virtual Network.

## Objetivos de aprendizaje

En este módulo aprenderá a:

- Identificar los casos de uso y las características de producto del emparejamiento de red virtual de Azure
- Configurar la red para implementar Azure VPN Gateway para la conectividad de tránsito
- Extender el emparejamiento mediante una red en estrella tipo hub-and-spoke con rutas definidas por el usuario y encadenamiento de servicios

# Determinación de los usos del emparejamiento de red virtual de Azure.

### Cosas que debe saber sobre el emparejamiento de redes virtuales de Azure

Vamos a examinar algunas características destacadas del emparejamiento de red virtual de Azure.

- Existen dos tipos de emparejamiento de red virtual de Azure: _regional_ y _global_.
    
    ![Diagrama que muestra los dos tipos de emparejamiento de red virtual de Azure: global y regional.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-vnet-peering/media/network-peering-5beae28a.png)
    
- El **emparejamiento de red virtual regional** conecta redes virtuales de Azure que existen en la misma región.

- El **emparejamiento de red virtual global** conecta redes virtuales de Azure que existen en regiones diferentes.

- Puede crear un emparejamiento regional de redes virtuales en la misma región de nube pública de Azure, en la misma región de nube de China o en la misma región de nube de Microsoft Azure Government.

- Puede crear un emparejamiento global de redes virtuales en cualquier región de nube pública de Azure o en cualquier región de nube de China.

- No se permite el emparejamiento global de redes virtuales en regiones de nube de Azure Government diferentes.

- Después de crear un emparejamiento entre redes virtuales, las redes virtuales individuales se siguen administrando como recursos independientes.

- Las redes virtuales se pueden emparejar entre suscripciones e inquilinos.

### Aspectos que se deben tener en cuenta al usar el emparejamiento de red virtual de Azure

Tenga en cuenta las ventajas de usar el emparejamiento de redes virtuales de Azure.

| Prestación                               | Descripción                                                                                                                                                                                                                                                                                                                                 |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Conexiones de red privada**            | Cuando implementa el emparejamiento de red virtual de Azure, el tráfico entre las redes virtuales emparejadas es privado. El tráfico entre las redes virtuales se mantiene en la red troncal de Microsoft Azure. No se requiere ninguna red pública de Internet, puertas de enlace ni cifrado en la comunicación entre las redes virtuales. |
| **Rendimiento sólido**                   | Como el emparejamiento de red virtual de Azure utiliza la infraestructura de Azure, se obtiene una conexión de baja latencia y ancho de banda alto entre los recursos en redes virtuales diferentes.                                                                                                                                        |
| **Comunicación simplificada**            | El emparejamiento de red virtual de Azure permite que los recursos de una red virtual se comuniquen con los recursos de otra red virtual una vez que se emparejen las redes virtuales.                                                                                                                                                      |
| **Transferencia de datos sin problemas** | Puede crear una configuración de emparejamiento de red virtual de Azure para transferir datos entre suscripciones de Azure, modelos de implementación y entre distintas regiones de Azure.                                                                                                                                                  |
| **Sin interrupciones en los recursos**   | El emparejamiento de redes virtuales de Azure no requiere tiempo de inactividad en ninguna de las redes virtuales al crear el emparejamiento ni después de haberlo creado.                                                                                                                                                                  |
### Aspectos que se deben conocer sobre los requisitos y las limitaciones del emparejamiento

Aunque el peering de VNet proporciona muchas ventajas, existen restricciones importantes que deben entenderse.

|Requisitos y limitaciones|Descripción|
|---|---|
|**Espacios de direcciones no superpuestos**|Las redes virtuales emparejadas deben tener espacios de direcciones IP no superpuestos. Se produce un error en la creación del emparejamiento si los intervalos de direcciones se superponen.|
|**Restricciones de modificación del espacio de direcciones**|Si desea cambiar el rango de direcciones de una VNet, primero debe eliminar el emparejamiento, actualizar el espacio de direcciones y, a continuación, volver a configurar el emparejamiento.|
|**Limitaciones básicas de Load Balancer**|Los recursos en una red virtual (VNet) no pueden comunicarse con las direcciones IP de un Basic Internal Load Balancer en redes virtuales (VNets) emparejadas a través de regiones. Usa el Standard Load Balancer para las conexiones entre regiones.|
|**Límites de resolución DNS**|La resolución de nombres integrada de Azure no funciona en redes virtuales emparejadas. Configure zonas DNS privadas de Azure o servidores DNS personalizados para la resolución de nombres entre redes virtuales.|

# Determinar el tránsito y la conectividad de la puerta de enlace

Cuando las redes virtuales están emparejadas, puede configurar una puerta de enlace de VPN de Azure en la red virtual emparejada como _punto de tránsito_. En este escenario, una red virtual emparejada usa la puerta de enlace de VPN remota para obtener acceso a otros recursos.

### Uso de tránsito y conectividad

Piense en un escenario en el que tres redes virtuales de la misma región están conectadas mediante emparejamiento de red virtual. La red virtual A y la red virtual B están cada una emparejadas con una red virtual de centro. La red virtual de centro contiene varios recursos, incluida una subred de puerta de enlace y una puerta de enlace de VPN de Azure. La puerta de enlace de VPN está configurada para permitir el tránsito de la puerta de enlace de VPN. La red virtual B accede a los recursos del centro, incluida la subred de puerta de enlace, mediante una puerta de enlace de VPN remota.

![Diagrama de un emparejamiento de red virtual regional. Una red permite el tránsito de puerta de enlace de VPN y usa una puerta de enlace de VPN remota para acceder a los recursos de una red virtual de centro.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-vnet-peering/media/gateway-transit-173a51a0.png)

Azure Portal proporciona cuatro opciones clave al configurar el emparejamiento de red virtual.

![Captura de pantalla de las opciones de emparejamiento en el portal.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-vnet-peering/media/peering-settings.png)

- **Tráfico a la red virtual remota**. Controla si el tráfico fluye desde esta red virtual a la red virtual remota.
    
- **Tráfico reenviado desde la red virtual remota**. Controla si el tráfico reenviado (no originado) se acepta desde la red virtual emparejada.
    
- **Puerta de enlace de red virtual o Servidor de rutas**. Habilita el tránsito de puerta de enlace. Permite que las redes virtuales emparejadas usen la VPN Gateway o el Azure Route Server de esta red virtual.
    
- **Puerta de enlace de red virtual remota o Servidor de rutas**. Habilita que esta red virtual use la puerta de enlace VPN o el servidor de rutas de la red virtual remota.
    

### Aspectos que debe saber sobre Azure VPN Gateway

Echemos un vistazo con mayor detalle a cómo se implementa Azure VPN Gateway con el emparejamiento de red virtual de Azure.

- Una red virtual solo puede tener una puerta de enlace de VPN.
    
- El tránsito de puerta de enlace es compatible con el emparejamiento de red virtual regional y el global.
    
- Cuando se permite el tránsito de puerta de enlace de VPN, la red virtual puede comunicarse con recursos que están fuera del emparejamiento. En la ilustración de ejemplo, la puerta de enlace de subred de puerta de enlace dentro de la red virtual de centro puede completar tareas como:
    
    - Usar una VPN de sitio a sitio para conectarse a una red local.
    - Usar una conexión de vnet a vnet con otra red virtual.
    - Usar una VPN de punto a sitio para conectarse a un cliente.

- El tránsito de puerta de enlace permite que las redes virtuales emparejadas compartan la puerta de enlace y obtengan acceso a recursos externos. Con esta implementación, no es necesario implementar una puerta de enlace de VPN en la red virtual emparejada.

- En una red virtual, se pueden aplicar grupos de seguridad de red para bloquear o permitir el acceso a otras redes o subredes virtuales. Al configurar el emparejamiento de red virtual, puede elegir si abrir o cerrar las reglas del grupo de seguridad de red entre las redes virtuales.

# Creación del emparejamiento de red virtual.

El emparejamiento de red virtual de Azure se puede configurar para redes virtuales mediante PowerShell, la CLI de Azure y en Azure Portal. En este módulo, revisamos los pasos para crear el emparejamiento en Azure Portal para las redes virtuales implementadas a través de Azure Resource Manager.

### Aspectos que debe saber sobre la creación del emparejamiento de red virtual

Hay algunos puntos que revisar antes de examinar cómo crear el emparejamiento en Azure Portal.

- Para implementar el emparejamiento de red virtual, la cuenta de Azure debe estar asignada al rol `Network Contributor`. De manera alternativa, la cuenta de Azure se puede asignar a un rol personalizado que pueda completar las acciones de emparejamiento necesarias. Para información detallada, consulte [Permisos](https://learn.microsoft.com/es-es/azure/virtual-network/virtual-network-manage-peering?tabs=peering-portal#permissions).
    
- Si desea crear un emparejamiento, necesita dos redes virtuales.
    
- La segunda red virtual en el emparejamiento se conoce como la _red remota_.
    
- Inicialmente, las máquinas virtuales de las redes virtuales no se pueden comunicar entre sí. Una vez que se establece el emparejamiento, las máquinas pueden comunicarse dentro de la red emparejada en función de los valores de configuración.

## Cómo conectar redes virtuales entre regiones de Azure con el emparejamiento global de redes virtuales de Azure

[Video](https://www.youtube.com/watch?v=pSqDlQlcsLo)

## Comprobación del estado del emparejamiento.


En Azure Portal, puede comprobar el estado de la conectividad de las redes virtuales en el emparejamiento de red virtual. Las condiciones del estado dependen de cómo se implementan las redes virtuales.

> [!TIP] Importante 
> El emparejamiento no se establece correctamente hasta que ambas redes virtuales del emparejamiento tengan el estado **Conectado**.

- Las dos condiciones de estado de emparejamiento son **Iniciada** y **Conectada**.
    
- Cuando se crea el emparejamiento inicial _hacia_ la segunda red virtual (remota) desde la primera, el estado del emparejamiento para la primera red virtual es **Iniciado**.


# Extensión del emparejamiento con rutas definidas por el usuario y encadenamiento de servicios.

El emparejamiento de redes virtuales es no transitivo. Las funcionalidades de comunicación de un emparejamiento solo están disponibles para las redes virtuales y los recursos del emparejamiento. Otros mecanismos deben usarse para habilitar el tráfico hacia y desde recursos y redes fuera de la red de emparejamiento privado.

Supongamos que tiene tres redes virtuales: A, B y C. Se establece el emparejamiento de redes virtuales entre las redes A y B, y también entre las redes B y C. No configura el emparejamiento entre redes A y C. Las funcionalidades de emparejamiento de redes virtuales que configuró entre las redes B y C no habilitan automáticamente las funcionalidades de comunicación de emparejamiento entre las redes A y C.


### Aspectos que debe saber sobre la extensión del emparejamiento

Hay varias maneras de ampliar las funcionalidades del emparejamiento para recursos y redes virtuales fuera de la red de emparejamiento.

|Mecanismo|Descripción|
|---|---|
|**Red en estrella tipo hub-and-spoke**|Al implementar una red en estrella tipo hub-and-spoke, la red virtual de centro puede hospedar componentes de la infraestructura como una aplicación virtual de red (NVA) o una puerta de enlace de VPN de Azure. Todas las redes virtuales de radio se pueden emparejar con la red virtual de concentrador. El tráfico puede fluir por las puertas de enlace de VPN o las NVA que se ejecutan en la red virtual de centro.|
|**ruta definida por el usuario (UDR)**|El emparejamiento de red virtual permite que el próximo salto de una [ruta definida por el usuario](https://learn.microsoft.com/es-es/azure/virtual-network/virtual-networks-udr-overview#user-defined) sea la dirección IP de una máquina virtual en la red virtual emparejada o una puerta de enlace VPN.|
|**Encadenamiento de servicios**|El [encadenamiento de servicios](https://learn.microsoft.com/es-es/azure/virtual-network/virtual-network-peering-overview#service-chaining) se usa para dirigir el tráfico de una red virtual a una aplicación virtual o puerta de enlace. Para habilitar el encadenamiento de servicios, configure UDRs que apunten a máquinas virtuales en redes virtuales emparejadas, como una dirección IP del próximo salto. Las UDR también pueden apuntar a puertas de enlace de redes virtuales para habilitar el encadenamiento de servicios.|
|**Azure Virtual Network Manager**|Administra de forma centralizada topologías de interconexión en estrella o de malla a gran escala. Automatiza la creación de emparejamiento sin configuración manual por red virtual.|

En el diagrama siguiente, se muestra una red virtual en estrella tipo hub-and-spoke con una puerta de enlace de VPN y NVA. La red en estrella tipo hub-and-spoke es accesible para otras redes virtuales a través de rutas definidas por el usuario y el encadenamiento de servicios.

![Diagrama que muestra una red virtual de centro con una puerta de enlace de VPN y NVA que son accesibles para otras redes virtuales.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-vnet-peering/media/service-chains-5c9286d1.png)

> [!Abstract] Sugerencia 
> Use el icono **Preguntar información** (de arriba a la derecha) para obtener más información sobre el _encadenamiento de servicios y las rutas definidas por el usuario_.

# Ejercicio.


## Escenario del laboratorio

Su organización segmenta los servicios y aplicaciones de TI principales (como DNS y servicios de seguridad) de otras partes de la empresa, incluido el departamento de fabricación. Sin embargo, en algunos escenarios, las aplicaciones y los servicios del área principal necesitan comunicarse con aplicaciones y servicios en el área de fabricación. En este laboratorio, configurará la conectividad entre las áreas segmentadas. Separar la producción del desarrollo o separar una subsidiaria de otra es un escenario de red común.

## Diagrama de arquitectura

![Diagrama de arquitectura como se explica en las tareas.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-vnet-peering/media/lab-05.png)

## Aptitudes de trabajo

- Cree una máquina virtual en una red virtual.
- Cree una máquina virtual en otra red virtual.
- Use Network Watcher para probar la conexión entre máquinas virtuales.
- Configure emparejamientos de red virtual entre diferentes redes virtuales.
- Use Azure PowerShell para probar la conexión entre máquinas virtuales.
- Cree una ruta personalizada. (opcional).

Inicie el ejercicio y siga las instrucciones. Cuando termine, asegúrese de volver a esta página para que pueda continuar aprendiendo.

[[Lab 05 - Implement Intersite Connectivity.]]


# Resumen y recursos.
En este módulo, ha aprendido que el emparejamiento de Azure Virtual Network le permite conectar redes virtuales en una topología tipo hub-and-spoke. Ha aprendido a configurar las redes virtuales con Azure VPN Gateway para la conectividad de tránsito. Ha explorado cómo ampliar el emparejamiento con rutas definidas por el usuario y el encadenamiento de servicios.

Las principales conclusiones de este módulo son:

- El emparejamiento de red virtual de Azure le permite conectar redes virtuales en una topología tipo hub-and-spoke.
    
- Dos tipos de emparejamiento: regional y global. El emparejamiento regional conecta redes virtuales en la misma región. El emparejamiento global conecta redes virtuales de regiones diferentes.
    
- El tráfico entre redes virtuales emparejadas es privado y se mantiene en la red troncal de Azure.
    
- Puede configurar Azure VPN Gateway en la red virtual emparejada como un punto de tránsito para acceder a los recursos de otra red.
    
- Los grupos de seguridad de red se pueden aplicar para bloquear o permitir el acceso entre redes virtuales al configurar el emparejamiento de redes virtuales.
    

## Más información con Copilot

Copilot puede ayudarle a diseñar soluciones de infraestructura de Azure. Copilot puede comparar, recomendar, explicar e investigar productos y servicios en los que necesita más información. Abra un explorador de Microsoft Edge y elija Copilot (arriba a la derecha) o vaya a copilot.microsoft.com. Dedique unos minutos a probar estos mensajes y ampliar el aprendizaje con Copilot.

- ¿Qué es el emparejamiento de redes virtuales de Azure y cuáles son las ventajas de esta característica?
    
- ¿Cuáles son algunas de las opciones de configuración para el emparejamiento de redes virtuales de Azure?
    

## Obtener más información con la documentación

- [Emparejamiento de Azure Virtual Network](https://learn.microsoft.com/es-es/azure/virtual-network/virtual-network-peering-overview). Este artículo es el punto de partida para obtener información sobre el emparejamiento de redes virtuales.
    
- [Crear, cambiar o eliminar un emparejamiento de red virtual](https://learn.microsoft.com/es-es/azure/virtual-network/virtual-network-manage-peering?tabs=peering-portal). En este artículo se revisa cómo crear un emparejamiento de red virtual y lo que significa cada configuración.






## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Azure Networking]]
- [[Hub-Spoke]]
