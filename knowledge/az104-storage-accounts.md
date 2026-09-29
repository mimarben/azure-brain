---
title: AZ-104 — Configuración de cuentas de almacenamiento
aliases: ["Configuración de cuentas de almacenamiento (AZ-104)"]
tags: [associate, storage]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/
---
# AZ-104 — Configuración de cuentas de almacenamiento

Módulo 09 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 2 — Implementación y administración del almacenamiento · Área: Implementación y administración del almacenamiento (15–20%).

## Concepto

Configuración de cuentas de almacenamiento, incluida la replicación (redundancia) y los puntos de conexión (endpoints).

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación y configuración de cuentas de almacenamiento
> - Configuración de la redundancia de Azure Storage (LRS/ZRS/GRS/GZRS y failover)
> - Configuración de la replicación de objetos
> - Configuración del cifrado de una cuenta de almacenamiento
> - Administración de datos mediante Explorador de Azure Storage y AzCopy

## Enlaces relacionados

**Módulo de Learn**: [Configuración de cuentas de almacenamiento](https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-storage-accounts/))

**Savill**: buscar "storage" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Servicios de almacenamiento de Azure (AZ-900)]]

**Laboratorio**: Lab 07 (storage accounts) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Servicios de almacenamiento de Azure (AZ-900)]]

# Introducción.

Azure Storage es la solución de almacenamiento de Microsoft para los escenarios modernos de almacenamiento de datos.

Supongamos que trabaja para una gran empresa de comercio electrónico que necesita almacenar y servir un gran número de imágenes de producto a sus clientes. La empresa quiere una solución escalable y fiable que pueda controlar el tráfico elevado y garantizar la durabilidad de los datos. Quieren restaurar rápidamente los datos si hay una interrupción.

En este módulo, aprenderá a configurar cuentas de almacenamiento y a seleccionar los tipos de almacenamiento adecuados en Azure. En el módulo se tratan temas como la implementación de estrategias de replicación y la configuración del acceso seguro al almacenamiento.

El objetivo de este módulo es proporcionar a los administradores de Azure los conocimientos y aptitudes para configurar y administrar de forma eficaz las cuentas de almacenamiento de Azure.

## Objetivos de aprendizaje

En este módulo aprenderá a:

- Identificar las características y los casos de uso de las cuentas de almacenamiento de Azure
- Seleccione uno de los diferentes tipos de instancias de Azure Storage y cree cuentas de almacenamiento.
- Seleccionar una estrategia de replicación de almacenamiento
- Configure el acceso seguro de red a los puntos de conexión de almacenamiento.

# Implementación de Azure Storage.

