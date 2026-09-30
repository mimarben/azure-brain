---
title: AZ-104 — Configuración de Azure Files
aliases: ["Configuración de Azure Files (AZ-104)"]
tags: [associate, storage]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-azure-files-file-sync/
---

# AZ-104 — Configuración de Azure Files

Módulo 12 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 2 — Implementación y administración del almacenamiento · Área: Implementación y administración del almacenamiento (15–20%).

## Concepto

Configuración de recursos compartidos de archivos de Azure (file shares) y Azure File Sync.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación y configuración de un recurso compartido de archivos en Azure Files
> - Configuración de instantáneas y eliminación temporal para Azure Files
> - Configuración del acceso basado en identidad para Azure Files
> - Azure File Sync (grupos de sincronización, servidor registrado, niveles de nube)

## Enlaces relacionados

**Módulo de Learn**: [Configuración de Azure Files](https://learn.microsoft.com/en-us/training/modules/configure-azure-files-file-sync/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-azure-files-file-sync/))

**Savill**: buscar "Files" / "File Sync" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Servicios de almacenamiento de Azure (AZ-900)]]

**Laboratorio**: Lab 07 (Manage Azure Storage) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

# Introducción

Azure Files ofrece recursos compartidos de archivos en la nube totalmente administrados, a los que se puede acceder mediante protocolos estándar del sector. Azure File Sync es un servicio que permite almacenar en caché varios recursos compartidos de Azure Files en una máquina virtual en la nube o una instancia local de Windows Server.

En este módulo, la empresa tiene un gran repositorio de documentos organizativos. Las oficinas se encuentran en diferentes regiones geográficas y los usuarios necesitan las versiones más actuales de los documentos. Va a investigar cómo implementar recursos compartidos de Azure Files a fin de proporcionar una ubicación central para los documentos.

## Objetivos de aprendizaje

En este módulo aprenderá a:

- Identificar el almacenamiento para comparticiones de archivos.
- Compara los recursos compartidos de archivos con el almacenamiento en blobs.
- Configurar los recursos compartidos de archivos de Azure, las instantáneas de compartidos de archivos y la eliminación reversible.
- Usa Azure Storage Explorer para acceder a la compartición de archivos.

## Aptitudes evaluadas

