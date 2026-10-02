---
title: AZ-104 — Introducción a Azure Load Balancer
aliases: ["Introducción a Azure Load Balancer (AZ-104)"]
tags: [associate, networking]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/intro-to-azure-load-balancer/
---

# AZ-104 — Introducción a Azure Load Balancer

Módulo 23 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 4 — Configuración y administración de redes virtuales · Área: Implementación y administración de redes virtuales (15–20%).

## Concepto

Qué hace Azure Load Balancer (LB de capa 4), cómo funciona y cuándo usarlo: interno vs público, SKU básica/estándar.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Configuración de un equilibrador de carga interno o público (reglas, sondeos de estado, HA ports)
> - Solución de problemas del equilibrio de carga

## Enlaces relacionados

**Módulo de Learn**: [Introducción a Azure Load Balancer](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-load-balancer/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-load-balancer/))

**Savill**: buscar "load balancer" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Azure Networking]]

**Laboratorio**: Lab 06 (Implement Network Traffic Management) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)


# Introducción.

Usted es responsable de la creación de redes en Adatum, una tienda de comercio electrónico nueva y en expansión. Adatum tiene varias aplicaciones de tres niveles que se ejecutan en máquinas virtuales (VM) que se migraron desde centros de datos locales. Estas máquinas virtuales se hospedan en varias redes virtuales. Algunas de las aplicaciones están disponibles para la red pública de Internet y otras solo deben ser accesibles para los usuarios en la ubicación principal de la oficina de Adatum en Sydney.

Cuando las aplicaciones se hospedaban en el entorno local, varios dispositivos de hardware usaban el equilibrio de carga de la capa 4 del modelo de interconexión de sistemas abiertos (OSI) para distribuir el tráfico entrante entre las máquinas virtuales de nivel web y las máquinas virtuales de nivel intermedio que realizan tareas de análisis y transformación de datos. Estos dispositivos de nivel 4 se configuraron para poder usar el protocolo de escritorio remoto para conectarse a máquinas virtuales individuales para realizar tareas administrativas. Los dispositivos de hardware también dejarían de reenviar el tráfico a cualquier máquina virtual que sufriera una falla y garantizarían que el tráfico de cliente para una sesión solo ocurriera con una máquina virtual en el grupo de back-end. Ahora que las máquinas virtuales se migran a Azure, le gustaría replicar la funcionalidad proporcionada por los dispositivos de hardware de nivel 4 mediante servicios nativos de Azure. Cree que puede lograr este objetivo con Load Balancer.

Azure Load Balancer distribuye el tráfico entrante a través de un conjunto de máquinas virtuales de un grupo de back-end. El grupo de back-end puede estar compuesto por máquinas virtuales (VM) de infraestructura como servicio (IaaS) de Azure o por instancias en un conjunto de escalado de máquinas virtuales. Puede configurar cómo se distribuye el tráfico entrante en el grupo de back-end mediante reglas de equilibrio de carga. Puede asegurarse de que el tráfico no se dirige a nodos que no responden mediante sondeos de estado.

En este módulo se explica qué hace Azure Load Balancer, cómo funciona y cuándo debe usarlo como solución para satisfacer las necesidades de su organización.

# ¿Qué es Azure Load Balancer?.

Algunas aplicaciones tienen tanto tráfico entrante que el único servidor que los hospeda se sobrecarga y no puede responder a las solicitudes de cliente de forma oportuna. En lugar de agregar continuamente capacidad de red, procesadores, recursos de disco y RAM, puede abordar este tráfico mediante la implementación del equilibrio de carga. El equilibrio de carga es un proceso en el que se distribuye el tráfico entrante de forma equitativa entre varios equipos. Un grupo de equipos que tienen niveles inferiores de recursos suele responder al tráfico de forma más eficaz que un único servidor con un mayor rendimiento.

Azure Load Balancer es un servicio de Azure que permite distribuir uniformemente el tráfico de red entrante a través de un grupo de máquinas virtuales de Azure o entre instancias de un conjunto de escalado de máquinas virtuales. Load Balancer ofrece alta disponibilidad y rendimiento de red de las maneras siguientes:

- Las reglas de equilibrio de carga determinan cómo se distribuye el tráfico a las instancias que componen el back-end.
- Los sondeos de estado garantizan que los recursos del back-end sean correctos y que el tráfico no se dirija a instancias de back-end incorrectas.

Puede implementar equilibradores de carga **públicos** y equilibradores de carga **internos** (o _privados_) en Azure:

