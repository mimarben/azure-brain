---
title: AZ-104 — Introducción a Azure Virtual Machines
aliases: ["Introducción a Azure Virtual Machines (AZ-104)"]
tags: [associate, compute]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/intro-to-azure-virtual-machines/
---

# AZ-104 — Introducción a Azure Virtual Machines

Módulo 13 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 3 — Implementación y administración de recursos de procesos de Azure · Área: Implementación y administración de recursos de procesos de Azure (20–25%).

## Concepto

Decisiones previas a crear una VM, opciones de creación y administración, extensiones y servicios de administración.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación de una máquina virtual (portal, CLI, PowerShell, ARM/Bicep)
> - Administración de los tamaños de máquina virtual (cambio de tamaño)
> - Administración de discos de máquinas virtuales (tipos, añadir/adjuntar)
> - Del mismo grupo (cubrir con labs): cifrado en el host, mover VM entre RG/suscripción/región

## Enlaces relacionados

**Módulo de Learn**: [Introducción a Azure Virtual Machines](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-virtual-machines/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-virtual-machines/))

**Savill**: buscar "VM" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Servicios de proceso de Azure (AZ-900)]]

**Laboratorio**: Lab 08 (Manage Virtual Machines) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)
## Objetivos de aprendizaje

En este módulo aprenderá a:

- Crear una lista de comprobación para crear una máquina virtual
- Describir las opciones para crear y administrar máquinas virtuales
- Describir los otros servicios disponibles para administrar máquinas virtuales



# Introducción.

Supongamos que trabaja para una empresa que lleva a cabo investigaciones médicas y que es responsable de administrar los servidores locales. Los servidores que administra ejecutan toda la infraestructura de la empresa, desde los servidores web hasta las bases de datos. Sin embargo, el hardware se está quedando obsoleto y empieza a tener dificultades para mantenerse al día con algunas de las nuevas aplicaciones de análisis de datos que se implementan en él.

Podría actualizar todo el hardware, pero esa opción no resulta atractiva por varias razones:

- Los servidores están físicamente dispersos por todo el mundo con un personal mínimo en cada ubicación. Nos gustaría centralizar la actualización en nuestra oficina principal.
    
- La empresa ejecuta un software de análisis de datos personalizado con varias versiones y distintas versiones de Windows y Linux, a veces con configuraciones extrañas no siempre comprensibles. Necesitamos una forma de probar nuestras implementaciones completamente y probar otras configuraciones diferentes para asegurarnos de que todo funciona antes de realizar la transición del trabajo.
    
- El negocio está en alza y la empresa está creciendo rápido. Es probable que la carga de los servidores internos, especialmente la de las bases de datos, continúe creciendo. Este crecimiento nos obliga a realizar nuevas compras en el futuro o a proponer un plan de escalado para administrar el crecimiento.
    

Por estos motivos, decide que es el momento de explorar la nube para ver si puede ayudarle a solucionar el problema de carga y de escalado. Como tiene varios servidores mixtos y software personalizado, es lógico intentar moverlos de uno en uno a Azure mediante máquinas virtuales (VM) de Azure.

Las máquinas virtuales de Azure son uno de los diversos tipos de recursos de proceso a petición y escalables que ofrece Azure. Con las máquinas virtuales, tiene un control total sobre la configuración y puede instalar todo lo que necesite para realizar el trabajo. No es necesario comprar hardware físico para escalar o ampliar su centro de datos. Por último, Azure proporciona otros servicios para supervisar, proteger y administrar las actualizaciones y revisiones del sistema operativo.

Vamos a observar las decisiones tomadas antes de crear una máquina virtual, las opciones para crear y administrar la máquina virtual, y las extensiones y servicios que usa para administrarla.

# Crear una lista de comprobación para crear una máquina virtual de Azure


La migración de los servidores locales a Azure requiere planeamiento y atención. Puede moverlos todos al mismo tiempo o, lo que es más probable, en lotes pequeños o incluso individualmente. Antes de crear una sola máquina virtual, debe reflexionar y esbozar el modelo de infraestructura actual y ver cómo puede asignarse a la nube.

## ¿Qué es un recurso de Azure?

Un **recurso de Azure** es un elemento fácil de administrar en Azure. Al igual que un equipo físico del centro de datos, las máquinas virtuales tienen varios elementos que son necesarios para realizar su trabajo:

- La propia máquina virtual
- Discos de almacenamiento
- Red de área virtual
- Una interfaz de red para comunicarse en la red virtual
- Grupo de seguridad de red (NSG) para proteger el tráfico de red
- Una dirección IP (pública, privada o ambas)

Azure crea todos estos recursos si es necesario, o bien puede proporcionar los ya existentes como parte del proceso de implementación. Cada recurso necesita un nombre, que se utiliza para identificarlo. Si Azure crea el recurso, usa el nombre de la máquina virtual para generar un nombre de recurso. Esta es otra razón por la que es muy importante mantener la coherencia de los nombres de máquina virtual.

## Recursos necesarios para las máquinas virtuales de IaaS

Vamos a repasar una lista de comprobación con los elementos sobre los que hay que reflexionar.

- La red
- Nombre de la máquina virtual
- Location
- El tamaño de la máquina virtual
- Discos
- Sistema operativo

## La red

Lo primero en lo que debe pensar no tiene nada que ver con la máquina virtual, sino con la red. Eche un vistazo a los servidores locales:

- ¿Con qué se comunica el servidor?
- ¿Qué puertos están abiertos?

Las redes virtuales se usan en Azure para proporcionar conectividad privada entre Azure Virtual Machines y otros servicios de Azure. Las máquinas virtuales y servicios que forman parte de la misma red virtual tienen acceso mutuo. De manera predeterminada, los servicios fuera de la red virtual no se pueden conectar a los servicios dentro de la red virtual. No obstante, puede configurar la red para permitir el acceso a un servicio externo, incluido el acceso a los servidores locales.

Esto último es el motivo por el que debe invertir algún tiempo en reflexionar sobre la configuración de la red. Las direcciones de red y las subredes no necesitan cambios triviales una vez que se configuran. Si pretende conectar la red privada de la empresa a los servicios de Azure, querrá estar seguro de que se tiene en cuenta la topología antes de poner en marcha una máquina virtual.

Cuando configura una red virtual, puede especificar los espacios de direcciones disponibles, las subredes y la seguridad. Si la red virtual se conecta a otras redes virtuales, es preciso seleccionar intervalos de direcciones que no se superpongan. Este es el intervalo de direcciones privadas que pueden usar las máquinas virtuales y los servicios de la red. Puede usar direcciones IP no enrutables, como 10.0.0.0/8, 172.16.0.0/12 o 192.168.0.0/16, o definir su propio intervalo. Azure trata todos los intervalos de direcciones como parte del espacio de direcciones IP de la red virtual privada si solo se puede acceder a esta desde dentro de la red virtual, desde dentro de redes virtuales interconectadas y desde su ubicación local. Si hay otro responsable de las redes internas, debe colaborar con esa persona antes de seleccionar el espacio de direcciones para asegurarse de que no hay ninguna superposición. Infórmele acerca del espacio que desea usar, con el fin de que no intente usar el mismo intervalo de direcciones IP.

### Segregación de la red

Después de decidir los espacios de direcciones de la red virtual, puede crear una o varias subredes. Crea estas subredes para dividir la red en secciones más fáciles de administrar. Por ejemplo, podría asignar 10.1.0.0 a las máquinas virtuales, 10.2.0.0 a los servicios back-end y 10.3.0.0 a las máquinas virtuales con SQL Server.

> [!NOTE] Nota:> 
> Azure reserva las cuatro primeras direcciones y la última de cada subred para uso interno.

### Protección de la red

De forma predeterminada, no hay ningún límite de seguridad entre subredes, por lo que los servicios de cada una de estas subredes pueden comunicarse entre sí. Sin embargo, se pueden configurar grupos de seguridad de red (NSG -> Network Security Group), que permiten controlar el flujo de tráfico que llega y sale tanto de las subredes como de las máquinas virtuales. Los grupos de seguridad de red actúan como firewalls de software que aplican reglas personalizadas a cada solicitud entrante o saliente en el nivel de interfaz de red y de subred. Así pues, puede controlar completamente cada solicitud de red que entra o sale de la máquina virtual.

## Planeamiento de la implementación de cada máquina virtual

Una vez que ha configurado la comunicación y los requisitos de red, puede empezar a pensar en las máquinas virtuales que desea crear. Una buena idea es seleccionar un servidor y hacer un inventario:

