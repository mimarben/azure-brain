---
title: AZ-104 — Configuración de grupos de seguridad de red
aliases: ["Configuración de grupos de seguridad de red (AZ-104)"]
tags: [associate, networking, security]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-network-security-groups/
---

# AZ-104 — Configuración de grupos de seguridad de red

Módulo 19 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 4 — Configuración y administración de redes virtuales · Área: Implementación y administración de redes virtuales (15–20%).

## Concepto

Implementar grupos de seguridad de red (NSG) y grupos de seguridad de aplicaciones (ASG), asegurando que las reglas se aplican correctamente.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación y configuración de NSG y ASG
> - Evaluación de reglas de seguridad eficaces en NSG (prioridad, combinación subred vs NIC)

> **Gap del examen**: **Azure Bastion** es objetivo explícito del área sin módulo propio en la ruta — cubrir con [docs de Bastion](https://learn.microsoft.com/en-us/azure/bastion/) ([ES](https://learn.microsoft.com/es-es/azure/bastion/)).

## Enlaces relacionados

**Módulo de Learn**: [Configuración de grupos de seguridad de red](https://learn.microsoft.com/en-us/training/modules/configure-network-security-groups/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-network-security-groups/))

**Savill**: buscar "NSG" / "security group" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Azure Networking]] · [[Private Endpoints]] · [[Servicios de red de Azure (AZ-900)]]

**Laboratorio**: Lab 04 (Implement Virtual Networking, incluye NSG/ASG) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)



# Introducción.


Los grupos de seguridad de red son una manera de limitar el tráfico de red a los recursos de la red virtual. Los grupos de seguridad de red contienen reglas de seguridad que permiten o deniegan el tráfico de red entrante o saliente.

Supongamos que su empresa tiene varias ubicaciones y quiere migrar a una solución basada en la nube. La empresa solo considera la posibilidad de migrar los sistemas clave a la plataforma en la nube si se pueden cumplir estrictos requisitos de seguridad. Entre estos, se incluye un estrecho control sobre qué equipos tienen acceso de red a los servidores de aplicaciones. Necesita proteger tanto las redes de máquinas virtuales como las de los servicios de Azure. El objetivo es impedir que el tráfico de red no seguro o no deseado pueda llegar a los sistemas clave.

En este módulo, aprenderá a crear un grupo de seguridad de red listo para IA, configurar reglas de puerto entrantes y salientes, y verificar la conectividad segura. El objetivo de este módulo es enseñar a controlar el tráfico de red con grupos de seguridad de red.

# Implementación de grupos de seguridad de red.