- **_Los equilibradores de carga públicos_** se usan para equilibrar la carga del tráfico de Internet a las máquinas virtuales (VM). Un equilibrador de carga público asigna la dirección IP pública y el número de puerto del tráfico entrante a la dirección IP privada y el número de puerto de las máquinas virtuales del grupo de servidores de fondo. Por ejemplo, puede distribuir la carga del tráfico entrante de solicitud web desde Internet a través de varios servidores web. Un equilibrador de carga público también puede proporcionar conexiones salientes para las máquinas virtuales dentro de la red virtual.
- **Un _equilibrador de carga interno_** dirige el tráfico a los recursos que están dentro de una red virtual o que usan una VPN para acceder a la infraestructura de Azure. Las direcciones IP del front-end del equilibrador de carga interno y las redes virtuales no se exponen nunca directamente a un punto de conexión de Internet. Las aplicaciones internas de línea de negocio (LOB) se ejecutan en Azure y se accede a ellas desde Azure o desde recursos locales. Se usa un equilibrador de carga interno en el que solo se necesitan direcciones IP privadas en el front-end. A menudo, los equilibradores de carga internos se usan para distribuir el tráfico de las máquinas virtuales (IaaS) de nivel web de la infraestructura de front-end en un conjunto de máquinas virtuales secundarias que realizan tareas como cálculos o procesamiento de datos.

Un equilibrador de carga interno habilita los siguientes tipos de equilibrio de carga:

- **Dentro de una red virtual**: equilibrio de carga de las máquinas virtuales de la red virtual a un conjunto de máquinas virtuales que residen dentro de la misma red virtual.
- **Para una red virtual entre diferentes locales**: equilibrio de carga desde ordenadores locales a un conjunto de máquinas virtuales que residen dentro de la misma red virtual.
- **Para las aplicaciones de varios niveles**: equilibrio de carga para aplicaciones de varios niveles accesibles desde Internet en las que los niveles de back-end no están accesibles desde Internet. Los niveles de back-end requieren un equilibrio de carga de tráfico en el nivel accesible desde Internet.
- **Para las aplicaciones loB**: equilibrio de carga para aplicaciones loB hospedadas en Azure sin hardware o software de equilibrador de carga agregados. Este escenario incluye servidores locales que se encuentran en el conjunto de equipos cuyo tráfico tiene equilibrio de carga.

Cada tipo de equilibrador de carga se puede usar para escenarios de entrada y salida, y escalar hasta millones de flujos de aplicaciones de Protocolo de Control de Transmisión (TCP) y Protocolo de Datagramas de Usuario (UDP).


# Cómo funciona Azure Load Balancer.

Azure Load Balancer funciona en la capa de transporte del modelo de interconexión de sistemas abiertos (OSI). Esta funcionalidad de **nivel 4** permite la administración del tráfico en función de propiedades específicas del tráfico. Propiedades que incluyen la dirección de origen y destino, el tipo de protocolo TCP o UDP y el número de puerto.

Load Balancer tiene varios elementos que funcionan conjuntamente para garantizar la alta disponibilidad y el rendimiento de una aplicación:

- Dirección IP de front-end
- Reglas del equilibrador de carga
- Grupo de servidores back-end
- Comprobaciones de salud
- Reglas NAT de entrada
- Puertos de alta disponibilidad
- Reglas de salida

## Dirección IP de front-end

La dirección IP de front-end es la dirección que usan los clientes para conectarse a la aplicación web. Una dirección IP de front-end puede ser una dirección IP pública o privada. Los equilibradores de carga de Azure pueden tener varias direcciones IP de front-end. La selección de una dirección IP pública o privada determina qué tipo de equilibrador de carga se va a crear:

- **Dirección IP pública: un equilibrador de carga público**: un equilibrador de carga público asigna la dirección IP pública y el puerto del tráfico entrante a la dirección IP privada y el puerto de la máquina virtual (VM). Puede distribuir tipos específicos de tráfico entre varias máquinas virtuales o servicios aplicando reglas de equilibrio de carga. Por ejemplo, puede distribuir la carga del tráfico de solicitud web entre varios servidores web. El equilibrador de carga asigna el tráfico de respuesta desde la dirección IP privada y el puerto de la máquina virtual a la dirección IP pública y el puerto del equilibrador de carga. A continuación, transmite la respuesta al cliente solicitante.
    