- ¿Qué sistema operativo se usa?
- ¿Cuánto espacio en disco está en uso?
- ¿Qué tipo de datos usa? ¿Hay restricciones (legales o de otra índole) en torno a cómo se almacenan o dónde se encuentran físicamente?
- ¿Qué tipo de CPU, memoria y carga de E/S de disco tiene el servidor? ¿Hay picos de tráfico que se deban tener en cuenta?

A continuación, podemos comenzar a dar respuesta a algunas de las preguntas de Azure con respecto a una nueva máquina virtual.

### Nombre de la máquina virtual

El nombre de la máquina virtual se usa como nombre del equipo, que está configurado como parte del sistema operativo. Puede especificar un nombre de hasta 64 caracteres en una máquina virtual de Linux y hasta 15 caracteres en una máquina virtual de Windows.

Este nombre también permite definir un **recurso de Azure** administrable y no es fácil de cambiar más tarde. Esto significa que debe elegir nombres que sean significativos y coherentes para que pueda identificar fácilmente qué hace la máquina virtual. Una buena convención es incluir la siguiente información en el nombre:

|Elemento|Ejemplo|Notas|
|---|---|---|
|Entorno|desarrollo, producción, control de calidad|Identifica el entorno del recurso|
|Location|`eus` para el Este de EE. UU., `jw` para el Oeste de Japón|Identifica la región en la que se implementa el recurso|
|Instancia|01, 02|Para los recursos que tienen más de una instancia con nombre (servidores web, etc.).|
|Producto o servicio|servicio|Identifica el producto, la aplicación o el servicio que admite el recurso|
|Rol|sql, web, mensajería|Identifica el rol del recurso asociado|

Por ejemplo, `deveus-webvm01` podría representar el primer servidor web de desarrollo hospedado en la ubicación Este de EE. UU.

### Decidir la ubicación de la máquina virtual

Azure tiene centros de datos distribuidos por todo el mundo dotados de servidores y discos. Estos centros de datos se agrupan en _regiones_ geográficas ("Oeste de EE. UU", "Norte de Europa", "Sudeste Asiático", etc) para proporcionar redundancia y disponibilidad.

Al crear e implementar una máquina virtual, debe seleccionar la región en la que quiere asignar los recursos. Puede colocar las máquinas virtuales lo más cerca posible de los usuarios para mejorar el rendimiento y cumplir con todos los requisitos legales, de cumplimiento o fiscales.

Otras dos cosas en las que pensar con respecto a la opción de ubicación. En primer lugar, la ubicación puede limitar las opciones disponibles. Cada región tiene un hardware diferente disponible y algunas configuraciones no están disponibles en todas las regiones. En segundo lugar, hay diferencias de precio entre las ubicaciones. Si la carga de trabajo no está enlazada a una ubicación específica, puede ser muy rentable comprobar la configuración necesaria en varias regiones para encontrar el precio más bajo.

### Determinación del tamaño de la máquina virtual

Una vez que ha establecido el nombre y la ubicación, debe decidir [el tamaño de la máquina virtual](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes). En lugar de especificar la capacidad de procesamiento, memoria y almacenamiento por separado, Azure proporciona diferentes _tamaños de máquina virtual_ que ofrecen variaciones de estos elementos en diferentes tamaños. Azure proporciona una amplia gama de opciones de tamaño de máquina virtual, lo que le permite seleccionar la combinación adecuada de capacidad de proceso, memoria y almacenamiento para las tareas que desea realizar.

La mejor manera de determinar el tamaño de máquina virtual adecuado es tener en cuenta el tipo de carga de trabajo que la máquina virtual debe ejecutar. Según la carga de trabajo, podrá elegir entre un subconjunto de tamaños de máquina virtual disponibles. Las opciones de carga de trabajo se clasifican como se indica a continuación en Azure:

