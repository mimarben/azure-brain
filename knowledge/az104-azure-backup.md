---
title: AZ-104 — Introducción a Azure Backup
aliases: ["Introducción a Azure Backup (AZ-104)"]
tags: [associate, backup]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/
---

# AZ-104 — Introducción a Azure Backup

Módulo 26 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 5 — Supervisión y copia de seguridad de recursos de Azure · Área: Supervisión y mantenimiento de recursos de Azure (10–15%).

## Concepto

Azure Backup como servicio: bóvedas de Recovery Services vs almacenes de Backup, y políticas de copia de seguridad.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Crear una bóveda de servicios de recuperación (Recovery Services vault)
> - Creación de un almacén de Azure Backup (Backup vault) — y cuál usar para cada workload
> - Creación y configuración de una directiva de copia de seguridad

> **Gap del examen**: **Azure Site Recovery** (configurar, failover a región secundaria) es objetivo explícito sin módulo propio — cubrir con [docs de Site Recovery](https://learn.microsoft.com/en-us/azure/site-recovery/) ([ES](https://learn.microsoft.com/es-es/azure/site-recovery/)).

## Enlaces relacionados

**Módulo de Learn**: [Introducción a Azure Backup](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/) ([ES](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/))

**Savill**: buscar "backup" / "site recovery" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: —

**Laboratorio**: Lab 10 (Implement Data Protection) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](create-vm.md)



# # Introducción.

Los trabajadores de tecnología de la información comprenden la importancia de los datos para la organización. La necesidad de proteger esos datos determina las decisiones en torno al almacenamiento, las copias de seguridad y la seguridad. Muchas empresas implementan directivas que dictan las especificaciones de copia de seguridad con respecto a la frecuencia, la duración del almacenamiento de la copia y las directivas de restauración.

En escenarios locales, las soluciones de copia de seguridad pueden haber incluido soluciones de almacenamiento con redundancia local o almacenamiento fuera del sitio. Los escenarios donde se usan copias de seguridad en unidades de cinta y almacenamiento fuera del sitio llevan consigo el retraso resultante con la restauración de los datos (por la necesidad de transportar las cintas de vuelta a las salas de servidores y realizar la operación de restauración). Esto puede dar lugar a un tiempo de inactividad significativo.

Estas soluciones de copia de seguridad no siempre pueden abordar algunas de las cuestiones más importantes, como la seguridad de las copias de seguridad, la posibilidad de que la empresa se pueda ver afectada por un ataque de ransomware o los errores humanos en las operaciones de copia de seguridad y restauración. Una solución idónea debería ser rentable, fácil de usar y segura. Y aquí es donde entra en juego Azure Backup.