- **Dirección IP privada: un equilibrador de carga interno**: un equilibrador de carga interno distribuye el tráfico a los recursos que están dentro de una red virtual. Azure restringe el acceso a las direcciones IP de front-end de una red virtual con equilibrio de carga. Las direcciones IP de front-end y las redes virtuales nunca se exponen directamente a un punto de conexión de Internet. Las aplicaciones internas de línea de negocio se ejecutan en Azure y se accede a ellas desde Azure o desde recursos locales a través de una conexión VPN o ExpressRoute.
    
    ![Diagrama que muestra cómo funcionan los equilibradores de carga públicos e internos en Azure Load Balancer.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-load-balancer/images/load-balancer-types.png)
    

## Reglas del equilibrador de carga

Una regla del balanceador de carga define cómo se distribuye el tráfico al grupo de servidores de back-end. La regla asigna una combinación determinada de IP y puerto de front-end a un conjunto de combinaciones de direcciones IP y puertos de back-end.

![Diagrama que muestra cómo funcionan las reglas del equilibrador de carga en Azure Load Balancer.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-load-balancer/images/load-balancer-rules.png)

El tráfico se administra mediante un hash de cinco tuplas creado a partir de los siguientes elementos:

- **IP de** origen: la dirección IP del cliente solicitante.
- **Puerto de origen**: el puerto del cliente solicitante.
- **IP de** destino: la dirección IP de destino de la solicitud.
- **Puerto de** destino: puerto de destino de la solicitud.
- **Tipo** de protocolo: tipo de protocolo especificado, Protocolo de control de transmisión (TCP) o Protocolo de datagramas de usuario (UDP).
- **Afinidad de sesión**: garantiza que el mismo nodo de grupo siempre controla el tráfico de un cliente.

Load Balancer permite equilibrar la carga de los servicios en varios puertos, varias direcciones IP o ambas. Puede configurar diferentes reglas de equilibrio de carga para cada dirección IP de front-end. Solo se admiten varias configuraciones de front-end con máquinas virtuales IaaS.

Load Balancer no puede aplicar reglas diferentes basadas en el contenido interno del tráfico porque funciona en la capa 4 (capa de transporte) del modelo OSI. Si necesita administrar el tráfico en función de sus propiedades de capa 7 (capa de aplicación), debe implementar una solución como Azure Application Gateway.

## Grupo de servidores back-end

El grupo de servidores de fondo es un conjunto de máquinas virtuales o instancias de un conjunto de escalado de máquinas virtuales que responde a las solicitudes entrantes. Para escalar de manera rentable para satisfacer los grandes volúmenes de tráfico entrante, las directrices de computación generalmente recomiendan agregar más instancias al grupo de servidores back-end.

Load Balancer implementa la reconfiguración automática para redistribuir la carga a través del número modificado de instancias al escalar instancias hacia arriba o hacia abajo. Por ejemplo, si agregó dos instancias de máquinas virtuales más al grupo de back-end, Load Balancer se volvería a configurar para empezar a equilibrar el tráfico a esas instancias en función de las reglas de equilibrio de carga ya configuradas.

## Comprobaciones de salud

Los sondeos de estado se usan para determinar el estado de mantenimiento de las instancias del grupo de back-end. Este sondeo de estado determina si una instancia es correcta y puede recibir tráfico. Puede definir el umbral incorrecto para los sondeos de estado. Cuando un sondeo no responde, el equilibrador de carga deja de enviar nuevas conexiones a las instancias incorrectas. Un error de sondeo no afecta a las conexiones existentes. La conexión continúa hasta:

- La aplicación finaliza el flujo.
- Se produce el tiempo de espera de inactividad.
- La máquina virtual se apaga.

Load Balancer permite configurar diferentes tipos de sondeo de estado para los puntos de conexión: TCP, HTTP y HTTPS.

- **Sondeo personalizado tcp**: este sondeo se basa en el establecimiento de una sesión TCP correcta en un puerto de sondeo definido. Si existe el agente de escucha especificado en la máquina virtual, el sondeo se realiza correctamente. Si se rechaza la conexión, se produce un error en el sondeo. Puede especificar el puerto, el intervalo y el umbral de número de errores.
- **Sondeo personalizado HTTP o HTTPS**: el equilibrador de carga sondea periódicamente el punto de conexión (cada 15 segundos, de forma predeterminada). La instancia es correcta si responde con un HTTP 200 dentro del período de tiempo de espera (valor predeterminado de 31 segundos). Cualquier estado distinto de HTTP 200 hace que se produzca un error en el sondeo. Puede especificar el puerto (Puerto), el URI para solicitar el estado de mantenimiento del back-end (URI), la cantidad de tiempo entre los intentos de sondeo (Intervalo) y el número de errores que deben producirse para que la instancia se considere incorrecta (Umbral de número de errores).

## Persistencia de la sesión