|Opción|Descripción|
|---|---|
|[De uso general](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes-general)|Los tamaños de máquina virtual de uso general están diseñados para proporcionar una relación equilibrada entre CPU y memoria. Ideal para desarrollo y pruebas, bases de datos pequeñas o medianas, y servidores web de tráfico bajo o medio.|
|[Optimizada para proceso](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes-compute)|Las máquinas virtuales optimizadas para proceso están diseñadas para proporcionar una relación alta entre CPU y memoria. Es un tamaño adecuado para servidores web de tráfico medio, aplicaciones de red, procesos por lotes y servidores de aplicaciones.|
|[Optimizada para memoria](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes-memory)|Las máquinas virtuales optimizadas para memoria están diseñadas para proporcionar una relación alta entre memoria y CPU. Excelente para servidores de bases de datos relacionales, memorias caché de capacidad media o grande y análisis en memoria.|
|[Optimizada para almacenamiento](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes-storage)|Las máquinas virtuales optimizadas para almacenamiento están diseñadas para tener un alto rendimiento de disco y E/S. Es un tamaño ideal para máquinas virtuales que ejecutan bases de datos.|
|[GPU](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes-gpu)|Las máquinas virtuales de GPU son máquinas virtuales especializadas específicas para la representación de gráficos pesados y la edición de vídeo. Estas máquinas virtuales son la opción ideal para el entrenamiento de modelos y la realización de inferencias con aprendizaje profundo.|
|[Proceso de alto rendimiento](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes-hpc)|Las de informática de alto rendimiento son las máquinas virtuales de CPU más rápidas y potentes con interfaces de red de alto rendimiento opcionales.|

Podrá filtrar según el tipo de carga de trabajo cuando configure el tamaño de máquina virtual de Azure. El tamaño que elija influye directamente en el costo del servicio. Cuanto mayor sea la capacidad de CPU, memoria y GPU que necesite, mayor será el precio.

### ¿Qué ocurre si mis necesidades de tamaño cambian?

Azure le permite cambiar el tamaño de la máquina virtual cuando el tamaño existente ya no cumpla con sus necesidades. Puedes actualizar o cambiar a una versión anterior la máquina virtual, siempre y cuando se permita la configuración del hardware actual en el nuevo tamaño. La capacidad de cambiar el tamaño de la máquina virtual proporciona un enfoque totalmente ágil y escalable para la administración de máquinas virtuales.

Se puede cambiar el tamaño de máquina virtual mientras esta se está ejecutando, siempre que el nuevo tamaño esté disponible en el clúster de hardware actual en el que se está ejecutando la máquina virtual. Azure Portal hace que las opciones de tamaño resulten evidentes mostrándole solo las opciones de tamaño disponibles. Las herramientas de línea de comandos notifican un error si intenta cambiar el tamaño de una máquina virtual a un tamaño que no está disponible. Cambiar el tamaño de una máquina virtual en ejecución hace que esta se reinicie de forma automática para completar la solicitud.

Si detiene y desasigna la máquina virtual, entonces puede seleccionar cualquier tamaño disponible en su región, ya que la desasignación quita la máquina virtual del clúster en el que se estaba ejecutando.

> [!WARNING] Advertencia
> Tenga cuidado al cambiar el tamaño de las máquinas virtuales de producción, ya que se reiniciarán automáticamente, lo que puede provocar una interrupción temporal y cambiar algunos valores de configuración, como la dirección IP.

### Partes de una máquina virtual y cómo se facturan

Al crear una máquina virtual, también va a crear recursos que admitan la máquina virtual. Estos recursos incluyen sus propios costos, que se deben tener en cuenta.

Los recursos predeterminados que admiten una máquina virtual y cómo se facturan se detallan en la tabla siguiente:

|Resource|Descripción|Coste|
|---|---|---|
|Red de área virtual|Para proporcionar a la máquina virtual la capacidad de comunicarse con otros recursos|[Precios de Virtual Network](https://azure.microsoft.com/pricing/details/virtual-network/)|
|Una tarjeta de interfaz de red virtual (NIC)|Para conectarse a la red virtual|No hay ningún costo específico para las NIC. Sin embargo, hay un límite para el número de NIC que puede usar en función del [tamaño de la máquina virtual](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes). Ajuste el tamaño de la máquina virtual en consecuencia y consulte los [precios de máquina virtual](https://azure.microsoft.com/pricing/details/virtual-machines/linux/).|
|Una dirección IP privada y a veces una dirección IP pública.|Para la comunicación y el intercambio de datos en la red propia y con redes externas|[Precios de direcciones IP](https://azure.microsoft.com/pricing/details/ip-addresses/)|
|Grupo de seguridad de red (NSG)|Para administrar el tráfico de red también y desde la máquina virtual. Por ejemplo, es posible que tenga que abrir el puerto 22 para el acceso SSH, pero es posible que desee bloquear el tráfico al puerto 80. El bloqueo y la habilitación del acceso al puerto se realiza a través del grupo de seguridad de red.|No hay cargos adicionales por los grupos de seguridad de red en Azure.|
|Disco del sistema operativo y posiblemente discos independientes para los datos.|Se recomienda mantener los datos en un disco independiente del sistema operativo, ya que, en caso de que alguna vez se produzca un error en una máquina virtual, simplemente puede desasociar el disco de datos y conectarlo a una nueva máquina virtual.|Todas las máquinas virtuales nuevas tienen un disco de sistema operativo y un disco local.  <br>Azure no aplica ningún cargo por el almacenamiento en disco local.  <br>El cargo que se aplica por el disco del sistema operativo, que normalmente es de 127 GiB pero que es más pequeño para algunas imágenes, es la [tarifa normal de los discos](https://azure.microsoft.com/pricing/details/managed-disks/).  <br>Puede ver el costo de conectar discos prémium (basados en SSD) y estándar (basados en HDD) a las máquinas virtuales en la [página de precios de Managed Disks](https://azure.microsoft.com/pricing/details/managed-disks/).|
|En algunos casos, una licencia para el sistema operativo|Para proporcionar las ejecuciones de la máquina virtual para ejecutar el sistema operativo|El costo varía en función del número de núcleos de la máquina virtual, por lo que debe [ajustar el tamaño de la máquina virtual en consecuencia](https://learn.microsoft.com/es-es/azure/virtual-machines/sizes). El costo se puede reducir a través de la [Ventaja híbrida de Azure](https://azure.microsoft.com/pricing/hybrid-benefit/#overview).|

### Descripción del modelo de precios

Hay dos costos independientes por los que se cobra en la suscripción de cada máquina virtual: proceso y almacenamiento. Al separar estos costos, los puede escalar por separado y pagar solo por lo que necesita.

**Costos de proceso**: los gastos de proceso tienen un precio por horas pero se facturan por minutos. Por ejemplo, solo se le cobrarán 55 minutos de uso si la máquina virtual se implementa durante ese tiempo. No se le cobrará por la capacidad de proceso si detiene y desasigna la máquina virtual ya que la desasignación libera el hardware. El precio por horas varía en función del tamaño de máquina virtual y del sistema operativo que seleccione. Las instancias basadas en Linux son más baratas porque no hay gastos por licencia del sistema operativo. Para Windows, el costo de una máquina virtual incluye los gastos por el sistema operativo.

> [!TIP] Sugerencia
> Puede ahorrar dinero mediante la reutilización de las licencias existentes con la **Ventaja híbrida de Azure** para [Linux](https://learn.microsoft.com/es-es/azure/virtual-machines/linux/azure-hybrid-benefit-linux) o [Windows](https://learn.microsoft.com/es-es/azure/virtual-machines/windows/hybrid-use-benefit-licensing).> 
> Podrá elegir entre dos opciones de pago para los costos de proceso.

|Opción|Descripción|
|---|---|
|**Pago por uso**|Con la opción de **pago por uso**, paga por la capacidad de proceso por segundo, sin ningún tipo de compromiso a largo plazo ni pago por adelantado. Podrá aumentar o disminuir la capacidad de proceso a petición, así como iniciarla o detenerla en cualquier momento. Seleccione esta opción si ejecuta aplicaciones con cargas de trabajo a corto plazo o impredecibles que no se pueden interrumpir. Por ejemplo, si va a realizar una prueba rápida o a desarrollar una aplicación en una máquina virtual, el **pago por uso** es la opción adecuada.|
|**Instancias reservadas de máquina virtual**|La opción de instancias reservadas de máquina virtual (RI) es una compra por adelantado de una máquina virtual para uno o tres años en una región determinada. El compromiso se realiza por adelantado y, a cambio, se obtiene una rebaja en el precio de hasta un 72 % en comparación con los precios de pago por uso. Las **instancias reservadas** son flexibles y se pueden intercambiar o devolver fácilmente a cambio de una tarifa por cancelación anticipada. Seleccione esta opción si la máquina virtual debe estar en ejecución continuamente o si necesita realizar una estimación presupuestaria, **y** puede comprometerse a usar la máquina virtual durante un año como mínimo.|

**Costes de almacenamiento**: se le cobran por separado en función del almacenamiento que usa la máquina virtual. El estado de la máquina virtual no tiene ninguna relación con los cargos de almacenamiento en los que se incurre. Si la máquina virtual está detenida o desasignada y no se le factura por la máquina virtual en ejecución, se le seguirá cobrando por el almacenamiento que usan los discos.

### Almacenamiento de la máquina virtual

Todas las máquinas virtuales de Azure tienen al menos dos discos duros virtuales (VHD). El primer disco almacena el sistema operativo y el segundo se usa como almacenamiento temporal. Debe agregar más discos de datos para almacenar los datos de la aplicación. Separar los datos en discos diferentes le permite administrar los discos de forma independiente. El tamaño de la máquina virtual determina el número máximo de discos de datos que puede conectar a la máquina virtual, normalmente dos por vCPU.

Hay cinco tipos de disco, cada uno destinado a abordar un escenario de cliente específico:

- [Discos Ultra](https://learn.microsoft.com/es-es/azure/virtual-machines/disks-types#ultra-disks)
- [SSD prémium v2 (versión preliminar)](https://learn.microsoft.com/es-es/azure/virtual-machines/disks-types#premium-ssd-v2-preview)
- [Discos SSD prémium (unidades de estado sólido)](https://learn.microsoft.com/es-es/azure/virtual-machines/disks-types#premium-ssds)
- [Discos SSD estándar](https://learn.microsoft.com/es-es/azure/virtual-machines/disks-types#standard-ssds)
- [Discos HDD estándar (unidades de disco duro)](https://learn.microsoft.com/es-es/azure/virtual-machines/disks-types#standard-hdds)

En la tabla siguiente se proporciona una comparación de los cinco tipos de disco para ayudarle a decidir cuál usar.

|Disco Ultra|SSD prémium v2|SSD Premium|SSD estándar|HDD estándar|
|---|---|---|---|---|---|
|Tipo de disco|SSD|SSD|SSD|SSD|HDD|
|Escenario|Cargas de trabajo de uso intensivo de E/S, como [SAP HANA](https://learn.microsoft.com/es-es/azure/virtual-machines/workloads/sap/hana-vm-operations-storage), bases de datos de nivel superior (por ejemplo, SQL y Oracle) y otras cargas de trabajo con muchas transacciones.|Cargas de trabajo de producción y sensibles al rendimiento que requieren constantemente baja latencia, un alto número de IOPS y rendimiento elevado|Cargas de trabajo delicadas de producción y rendimiento|Servidores web, aplicaciones empresariales poco utilizadas y desarrollo y pruebas|Copia de seguridad, no crítico, acceso poco frecuente|
|Tamaño máximo del disco|65 536 gibibytes (GiB)|65 536 GiB|32 767 GiB|32 767 GiB|32 767 GiB|
|Rendimiento máx.|4000 MB/s|1200 MB/s|900 MB/s|750 MB/s|500 MB/s|
|IOPS máx.|160 000|80 000|20.000|6,000|2\.000|
|¿Se puede usar como disco del sistema operativo?|No|No|Sí|Sí|Sí|

### Selección de un sistema operativo

Azure proporciona varias imágenes del sistema operativo que puede instalar en la máquina virtual, incluidas muchas distribuciones de Linux. La elección del sistema operativo puede influir en el precio por horas de proceso ya que Azure incluye el costo por la licencia del sistema operativo en el precio.

Si busca algo más que imágenes básicas del sistema operativo, puede buscar en Azure Marketplace imágenes más sofisticadas que incluyan el sistema operativo y las herramientas de software más conocidas para escenarios específicos. Por ejemplo, si necesita un nuevo sitio de WordPress, el componente tecnológico estándar debe consistir en un servidor Linux, un servidor web Apache, una base de datos MySQL y PHP. En lugar de instalar y configurar cada componente, puede usar una imagen de Marketplace e instalar todo el componente completo a la vez.

Por último, si no encuentra una imagen de sistema operativo adecuada, puede crear las suyas propias con lo que necesita y usarlas para crear máquinas virtuales. Puede crear imágenes individuales para usarlas en desarrollo y pruebas. Puede crear una instancia de [Azure Compute Gallery](https://learn.microsoft.com/es-es/azure/virtual-machines/azure-compute-gallery) para administrar varias imágenes y replicarlas en las regiones en las que se necesitan.
# Ejercicio: Creación de una máquina virtual desde Azure Portal.















## Relacionado
- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Servicios de proceso de Azure (AZ-900)]]