Puede limitar el tráfico de red a los recursos de la red virtual mediante un [grupo de seguridad de red](https://learn.microsoft.com/es-es/azure/virtual-network/network-security-groups-overview). Un grupo de seguridad de red se puede asignar a una subred o a una interfaz de red, y se pueden definir reglas de seguridad en el grupo para controlar el tráfico de red.

### Aspectos que saber sobre los grupos de seguridad de red

Echemos un vistazo a las características de los grupos de seguridad de red.

- Un grupo de seguridad de red contiene reglas de seguridad que permiten o deniegan el tráfico de red entrante o saliente.
    
- Un grupo de seguridad de red se puede asociar a una subred o a una interfaz de red.
    
- Además, se puede asociar varias veces.
    
- El grupo de seguridad de red se crea y luego se definen reglas de seguridad en Azure Portal.
    
- La página Información general de una máquina virtual proporciona información sobre los grupos de seguridad de red asociados. Puede ver detalles como las subredes asignadas, las interfaces de red asignadas y las reglas de seguridad definidas.
    

![Captura de pantalla de la página de información general del grupo de seguridad de red.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/network-security-groups-1ebf7bed.png)

#### Grupos de seguridad de red y subredes

Puede asignar grupos de seguridad de red a una subred y crear una subred protegida con pantalla (también denominada zona desmilitarizada o _DMZ_). Una DMZ actúa como un búfer entre los recursos de la red virtual e Internet.

- Use el grupo de seguridad de red para restringir el flujo de tráfico a todas las máquinas que residen dentro de la subred.
    
- Cada subred puede tener como máximo un grupo de seguridad de red asociado.
    

#### Grupos de seguridad de red e interfaces de red

Puede asignar grupos de seguridad de red a una tarjeta de interfaz de red (NIC).

- Defina reglas de grupo de seguridad de red para controlar todo el tráfico que fluye a través de una interfaz de red.
    
- Cada interfaz de red que existe en una subred puede tener un grupo de seguridad de red asociado o ninguno.


# Determinación de las reglas de grupo de seguridad de red.

Las reglas de seguridad de los grupos de seguridad de red permiten filtrar el tráfico de red. Puede definir reglas para controlar el flujo de tráfico dentro y fuera de las subredes de red virtual y de las interfaces de red.

### Aspectos que saber sobre las reglas de seguridad

Vamos a revisar las características de las reglas de seguridad de los grupos de seguridad de red.

- Azure crea varias reglas de seguridad predeterminadas dentro de cada grupo de seguridad de red, incluido el tráfico entrante y el tráfico saliente. Un par de ejemplos de reglas predeterminadas son el tráfico `DenyAllInbound` y el tráfico `AllowInternetOutbound`.
    
- Azure crea reglas de seguridad predeterminadas en cada grupo de seguridad de red que cree.
    
- Puede agregar más reglas de seguridad a un grupo de seguridad de red [especificando condiciones](https://learn.microsoft.com/es-es/azure/virtual-network/manage-network-security-group?tabs=network-security-group-portal#create-a-security-rule). Esta es una lista de las condiciones más comunes.
    
|Configuración|Importancia|
|---|---|
|Fuente|Cualquiera, direcciones IP, Mi dirección IP, Etiqueta de servicio o Grupo de seguridad de aplicaciones|
|Intervalos de puertos de origen|Especificar los puertos en los que la regla permite o deniega el tráfico.|
|Destino|Cualquiera, direcciones IP, etiqueta de servicio o grupo de seguridad de aplicaciones|
|Protocolo|Restrinja la regla al Protocolo de control de transmisión (TCP), el Protocolo de datagramas de usuario (UDP), el Protocolo de mensajes de control de Internet (ICMP), la encapsulación de la carga de seguridad (ESP) o el encabezado de autenticación (AH). Los protocolos ESP y AH solo están disponibles a través de plantillas JSON y PowerShell. El valor predeterminado es que la regla se aplique a todos los protocolos (Any).|
|Acción|Permitir o denegar|
|Prioridad|Valor comprendido entre 100 y 4096 que es único para todas las reglas de seguridad dentro del grupo de seguridad de red|
    
- A cada regla de seguridad se le asigna un valor de prioridad. Todas las reglas de seguridad de un grupo de seguridad de red se procesan por orden de prioridad. Cuando una regla tiene un valor de prioridad bajo, la regla tiene una prioridad o prioridad más alta en términos de orden de procesamiento.
    
- Las reglas de seguridad predeterminadas no se pueden quitar.
    
- Una regla de seguridad predeterminada se puede invalidar creando otra regla de seguridad que tenga una configuración de prioridad más alta en el grupo de seguridad de red.
    

#### Reglas de tráfico entrante

Azure define tres reglas de seguridad de entrada predeterminadas para el grupo de seguridad de red. Estas reglas **deniegan todo el tráfico entrante** , excepto el tráfico de la red virtual y los equilibradores de carga de Azure. En la imagen siguiente se muestran las reglas de seguridad de entrada predeterminadas para un grupo de seguridad de red en Azure Portal.

![Captura de pantalla que muestra las reglas de seguridad de entrada predeterminadas para un grupo de seguridad de red en Azure Portal.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/inbound-rules-a554314b.png)

#### Reglas de tráfico de salida

Azure define tres reglas de seguridad de salida predeterminadas para el grupo de seguridad de red. Estas reglas **solo permiten el tráfico saliente** a Internet y a la red virtual. En la imagen siguiente se muestran las reglas de seguridad de salida predeterminadas para un grupo de seguridad de red en Azure Portal.

![Captura de pantalla que muestra las reglas de seguridad de salida predeterminadas para un grupo de seguridad de red en Azure Portal.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/outbound-rules-ff90d802.png)



# Determinar las reglas efectivas del grupo de seguridad de red.

Cada grupo de seguridad de red y sus reglas de seguridad definidas se evalúan de forma independiente. Azure procesa las condiciones de cada regla definida para cada máquina virtual de la configuración.

- Para el tráfico entrante, Azure procesa primero las reglas de seguridad del grupo de seguridad de red para las subredes asociadas y, a continuación, las interfaces de red asociadas.
- Para el tráfico saliente, se invierte el proceso. Azure evalúa primero las reglas de seguridad del grupo de seguridad de red para las interfaces de red asociadas seguidas de las subredes asociadas.
- En el caso del proceso de evaluación de entrada y salida, Azure también comprueba cómo aplicar las reglas para el tráfico dentro de la subred. El tráfico entre subredes hace referencia a las máquinas virtuales de la misma subred.

La forma en que Azure termina aplicando las reglas de seguridad definidas para una máquina virtual determina la _vigencia_ general de las reglas.

### Evaluación del grupo de seguridad de red

Al aplicar grupos de seguridad de red a una subred y a una interfaz de subred, cada grupo de seguridad de red se evalúa por separado. Las reglas entrantes y salientes se consideran en función del orden de prioridad y procesamiento.

![Diagrama de dos grupos de seguridad de red aplicados a una subred.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/multiple-nsgs.png)

### Aspectos que hay que tener en cuenta al crear reglas vigentes

Revise las consideraciones siguientes sobre la creación de reglas de seguridad vigentes para las máquinas de la red virtual.

- **Considere la posibilidad de permitir todo el tráfico**. Si coloca la máquina virtual dentro de una subred o utiliza una interfaz de red, no tiene que asociar la subred o la NIC a un grupo de seguridad de red. Este enfoque permite todo el tráfico de red a través de la subred o la NIC según las reglas de seguridad predeterminadas de Azure. Si no le preocupa controlar el tráfico al recurso en un nivel específico, no asocie el recurso en ese nivel a un grupo de seguridad de red.
    
- **Considere la importancia de las reglas de permiso**. Al crear un grupo de seguridad de red, debe definir una regla de **permiso** para la subred y la interfaz de red del grupo para asegurarse de que el tráfico puede pasar. Si tiene una subred o una NIC en el grupo de seguridad de red, debe definir una regla de permiso en cada nivel. De lo contrario, se deniega el tráfico para cualquier nivel que no proporcione una definición de regla de permiso.
    
- **Considere el tráfico dentro de la subred**. Las reglas de seguridad de un grupo de seguridad de red asociado a una subred pueden afectar al tráfico entre todas las máquinas virtuales de la subred. Puede prohibir el tráfico dentro de la subred definiendo una regla en el grupo de seguridad de red para denegar todo el tráfico entrante y saliente. Esta regla impide que todas las máquinas virtuales de la subred se comuniquen entre sí.
    
- **Considere la prioridad de las reglas**. Las reglas de seguridad de un grupo de seguridad de red se procesan en orden de prioridad. Para asegurarse de que siempre se procesa una regla de seguridad determinada, asigne el valor de prioridad más bajo posible a la regla. Se recomienda dejar espacios en la numeración de prioridad, como 100, 200, 300, etc. Los espacios en la numeración permiten agregar nuevas reglas sin tener que editar las reglas existentes.
    

### Visualización de las reglas de seguridad vigentes

Si tiene varios NSG y no está seguro de qué reglas de seguridad se aplican, puede usar el vínculo **Reglas de seguridad vigentes** en Azure Portal. Puede usar el vínculo para comprobar qué reglas de seguridad se aplican a las máquinas, subredes e interfaces de red.

![Captura de pantalla de la página Redes de Azure Portal, con el vínculo Reglas de seguridad vigentes resaltado.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/effective-security-rules-d93ab464.png)

> [!NOTE] Nota:
> [Network Watcher](https://learn.microsoft.com/es-es/azure/network-watcher/effective-security-rules-overview) proporciona una vista consolidada de las reglas de infraestructura, incluidas las reglas de NSG y las reglas de administración de seguridad de Azure Virtual Network Manager. La característica de comprobación del flujo de IP evalúa el tráfico con respecto a las reglas de NSG y a las reglas de administración de seguridad que pueden estar en vigor.


# Creación de reglas de grupo de seguridad de red.


Agregar reglas de seguridad para controlar el tráfico entrante y saliente en Azure Portal es fácil. Se pueden configurar reglas de grupo de seguridad de red virtual y seleccionar de entre una gran variedad de servicios de comunicación, como HTTPS, RDP, FTP y DNS.

### Aspectos que saber sobre la configuración de reglas de seguridad

Echemos un vistazo a algunas de las propiedades que es necesario especificar para crear las reglas de seguridad. A medida que revise esta configuración, piense en las reglas de tráfico que necesita crear y qué servicios pueden cubrir sus requisitos de red.

![Captura de pantalla que muestra cómo configurar las opciones de origen y destino para crear una regla de seguridad en Azure Portal.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/add-network-security-rule-2f306d23.png)

- **Origen**: identifica cómo la regla de seguridad controla el tráfico **entrante** . El valor especifica un intervalo de direcciones IP de origen específico para permitir o denegar. El filtro de origen puede ser cualquier recurso, un intervalo de direcciones IP, un grupo de seguridad de aplicaciones o una etiqueta predeterminada.
    
- **Destino**: identifica cómo la regla de seguridad controla el tráfico **saliente** . El valor especifica un intervalo de direcciones IP de destino específico para permitir o denegar. El valor del filtro de destino es similar al del filtro de origen. Este valor puede ser cualquier recurso, un intervalo de direcciones IP, un grupo de seguridad de aplicaciones o una etiqueta predeterminada.
    
- **Servicio**: especifica el protocolo de destino y el intervalo de puertos para la regla de seguridad. Puede elegir un servicio predefinido (como RDP o SSH) o proporcionar un intervalo de puertos personalizado. Hay un gran número de servicios entre los que seleccionar.
    
    ![Captura de pantalla que muestra las opciones de regla de servicio para una regla de seguridad en Azure Portal.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/security-services.png)
    
- **Prioridad**: asigna el valor del orden de prioridad para la regla de seguridad. Las reglas se procesan según el orden de prioridad de todas las reglas de un grupo de seguridad de red, incluida una subred y una interfaz de red. Cuanto menor sea el valor de prioridad, mayor será la prioridad de la regla.
    
    ![Captura de pantalla que muestra cómo establecer el valor de prioridad de una regla de seguridad en Azure Portal.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/security-priority.png)
    

### Cuándo usar reglas de seguridad aumentadas

Una única regla de grupo de seguridad de red puede contener varios valores en los campos Origen, Destino y Servicio. Este enfoque, denominado reglas de seguridad aumentadas, reduce el número total de reglas necesarias y simplifica la administración del grupo de seguridad de red.

**Aspectos que se deben conocer sobre reglas de seguridad mejoradas**

- **Varias direcciones IP**: combine varias direcciones IP en una regla.
    
- **Varios intervalos de puertos**: especifique varios puertos y intervalos en el campo Servicio.
    
- **Etiquetas de servicio y grupos de seguridad de aplicaciones**: Mezclar etiquetas de servicio, grupos de seguridad de aplicaciones y direcciones IP en la misma regla.
    
- **Recuento reducido de reglas**: en lugar de crear reglas independientes para cada intervalo IP o puerto, compílelas en menos reglas más fáciles de administrar.
    

En entornos empresariales con muchos intervalos IP o servicios, las reglas mejoradas impiden la expansión de las reglas de NSG. Por ejemplo, en lugar de crear cuatro reglas independientes para los puertos 80, 443, 8080 y 8090, cree una regla con todos los puertos.

> [!TIP] Sugerencia:
> Amplíe su aprendizaje con el módulo de formación "Proteja y aísle el acceso a los recursos de Azure utilizando grupos de seguridad de red y puntos de conexión de servicio". Este módulo incluye un entorno de pruebas en el que puedes practicar.

# Implementación de grupos de seguridad de aplicaciones.

Puede implementar [grupos de seguridad de aplicaciones (ASG)](https://learn.microsoft.com/es-es/azure/virtual-network/application-security-groups) en la red virtual de Azure para agrupar lógicamente las máquinas virtuales por carga de trabajo. Después, puede definir las reglas del grupo de seguridad de red en función de los grupos de seguridad de aplicaciones.

### Aspectos que se deben saber sobre el uso de grupos de seguridad de aplicaciones

Los grupos de seguridad de aplicaciones proporcionan una manera centrada en la aplicación de examinar la infraestructura. Las máquinas virtuales se unen a un grupo de seguridad de aplicaciones. A continuación, use el grupo de seguridad de aplicaciones como origen o destino en las reglas del grupo de seguridad de red.

Vamos a examinar cómo implementar grupos de seguridad de aplicaciones mediante la creación de una configuración para un minorista en línea. En nuestro escenario de ejemplo, es necesario controlar el tráfico de red a las máquinas virtuales en los grupos de seguridad de aplicaciones.

![Diagrama que muestra cómo se combinan los grupos de seguridad de aplicaciones con grupos de seguridad de red para proteger las aplicaciones.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-network-security-groups/media/application-security-groups.png)


> [!NOTE] Nota: 
> En el diagrama, los servidores de aplicaciones están entregando solicitudes de SQL Server.

#### Requisitos del escenario

Estos son los requisitos del escenario para nuestra configuración de ejemplo:

- En este escenario, hay dos niveles: servidores web y servidores de aplicaciones.
- Los servidores web controlan el tráfico HTTP y HTTPS de Internet.
- Los servidores de aplicaciones procesan solicitudes SQL desde los servidores web.

#### Solución

Para nuestro escenario, es necesario crear la siguiente configuración:

1. Cree grupos de seguridad de aplicaciones para cada nivel.
    
2. Para cada servidor de máquina virtual, asigne su interfaz de red al grupo de seguridad de aplicaciones adecuado.
    
3. Cree un grupo de seguridad de red y reglas de seguridad.
    
    - **Regla 1**: Establezca **Prioridad** en 100. Permitir el acceso desde Internet a las máquinas de servidores web desde el puerto HTTP 80 y el puerto HTTPS 443.
        
        La regla 1 tiene el valor de prioridad más bajo, por lo que tiene prioridad sobre las demás reglas del grupo. El acceso de los clientes a nuestro catálogo en línea es primordial en nuestro diseño.
        
    - **Regla 2**: Establezca **Prioridad** en 110. Permitir el acceso desde los servidores web a los servidores de aplicaciones a través del puerto SQL 1433.
        
    - **Regla 3**: Establezca **Prioridad** en 120. **Deniegue el** acceso desde cualquier lugar a las máquinas del servidor de aplicaciones en los puertos HTTP y HTTPS.
        
        La combinación de la Regla 2 y la Regla 3 garantiza que solo nuestros servidores web puedan acceder a nuestros servidores de bases de datos. Esta configuración de seguridad protege nuestras bases de datos de inventario frente a ataques externos.
        

### Cosas que hay que tener en cuenta al usar grupos de seguridad de aplicaciones

Hay varias ventajas al implementar grupos de seguridad de aplicaciones en las redes virtuales.

- **Considere la posibilidad de mantenimiento de direcciones IP**. Al controlar el tráfico de red mediante grupos de seguridad de aplicaciones, no es necesario configurar el tráfico entrante y saliente para direcciones IP específicas. Si tiene muchas máquinas virtuales en la configuración, puede ser difícil especificar todas las direcciones IP afectadas. A medida que mantiene la configuración, el número de servidores puede cambiar. Estos cambios pueden requerir que modifique cómo se admiten diferentes direcciones IP en las reglas de seguridad.

- **Considere la posibilidad de no usar subredes**. Al organizar las máquinas virtuales en grupos de seguridad de aplicaciones, no es necesario distribuir también los servidores entre subredes específicas. Puede organizar los servidores por aplicación y propósito para lograr agrupaciones lógicas.

- **Considere las reglas simplificadas**. Los grupos de seguridad de aplicaciones ayudan a eliminar la necesidad de varios conjuntos de reglas. No tiene que crear una regla independiente para cada máquina virtual. Puede aplicar dinámicamente nuevas reglas a los grupos de seguridad de aplicaciones designados. Las nuevas reglas de seguridad se aplican automáticamente a todas las máquinas virtuales del grupo de seguridad de aplicaciones especificado.

- **Considere el soporte de cargas de trabajo**. Una configuración que implementa grupos de seguridad de aplicaciones es fácil de mantener y comprender porque la organización se basa en el uso de la carga de trabajo. Los grupos de seguridad de aplicaciones proporcionan organizaciones lógicas para las aplicaciones, los servicios, el almacenamiento de datos y las cargas de trabajo.

- **Considere la posibilidad de usar etiquetas de servicio**. Las etiquetas de servicio representan un grupo de prefijos de dirección IP de un servicio de Azure específico. Ayudan a minimizar la complejidad de las actualizaciones frecuentes en las reglas de seguridad de red. Aunque las etiquetas de servicio se usan para simplificar la administración de direcciones IP para los servicios de Azure, los ASG se usan para agrupar máquinas virtuales y administrar directivas de seguridad de red basadas en esos grupos.

# Ejercicio.


[[Implementación de redes virtuales.]]

# Evaluación del módulo.

> [!abstract] Idea central
> 
> - **NSG** (_Network Security Group_) = **las reglas** que permiten o deniegan tráfico.
> - **ASG** (_Application Security Group_) = **agrupación lógica de VMs por rol** para usarla como origen/destino en esas reglas.

## 1️⃣ Directivas por rol de VM

**Pregunta:** Una empresa quiere aplicar directivas de seguridad según los roles de sus VMs. ¿Qué característica deben implementar para la agrupación lógica y la asignación de reglas?

- [ ] Plantillas de Azure Resource Manager
- [x] **Grupos de seguridad de aplicaciones**
- [ ] Grupos de seguridad de red

> [!success] Por qué Un **ASG** agrupa VMs por función (web, base de datos...) y esa agrupación se usa en las reglas del NSG. Las **plantillas ARM** sirven para desplegar infraestructura, no para agrupar. El **NSG** contiene las reglas, pero la agrupación lógica por rol la hace el ASG.

---

## 2️⃣ Solo la subred A llega a la subred B

**Pregunta:** ¿Cómo asegurar con NSG que solo el tráfico de la subred A puede llegar a la subred B?

- [ ] Asignar un NSG a la subred A que deniega todo el tráfico saliente
- [ ] Usar una etiqueta de servicio para permitir todo el tráfico entre A y B
- [x] **Crear un NSG para la subred B con una regla que permita el tráfico solo desde la subred A**

> [!success] Por qué La restricción se aplica **en el destino**: el NSG de la subred B permite como origen únicamente el rango de la subred A. Denegar toda la salida de A rompería también su comunicación con otros destinos, y permitir "todo" entre A y B no restringe nada.

---

## 3️⃣ Agrupar VMs por tipo de servicio

**Pregunta:** ¿Qué característica permite agrupar VMs según su tipo de servicio y administrar reglas de seguridad?

- [ ] Grupos de recursos de Azure
- [ ] Grupos de seguridad de red
- [x] **Grupos de seguridad de aplicaciones**

> [!success] Por qué El **ASG** está diseñado para agrupar interfaces de red de VMs por carga de trabajo. Los **grupos de recursos** agrupan recursos por administración y facturación, no por seguridad de red.

---

## 4️⃣ Comprobar las reglas aplicadas a una VM

**Pregunta:** ¿Cómo comprobar que se aplican las reglas de NSG correctas a una VM concreta?

- [ ] Consultar los registros de Azure Active Directory
- [x] **Revisar las reglas de seguridad vigentes (_effective security rules_) de la VM en Azure Portal**
- [ ] Comprobar la configuración de la subred asociada

> [!success] Por qué **Effective security rules** muestra la combinación real de todas las reglas que afectan a la VM (NSG de la subred + NSG de la interfaz de red). Mirar solo la subred daría una visión incompleta, y **Microsoft Entra ID** (antes Azure AD) gestiona identidades, no tráfico de red.

---

## 5️⃣ Regla con prioridad numérica superior

**Pregunta:** ¿Qué ocurre si se crea una regla con un valor de prioridad superior a las existentes?

- [x] **La nueva regla se procesa después de las reglas existentes con valores de prioridad inferior**
- [ ] El orden se ajusta según el tiempo de creación
- [ ] La nueva regla invalida todas las existentes

> [!success] Por qué En Azure **el número más bajo se evalúa primero** (100 antes que 4096). Un valor mayor significa **menor precedencia**, así que la regla se procesa después. Cuando una regla coincide, Azure deja de evaluar el resto.

> [!warning] Trampa habitual "Prioridad superior" en el enunciado se refiere al **número**, no a la importancia. Número alto = se evalúa más tarde.

---

## 6️⃣ NSG en nube híbrida

**Pregunta:** ¿Cuándo son adecuados los NSG en un entorno de nube híbrida?

- [x] **Para controlar el flujo de tráfico entre VMs de Azure y recursos locales**
- [ ] Para configurar copia de seguridad y recuperación ante desastres
- [ ] Para administrar identidad y acceso de usuarios

> [!success] Por qué Los NSG filtran tráfico de red, incluido el que llega desde on-premises por VPN o ExpressRoute. La copia de seguridad y recuperación es de **Azure Backup / Site Recovery**, y la identidad es de **Microsoft Entra ID**.

---

## 7️⃣ NSG en subred y en interfaz de red a la vez

**Pregunta:** ¿Qué efecto tiene asignar un NSG a una subred y a una interfaz de red?

- [ ] Las reglas de la interfaz invalidan las de la subred
- [ ] Solo se aplican las reglas de la subred
- [x] **Ambas se evalúan de forma independiente y se aplican las más restrictivas**

> [!success] Por qué El tráfico debe ser permitido por **los dos NSG**. Si uno lo deniega, se bloquea.

> [!info] Orden de evaluación
> 
> |Dirección|Primero|Después|
> |---|---|---|
> |**Entrada**|NSG de la subred|NSG de la interfaz de red|
> |**Salida**|NSG de la interfaz de red|NSG de la subred|

---

## 8️⃣ Qué determina el orden de las reglas

**Pregunta:** ¿Qué factor determina el orden de procesamiento de las reglas del NSG?

- [ ] Fecha de creación
- [ ] Orden alfabético del nombre
- [x] **Valor de prioridad asignado a cada regla**

> [!success] Por qué Las reglas se procesan por **prioridad (de 100 a 4096 para las personalizadas)**, de menor a mayor número. El nombre y la fecha no influyen.

---

## 9️⃣ Mejorar la agrupación por carga de trabajo

**Pregunta:** La configuración carece de organización para administrar VMs por carga de trabajo con fines de seguridad. ¿Qué característica recomendar?

- [ ] Azure Security Center
- [x] **Grupos de seguridad de aplicaciones**
- [ ] Azure Automation

> [!success] Por qué El **ASG** agrupa VMs por carga de trabajo y simplifica las reglas del NSG. **Security Center** (ahora _Microsoft Defender for Cloud_) evalúa y recomienda postura de seguridad, y **Azure Automation** automatiza tareas operativas.

---

## 🧠 Chuleta final

|Si la pregunta habla de...|Respuesta|
|---|---|
|Agrupar VMs por rol o carga de trabajo|**ASG**|
|Reglas allow/deny de tráfico|**NSG**|
|Qué regla se evalúa antes|La de **menor número** de prioridad|
|NSG en subred + interfaz|Se aplican **ambos**; gana el más restrictivo|
|Ver qué reglas afectan realmente a una VM|**Effective security rules**|
|Restringir quién llega a una subred|NSG **en la subred destino**|
|Identidad y acceso|**Microsoft Entra ID**, no NSG|

## 🔗 Relacionado

- [[AZ-104 Lab 04 - Virtual Networking]]

# Resumen y recursos.

En este módulo, ha obtenido información sobre los grupos de seguridad de red (NSG) en Azure. Los grupos de seguridad de red se usan para limitar el tráfico de red a los recursos de la red virtual mediante una lista de reglas de seguridad. Puede asociar grupos de seguridad de red a subredes o interfaces de red, y definir reglas para controlar el tráfico entrante y saliente.

También ha aprendido cómo se evalúan y procesan las reglas de los grupos de seguridad de red. Por último, ha aprendido cómo permiten los grupos de seguridad de aplicaciones agrupar máquinas virtuales en función de la carga de trabajo.

Las principales conclusiones de este módulo son las siguientes:

- Los **grupos de seguridad de red** son esenciales para controlar el tráfico de red en las redes virtuales de Azure.
    
- Las **reglas del grupo de seguridad** de red se evalúan y procesan en función de la prioridad y se pueden crear para subredes e interfaces de red.
    
- Se pueden conseguir reglas de NSG eficaces teniendo en cuenta la prioridad de las reglas, el tráfico dentro de la subred y la administración de la prioridad de las reglas.
    
- Los **grupos de seguridad de aplicaciones** proporcionan una vista centrada en la aplicación de la infraestructura y simplifican la administración de reglas.
    

## Más información con Copilot

Copilot puede ayudarle a diseñar soluciones de infraestructura de Azure. Copilot puede comparar, recomendar, explicar e investigar productos y servicios en los que necesita más información. Abra un explorador de Microsoft Edge y elija Copilot (arriba a la derecha) o vaya a copilot.microsoft.com. Dedique unos minutos a probar estos mensajes y ampliar el aprendizaje con Copilot.

- ¿Cuál es la diferencia entre un grupo de seguridad de red de Azure y un grupo de seguridad de aplicaciones? Proporcione ejemplos de uso.
    
- ¿Puede explicar las reglas del grupo de seguridad de red en detalle?
    
- ¿Cómo puedo resolver problemas de reglas de grupo de seguridad de red?
    

## Más información con la documentación

- [Obtenga información sobre los grupos de seguridad de red](https://learn.microsoft.com/es-es/azure/virtual-network/network-security-groups-overview). En este artículo, se describen las propiedades de una regla de grupo de seguridad de red, las reglas de seguridad predeterminadas que se aplican y las propiedades que puede modificar de las reglas.
    
- [Filtre el tráfico de red con grupos de seguridad de red en Azure Portal](https://learn.microsoft.com/es-es/azure/virtual-network/tutorial-filter-network-traffic). Obtenga información sobre cómo crear un grupo de seguridad de red y un grupo de seguridad de aplicaciones.
    
- [Cree, cambie o elimine un grupo de seguridad de red](https://learn.microsoft.com/es-es/azure/virtual-network/manage-network-security-group?tabs=network-security-group-portal). Obtenga información sobre cómo trabajar con grupos de seguridad de red y de aplicaciones.
    
- [Grupos de seguridad de aplicaciones](https://learn.microsoft.com/es-es/azure/virtual-network/application-security-groups). Obtenga información sobre los grupos de seguridad de aplicaciones y el control del tráfico con reglas.
    

## Más información con el aprendizaje autodirigido

- [Proteja y aísle el acceso a los recursos de Azure con grupos de seguridad de red y puntos de conexión de servicio (espacio aislado).](https://learn.microsoft.com/es-es/training/modules/secure-and-isolate-with-nsg-and-service-endpoints/) Obtenga información sobre cómo proteger las máquinas virtuales y los servicios de Azure frente al acceso de red no autorizado.
    
- [Filtre el tráfico de red con un grupo de seguridad de red mediante Azure Portal](https://learn.microsoft.com/es-es/training/modules/filter-network-traffic-network-security-group-using-azure-portal/). Aprenda a crear, configurar y aplicar grupos de seguridad de red para mejorar la seguridad de red.

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Azure Networking]]