El contenido del módulo le ayuda a prepararse para el [examen AZ-104: Administrador de Microsoft Azure](https://learn.microsoft.com/es-es/credentials/certifications/resources/study-guides/az-104).

## Requisitos previos

- Familiaridad con los sistemas de archivos compartidos.
- Familiaridad con la navegación por Azure Portal.
# Comparación del almacenamiento para recursos compartidos de archivos y datos de blobs.

[Azure Files](https://learn.microsoft.com/es-es/azure/storage/files/storage-files-introduction) ofrece recursos compartidos de archivos totalmente administrados en la nube. Puede acceder a recursos compartidos de archivos de Azure mediante el uso de los protocolos Bloque de mensajes del servidor (SMB), Network File System (NFS) y HTTP. Los clientes pueden conectarse a recursos compartidos de archivos de Azure desde dispositivos Windows, Linux y macOS.

### Aspectos que debe saber sobre Azure Files

Estas son algunas características de Azure Files:

- **Implementación sin servidor**. Un recurso compartido de archivos de Azure es una oferta de PaaS (Platform as a Service - **Plataforma como Servicio**) de un recurso compartido de archivos totalmente administrado que no requiere ninguna infraestructura. No es necesario que se ocupe de las máquinas virtuales, los sistemas operativos o las actualizaciones.

- **Almacenamiento casi ilimitado**. Un solo recurso compartido de archivos de Azure puede almacenar hasta 100 tebibytes (TiB) de archivos y un archivo puede tener un tamaño máximo de 4 TiB. Los archivos se organizan en una estructura jerárquica de carpetas de la misma manera que en los servidores de archivos locales.

> [!NOTE]
> 
> | Decimal | Binario |
> | ------- | ------- |
> | KB      | KiB     |
> | MB      | MiB     |
> | GB      | GiB     |
> | TB      | TiB     |
> 
> La **i** significa: **kibi, mebi, gibi, tebi** e indica que se usan potencias de **2 (1024)** en lugar de potencias de **10 (1000)**.


- **Cifrado de datos**. Los datos de un recurso compartido de archivos de Azure se cifran en reposo en un centro de datos de Azure y en tránsito cuando se almacenan en una red.

- **Acceso desde cualquier lugar**. De forma predeterminada, los clientes pueden acceder a recursos compartidos de archivos de Azure desde cualquier lugar si tienen conectividad a Internet.

- **Integración en un entorno existente**. Puede controlar el acceso a los recursos compartidos de archivos de Azure mediante identidades de Microsoft Entra o identidades de AD DS que se sincronizan con Microsoft Entra ID. Esto ayuda a garantizar que los usuarios tengan la misma experiencia al acceder a un recurso compartido de archivos de Azure que cuando acceden a un servidor de archivos local.

- **Versiones y copias de seguridad anteriores**. Puede crear instantáneas de recurso compartido de archivos de Azure que se integren con la característica versiones anteriores en el Explorador de archivos. También puede usar Azure Backup para realizar copias de seguridad de recursos compartidos de archivos de Azure.

- **Redundancia de datos**. Los datos del recurso compartido de archivos de Azure se replican en varias ubicaciones en el mismo centro de datos de Azure o en muchos centros de datos de Azure. La configuración de replicación de la cuenta de almacenamiento de Azure que incluye el recurso compartido de archivos controla la redundancia de los datos.


### Aspectos que se deben tener en cuenta al usar Azure Files

Hay muchos escenarios comunes para usar Azure Files. A medida que revise las sugerencias siguientes, piense en cómo Azure Files puede proporcionar soluciones para la organización.

- **Considere las opciones de reemplazo y suplemento**. Reemplace o complemente los servidores de archivos locales tradicionales o los dispositivos NAS mediante Azure Files.
    
- **Considere el acceso global**. Acceda directamente a recursos compartidos de archivos de Azure mediante la mayoría de los sistemas operativos, como Windows, macOS y Linux desde cualquier lugar del mundo.
    
- **Considere la posibilidad de admitir la migración lift-and-shift**. _Elevación y desplazamiento_ de aplicaciones a la nube con Azure Files para aplicaciones que esperan que un recurso compartido de archivos almacene datos de usuario o aplicación de archivos.
    
- **Considere la posibilidad de usar Azure File Sync**. Replicar recursos compartidos de archivos de Azure en servidores Windows usando Azure File Sync. Puede replicar en las instalaciones locales o en la nube para mejorar el rendimiento y el almacenamiento en caché distribuido de los datos donde se estén utilizando. En una unidad posterior se examina Azure File Sync con más detalle.
    
- **Considere la posibilidad de usar aplicaciones compartidas**. Almacene la configuración de la aplicación compartida, como los archivos de configuración, en Azure Files.
    
- **Considere los datos de diagnóstico**. Use Azure Files para almacenar datos de diagnóstico como registros, métricas y volcados de memoria en una ubicación compartida.
    
- **Considere las herramientas y las utilidades**. Azure Files es una buena opción para almacenar herramientas y utilidades necesarias para desarrollar o administrar máquinas virtuales de Azure o servicios en la nube.
    

## Comparación de Azure Files con Azure Blob Storage

Es importante comprender cuándo usar Azure Files para almacenar datos en recursos compartidos de archivos en lugar de usar Azure Blob Storage para almacenar datos como blobs. En la tabla siguiente se comparan diferentes características de estos servicios y escenarios de implementación comunes.

| Azure Files (recursos compartidos de archivos)                                                                                                                                                                                                                                                                                                                                                | Azure Blob Storage (blobs, objetos)                                                                                                                                                                                                                          |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Azure Files proporciona los protocolos SMB y NFS, bibliotecas cliente y una interfaz REST que permite el acceso desde cualquier lugar a los archivos almacenados.                                                                                                                                                                                                                             | Azure Blob Storage proporciona bibliotecas cliente y una interfaz REST que permite que los datos no estructurados se almacenen a gran escala en blobs en bloques y se acceda a ellos de este modo.                                                           |
| - Los archivos de un recurso compartido de Azure Files son objetos de directorio reales.  <br>- A los datos de Azure Files se accede por medio de recursos compartidos de archivos en varias máquinas virtuales.                                                                                                                                                                              | - Los blobs de Azure Blob Storage son un espacio de nombres plano.  <br>- A los datos de blobs de Azure Blob Storage se accede por medio de un contenedor.                                                                                                   |
| _**Azure Files** es ideal para elevar y desplazar una aplicación a la nube que ya usa las API nativas del sistema de archivos. Comparta datos entre la aplicación y otras aplicaciones que se ejecutan en Azure._  <br>  <br>_Azure Files es una buena opción cuando desea almacenar herramientas de desarrollo y depuración a las que se debe tener acceso desde muchas máquinas virtuales._ | _**Azure Blob Storage** es ideal para las aplicaciones que necesitan admitir escenarios de streaming y acceso aleatorio._  <br>  <br>_Azure Blob Storage es una buena opción cuando desea poder acceder a los datos de la aplicación desde cualquier lugar._ |

### Regla rápida

#### Azure Files

👉 Cuando necesitas un **sistema de archivos compartido**.

```
\\servidor\documentos
```

#### Azure Blob Storage

👉 Cuando necesitas almacenar **objetos** (ficheros, imágenes, vídeos, backups, logs, datos, etc.).

```
Amazon S3

Google Cloud Storage
```

|Característica|Azure Files|Azure Blob Storage|
|---|---|---|
|Estructura|Carpetas y archivos|Contenedores y blobs|
|Protocolo|SMB, NFS|HTTPS/REST API|
|Se puede mapear como unidad de red|✅ Sí|❌ No|
|Compatible con aplicaciones legacy|✅ Sí|❌ No|
|Acceso desde navegador o API|Limitado|✅ Excelente|
|Coste|Más alto|Más económico|
|Escalabilidad|Alta|Muy alta|
|Ideal para documentos compartidos|✅|❌|
|Ideal para datos masivos|❌|✅|


# Administrar recursos compartidos de archivos de Azure.


Azure Files ofrece dos protocolos del sistema de archivos estándar del sector para el montaje de recursos compartidos de archivos de Azure: el protocolo Bloque de mensajes del servidor (SMB) y el protocolo Network File System (NFS). Los recursos compartidos de archivos de Azure no admiten los protocolos SMB y NFS en el mismo recurso compartido de archivos, aunque puede crear recursos compartidos de archivos de Azure SMB y NFS dentro de la misma cuenta de almacenamiento.

## Tipos de recursos compartidos de archivos de Azure

Azure Files admite dos niveles de almacenamiento: Premium y estándar. Los recursos compartidos de archivos estándar se crean en cuentas de almacenamiento de uso general ([[General Purpose v2]]), mientras que los recursos compartidos de archivos prémium se crean en cuentas de almacenamiento de FileStorage. Los dos niveles de almacenamiento tienen los atributos que se describen en la tabla siguiente.

|Capa de almacenamiento|Rendimiento|Tipo de cuenta de almacenamiento|Opciones de redundancia|Modelo de facturación|Casos de uso|
|---|---|---|---|---|---|
|**Premium**|Con respaldo SSD, latencia baja coherente|FileStorage|LRS (Almacenamiento con Redundancia Local), ZRS (Almacenamiento con Redundancia Zonal)|Aprovisionado (pago por la capacidad reservada)|Cargas de trabajo de alto rendimiento que requieren baja latencia|
|**Optimizado para transacciones**|Respaldado por HDD, rendimiento estándar|Uso general v2 (GPv2)|LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS|Pago por uso|Cargas de trabajo de transacciones elevadas, datos a los que se accede con frecuencia|
|**Caliente**|Rendimiento estándar con HDD|Uso general versión 2 (GPv2)|LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS|Pago por uso|Comparticiones de equipo de propósito general y cargas de trabajo colaborativas|
|**genial**|Respaldado por HDD, rendimiento estándar|Uso general v2 (GPv2)|LRS, GRS, RA-GRS, ZRS, GZRS, RA-GZRS|Pago por uso|Escenarios rentables de archivo y copia de seguridad en línea|

> [!NOTE] Nota:
> Los niveles optimizados para transacciones, caliente y frío son todos niveles estándar (basados en HDD) con diferentes estructuras de precios optimizadas para patrones de acceso específicos. El nivel Premium usa almacenamiento SSD con facturación aprovisionada (paga por la capacidad que reserva), mientras que los niveles Estándar usan la facturación de pago por uso.

|Método de autenticación|Descripción|
|---|---|
|Autenticación basada en la identidad en SMB|[La autenticación basada en identidades de SMB](https://learn.microsoft.com/es-es/azure/storage/files/storage-files-active-directory-overview#supported-authentication-scenarios) admite tres orígenes de Active Directory: AD DS local, Microsoft Entra Domain Services y Microsoft Entra Kerberos. Una vez que se haya seleccionado la fuente de Active Directory, asigne roles de RBAC de Azure a los usuarios que necesiten acceso al recurso compartido de archivos.|
|Clave de acceso|La clave de acceso es una opción más antigua y menos flexible. Las cuentas de almacenamiento de Azure tienen dos claves de acceso que se pueden usar al realizar una solicitud a la cuenta de almacenamiento, incluido Azure Files. Las claves de acceso son estáticas y proporcionan acceso de control total a Azure Files. Las claves de acceso deben protegerse y no se pueden compartir con otros usuarios, ya que son capaces de saltarse todas las restricciones de control de acceso. Un procedimiento recomendado es evitar el uso compartido de las claves de cuenta de almacenamiento y usar la autenticación basada en la identidad siempre que sea posible.|
|Un token de firma de acceso compartido (SAS)|SAS es un identificador uniforme de recursos (URI) generado dinámicamente que se basa en la clave de acceso de almacenamiento. SAS proporciona derechos de acceso restringido a una cuenta de Azure Storage. Las restricciones incluyen permisos admitidos, hora de inicio y expiración, direcciones IP permitidas desde donde se pueden enviar solicitudes y protocolos permitidos. Con Azure Files, solo se usa un token de SAS para proporcionar acceso a la API REST desde el código.|
## Creación de archivos compartidos Azure SMB (clásico)

Los recursos compartidos de archivos de Azure clásicos residen dentro de una cuenta de almacenamiento, por lo que siguen los mismos límites que esa cuenta. Puede elegir entre dos niveles de almacenamiento: SSD (Premium) y HDD (estándar).
Los recursos compartidos de archivos SSD son excelentes cuando necesita un rendimiento rápido y coherente con baja latencia, normalmente en milisegundos de un solo dígito. Los recursos compartidos de HDD son más asequibles y funcionan bien para el almacenamiento de uso general.
Si necesita acceso SMB, cree el recurso compartido de archivos dentro de una cuenta de almacenamiento. Los recursos compartidos de archivos por SMB le permiten elegir diferente niveles de acceso, como el optimizado para transacciones, el acceso frecuente y el acceso esporádico.

![Captura de pantalla de la creación de un recurso compartido de archivos que muestra las opciones de nivel de acceso.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-azure-files-file-sync/media/configure-classic-files.png)

> [!NOTE] Nota:
> Al conectarse a través de SMB, no olvide que el tráfico usa el puerto 445. Muchos ISP bloquean el puerto 445 de salida, que es el problema de conectividad más común al montar recursos compartidos de archivos de Azure desde entornos locales.

> [!TIP] Importante
 Los recursos compartidos de archivos [(versión preliminar)](https://learn.microsoft.com/es-es/azure/storage/files/create-file-share) ahora están disponibles con carácter general que no requieren una cuenta de Almacenamiento de Azure. Esta opción proporciona administración simplificada para escenarios en los que solo se necesitan recursos compartidos de archivos sin otros servicios de almacenamiento.

# Creación de instantáneas de recursos compartidos de archivos.


Azure Files proporciona la capacidad de tomar [instantáneas de recursos compartidos de recursos compartidos de archivos](https://learn.microsoft.com/es-es/azure/storage/files/storage-snapshots-files). Las instantáneas de recursos compartidos proporcionan copias puntuales de los recursos compartidos de archivos de Azure que protegen contra la eliminación accidental y habilitan la recuperación de errores de aplicación.

![Captura de pantalla de una instantánea de recurso compartido de archivos en la que se muestra el nombre de la instantánea y la fecha en que se ha creado.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-azure-files-file-sync/media/file-share-snapshot-cbda2136.png)

## Aspectos que tener en cuenta sobre las instantáneas de recurso compartido de archivos

- Las instantáneas **==son copias incrementales y de solo lectura==** a un momento dado en el nivel de recurso compartido.
- Para reducir el tiempo y el coste, se captura solo desde la última instantánea.
- La misma experiencia para los recursos compartidos SMB y NFS en todas las regiones públicas de Azure.
- La instantánea agrega una marca de tiempo única al URI de recurso compartido.
- Usa la configuración de redundancia de recursos compartidos.
- Hasta ==**200 instantáneas**== por recurso compartido de archivos para puntos de recuperación con bajo RPO.
- Las instantáneas se conservan hasta que se eliminan. Al eliminar el recurso compartido, se eliminan todas las instantáneas.
- Azure Backup puede conceder instantáneas para ayudar a evitar la eliminación accidental.
- Restaurar un archivo, carpeta o recurso compartido completo; la restauración completa solo requiere la instantánea más reciente.

### Aspectos a considerar al utilizar instantáneas de archivos compartidos

Las instantáneas de la compartición de archivos pueden ayudarte a proteger y recuperar tus datos. A medida que revise las ventajas, tenga en cuenta dónde encajan las instantáneas en la configuración de Azure Files.

|Prestación|Descripción|
|---|---|
|Protección contra daños en los datos y errores de la aplicación|Las cargas de trabajo de archivos compartidos leen y escriben datos constantemente. Si una configuración incorrecta, una implementación incorrecta o un error de software sobrescribe o daña los datos, una instantánea le permite revertir el recurso compartido a un momento dado conocido. Tome una instantánea antes de liberar código nuevo para que tenga un punto de restauración limpio si algo va mal.|
|Protección contra eliminaciones accidentales o cambios no deseados|Si se cambia un archivo, las instantáneas proporcionan una manera rápida de restaurar una versión anterior. Utilice instantáneas para revertir a la última copia correcta cuando se produzca algo inesperado.|
|Compatibilidad con la copia de seguridad y recuperación|Cree instantáneas según una programación para crear un historial de copias de seguridad del recurso compartido de archivos. Mantener versiones anteriores facilita la realización de necesidades de auditoría y recuperación de datos después de errores o una interrupción más amplia.|


# Implementación de la eliminación temporal para Azure Files.

Azure Files ofrece la [eliminación temporal para recursos compartidos de archivos](https://learn.microsoft.com/es-es/azure/storage/files/storage-files-prevent-file-share-deletion?toc=%2Fazure%2Fstorage%2Ffile-sync). La eliminación temporal le permite recuperar archivos eliminados y recursos compartidos de archivos.

![Ilustración que muestra cómo habilitar la eliminación temporal en un recurso compartido de archivos de Azure.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-azure-files-file-sync/media/files-enable-soft-delete-new-ui.png)

### Aspectos que debe saber sobre la eliminación temporal para Azure Files.

Echemos un vistazo a las características de la eliminación temporal para Azure Files.

- La eliminación temporal de recursos compartidos de archivos está habilitada en el nivel de cuenta de almacenamiento.

- La eliminación temporal pasa el contenido a un estado de eliminado temporalmente en lugar de borrarse de forma permanente.

- La eliminación temporal le permite configurar el período de retención. El período de retención es la cantidad de tiempo durante el que los recursos compartidos de archivos eliminados temporalmente se almacenan y están disponibles para su recuperación.

- La eliminación temporal proporciona un período de retención de entre 1 y 365 días.

- La eliminación temporal se puede habilitar en recursos compartidos de archivos nuevos o existentes.


### Aspectos que se deben tener en cuenta al usar la eliminación temporal para Azure Files.

Usar la eliminación temporal para Azure Files tiene muchas ventajas. Tenga en cuenta los siguientes escenarios y piense en cómo puede usar la eliminación temporal.

- **Recuperarse de la pérdida accidental de datos**. Puede recuperar datos eliminados o dañados con la eliminación temporal.

- **Escenarios de actualización**. Use la eliminación temporal para restaurar a un estado correcto conocido después de un intento de actualización con error.

- **Protección contra ransomware**. Use la eliminación temporal para recuperar datos sin pagar un rescate a ciberdelincuentes.

- **Retención a largo plazo**. Use la eliminación temporal para cumplir los requisitos de retención de datos.

- **Continuidad empresarial**. Use la eliminación temporal para preparar su infraestructura para que sea de alta disponibilidad para cargas de trabajo críticas.


# Uso del Explorador de Azure Storage.

[El Explorador de Azure Storage](https://learn.microsoft.com/es-es/azure/storage/storage-explorer/vs-azure-tools-storage-manage-with-storage-explorer?tabs=windows) es una aplicación independiente que facilita el trabajo con datos de Azure Storage en Windows, macOS y Linux. Con el Explorador de Azure Storage, puede acceder a varias cuentas y suscripciones y administrar todo el contenido de Storage.
  
![Captura de pantalla del Explorador de Azure Storage que muestra la cuenta de almacenamiento del emulador abierta, que tiene una carpeta y varios documentos. La información del nivel de acceso es visible.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-azure-files-file-sync/media/storage-explorer.png)

### Cosas que debe saber sobre el Explorador de Azure Storage

El Explorador de Azure Storage tiene las características siguientes.

- El Explorador de Azure Storage requiere permisos de administración (Azure Resource Manager) y de la capa de datos para permitir el acceso total a los recursos. Necesita permisos de Microsoft Entra ID para acceder a la cuenta de almacenamiento, los contenedores de la cuenta y los datos de los contenedores.
    
- El Explorador de Azure Storage le permite conectarse a diferentes cuentas de almacenamiento.
    - Conéctese a las cuentas de almacenamiento asociadas a las suscripciones de Azure.
    - Conéctese a cuentas de almacenamiento y servicios que se comparten desde otras suscripciones de Azure.
    - Conéctese y administre el almacenamiento local mediante el emulador de Azure Storage.
    
    ![Captura de pantalla de la página Administrar cuentas de Azure Explorer.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-azure-files-file-sync/media/connection-options-1df9c8f7.png)
    

### Aspectos que se deben tener en cuenta al usar el Explorador de Azure Storage

El Explorador de Azure Storage admite muchos escenarios para trabajar con cuentas de almacenamiento en Azure. Cuando revise estas opciones, piense en qué escenarios se aplican a su implementación de Azure Storage.


|Escenario|Descripción|
|---|---|
|**Conexión a una suscripción de Azure**|Administre los recursos de almacenamiento que pertenecen a su suscripción de Azure.|
|**Trabajo con el almacenamiento de desarrollo local**|Administre el almacenamiento local mediante el emulador de Azure Storage.|
|**Asociación a un almacenamiento externo**|Administre los recursos de almacenamiento que pertenecen a otra suscripción de Azure o que se encuentran en nubes de Azure nacionales mediante el nombre, la clave y los puntos de conexión de la cuenta de almacenamiento. Este escenario se describe con más detalle en la sección siguiente.|
|**Asociación de una cuenta de almacenamiento con una SAS**|Administre los recursos de almacenamiento que pertenecen a otra suscripción de Azure mediante una firma de acceso compartido (SAS).|
|**Asociación de un servicio con una SAS**|Administre un servicio de Azure Storage específico (contenedor de blobs, cola o tabla) que pertenezca a otra suscripción de Azure mediante una SAS.|

## Asociación a una cuenta de almacenamiento externo

El Explorador de Azure Storage le permite conectarse a cuentas de almacenamiento externas, lo que facilita el uso compartido de las cuentas de almacenamiento.

Para crear la conexión, necesita el nombre de la **cuenta** de almacenamiento externo y la **clave de cuenta**. En Azure Portal, la clave de cuenta se denomina **key1**.

![Captura de pantalla del asistente del Explorador de Azure Storage para conectarse a una cuenta de almacenamiento externa.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-azure-files-file-sync/media/attach-name-key-13fe3ba3.png)

Para usar un nombre y una clave de cuenta de almacenamiento de una nube nacional de Azure, utilice el menú desplegable **Dominio de puntos de conexión de almacenamiento** para seleccionar **Otros** y luego introduzca el dominio personalizado del punto de conexión de la cuenta de almacenamiento.

### Claves de acceso

Las claves de acceso permiten acceder a toda la cuenta de almacenamiento. Se le proporcionan dos claves de acceso, por lo que puede mantener las conexiones si usa una de ellas mientras se regenera la otra.

> [!NOTE] Importante
> Almacene las claves de acceso de forma segura. Se recomienda volver a generar estas claves con regularidad.

Cuando regenere las claves de acceso, deberá actualizar todos los recursos y aplicaciones de Azure que accedan a esta cuenta de almacenamiento para poder usar las nuevas claves. Esta acción no interrumpe el acceso a los discos de las máquinas virtuales.

# Considere la posibilidad de usar Azure File Sync.

[Azure File Sync](https://learn.microsoft.com/es-es/azure/storage/file-sync/file-sync-introduction) le permite almacenar en caché varios recursos compartidos de Azure Files en una máquina virtual en la nube o en una instancia local de Windows Server. Puede usar Azure File Sync para centralizar los recursos compartidos de archivos de su organización en Azure Files sin renunciar a la flexibilidad, el rendimiento y la compatibilidad de un servidor de archivos local.

Azure File Sync consta de cinco componentes principales que funcionan conjuntamente para sincronizar archivos entre servidores de Windows locales y recursos compartidos de archivos de Azure.

![Ilustración en la que se muestra cómo usar Azure File Sync para almacenar en caché los recursos compartidos de archivos de una organización en Azure Files.](https://learn.microsoft.com/es-es/training/wwl-azure/configure-azure-files-file-sync/media/file-sync-1d3fd2e7.png)

- El **servicio de sincronización de almacenamiento** es el recurso principal de Azure responsable de administrar la sincronización de archivos. Puede admitir hasta 100 grupos de sincronización, funciona dentro de una sola región de Azure y permite hasta 99 servidores windows registrados.

- El **grupo de sincronización** establece la configuración de sincronización, que contiene un punto de conexión en la nube (recurso compartido de archivos de Azure) y hasta 50 puntos de conexión de servidor. Los puntos de conexión del servidor son rutas NTFS específicas en servidores Windows registrados, pero no pueden estar en el volumen del sistema, y allí no se admite la organización por niveles en la nube.

- El **punto de conexión** en la nube es un recurso compartido de archivos de Azure que participa en el grupo de sincronización. Solo se permite un punto de conexión en la nube por grupo de sincronización.

- El **punto de conexión del servidor** es una ruta de acceso en un servidor Windows Server registrado que se sincroniza con el punto de conexión en la nube. El punto de conexión del servidor debe ser un volumen con formato NTFS y no puede ser un volumen del sistema.

- El **agente de Azure File Sync** se instala en cada servidor de Windows Server. El agente es un servicio de Windows en segundo plano para las operaciones de sincronización y las tareas de administración.


### Aspectos que debe saber sobre Azure File Sync

Ahora se examinarán las características de Azure File Sync.

- Azure File Sync transforma Windows Server en una caché rápida de los recursos compartidos de Azure Files.

- Puede usar cualquier protocolo disponible en Windows Server para acceder a los datos localmente con Azure File Sync, como SMB, NFS y FTPS.

- Azure File Sync admite tantas cachés como necesite en todo el mundo.

- Hay un máximo de 100 grupos de sincronización por servicio de sincronización de almacenamiento y 50 puntos de conexión de servidor por grupo de sincronización.


### Aspectos que se deben tener en cuenta al usar Azure File Sync

El uso de Azure File Sync ofrece muchas ventajas. Tenga en cuenta los escenarios siguientes y piense en cómo puede usar Azure File Sync con los recursos compartidos de Azure Files.

- **Considere levantar y trasladar la aplicación**. Use Azure File Sync para mover aplicaciones que necesiten acceso entre Azure y sistemas locales. Proporcione acceso de escritura a los mismos datos en instancias de Windows Server y Azure Files.

- **Considere la posibilidad de admitir sucursales**. Apoye a sus sucursales que necesitan realizar copias de seguridad de archivos mediante Azure File Sync. Use el servicio para configurar un nuevo servidor que se conecte al almacenamiento de Azure.

- **Considere la posibilidad de copias de seguridad y recuperación ante desastres**. Después de implementar Azure File Sync, Azure Backup realiza una copia de seguridad de los datos locales. Restaure los metadatos de archivo inmediatamente y recupere los datos según sea necesario para una rápida recuperación ante desastres.

- **Considere la posibilidad de archivar usando la jerarquización en la nube**. Azure File Sync solo almacena los datos a los que se ha accedido recientemente en los servidores locales. Implemente la nube por niveles para que los datos antiguos se muevan a Azure Files.


# Resumen y recursos

Los administradores de Azure están familiarizados con Azure Files y el agente de Azure File Sync. Saben cómo implementar recursos compartidos de archivos totalmente administrados en la nube mediante protocolos estándar del sector. Saben cómo usar Azure File Sync para almacenar en caché varios recursos compartidos de Azure Files en una máquina virtual en la nube o en una instancia local de Windows Server.

En este módulo, ha aprendido a usar Azure Files y cómo se compara el servicio con Azure Blob Storage. También ha revisado las características de Azure Files, como las instantáneas y la eliminación temporal. Aprendió cómo usar Azure File Sync con almacenes de datos locales. También ha conocido el Explorador de Azure Storage.

**Los principales aspectos de este módulo son:**

- Azure Files proporciona los protocolos SMB y NFS, bibliotecas cliente y una interfaz REST que permite el acceso desde cualquier lugar a los archivos almacenados.
    
- Azure Files es idóneo para la migración mediante lift-and-shift de una aplicación a la nube que ya usa las API nativas del sistema de archivos. Comparta datos entre la aplicación y otras aplicaciones que se ejecutan en Azure.
    
- Azure Files ofrece dos protocolos del sistema de archivos estándar del sector para el montaje de recursos compartidos de archivos de Azure: el protocolo Bloque de mensajes del servidor (SMB) y el protocolo Network File System (NFS).
    
- Azure Files ofrece dos tipos de recursos compartidos de archivos: Estándar y Premium. El nivel Premium almacena datos en unidades de estado sólido (SSD) modernas, mientras que el nivel Estándar usa unidades de disco duro (HDD).
    
- Las instantáneas de recursos compartidos de archivos capturan una copia de solo lectura de un momento dado de los datos.
    
- La eliminación temporal permite recuperar el recurso compartido de archivos eliminado.
    
- Explorador de Azure Storage es una aplicación independiente que facilita el trabajo con los datos almacenados en Windows, macOS y Linux.
    
- Azure File Sync permite almacenar en caché recursos compartidos de archivos en una máquina virtual en la nube o en una instancia local de Windows Server.
    

## Más información sobre Copilot

Copilot puede ayudarle a configurar soluciones de infraestructura de Azure. Copilot puede comparar, recomendar, explicar e investigar productos y servicios en los que necesita más información. Abra un explorador de Microsoft Edge y elija Copilot (arriba a la derecha) o vaya a copilot.microsoft.com. Dedique unos minutos a probar estas solicitudes y ampliar el aprendizaje con Copilot.

- ¿Qué es Azure Files y en qué se diferencia de Azure Blob Storage?
    
- ¿Cuáles son algunas de las tareas habituales de configuración y administración de Azure Files?
    

## Obtener más información con la documentación

- [Documentación de Azure Files](https://learn.microsoft.com/es-es/azure/storage/files/). Esta página es el punto inicial de todo lo relacionado con Azure Files.
    
- [Documentación de Azure File Sync](https://learn.microsoft.com/es-es/azure/storage/file-sync/). Esta página es el punto inicial de todo lo relacionado con Azure File Sync.
    

## Más información con el aprendizaje autodirigido

- [Implemente una infraestructura de servidor de archivos híbrido](https://learn.microsoft.com/es-es/training/modules/implement-hybrid-file-server-infrastructure/). En este módulo, se aprende a implementar Azure File Sync y a usar los servicios de migración de almacenamiento para migrar servidores de archivos a Azure.
    
- [Proyecto guiado: Azure Files y blobs de Azure](https://learn.microsoft.com/es-es/training/modules/guided-project-azure-files-azure-blobs/). En este módulo, practicará el almacenamiento de datos empresariales de forma segura mediante Azure Blob Storage y Azure Files. El laboratorio combina tanto el aprendizaje como la experiencia práctica.
    

## Introducción a Azure

Elija la cuenta de Azure adecuada para usted. Pague a medida que habla o pruebe Azure gratis durante 30 días.[Regístrese.](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_0f6b00b2-e31b-9a42-bdcc-ffcd684e7a7a)






## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Servicios de almacenamiento de Azure (AZ-900)]]