![Diagram of a backup scenario with a company's servers and workstations on the left, with files and folders, using the Backup Agent to back up the data to Microsoft Azure storage.](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-backup/media/architecture-on-premises-mars.png)

Azure Backup también puede abordar escenarios en los entornos de Azure gracias a la compatibilidad con:

- Máquinas virtuales de Azure
- Azure Managed Disks
- Azure Files
- SQL Server en máquinas virtuales de Azure
- Bases de datos SAP HANA en máquinas virtuales de Azure
- Servidores de Azure Database for PostgreSQL
- Azure Blobs
- Azure Database for PostgreSQL: servidores flexibles
- Azure Database for MySQL: servidores flexibles
- Clúster de Azure Kubernetes
## Escenario de ejemplo

Va a ejecutar una aplicación con tecnología de SQL Server. La base de datos se ejecuta en un grupo de disponibilidad AlwaysOn en tres máquinas virtuales de Azure. Quiere realizar una copia de seguridad de las bases de datos mediante un servicio de copia de seguridad nativo de Azure. Busca almacenar la copia de seguridad durante 10 años en un almacenamiento más económico para hacer frente a sus necesidades de auditoría y cumplimiento. Le gustaría supervisar diariamente los trabajos de copia de seguridad de todas estas bases de datos.

![Diagrama de una aplicación que usa una base de datos de back-end de SQL Server y Azure Backup en escenarios de copia de seguridad de datos.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/scenario.png)

## ¿Qué hará?

Evaluaremos las características y funcionalidades de Azure Backup para ayudarle a decidir si:

- Azure Backup puede ofrecer una solución para sus necesidades de copia de seguridad.
- Puede realizar una copia de seguridad de los datos y restaurarlos de acuerdo con las necesidades de la organización.
- Azure Backup ofrece almacenamiento seguro de los datos.

## ¿Cuál es el objetivo principal?

Al final de esta sesión, podrá decidir si Azure Backup es la solución adecuada que debe tener en cuenta para sus necesidades de protección de datos.


# ¿Qué es Azure Backup?

Comencemos definiendo Azure Backup y realizando un recorrido rápido por las características principales. Esta introducción debe ayudarle a decidir si Azure Backup podría ser una buena opción para sus necesidades de protección de datos.

## ¿Qué es Azure Backup?

El servicio Azure Backup proporciona soluciones sencillas, seguras y rentables tanto para realizar copias de seguridad de datos de la nube de Microsoft Azure como para recuperarlos.

![Diagrama del servicio Azure Backup que implementa agentes de copia de seguridad del entorno local a la nube. En la sección central se muestran los componentes de Azure Backup de seguridad y escalabilidad con una barra subyacente que indica la administración central.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/azure-backup-overview.png)

## Definición de Azure Backup

Azure Backup es un servicio de Azure que proporciona soluciones de copia de seguridad rentables, seguras y sin necesidad de infraestructura para todos los recursos de datos administrados por Azure.

La interfaz de administración centralizada facilita la definición de directivas de copia de seguridad y la protección de una amplia variedad de cargas de trabajo empresariales, como Azure Virtual Machines, Azure Disks, bases de datos SQL y SAP, y recursos compartidos de archivos y blobs de Azure.

![Diagrama de la arquitectura de Azure Backup en el que se muestran las cargas de trabajo en la parte inferior, que ascienden al plano de datos y se conectan al plano de administración. La administración contiene directivas de copia de seguridad, directivas de Azure, Azure Monitor y servicios Azure Lighthouse.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/azure-backup-architecture.png)

## Cuándo usar Azure Backup

Como administrador de TI de su organización, es responsable de satisfacer las necesidades de cumplimiento de todos los recursos de datos de la empresa y la copia de seguridad es un aspecto crítico. También hay varios administradores de aplicaciones en su empresa que necesitan realizar copias de seguridad y restauración de autoservicio para ocuparse de problemas como daños en los datos o escenarios de administración no autorizada. Está buscando una solución de copia de seguridad de clase empresarial para proteger todas sus cargas de trabajo y administrarlas desde un lugar central.

Azure Backup puede proporcionar servicios de copia de seguridad para los siguientes activos de datos:

- Archivos, carpetas y estado del sistema locales
- Máquinas virtuales de Azure (VM)
- Azure Managed Disks
- Recursos compartidos de Azure Files
- SQL Server en máquinas virtuales de Azure
- Bases de datos SAP HANA (dispositivo analítico de alto rendimiento) en Azure Virtual Machines
- Azure Database para servidores PostgreSQL
- Blobs de Azure
- Azure Database for PostgreSQL: servidores flexibles
- Azure Database for MySQL: servidores flexibles
- Clúster de Azure Kubernetes

![Captura de pantalla del centro de Azure Backup en la que se muestra una lista delos trabajos de copia de seguridad, con la instancia de copia de seguridad, el origen de datos, el tipo de operación y el estado.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/backup-center-jobs.png)

## Características principales

Echemos un vistazo a algunas de las características principales de Azure Backup.

|Característica|Descripción|Uso|
|---|---|---|
|Solución de copia de seguridad sin infraestructura|A diferencia de las soluciones de copia de seguridad convencionales, no se necesita ningún servidor ni infraestructura de copia de seguridad. Del mismo modo, no es necesario implementar ningún almacenamiento de copia de seguridad, ya que Azure Backup lo administra y escala automáticamente.|La solución sin infraestructura elimina los gastos de capital y reduce los gastos operativos. Además, aumenta la facilidad de uso al automatizar la administración del almacenamiento.|
|Administración a gran escala|Administre de forma nativa todo el patrimonio de copia de seguridad desde una consola central llamada Centro de copia de seguridad. Use las API, PowerShell y la CLI de Azure para automatizar las configuraciones de directivas y seguridad de las copias.|El centro de copia de seguridad simplifica la administración de la protección de datos a escala al permitirle detectar, controlar, supervisar, operar y optimizar la administración de copias de seguridad desde una consola unificada, lo que le ayuda a impulsar la eficacia operativa con Azure.|
|Seguridad|Azure Backup ofrece seguridad integrada al entorno de copia de seguridad, tanto si los datos están en tránsito como en reposo, mediante funcionalidades como cifrado, puntos de conexión privados, alertas, etc.|Las copias de seguridad se protegen automáticamente contra ransomware, administradores malintencionados y eliminaciones accidentales.|

## ¿Cómo funciona el objetivo de tiempo de recuperación y el objetivo de punto de recuperación?

El objetivo de tiempo de recuperación (RTO) es el tiempo objetivo en el que se debe restaurar un proceso empresarial después de que se produzca un desastre para evitar consecuencias inaceptables. Por ejemplo, si una aplicación crítica deja de funcionar debido a un error del servidor y la empresa solo puede tolerar un máximo de cuatro horas de tiempo de inactividad, el RTO es de cuatro horas.

El objetivo de punto de recuperación (RPO) es la cantidad máxima de pérdida de datos, medida en tiempo, que su organización puede soportar durante un evento.

En el escenario de ejemplo siguiente se describen los conceptos de RPO y RTO:

Su organización tiene un RPO de una hora para la base de datos del cliente, lo que significa que realiza copias de seguridad cada hora. Si se produce un incidente de pérdida de datos, no perderá más de una hora de datos. Cuando se establece el RPO en tres horas, si se produce un fallo en el sistema, el objetivo es restaurar el acceso a la base de datos en un plazo de tres horas para minimizar el impacto en las operaciones.

# Cómo funciona Azure Backup.

Vamos a ver cómo funciona Azure Backup para proporcionar la protección de datos que necesita. En particular, echemos un vistazo a cómo los distintos aspectos del servicio de copia de seguridad facilitan la copia de seguridad de varios tipos de datos y cómo ofrece también seguridad para las copias de seguridad. En esta unidad, tratamos los siguientes aspectos del servicio Azure Backup:

- **Capa de integración de cargas de trabajo: extensión de copia de seguridad**: La integración con la carga de trabajo real, como máquinas virtuales (VM) de Azure o blobs de Azure, se produce en esta capa.
- **Plano de datos: niveles de acceso**: Hay tres niveles de acceso donde se podrían almacenar las copias de seguridad:
    - Nivel de instantánea
    - Nivel estándar
    - nivel de archivo
- **Plano de datos: disponibilidad y seguridad**: Los datos de copia de seguridad se replican entre zonas o regiones, en función de la redundancia que especifica el usuario.
- **Almacén de plano de administración – Recovery Services/Almacén de Backup y centro de copia de seguridad**: El almacén proporciona una interfaz para que el usuario interactúe con el servicio de copia de seguridad.

## ¿Qué datos se copian y cómo?

La explicación más sencilla de Azure Backup es que realiza una copia de seguridad de los datos, el estado de la máquina y las cargas de trabajo que se ejecutan en máquinas locales e instancias de máquina virtual en la nube de Azure. Azure Backup almacena los datos de copia de seguridad en almacenes de Recovery Services y de copia de seguridad.

En las máquinas Windows locales, puede hacer una copia de seguridad directamente en Azure mediante el agente de Microsoft Azure Recovery Services (MARS) de Azure Backup. Como alternativa, puede realizar copias de seguridad de estas máquinas Windows en un servidor de copia de seguridad, quizás un Administrador de protección de datos de System Center (DPM) o Microsoft Azure Backup Server (MABS). Después, puede hacer una copia de seguridad de ese servidor en un almacén de Recovery Services en Azure.

Si usa máquinas virtuales de Azure, puede hacer una copia de seguridad de ellas directamente. Azure Backup instala una extensión de copia de seguridad en el agente de máquina virtual de Azure que se ejecuta en la máquina virtual, lo que le permite realizar una copia de seguridad de toda la máquina virtual. Si solo quiere realizar copias de seguridad de archivos y carpetas de la máquina virtual, puede hacerlo con el agente de MARS.

Azure Backup almacena los datos de copia de seguridad en almacenes: almacenes de Recovery Services y de Backup. Un almacén es una entidad de almacenamiento en línea de Azure que se usa para contener datos, como copias de seguridad, puntos de recuperación y directivas de copia de seguridad.

### Tipos de copia de seguridad admitidos

Azure Backup admite copias de seguridad completas y copias de seguridad incrementales. La copia de seguridad inicial es una copia de seguridad completa. DPM/MABS usan la copia de seguridad incremental para las copias de seguridad de disco y todas las copias de seguridad en Azure también usan copias de seguridad incrementales. Como sugiere el nombre, las copias de seguridad incrementales solo se centran en los bloques de datos que han cambiado desde la copia de seguridad anterior.

Azure Backup admite también cintas de copia de seguridad de SQL Server. En la tabla siguiente se describe la compatibilidad con las copias de seguridad de tipo SQL Server:

|Tipo|Descripción|Uso|
|---|---|---|
|Completo|una copia de seguridad completa de la base de datos realiza una copia de seguridad de toda la base de datos. Contiene todos los datos de una base de datos específica o de un conjunto de archivos o grupos de archivos. Una copia de seguridad completa también contiene suficientes registros para recuperar esos datos.|A lo sumo, puede desencadenar una copia de seguridad completa al día. Puede elegir realizar una copia de seguridad completa en un intervalo diario o semanal.|
|Diferencial|Una copia de seguridad diferencial se basa en la copia de seguridad de datos completa más reciente. Captura solo los datos que han cambiado desde la copia de seguridad completa.|A lo sumo, puede desencadenar una copia de seguridad diferencial al día. No se puede configurar una copia de seguridad completa y una copia de seguridad diferencial en el mismo día.|
|Varias copias de seguridad por día|Realice una copia de seguridad de las máquinas virtuales de Azure cada hora con un objetivo de punto de recuperación (RPO) mínimo de 4 horas y un máximo de 24 horas.|Puede usar la directiva de copia de seguridad mejorada para establecer la programación de copia de seguridad en 4, 6, 8, 12 y 24 horas (respectivamente) para nuevas ofertas de Azure, como la máquina virtual de inicio seguro.|
|Copia de seguridad de discos selectiva|Realice una copia de seguridad selectiva de un subconjunto de los discos de datos que están conectados a la máquina virtual y, a continuación, restaure un subconjunto de los discos que están disponibles en un punto de recuperación, tanto desde la restauración instantánea como desde el nivel de almacén. La copia de seguridad selectiva de discos le ayuda a administrar los datos críticos en un subconjunto de los discos de máquina virtual y a usar soluciones de copia de seguridad de bases de datos cuando solo desea realizar una copia de seguridad de su disco del sistema operativo para reducir el costo.|Azure Backup proporciona la funcionalidad de Copia de seguridad y restauración de discos selectiva mediante la directiva de copia de seguridad mejorada.|
|Registro de transacciones|una copia de seguridad de registros permite realizar la restauración a un momento dado con una precisión de un segundo.|A lo sumo, puede configurar las copias de seguridad del registro de transacciones cada 15 minutos.|

## Capa de integración de cargas de trabajo: extensión de copia de seguridad

Se instala una extensión de copia de seguridad, específica de cada carga de trabajo, en la máquina virtual de origen o en una máquina virtual de trabajo. En el momento de la copia de seguridad (según lo definido por el usuario en la directiva de copia de seguridad), la extensión de copia de seguridad genera la copia de seguridad, que podría ser:

- **Almacenamiento**: Instantáneas al usar una máquina virtual de Azure o Azure Files.
    
- **Copia de seguridad de secuencias**: Para las bases de datos como SQL o el dispositivo analítico de alto rendimiento (HANA) que se ejecutan en máquinas virtuales.
    

Los datos de copia de seguridad se transfieren finalmente al almacenamiento administrado de Azure Backup en el plano de datos mediante grupos de seguridad de red (NSG) seguros de redes de Azure, firewalls o puntos de conexión privados más sofisticados.

## Plano de datos: niveles de acceso

Hay tres niveles de acceso en los que se pueden almacenar las copias de seguridad:

- **Nivel de instantánea**: (Término específico de la carga de trabajo) En la primera fase de una copia de seguridad de máquina virtual, la instantánea se toma y almacena junto con el disco. Esta forma de almacenamiento se conoce como un nivel de instantánea. Restaurar un nivel de instantánea es más rápido que restaurar desde un almacén, ya que elimina el tiempo de espera para que las instantáneas se copien del almacén antes de desencadenar la operación de restauración. Las instantáneas de vm/Azure Files/Azure Blobs/etc. se conservan en la suscripción del cliente en un grupo de recursos especificado. Este contenedor garantiza que las restauraciones son rápidas, ya que la copia de seguridad o instantánea está disponible localmente para el cliente.
    
- **Nivel estándar de Almacén**: Los datos de copia de seguridad de todas las cargas de trabajo compatibles con Azure Backup se almacenan en almacenes, que contienen almacenamiento de copia de seguridad, un conjunto de escalado automático de cuentas de almacenamiento administradas por Azure Backup. El nivel estándar de Almacén es un nivel de almacenamiento en línea que permite almacenar una copia aislada de los datos de copia de seguridad en un inquilino administrado por Microsoft, lo que crea una capa adicional de protección. En el caso de las cargas de trabajo en las que se admite el nivel de instantánea, hay una copia de los datos de copia de seguridad tanto en el nivel de instantánea como en el nivel estándar del almacén. El nivel estándar de Almacén garantiza que los datos de copia de seguridad estén disponibles incluso si el origen de datos del que se realiza la copia de seguridad se elimina o se pone en peligro.
    
- **Nivel de acceso de archivo**: Los clientes dependen de Azure Backup para almacenar datos de copia de seguridad, incluidos sus datos de copia de seguridad de retención a largo plazo (LTR), con necesidades de retención definidas en las reglas de cumplimiento de la organización. En la mayoría de los casos, pocas veces se accede a los datos de copia de seguridad antiguos, que solo se almacenan para satisfacer las necesidades de cumplimiento.
    
    Azure Backup admite la copia de seguridad de puntos de retención a largo plazo en el nivel de archivo.
    

Todos los niveles ofrecen diferentes objetivos de tiempo de recuperación (RTO) y tienen un precio diferente.

![Diagrama de las diversas cargas de trabajo, como servidores locales, máquinas virtuales de Azure, archivos de Azure, etc., que alimentan el plano de datos donde se encuentran los niveles de acceso.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/data-plane.png)

## Plano de datos: disponibilidad y seguridad

Los datos de copia de seguridad se replican entre zonas o regiones, en función de la redundancia que especifique. Puede elegir entre almacenamiento con redundancia local (LRS), almacenamiento con redundancia geográfica (GRS) o almacenamiento con redundancia de zona (ZRS). Estas opciones proporcionan funcionalidades de almacenamiento de datos de alta disponibilidad.

Los datos se mantienen seguros mediante el cifrado y la implementación del control de acceso basado en rol (RBAC) de Azure. Puede elegir quién puede realizar operaciones de copia de seguridad y restauración. Azure Backup también proporciona protección contra la eliminación malintencionada de la copia de seguridad mediante operaciones de eliminación temporal. Una copia de seguridad eliminada se almacena durante 14 días, de forma gratuita, lo que le permite recuperarla si es necesario.

Azure Backup también admite un escenario de administración del ciclo de vida de los datos de copia de seguridad que le permite cumplir con las directivas de retención.

![Gráfico que muestra las tres opciones de seguridad: RBAC de Azure, cifrado y eliminación temporal, en forma de iconos.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/built-in-security.png)

## Plano de administración: almacén de Recovery Services, almacén de Backup y Centro de copias de seguridad.

Azure Backup usa almacenes de Recovery Services y almacenes de Backup para orquestar y administrar copias de seguridad. y para almacenar los datos con copia de seguridad realizada. El almacén proporciona una interfaz para que el usuario interactúe con el servicio de copia de seguridad. Las directivas de Azure Backup dentro de cada almacén definen cuándo se deben desencadenar las copias de seguridad y cuánto tiempo deben conservarse.

Puede usar un solo almacén o varios almacenes para organizar y administrar la copia de seguridad. Si administra las cargas de trabajo con una sola suscripción y un único recurso, puede usar un único almacén para supervisar y administrar el patrimonio de copias de seguridad. Si las cargas de trabajo se distribuyen entre varias suscripciones, puede crear varios almacenes con uno o varios almacenes por suscripción.

![Diagrama del plano de administración. El almacén de Recovery Services muestra las opciones de directivas de copia de seguridad y administración con el portal, el SDK o la interfaz de la línea de comandos (CLI).](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/backup-vaults.png)

El Centro de copias de seguridad permite administrar todas las tareas relacionadas con las copias de seguridad desde un único panel. Este centro está diseñado para funcionar bien en entornos de Azure grandes y distribuidos. Puede usar el Centro de copias de seguridad para administrar de forma eficaz las copias de seguridad que abarcan varios tipos de cargas de trabajo, almacenes, suscripciones, regiones e inquilinos de Azure Lighthouse.

![Captura de pantalla de la interfaz de usuario del Centro de copias de seguridad en Azure Portal en la que se muestra información de copia de seguridad de máquinas virtuales de Azure relacionadas con trabajos e instancias de copia de seguridad.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/backup-center.png)

---


# Cuándo usar Azure Backup.

Aquí se describe cómo puede decidir si Azure Backup es la opción adecuada para sus necesidades de protección de datos. En esta unidad, se resaltan los escenarios comunes de copia de seguridad en los que Azure Backup proporciona ventajas, como:

- Garantía de disponibilidad de los datos.
- Protección de las cargas de trabajo de Azure.
- Protección de los datos.

## Criterios de decisión

Azure Backup es un servicio de Azure que proporciona soluciones de copia de seguridad seguras y sin necesidad de infraestructura para todos los recursos de datos administrados por Azure. Protege una amplia gama de cargas de trabajo empresariales. Incluidas, Azure Virtual Machines (VM), Discos de Azure, bases de datos SQL y SAP, y recursos compartidos de archivos y blobs de Azure.

Los criterios principales que se van a evaluar se describen en la tabla siguiente. La tabla contiene algunas áreas clave en las que Azure Backup puede proporcionar servicios para la protección de datos.

|Criterios|Consideración|
|---|---|
|Cargas de trabajo de Azure|Máquinas virtuales de Azure, discos de Azure, SQL Server en máquinas virtuales de Azure, bases de datos de SAP HANA en máquinas virtuales de Azure, blobs de Azure, recursos compartidos de archivos de Azure, base de datos de Azure para PostgreSQL.|
|Cumplimiento|Directiva de copia de seguridad definida por el cliente con retención a largo plazo en varias zonas o regiones.|
|Recuperaciones operativas|Con el autoservicio de copia de seguridad y restauración, el administrador de la aplicación puede ocuparse de los problemas que puedan surgir, como eliminaciones accidentales o daños en los datos.|

## Aplicación de los criterios

En la introducción, se presentó un escenario en el que su organización puede tener una aplicación que dependa de los datos de una instalación de SQL Server del backend. SQL Server se ejecuta en tres máquinas virtuales de Azure. Los datos de la copia de seguridad deben conservarse durante un máximo de 10 años para satisfacer los requisitos de cumplimiento. También quiere poder supervisar las copias de seguridad.

Antes de profundizar en cómo Azure Backup puede ayudar a satisfacer estas necesidades, es importante comprender lo que no se admite actualmente. Si las tres máquinas virtuales de Azure se implementan en varias suscripciones o regiones, debe tener en cuenta que Azure Backup no admite la copia de seguridad entre regiones para la mayoría de las cargas de trabajo. Sin embargo, sí admite la restauración entre regiones en una región secundaria emparejada.

### ¿Puede Azure Backup proteger las máquinas virtuales de Azure que hospedan las instancias de SQL Server?

Azure Backup puede realizar copias de seguridad de máquinas virtuales enteras Windows y Linux mediante extensiones de copia de seguridad. Como resultado, puede hacer una copia de seguridad de toda la máquina virtual que hospeda SQL Server. Si solo quiere hacer una copia de seguridad de los archivos, las carpetas y el estado del sistema de las máquinas virtuales de Azure, puede usar el agente de Microsoft Azure Recovery Services (MARS).

Si su principal preocupación es hacer solo una copia de seguridad de los datos de SQL Server, Azure Backup también admite esto. Azure Backup ofrece una solución especializada basada en secuencias para realizar copias de seguridad de SQL Server que se ejecutan en máquinas virtuales de Azure. Esta solución se alinea con las ventajas de Azure Backup de la copia de seguridad de infraestructura cero, la retención a largo plazo y la administración central.

Además, Azure Backup proporciona las siguientes ventajas específicas para SQL Server:

- Copias de seguridad basadas en la carga de trabajo que admiten todos los tipos de copia de seguridad: completa, diferencial y de registros.
- Objetivo de punto de recuperación (RPO) de 15 minutos con copias de seguridad de registros frecuentes
- Recuperación a un momento dado hasta un segundo
- Copia de seguridad y restauración de bases de datos individuales.

![Diagrama de SQL Server hospedado en una máquina virtual de Azure con copia de seguridad en almacenes de Recovery Services en Azure Backup. Las flechas indican un flujo bidireccional para la ruta de acceso de datos y el flujo de ruta de acceso de control de Azure Backup a la extensión de copia de seguridad en la máquina virtual.](https://learn.microsoft.com/es-es/training/modules/intro-to-azure-backup/media/azure-backup-sql-overview.png)

### ¿Ayuda Azure Backup con los estándares de cumplimiento?

Puede implementar los mecanismos de control de acceso necesarios para las copias de seguridad. Los almacenes (almacenes de Recovery Services y de copia de seguridad) proporcionan las funcionalidades de administración y son accesibles a través de Azure Portal, el Centro de copia de seguridad, los paneles de almacén, el SDK, la CLI e incluso las API REST. También es un límite de control de acceso basado en rol (RBAC) de Azure, lo que proporciona la opción de restringir el acceso a las copias de seguridad solo a los administradores de copia de seguridad autorizados.

La retención a corto plazo puede ser _minutos_ o _un día_. La retención de puntos de copia de seguridad _semanales_, _mensuales_ o _anuales_ se conoce como _retención a largo plazo_.

La retención a largo plazo puede ser:

- **Planeado (requisitos de cumplimiento):** Si sabe con antelación que los datos son necesarios años a partir del momento actual, use la retención a largo plazo.
- **No planeado (requisito a petición)**: Si no conoce de antemano, puede usar la copia de seguridad a petición con una configuración de retención personalizada específica. La configuración de políticas no afecta a esta configuración de retención personalizada.
- **Copia de seguridad a petición con retención personalizada**: si necesita realizar una copia de seguridad no programada a través de la directiva de copia de seguridad, puede usar una copia de seguridad a petición. Este tipo de retención puede ser útil para realizar copias de seguridad que no se ajustan a la copia de seguridad programada o para realizar copias de seguridad pormenorizadas (por ejemplo, varias copias de seguridad de máquinas virtuales de IaaS por día, ya que la copia de seguridad programada solo permite una ejecución al día). Es importante tener en cuenta que la directiva de retención definida en la directiva programada no se aplica a las copias de seguridad a petición.

También puede implementar la administración de directivas para ayudar a satisfacer los estándares de cumplimiento. Las directivas de Azure Backup dentro de cada almacén definen cuándo se deben desencadenar las copias de seguridad y cuánto tiempo deben conservarse. También puede administrar estas directivas y aplicarlas en varios elementos.

### ¿Simplifica Azure Backup la supervisión y la administración?

Azure Backup se integra con Log Analytics para la supervisión y elaboración de informes, y proporciona reportes a través de Workbooks.

Azure Backup proporciona supervisión integrada de trabajos para operaciones como configurar copias de seguridad, hacerlas, restaurarlas, eliminarlas, etc. Azure Backup se limita al almacén, por lo que es ideal para supervisar un único almacén.

Si necesita supervisar las actividades operativas a gran escala, el Explorador de Backup proporciona una vista agregada de todos los recursos de copia de seguridad, lo que permite realizar análisis detallados y solucionar problemas. Se trata de un libro de Azure Monitor integrado que proporciona una única ubicación central para ayudarle a supervisar las actividades operativas en todos los recursos de copia de seguridad en Azure, lo que abarca inquilinos, ubicaciones, suscripciones, grupos de recursos y almacenes.






## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Protección de las máquinas virtuales con Azure Backup (AZ-104)]]