De forma predeterminada, Load Balancer distribuye el tráfico de red de forma equitativa entre varias instancias de máquina virtual. Proporciona permanencia solo dentro de una sesión de transporte. La persistencia de sesión especifica cómo se debe controlar el tráfico de un cliente. El comportamiento predeterminado (None) es que cualquier máquina virtual correcta puede controlar las solicitudes sucesivas de un cliente.

La persistencia de la sesión también se conoce como afinidad de sesión, afinidad de IP de origen o afinidad de IP de cliente. Este modo de distribución usa un hash de dos tuplas (IP de origen y IP de destino) o de tres tuplas (IP de origen, IP de destino y tipo de protocolo) para enrutar a instancias de back-end. Al usar la persistencia de sesión, las conexiones del mismo cliente van a la misma instancia de back-end del grupo de servidores de back-end. Puede configurar una de las siguientes opciones de persistencia de sesión:

- **Ninguno (valor predeterminado):** especifica que cualquier máquina virtual correcta puede controlar la solicitud.
- **IP de cliente (2-tupla):** especifica que la misma instancia de back-end puede controlar solicitudes sucesivas desde la misma dirección IP del cliente.
- **IP de cliente y protocolo (3-tupla):** especifica que la misma instancia de back-end puede gestionar solicitudes sucesivas de la misma dirección IP del cliente y combinación de protocolo.

Puede cambiar este comportamiento configurando una de las opciones que se describen en las secciones siguientes.

## Puertos de alta disponibilidad

Una regla de equilibrador de carga configurada con `protocol - all and port - 0` se conoce como _regla de puerto de alta disponibilidad (HA_). Esta regla permite que una sola regla equilibre la carga de todos los flujos TCP y UDP que llegan a todos los puertos de un equilibrador de carga estándar interno.

La decisión de equilibrio de carga se toma por flujo. Esta acción se basa en la siguiente conexión de cinco tuplas:

- Dirección IP de origen
- Puerto de origen
- Dirección IP de destino
- Puerto de destino
- Protocol

Las reglas de equilibrio de carga de puertos de alta disponibilidad le ayudan a la hora de usar escenarios críticos como aquellos con alta disponibilidad y escalabilidad para dispositivos virtuales de red (NVA) que estén en redes virtuales. La característica puede ayudar cuando se debe equilibrar la carga de un gran número de puertos.

![Diagrama que muestra cómo funcionan los puertos de alta disponibilidad en Azure Load Balancer.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-load-balancer/images/high-availability-ports.png)

## Reglas NAT de entrada.

Puede usar reglas de equilibrio de carga en combinación con reglas de traducción de direcciones de red (NAT). Por ejemplo, podría usar NAT desde la dirección pública del equilibrador de carga a TCP 3389 en una máquina virtual específica. Esta combinación de reglas permite el acceso a Escritorio remoto desde fuera de Azure.

![Diagrama que muestra cómo funcionan las reglas NAT de entrada en Azure Load Balancer.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-load-balancer/images/inbound-nat-rules.png)

## Reglas de salida

Una regla de salida configura la traducción de direcciones de red de origen (SNAT) para todas las máquinas virtuales o instancias identificadas por el grupo de back-end. Esta regla permite que las instancias del back-end se comuniquen (salida) con Internet u otros puntos de conexión públicos.

![Diagrama que muestra cómo funcionan las reglas de salida en Azure Load Balancer.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-load-balancer/images/outbound-rule.png)

|Situación|Qué hace el balanceador|
|---|---|
|**Una VM falla**|El probe la marca como no sana, y las **conexiones nuevas** van a las demás. Si la VM murió, sus conexiones activas se pierden y el cliente tiene que reconectar|
|**Carga normal**|Reparte las conexiones entre todas las VMs sanas|
|**Carga muy alta**|El balanceador aguanta, porque es de alto rendimiento. El límite lo ponen **tus VMs**, que se saturan|
|**Carga alta y sin autoescalado**|Todas las VMs llegan al 100% y la web se degrada o cae|
|**Carga alta con VMSS + autoescalado**|Azure añade VMs, y el balanceador las incluye solo en el reparto|

# Cuándo usar Azure Load Balancer.

Azure Load Balancer es más adecuado para las aplicaciones que requieren una latencia ultra baja y un alto rendimiento. Load Balancer es adecuado para las necesidades de su organización porque va a reemplazar los dispositivos de hardware de red existentes que equilibran la carga del tráfico entre aplicaciones. Las aplicaciones usaron varios niveles de máquina virtual (VM) cuando las aplicaciones estaban en el entorno local con un servicio de Azure que tiene la misma funcionalidad.