[Azure Storage](https://learn.microsoft.com/es-es/azure/storage/common/storage-introduction) es Microsoft solución de almacenamiento en la nube para escenarios de almacenamiento de datos modernos. Azure Storage ofrece un almacén de objetos escalable de forma masiva para objetos de datos. Proporciona un servicio de sistema de archivos para la nube, un almacén de mensajería para mensajería confiable y un almacén de NoSQL.

Azure Storage es un servicio listo para inteligencia artificial que puede usar para almacenar archivos, mensajes, tablas y otros tipos de información. Usa Azure Storage para aplicaciones como la compartición de archivos. Los desarrolladores usan Azure Storage para los datos de trabajo. Los datos de trabajo incluyen sitios web, aplicaciones móviles y aplicaciones de escritorio. Azure Storage también lo usan las máquinas virtuales iaaS y los servicios en la nube de PaaS.

### Cosas que se deben saber sobre Azure Storage

Puede considerar Azure Storage como compatibles con tres categorías de datos: datos estructurados, datos no estructurados y datos de máquina virtual. Revise las siguientes categorías y piense en qué tipos de almacenamiento se usan en su organización.
![[storage-types.png]]

| Category                     | Description                                                                                                                                                                                                                                                            | Ejemplos de almacenamiento                                                                                                                                                                                                                                                                                                                                                |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Datos de máquina virtual** | El almacenamiento de datos de una máquina virtual incluye discos y archivos. Los discos son un almacenamiento en bloques persistente para las máquinas virtuales IaaS de Azure. Los archivos son unidades compartidas de archivos totalmente administradas en la nube. | El almacenamiento de los datos de máquina virtual se proporciona a través de Azure discos administrados. Las máquinas virtuales usan discos de datos para almacenar datos como archivos de base de datos, contenido estático del sitio web o código de aplicación personalizado. El número de discos de datos que puede agregar depende del tamaño de la máquina virtual. |
| **Datos no estructurados**   | Los datos no estructurados son los menos organizados. El formato de los datos no estructurados se conoce como _no relacional_.                                                                                                                                         | Los datos no estructurados se pueden almacenar mediante Azure Blob Storage y Azure Data Lake Storage. Blob Storage es un almacén de objetos en la nube basado en REST altamente escalable. Azure Data Lake Storage es el sistema de archivos distribuido de Hadoop (HDFS) como servicio.                                                                                  |
| **Datos estructurados**      | Los datos estructurados se almacenan en un formato relacional que tiene un esquema compartido. Los datos estructurados suelen estar en una tabla de base de datos con filas, columnas y claves. Las tablas son un almacén de escalado automático NoSQL.                | Los datos estructurados se pueden almacenar mediante Azure Table Storage, Azure Cosmos DB y Azure SQL Database. Azure Cosmos DB es un servicio de base de datos distribuido globalmente. Azure SQL Database es una base de datos como servicio totalmente administrada basada en SQL.                                                                                     |


### Aspectos que se deben tener en cuenta al usar Azure Storage

A medida que piense en el plan de configuración para Azure Storage, tenga en cuenta estas características destacadas.

- **Considere la durabilidad y la disponibilidad**. Azure Storage es duradero y de alta disponibilidad. La redundancia garantiza que los datos estén seguros durante errores de hardware transitorios. Puede replicar datos entre centros de datos o regiones geográficas para obtener protección frente a catástrofes locales o desastres naturales. Los datos replicados siguen teniendo una alta disponibilidad en caso de una interrupción inesperada.
    
- **Considere la posibilidad de proteger el acceso**. Azure Storage cifra todos los datos. Azure Storage proporciona un control específico sobre quién tiene acceso a los datos.
    
- **Considere la escalabilidad**. Azure Storage está diseñado para ser escalable de forma masiva para satisfacer las necesidades de almacenamiento de datos y rendimiento de las aplicaciones modernas.
    
- **Considere la posibilidad de administrar**. Microsoft Azure controla el mantenimiento, las actualizaciones y los problemas críticos de hardware.
    
- **Considere la posibilidad de accesibilidad de los datos**. Los datos de Azure Storage son accesibles desde cualquier lugar del mundo a través de HTTP o HTTPS. Microsoft proporciona SDK para Azure Storage en varios idiomas. Puede usar .NET, Java, Node.js, Python, PHP, Ruby, Go y la API REST. Azure Storage admite el scripting en Azure PowerShell o el CLI de Azure. El portal de Azure y Explorador de Azure Storage ofrecen soluciones visuales sencillas para trabajar con los datos.
    
- **Considere la posibilidad de admitir SFTP**. Blob Storage puede usar SFTP (protocolo de transferencia de archivos SSH), por lo que puede seguir usando herramientas SFTP existentes para mover archivos directamente hacia y desde blobs. Para usar SFTP, habilite el espacio de nombres jerárquico (HNS). Puede activarla al crear la cuenta de almacenamiento (pestaña Avanzadas) o posterior en Configuración → Configuración.
    
- **Considere la posibilidad de admitir el protocolo NFSv3**. también se puede acceder a Blob Storage mediante NFSv3, lo que permite a los clientes linux montar un contenedor como un recurso compartido NFS. NFSv3 puede simplificar las migraciones de cargas de trabajo de archivos de Linux a Azure.
    
- **Considere las preferencias de autorización predeterminadas**. En el portal de Azure, puede habilitar **Autorización predeterminada de Microsoft Entra**. Esta autenticación hace que el control de acceso basado en rol (RBAC) sea el valor predeterminado en lugar de las claves de acceso compartidas, lo que puede mejorar la seguridad.



# Exploración de los servicios de Azure Storage

![[azure-storage-types.png]]

### Azure Blob Storage (Servicio de almacenamiento de blobs de Azure)

[Azure Blob Storage](https://learn.microsoft.com/es-es/azure/storage/blobs/storage-blobs-overview) es la solución de almacenamiento de objetos de Microsoft para la nube. Blob Storage está optimizado para almacenar grandes cantidades de datos no estructurados o _no relacionales_, como texto o datos binarios. Blob Storage resulta ideal para lo siguiente:

- Visualización de imágenes o documentos directamente en un explorador.
- Almacenamiento de archivos para el acceso distribuido.
- Streaming de audio y vídeo.
- Almacenamiento de datos para copia de seguridad y restauración, recuperación ante desastres y archivado.
- Almacenamiento de datos para el análisis por un servicio local u hospedado por Azure.

Se puede acceder a los objetos de Blob Storage desde cualquier parte del mundo a través de HTTP o HTTPS. Los usuarios o aplicaciones cliente pueden acceder a blobs a través de direcciones URL, la API de REST de Azure Storage, Azure PowerShell, la CLI de Azure o una biblioteca de cliente de Azure Storage. Las bibliotecas de cliente de almacenamiento están disponibles para numerosos lenguajes, como **.NET, Java, Node.js, Python, Go, PHP y Ruby.**

### Azure Files

[Azure Files](https://learn.microsoft.com/es-es/azure/storage/files/storage-files-introduction) le permite configurar recursos compartidos de archivos de red de alta disponibilidad. Se puede acceder a los recursos compartidos mediante el protocolo de Bloque de mensajes del servidor (SMB) y el protocolo Network File System (NFS). Varias máquinas virtuales pueden compartir los mismos archivos con acceso de lectura y escritura. También puede leer los archivos mediante la interfaz REST o las bibliotecas de cliente de Storage.

Los recursos compartidos de archivos se pueden usar en muchos escenarios comunes:

- Muchas aplicaciones locales usan recursos compartidos de archivos. Esta característica facilita la migración de las aplicaciones que comparten datos en Azure. Si monta el recurso compartido de archivos en la misma letra de unidad que la aplicación local usa, la parte de la aplicación que accede al recurso compartido de archivos debe funcionar con cambios mínimos, si los hay.
- Los archivos de configuración se pueden almacenar en un recurso compartido de archivos y se puede acceder a ellos desde varias máquinas virtuales. Las herramientas y utilidades que usan varios desarrolladores en un grupo se pueden almacenar en un recurso compartido de archivos, lo que garantiza que todos los usuarios puedan encontrarlos y que usen la misma versión.
- Los registros de diagnóstico, las métricas y los volcados de memoria son solo tres ejemplos de datos que se pueden escribir en un recurso compartido y procesarlos o analizarlos más adelante.

Las credenciales de la cuenta de almacenamiento se usan para proporcionar autenticación para el acceso al recurso compartido. Todos los usuarios que tengan el recurso compartido montado deben tener acceso completo de lectura y escritura al recurso compartido.

### Azure Queue Storage

[Azure Queue Storage](https://learn.microsoft.com/es-es/azure/storage/queues/storage-queues-introduction) se usa para almacenar y recuperar mensajes. La cola de mensajes puede ser de hasta 64 KB de tamaño y contener millones de mensajes. Las colas se usan para almacenar listas de mensajes y procesarlas de forma asincrónica.

Considere un escenario en el que desea que los clientes puedan cargar imágenes y le interesa crear miniaturas para cada imagen. Es posible que el cliente espere a que cree las miniaturas mientras se cargan las imágenes. Otra alternativa es utilizar una cola. Cuando el cliente finalice la carga, puede escribir un mensaje en la cola. Después, puede usar una función de Azure para recuperar el mensaje de la cola y crear las miniaturas. Cada una de las partes de procesamiento se puede escalar por separado, lo que permite un mayor control a la hora de ajustar la configuración.

### Azure Table Storage (almacenamiento de tablas de Azure)

[Azure Table storage](https://learn.microsoft.com/es-es/azure/storage/tables/table-storage-overview) es un servicio que almacena datos estructurados no relacionales (también conocidos como datos NoSQL estructurados) en la nube y proporciona un almacén de claves y atributos con un diseño sin esquema. Dado que Table Storage no tiene esquemas, es fácil adaptar los datos a medida que evolucionan las necesidades de la aplicación. El acceso a los datos de Table Storage es rápido y rentable para muchos tipos de aplicaciones y, por lo general, el costo es normalmente menor que con el SQL tradicional para volúmenes parecidos de datos. Además del servicio Azure Table Storage existente, hay una nueva oferta de Table API de Azure Cosmos DB que proporciona tablas optimizadas para el rendimiento, la distribución global y los índices secundarios automáticos.

### Aspectos que se deben tener en cuenta al elegir servicios de Azure Storage

Cuando piense en su plan de configuración para Azure Storage, tenga en cuenta las características más destacadas de los tipos de Azure Storage y qué opciones son compatibles con las necesidades de su aplicación.

- **Considere la optimización del almacenamiento para datos masivos**. Azure Blob Storage está optimizado para el almacenamiento de cantidades masivas de datos no estructurados. Se puede acceder a los objetos de Blob Storage desde cualquier parte del mundo a través de HTTP o HTTPS. Blob Storage es ideal para servir datos directamente a un navegador, transmitir datos y almacenar datos para copias de seguridad y restauración.
    
- **Considere la posibilidad de almacenar con alta disponibilidad**. Azure Files admite recursos compartidos de archivos de red de alta disponibilidad. Las aplicaciones locales usan recursos compartidos de archivos para facilitar la migración. Al usar Azure Files, todos los usuarios pueden acceder a los datos y herramientas compartidos. Las credenciales de la cuenta de almacenamiento proporcionan autenticación de recurso compartido de archivos para asegurarse de que todos los usuarios que tengan montado el recurso compartido de archivos tengan el acceso correcto de lectura y escritura.
    
- **Considere la posibilidad de almacenar los mensajes**. Use Azure Queue Storage para almacenar un gran número de mensajes. Queue Storage se usa normalmente para crear un trabajo pendiente que se va a procesar de forma asincrónica.
    
- **Considere la posibilidad de almacenar datos estructurados**. Azure Table Storage es idóneo para almacenar datos estructurados y no relacionales. Ofrece tablas optimizadas para el rendimiento, distribución global e índices secundarios automáticos. B
### Things to know about storage account types

**Standard** storage accounts are backed by magnetic hard disk drives (HDD). A standard storage account provides the lowest cost per GB. You can use Standard storage for applications that require bulk storage or where data is infrequently accessed.

**Premium** storage accounts are backed by solid-state drives (SSD) and offer consistent low-latency performance. You can use Premium storage for Azure virtual machine disks with I/O-intensive applications like databases.

|Storage account|Supported services|Redundancy options|Recommended usage|
|---|---|---|---|
|[**Standard** **general-purpose v2**](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-upgrade) ([ES](https://learn.microsoft.com/es-es/azure/storage/common/storage-account-upgrade))|Blob Storage (including Data Lake Storage), Queue Storage, Table Storage, and Azure Files|LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS|Standard storage account for most scenarios, including blobs, file shares, queues, tables, and disks (page blobs).|
|[**Premium** **block blobs**](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-block-blob-premium) ([ES](https://learn.microsoft.com/es-es/azure/storage/blobs/storage-blob-block-blob-premium))|Blob Storage (including Data Lake Storage)|LRS, ZRS|Premium storage account for block blobs and append blobs. Recommended for applications with high transaction rates. Use Premium block blobs if you work with smaller objects or require consistently low storage latency. This storage is designed to scale with your applications.|
|[**Premium** **file shares**](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share) ([ES](https://learn.microsoft.com/es-es/azure/storage/files/storage-how-to-create-file-share))|Azure Files|LRS, ZRS|Premium storage account for file shares only. Recommended for enterprise or high-performance scale applications. Use Premium file shares if you require support for both Server Message Block (SMB) and NFS file shares.|
|[**Premium** **page blobs**](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-pageblob-overview) ([ES](https://learn.microsoft.com/es-es/azure/storage/blobs/storage-blob-pageblob-overview))|Page blobs only|LRS only|Premium high-performance storage account for page blobs only. Page blobs are ideal for storing index-based and sparse data structures, such as operating systems, data disks for virtual machines, and databases.|
# Determine replication strategies

The data in your Azure storage account is always replicated to ensure durability and high availability. [Azure Storage replication](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy) ([ES](https://learn.microsoft.com/es-es/azure/storage/common/storage-redundancy)) copies your data to protect from planned and unplanned events. These events range from transient hardware failures, network or power outages, massive natural disasters, and so on. You can choose to replicate your data within the same data center, across zonal data centers within the same region, and even across regions. Replication ensures your storage account meets the Service-Level Agreement (SLA) for Azure Storage even if there are failures.

### Locally redundant storage.

![[assets/images/AZ-104/locally-redundant-storage.png]]

Locally redundant storage is the lowest-cost replication option and offers the least durability compared to other strategies. If a data center-level disaster occurs, such as fire or flooding, all replicas might be lost or unrecoverable. Despite its limitations, LRS can be appropriate in several scenarios:

- Your application stores data that can be easily reconstructed if data loss occurs.
- Your data is constantly changing like in a live feed, and storing the data isn't essential.
- Your application is restricted to replicating data only within a location due to data governance requirements.

### Zone redundant storage.

![[assets/images/AZ-104/zone-redundant-storage.png]]


Zone redundant storage synchronously replicates your data across three storage clusters in a single region. Each storage cluster is physically separated from the others and resides in its own availability zone. Each availability zone, and the ZRS cluster within it, is autonomous, and has separate utilities and networking capabilities. Storing your data in a ZRS account ensures you can access and manage your data if a zone becomes unavailable. ZRS provides excellent performance and low latency.

- ZRS isn't currently available in all regions.
- Changing to ZRS from another data replication option requires the physical data movement from a single storage stamp to multiple stamps within a region.

### Geo-redundant storage.

![[assets/images/AZ-104/geo-redundant-storage.png]]

Geo-redundant storage replicates your data to a secondary region (hundreds of miles away from the primary location of the source data). GRS provides a higher level of durability even during a regional outage. GRS is designed to provide at least 99.99999999999999% **(16 9's) durability**. When your storage account has GRS enabled, your data is durable even when there's a complete regional outage or a disaster where the primary region isn't recoverable.

If you implement GRS, you have two related options to choose from:

- **GRS** replicates your data to another data center in a secondary region. The data is available to be read only if Microsoft initiates a failover from the primary to secondary region.
    
- **Read-access geo-redundant storage** (RA-GRS) is based on GRS. RA-GRS replicates your data to another data center in a secondary region, and also provides you with the option to read from the secondary region. With RA-GRS, you can read from the secondary region regardless of whether Microsoft initiates a failover from the primary to the secondary.
    

For a storage account with GRS or RA-GRS enabled, all data is first replicated with locally redundant storage. An update is first committed to the primary location and replicated by using LRS. The update is then replicated asynchronously to the secondary region by using GRS. Data in the secondary region uses LRS. Both the primary and secondary regions manage replicas across separate fault domains and upgrade domains within a storage scale unit. The storage scale unit is the basic replication unit within the datacenter. Replication at this level is provided by LRS.


### Geo-zone redundant storage.

![[assets/images/AZ-104/geo-zone-redundant-storage.png]]


> [!TIP] TIP
> Microsoft recommends using GZRS for applications that require consistency, durability, high availability, excellent performance, and resilience for disaster recovery. Enable RA-GZRS for read access to a secondary region when there's a regional disaster.

### Things to consider when choosing replication strategies.

|Node in data center unavailable|Entire data center unavailable|Region-wide outage|Read access during region-wide outage|
|---|---|---|---|
|- **LRS**  <br>- **ZRS**  <br>- **GRS**  <br>- **RA-GRS**  <br>- **GZRS**  <br>- **RA-GZRS**|- **ZRS**  <br>- **GRS**  <br>- **RA-GRS**  <br>- **GZRS**  <br>- **RA-GZRS**|- **GRS**  <br>- **RA-GRS**  <br>- **GZRS**  <br>- **RA-GZRS**|- **RA-GRS**  <br>- **RA-GZRS**|
# Access storage.

Every object you store in Azure Storage has a unique URL address. Your storage account name forms the _subdomain_ portion of the URL address. The combination of the subdomain and the domain name, which is specific to each service, forms an endpoint for your storage account.

Let's look at an example. If your storage account name is _mystorageaccount_, default endpoints for your storage account are formed for the Azure services as shown in the following table:

|Service|Default endpoint|
|---|---|
|**Container service**|`//`**`mystorageaccount`**`.blob.core.windows.net`|
|**Table service**|`//`**`mystorageaccount`**`.table.core.windows.net`|
|**Queue service**|`//`**`mystorageaccount`**`.queue.core.windows.net`|
|**File service**|`//`**`mystorageaccount`**`.file.core.windows.net`|
We create the URL to access an object in your storage account by appending the object's location in the storage account to the endpoint.

For example, to access the _myblob_ data in the _mycontainer_ location in your storage account, we use the following URL address:

`//`**`mystorageaccount`**`.blob.core.windows.net/`**`mycontainer`**`/`**`myblob`**.

## Configure custom domains.

You can configure a [custom domain](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-custom-domain-name) ([ES](https://learn.microsoft.com/es-es/azure/storage/blobs/storage-custom-domain-name)) to access blob data in your Azure storage account. As we reviewed, the default endpoint for Azure Blob Storage is `\<storage-account-name>.blob.core.windows.net`. If you map a custom domain and subdomain, such as `www.contoso.com`, to the blob or web endpoint for your storage account, your users can use that domain to access blob data in your storage account.

**Direct mapping** lets you enable a custom domain for a subdomain to an Azure storage account. For this approach, you create a `CNAME` record that points from the subdomain to the Azure storage account.

The following example shows how a subdomain is mapped to an Azure storage account to create a `CNAME` record in the domain name system (DNS):

- Subdomain: `blobs.contoso.com`
- Azure storage account: `\<storage account>\.blob.core.windows.net`
- Direct `CNAME` record: `contosoblobs.blob.core.windows.net`

# Secure storage endpoints.

In the Azure portal, each Azure service requires certain steps to configure the service endpoints and restrict network access.

To access these settings for your storage account, you use the **Firewalls and virtual networks** settings. You add the virtual networks that should have access to the service for the account. - This setting restricts access to your storage account from specific subnets on virtual networks or public IPs.

![[secure-storage-access-d32868ef.png]]



![[assets/images/AZ-104/service-endpoints-portal-lrg.png]]