Dado que Load Balancer funciona en la **capa 4**, como los dispositivos de hardware que se usaron en el entorno local antes de que la organización migrara a Azure, puede usar Load Balancer para replicar esa funcionalidad de dispositivo de hardware. Esta funcionalidad incluye el uso de sondeos de estado para asegurarse de que Load Balancer no reenvía el tráfico a los nodos de máquina virtual con errores. También incluye el uso de la persistencia de sesión para asegurarse de que los clientes solo se comunican con una sola máquina virtual durante una sesión.

Puede configurar equilibradores de carga públicos para el tráfico front-end a niveles web de aplicaciones. También puede configurar equilibradores de carga internos para equilibrar el tráfico entre el nivel web y el nivel que realiza tareas de análisis y transformación de datos.

Puede configurar reglas NAT de entrada para permitir que el protocolo de escritorio remoto acceda a una instancia de máquina virtual para realizar tareas administrativas.

## Cuándo no usar Azure Load Balancer

Azure Load Balancer no es adecuado si tiene una aplicación web que no requiere equilibrio de carga que se ejecute en una sola instancia de máquina virtual IaaS. Por ejemplo, si la aplicación web solo recibe una pequeña cantidad de tráfico y la infraestructura existente ya se ocupa de la carga existente, no es necesario implementar un grupo de servidores back-end de máquinas virtuales y no es necesario usar Load Balancer.

Azure proporciona otras soluciones de equilibrio de carga como alternativas a Azure Load Balancer, como Azure Front Door, Azure Traffic Manager y Azure Application Gateway:

- **Azure Front Door** es una red de entrega de aplicaciones que proporciona un servicio global de aceleración de carga y equilibrio de carga para aplicaciones web. Ofrece funcionalidades de nivel 7 para la aplicación, como la descarga TLS/SSL, el enrutamiento basado en rutas de acceso, la conmutación por error rápida, un firewall de aplicaciones web y el almacenamiento en caché para mejorar el rendimiento y la alta disponibilidad de las aplicaciones. Elija esta opción en escenarios como el equilibrio de carga de una aplicación web implementada en varias regiones de Azure.

- **Azure Traffic Manager** es un equilibrador de carga de tráfico basado en DNS que permite distribuir el tráfico de forma óptima a los servicios en regiones globales de Azure, a la vez que proporciona alta disponibilidad y capacidad de respuesta. Dado que Traffic Manager es un servicio de equilibrio de carga basado en DNS, solo equilibra la carga en el nivel de dominio. Por ese motivo, no se puede conmutar por error tan rápido como Front Door, debido a desafíos comunes en torno al almacenamiento en caché de DNS y los sistemas que no respetan los TTL de DNS.

- **Azure Application Gateway** proporciona application Delivery Controller (ADC) como servicio, que ofrece diversas funcionalidades de equilibrio de carga de nivel 7. Se puede usar para optimizar la productividad de las granjas de servidores web traspasando la carga de la terminación TLS/SSL con mayor actividad de la CPU a la puerta de enlace. Application Gateway funciona dentro de una región en lugar de globalmente.

En comparación con estas soluciones:

- <font color="#7030a0"><b>Azure Load Balancer es un servicio de equilibrio de carga de capa 4 de alto rendimiento</b></font> y ultra baja latencia (entrante y saliente) para todos los protocolos UDP y TCP. Se ha creado para controlar millones de solicitudes por segundo, a la vez que garantiza que la solución es de alta disponibilidad. Azure Load Balancer es con redundancia de zona, lo que garantiza una alta disponibilidad en todas las zonas de disponibilidad. Si Adatum tuviera aplicaciones que requerían la funcionalidad de firewall de aplicaciones web, Azure Load Balancer no sería una solución adecuada para la empresa.

# Resumen.

En este módulo, ha obtenido información sobre Azure Load Balancer. Un servicio de Azure que permite distribuir uniformemente el tráfico de red entrante a través de un grupo de máquinas virtuales de Azure o entre instancias de un conjunto de escalado de máquinas virtuales. También ha aprendido cómo Load Balancer ofrece alta disponibilidad y rendimiento de red a las aplicaciones. Ha obtenido información sobre los tipos de escenarios en los que Load Balancer es una solución adecuada para su organización y cómo Es probable que Load Balancer pueda satisfacer las necesidades de red de Adatum. También ha obtenido información sobre la diferencia entre Azure Load Balancer y otras tecnologías de administración del tráfico, como Azure Application Gateway y Azure Traffic Manager.








## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Azure Networking]]
- [[Introducción a Azure Application Gateway (AZ-104)]]
