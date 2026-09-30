---
title: AZ-104 — Configurar la seguridad de Azure Storage
aliases: ["Configurar la seguridad de Azure Storage (AZ-104)"]
tags: [associate, storage, security]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-storage-security/
---

# AZ-104 — Configurar la seguridad de Azure Storage

Módulo 11 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 2 — Implementación y administración del almacenamiento · Área: Implementación y administración del almacenamiento (15–20%).

## Concepto

Características comunes de seguridad de Azure Storage: firmas de acceso compartido (SAS), directivas de acceso almacenadas, claves de acceso y reglas de red.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Configuración de redes virtuales y firewalls de Azure Storage
> - Creación y uso de tokens de firma de acceso compartido (SAS)
> - Configuración de las directivas de acceso almacenadas
> - Administración de las claves de acceso (rotación)
> - Configuración del acceso basado en identidad para Azure Files

## Enlaces relacionados

**Módulo de Learn**: [Configurar la seguridad de Azure Storage](https://learn.microsoft.com/en-us/training/modules/configure-storage-security/) ([ES](https://learn.microsoft.com/es-es/training/modules/configure-storage-security/))

**Savill**: buscar "SAS" / "storage security" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Private Endpoints]] · [[Servicios de almacenamiento de Azure (AZ-900)]]

**Laboratorio**: Labs 07 (Azure Storage) y 10 (Data Protection) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

# Introducción.

Azure Storage proporciona un completo conjunto de funcionalidades de seguridad que colaboran entre sí para permitir a los desarrolladores compilar aplicaciones seguras.

En este módulo, su empresa está almacenando datos confidenciales (incluida información personal) en Azure Storage. Los datos se usan internamente y también los usan desarrolladores de aplicaciones externas. Es responsable de garantizar que los datos sean seguros para todos los usuarios. Se le encarga proporcionar soluciones de configuración para conceder acceso seguro a la información.

# Revisión de las estrategias de seguridad de Azure Storage.

Los administradores usan distintas estrategias para garantizar que sus datos estén seguros. Entre los enfoques comunes se incluyen el cifrado, la autenticación, la autorización y el control de acceso de usuarios con credenciales, permisos de archivo y firmas privadas. Azure Storage ofrece un conjunto de funcionalidades de seguridad basadas en estrategias comunes que le ayudarán a proteger los datos.

### Cosas que debe saber sobre las estrategias de seguridad de Azure Storage

Veamos algunas de las características de seguridad de Azure Storage. A medida que pase por este módulo, considere la defensa en profundidad. ¿Cómo puede aplicar características de seguridad de almacenamiento a este concepto?

![Defensa en profundidad del almacenamiento](../assets/images/AZ-104/storage-defense-in-depth.png)

- **Cifrado en reposo**. Storage Service Encryption (SSE) con un cifrado Estándar de cifrado avanzado **(AES) de 256** bits cifra todos los datos escritos en Azure Storage. Cuando se leen datos de Azure Storage, este descifra los datos antes de devolverlos. Este proceso no supone ningún cargo adicional ni afecta al rendimiento. El cifrado en reposo incluye el cifrado de discos duros virtuales (VHD) con Azure Disk Encryption. Este cifrado usa imágenes de BitLocker para Windows y dm-crypt para Linux.

- **Cifrado en tránsito**. Puede configurar la cuenta de almacenamiento para que solo acepte solicitudes de conexiones seguras estableciendo la propiedad **Transferencia segura necesaria** para la cuenta de almacenamiento. Las cuentas existentes deben denegar explícitamente TLS 1.0 y 1.1, que están en desuso.

- **Modelos de cifrado**. Azure admite varios modelos de cifrado, incluido el cifrado del lado servidor que usa claves administradas por el servicio, claves administradas por el cliente en Key Vault o claves administradas por el cliente en hardware controlado por el cliente. Con el cifrado del lado cliente, puede administrar y almacenar claves locales o en otra ubicación segura.

- **Autorizar solicitudes**. Para una seguridad óptima, Microsoft recomienda usar Microsoft Entra ID con identidades administradas para autorizar solicitudes contra datos de blob, cola y tabla, siempre que sea posible. La autorización con Microsoft Entra ID e identidades administradas proporciona mayor seguridad y facilidad de uso a través de la autorización de clave compartida.

- **RBAC**. RBAC garantiza que los recursos de su cuenta de almacenamiento sean accesibles solo cuando usted lo desee y únicamente para los usuarios o aplicaciones a los que les conceda acceso. Asigne roles de RBAC con ámbito a una cuenta de Almacenamiento de Azure.

- **Análisis de almacenamiento**. Azure Storage Analytics realiza el registro de una cuenta de almacenamiento. Puede usar estos datos para realizar un seguimiento de las solicitudes, analizar las tendencias de uso y diagnosticar problemas con la cuenta de almacenamiento.

> [!Warning] Warning
> La [prueba comparativa de seguridad en la nube de](https://learn.microsoft.com/es-es/security/benchmark/azure/baselines/storage-security-baseline) almacenamiento de Microsoft proporciona recomendaciones sobre cómo proteger las soluciones de almacenamiento en la nube.


# Creación de firmas de acceso compartido.

Una [firma de acceso compartido (SAS)](https://learn.microsoft.com/es-es/azure/storage/common/storage-sas-overview)  (Shared Access Signature) es un identificador uniforme de recursos (URI -> **Uniform Resource Identifier** (Identificador Uniforme de Recursos).) que concede derechos de acceso restringidos a los recursos de Azure Storage. Una SAS es una forma segura de compartir los recursos de almacenamiento sin poner en peligro las claves de cuenta.

Puede proporcionar una SAS a los clientes que no deben tener acceso a la clave de la cuenta de almacenamiento. Mediante la distribución de un URI de SAS entre estos clientes, les concede acceso a un recurso durante un período de tiempo específico. UnaSAS normalmente se usaría para un servicio en el que los usuarios leyeran y escribieran sus datos en la cuenta de almacenamiento.

- Una _delegación SAS de usuario_ está protegida con las credenciales de Microsoft Entra y por los permisos especificados para la SAS. Se admite una SAS de delegación de usuarios para Blob Storage y Data Lake Storage,

- Una _SAS de nivel de cuenta_ para permitir el acceso a todo lo que una SAS de nivel de servicio pueda permitir, además de otros recursos y capacidades. Por ejemplo, puede usar una SAS de nivel de cuenta para permitir la creación de sistemas de archivos.

- Una _SAS de nivel de servicio_ para permitir el acceso a recursos específicos de una cuenta de almacenamiento. Este tipo de SAS se usaría, por ejemplo, para permitir que una aplicación recuperara una lista de archivos de un sistema de archivos o para descargar un archivo.

- Una _directiva de acceso almacenada_ puede proporcionar otro nivel de control cuando se utiliza una SAS de nivel de servicio en el lado servidor. Puede agrupar SAS y proporcionar otras restricciones mediante una directiva de acceso almacenada.

### Recomendaciones para administrar riesgos

Echemos un vistazo a algunas recomendaciones que pueden ayudar a mitigar los riesgos al trabajar con una SAS.

| Recomendación                                                                  | Descripción                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Uso siempre de HTTPS para la creación y distribución**                       | Si se pasa una SAS a través de HTTP, un atacante podría interceptarla y usarla. Estos ataques de tipo _Man in the middle_ pueden poner en peligro los datos confidenciales o permitir que un usuario malintencionado dañe los datos.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **Haga referencia a las directivas de acceso almacenadas cuando sea posible.** | Las directivas de acceso almacenadas le ofrecen la posibilidad de revocar permisos sin tener que volver a generar las claves de cuenta de almacenamiento. Establezca una fecha de expiración futura para la clave de la cuenta de almacenamiento.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **Establecer tiempos de expiración a corto plazo para una SAS no planeada**    | Si una SAS está en peligro, puede mitigar los ataques limitando la validez de SAS a un breve tiempo. Este procedimiento es importante si no puede hacer referencia a una directiva de acceso almacenada. Las expiraciones a corto plazo también limitan la cantidad de datos que puede escribirse en un blob mediante la limitación del tiempo disponible para cargarlos.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **Requerir que los clientes renueven automáticamente la SAS**.                 | Requiera a los clientes que renueven la SAS antes de la fecha de expiración. Al renovar anticipadamente, da margen para diversos reintentos si el servicio que proporciona la SAS no está disponible.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **Planear cuidadosamente la hora de inicio de SAS**                            | Si establece la hora de inicio de la SAS en ahora, pueden producirse errores intermitentes durante los primeros minutos debido al sesgo del reloj (diferencias en la hora actual según las distintas máquinas). En general, establezca la hora de inicio sea al menos 15 minutos en el pasado. O bien, no establezca una hora de inicio específica, lo que hace que la SAS sea válida inmediatamente en todos los casos. Las mismas condiciones se aplican generalmente a la hora de expiración. Puede observar hasta 15 minutos de sesgo del reloj en cualquier dirección de cualquier solicitud. Para los clientes con una versión API REST anterior a 2012-02-12, la duración máxima de una SAS que no hace referencia a una directiva de acceso almacenada es de 1 hora. Se produce un error en las directivas que especifican un período más largo. |
| **Definir los permisos de acceso de los recursos**                             | Un procedimiento recomendado de seguridad es proporcionar al usuario los privilegios mínimos necesarios. Si un usuario solo necesita acceso de lectura en una única entidad, concédale acceso de lectura a esa única entidad y no acceso de lectura, escritura o eliminación a todas las entidades. Esta práctica también ayuda a reducir los daños si se pone en peligro una SAS porque esta tiene menos poder en manos de un atacante.                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **Validar los datos escritos mediante una SAS**                                | Cuando una aplicación cliente escribe datos en la cuenta de almacenamiento de Azure, tenga en cuenta que pueden existir problemas con esos datos. Si la aplicación requiere datos validados o autorizados, valide los datos después de escribirlos, pero antes de usarlos. Esta práctica también le protege frente a los datos erróneos o malintencionados que se escriben en la cuenta, ya sea mediante un usuario que adquirió correctamente la SAS o un usuario que aproveche una SAS errónea.                                                                                                                                                                                                                                                                                                                                                        |
| **No dar por sentado que una SAS siempre será la opción correcta**             | En algunas ocasiones, los riesgos asociados a una operación determinada en la cuenta de almacenamiento superan las ventajas del uso de una SAS. Para esas operaciones, cree un servicio de nivel medio que escriba en la cuenta de almacenamiento después de llevar a cabo una auditoría, autenticación o validación de la regla de negocio. A veces también es más sencillo administrar el acceso de otras formas. Si desea que todos los blobs de un contenedor puedan leerse públicamente, puede hacer que el contenedor sea público en lugar de proporcionar un SAS a cada cliente para obtener acceso.                                                                                                                                                                                                                                              |

# Identificación de parámetros de URI y SAS.

Al crear la firma de acceso compartido (SAS), se crea un identificador uniforme de recursos (URI) mediante el uso de parámetros y tokens. El URI consta del URI del recurso de Azure Storage y del token de SAS.

### Cosas que debe saber sobre las definiciones de URI

Veamos una definición de identificador URI de ejemplo y examinemos los parámetros. En este ejemplo, se crea una SAS de nivel de servicio que concede permisos de lectura y escritura a un blob. Considere cómo puede configurar los parámetros para admitir los recursos de Azure Storage.


```bash
https://myaccount.blob.core.windows.net/?restype=service&comp=properties&sv=2015-04-05&ss=bf&st=2015-04-29T22%3A18%3A26Z&se=2015-04-30T02%3A23%3A26Z&sr=b&sp=rw&sip=168.1.5.60-168.1.5.70&spr=https&sig=F%6GRVAZ5Cdj2Pw4tgU7IlSTkWgn7bUkkAg8P6HESXwmf%4B

```

| Parámetro                      | Ejemplo                                                                                          | Descripción                                                                                                                                                                                                                                                                                                                                                   |
| ------------------------------ | ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **URI de recurso**             | `https://myaccount.`**`blob`**`.core.windows.net/``?restype=`**`service`**`&amp;comp=properties` | Define el punto de conexión de Azure Storage y otros parámetros. En este ejemplo se define un punto de conexión para Blob Storage y se indica que la SAS se aplica a las operaciones de nivel de servicio. Cuando se usa el URI con `GET`, se recuperan las propiedades de Storage. Cuando se usa el URI con `SET`, se configuran las propiedades de Storage. |
| **Versión de Storage**         | **`sv`**`=2015-04-05`                                                                            | En la versión 2012-02-12 y posteriores de Azure Storage, este parámetro indica qué versión usar. En este ejemplo se indica que se debe usar la versión 2015-04-05 (5 de abril de 2015).                                                                                                                                                                       |
| **Servicio de almacenamiento** | **`ss`**`=bf`                                                                                    | Especifica la instancia de Azure Storage a la que se aplica la SAS. En este ejemplo se indica que la SAS se aplica a Blob Storage y Azure Files.                                                                                                                                                                                                              |
| **Hora de inicio**             | **`st`**`=2015-04-29T22%3A18%3A26Z`                                                              | (Opcional) Especifica la hora de inicio de la SAS en hora UTC. En este ejemplo se establece la hora de inicio como 29 de abril de 2015, 22:18:26 UTC. Si desea que la firma de acceso compartido sea válida de inmediato, omita la hora de inicio.                                                                                                            |
| **Hora de expiración**         | **`se`**`=2015-04-30T02%3A23%3A26Z`                                                              | Especifica la hora de expiración de la SAS en hora UTC. En este ejemplo se establece la hora de expiración como 30 de abril de 2015, 02:23:26 UTC.                                                                                                                                                                                                            |
| **Recurso**                    | **`sr`**`=b`                                                                                     | Especifica a qué recursos se puede acceder a través de la SAS. En este ejemplo se especifica que el recurso al que se puede acceder está en Blob Storage.                                                                                                                                                                                                     |
| **Permisos**                   | **`sp`**`=rw`                                                                                    | Enumera los permisos que se van a conceder. En este ejemplo se concede acceso a las operaciones de lectura y escritura.                                                                                                                                                                                                                                       |
| **Intervalo IP**               | **`sip`**`=168.1.5.60-168.1.5.70`                                                                | Especifica un intervalo de direcciones IP desde el que se acepta una solicitud. En este ejemplo se define el intervalo de direcciones IP desde 168.1.5.60 a 168.1.5.70.                                                                                                                                                                                       |
| Protocolo                      | **`spr`**`=https`                                                                                | Especifica los protocolos de los que Azure Storage acepta la SAS. En este ejemplo se indica que solo se aceptan solicitudes mediante HTTPS.                                                                                                                                                                                                                   |
| **Firma**                      | **`sig`**`=F%6GRVAZ5Cdj2Pw4tgU7Il``STkWgn7bUkkAg8P6HESXwmf%4B`                                   | Especifica que el acceso al recurso se autentica mediante una firma con código de autenticación de mensajes basado en hash (HMAC). La firma se calcula a través con una clave mediante el algoritmo SHA256 y se codifica mediante Base64.                                                                                                                     |


> [!TIP] TIP
>  Continúe con el aprendizaje con los módulos de entrenamiento Implementar firmas de acceso compartido .

# Determinación del cifrado de Azure Storage.

El cifrado de Azure Storage para datos en reposo protege sus datos al asegurarse de que se cumplen los compromisos de seguridad y cumplimiento de la organización. Los procesos de cifrado y descifrado se realizan de forma automática. Dado que los datos están protegidos de forma predeterminada, no es necesario modificar el código ni las aplicaciones.

Cuando se crea una cuenta de almacenamiento, Azure genera dos claves de acceso de cuenta de almacenamiento de 512 bits para esa cuenta. Estas claves se pueden usar para autorizar el acceso a los datos de su cuenta de almacenamiento mediante la autorización de clave compartida o tokens de SAS firmados con la clave compartida.

Microsoft recomienda usar Azure Key Vault para administrar las claves de acceso, así como rotar y volver a generar las claves de forma periódica. Azure Key Vault admite directivas de rotación automática de claves, lo que le permite definir programaciones de rotación (por ejemplo, cada 90 días) que rotan las claves automáticamente. También puede rotar manualmente las claves cuando sea necesario.

### Cosas que debe saber sobre el cifrado de Azure Storage

Examine las características siguientes del cifrado de Azure Storage.

- Los datos se cifran automáticamente antes de escribirlos en Azure Storage.

- Los datos se descifran automáticamente cuando se recuperan.

- El cifrado de Azure Storage, el cifrado en reposo, el descifrado y la administración de claves son transparentes para los usuarios.

- Todos los datos escritos en Azure Storage se cifran mediante el Estándar de cifrado avanzado (AES) de 256 bits. AES es uno de los cifrados de bloque más seguros que existen.

- El cifrado de Azure Storage está habilitado para todas las cuentas de almacenamiento, nuevas o existentes, y no se puede deshabilitar.

## Configuración del cifrado de Azure Storage

En Azure Portal, especifique el tipo de cifrado para configurar el cifrado de Azure Storage. Puede encargarse de administrar las claves o elegir que las administre Microsoft. Considere cómo puede implementar el cifrado de Azure Storage para la seguridad del almacenamiento.
  
![Cifrado de Azure Storage con claves de Microsoft o del cliente](../assets/images/AZ-104/storage-encryption-keys.png)

- **Cifrado de infraestructura**. [El cifrado de infraestructura](https://learn.microsoft.com/es-es/azure/storage/common/infrastructure-encryption-enable) se puede habilitar para toda la cuenta de almacenamiento o para un ámbito de cifrado dentro de una cuenta. Cuando se habilita el cifrado de infraestructura para una cuenta de almacenamiento o un ámbito de cifrado, los datos se cifran dos veces (una en el nivel de servicio y otra en el de infraestructura) con dos algoritmos de cifrado diferentes y dos claves distintas.

- **Claves administradas por la plataforma**. Las claves administradas por la plataforma (PMK) son claves de cifrado que Azure genera, almacena y administra completamente. Los clientes no interactúan con las PMKs. Las claves usadas para Azure Data Encryption-at-Rest, por ejemplo, son PMK de forma predeterminada.

- **Claves administradas por el cliente**. Por otro lado, las claves administradas por el cliente (CMK) son claves que uno o varios clientes leen, crean, eliminan, actualizan o administran. Las claves almacenadas en un almacén de claves propiedad del cliente o en un módulo de seguridad de hardware (HSM) son CMK. Bring Your Own Key (BYOK) es un escenario de CMK en el que un cliente importa (trae) claves de una ubicación de almacenamiento externa. Este tema se describe con más detalle en la página siguiente.

# Creación de claves administradas por el cliente

Para la solución de seguridad de Azure Storage, puede usar Azure Key Vault para administrar las claves de cifrado. Las API de Azure Key Vault se pueden usar para generar claves de cifrado. También puede crear sus propias claves de cifrado y almacenarlas en un almacén de claves.

### Cosas que debe saber sobre las claves administradas por el cliente

Tenga en cuenta las siguientes características de las claves administradas por el cliente.

- Al crear sus propias claves (denominadas claves _administradas_ por el cliente), tiene más flexibilidad y mayor control.

- Puede crear, deshabilitar, auditar, rotar y definir controles de acceso para sus claves de cifrado.

- Las claves administradas por el cliente se pueden usar con el cifrado de Azure Storage. Puede usar una clave nueva o un almacén de claves y una clave existentes. La cuenta de almacenamiento de Azure y el almacén de claves deben estar en la misma región, pero pueden estar en distintas suscripciones.

- Las claves administradas por el cliente se almacenan en un Azure Key Vault propiedad del cliente o en un Azure Key Vault Managed HSM administrado por el cliente. HSM administrado proporciona validación fiPS 140-2 de nivel 3 para las organizaciones con los requisitos de cumplimiento más altos.


## Configuración de claves administradas por el cliente

En Azure Portal, puede configurar claves de cifrado administradas por el cliente. Puede crear sus propias claves o hacer que Microsoft las administre. Considere cómo puede usar Azure Key Vault para crear sus propias claves de cifrado administradas por el cliente.

![Configuración de claves administradas por el cliente](../assets/images/AZ-104/storage-customer-managed-keys.png)

- **Tipo** de cifrado: elija cómo se administra la clave de cifrado: por Microsoft o por usted mismo (cliente).

- **Clave** de cifrado: especifique una clave de cifrado escribiendo un URI o seleccione una clave de un almacén de claves existente.


> [!INFO] Sugerencia
> Expanda la comprensión de la seguridad de almacenamiento en el módulo [_Planear e implementar la seguridad para el entrenamiento de almacenamiento_](https://learn.microsoft.com/es-es/training/modules/security-storage/) .


# Aplicar procedimientos recomendados de seguridad para Azure Storage

[Storage Insights](https://learn.microsoft.com/es-es/azure/storage/common/storage-insights-overview?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&bc=%2Fazure%2Fstorage%2Fblobs%2Fbreadcrumb%2Ftoc.json) proporciona una supervisión completa de las cuentas de Azure Storage. Storage Insights ofrece una vista unificada del rendimiento, la capacidad y la disponibilidad de los servicios de Azure Storage.

![Storage Insights en Azure Portal](../assets/images/AZ-104/storage-insights.png)

### ¿Cuáles son las ventajas de Storage Insights?

- **Métricas y registros detallados**. Azure Storage Insights ofrece métricas detalladas, registros e información de diagnóstico que mejoran la visibilidad de las operaciones de almacenamiento. Insights ayuda a supervisar indicadores clave de rendimiento (KPI), como la latencia, el rendimiento, el uso de la capacidad y las transacciones.

- **Seguridad y cumplimiento mejorados**. Mediante Azure Storage Insights, puede garantizar una mayor seguridad y cumplimiento. Proporciona información útil y alertas que ayudan a identificar y resolver rápidamente problemas de seguridad.

- **control de acceso basado en rol (RBAC-> Role-Based Access Control)**. Azure Storage Insights se integra con las características de seguridad de Azure, incluidos el control de acceso basado en rol (RBAC), el identificador de Microsoft Entra, las cadenas de conexión y los permisos de lista de control de acceso (ACL). RBAC(Role-Based Access Control) garantiza el acceso seguro a los datos y los recursos.

- **Vista unificada**. Ofrece una vista unificada del rendimiento, la capacidad y la disponibilidad de los servicios de Azure Storage, que es fundamental para mantener la seguridad y la eficacia de las cuentas de almacenamiento.


### Cuándo usar Storage Insights

- **Supervisión en tiempo real**. Azure Storage Insights permite la supervisión en tiempo real de las cuentas de almacenamiento, lo que le permite realizar un seguimiento de las tendencias de uso, supervisar el rendimiento y configurar alertas para detectar anomalías.

- **Auditoría de seguridad**. Ayuda a la auditoría de seguridad proporcionando una supervisión completa y registros detallados, que son esenciales para garantizar el cumplimiento e identificar los problemas de seguridad.

- **Análisis y optimización de la salud**. La herramienta ayuda en el análisis de estado y la optimización de las cuentas de almacenamiento, lo que garantiza la seguridad y el rendimiento óptimo.


### Cuándo usar Microsoft Defender para Storage

Aunque Storage Insights proporciona supervisión pasiva y análisis histórico, Microsoft Defender para Storage ofrece detección proactiva de amenazas para amenazas de seguridad activas.

**Principales funcionalidades**

- **Examen de malware**. Examina automáticamente las cargas de blobs en busca de malware y virus.

- **Detección de amenazas de datos confidenciales**. Identifica cuándo la información de identificación personal (PII) o las credenciales se almacenan de forma inapropiada.

- **Detección de amenazas basada en** actividad. Supervisa los patrones de acceso inusuales, los volúmenes de descarga sospechosos y el análisis de reputación hash.

Microsoft Defender para Storage complementa Storage Insights al proporcionar detección de amenazas activa en lugar de supervisión reactiva e informes históricos.

# Administración de Azure Storage.

## Escenario de laboratorio

En este laboratorio, aprenderá a crear cuentas de almacenamiento para blobs de Azure y Azure Files. Aprenderá a configurar y proteger contenedores de blobs. También aprenderá a usar el explorador de almacenamiento para configurar y proteger recursos compartidos de archivos de Azure.


> [!NOTE] Title
> En este laboratorio se abordan las cuentas de almacenamiento, los blobs y los archivos. A medida que siga los pasos, tenga en cuenta las características de seguridad que ha aprendido.

## Diagrama de arquitectura

![Arquitectura del laboratorio 07 de almacenamiento](../assets/images/AZ-104/storage-security-lab07-overview.png)

## Aptitudes de trabajo

- Cree y configure una cuenta de almacenamiento.
- Cree y configure el almacenamiento de blobs seguro.
- Cree y configure almacenamiento seguro de archivos de Azure.

Nota:

Tiempo estimado: 50 minutos. Para completar este ejercicio, necesitará una [suscripción a Azure](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_33fe602f-9769-e313-4d56-69992cf6173d).

Inicie el ejercicio y siga las instrucciones. Cuando termine, asegúrese de volver a esta página para que pueda continuar aprendiendo.

[Abrir el ejercicio oficial](https://microsoftlearning.github.io/AZ-104-MicrosoftAzureAdministrator/Instructions/Labs/LAB_07-Manage_Azure_Storage.html)

LAB: [Laboratorio 07: Administración de Azure Storage](../labs/AZ-104/MicrosoftAzureAdministrator/AZ-104-MicrosoftAzureAdministrator..md)


# Resumen y recursos


Los administradores de Azure deben estar familiarizados con cómo configurar la seguridad del almacenamiento.

En este módulo, ha examinado varias opciones para proteger Azure Storage. Ha descubierto cómo configurar firmas de acceso compartido (SAS), incluido el identificador uniforme de recursos (URI) y los parámetros de SAS. Ha revisado cómo implementar claves administradas por el cliente y definir directivas de acceso almacenadas para configurar el cifrado de Azure Storage. Ha explorado oportunidades para mejorar la solución de seguridad de Azure Storage.

## Más información con Copilot

Copilot puede ayudarle a configurar soluciones de infraestructura de Azure. Copilot puede comparar, recomendar, explicar e investigar productos y servicios en los que necesita más información. Abra un explorador de Microsoft Edge y elija Copilot (arriba a la derecha) o vaya a copilot.microsoft.com. Dedique unos minutos a probar estos mensajes y ampliar el aprendizaje con Copilot.

- ¿Cuáles son las distintas formas de proteger Azure Storage? Aporte casos de uso de ejemplo.
    
- ¿Cómo se configura una firma de acceso compartido de Azure?
    

## Obtener más información con la documentación

- Conceda [acceso limitado a recursos de Azure Storage con firmas de acceso compartido](https://learn.microsoft.com/es-es/azure/storage/common/storage-dotnet-shared-access-signature-part-1).
    
- Obtenga más información acerca del [Cifrado de Azure Storage para datos en reposo](https://learn.microsoft.com/es-es/azure/storage/common/storage-service-encryption).
    
- Cree una [SAS para la cuenta de almacenamiento de Azure](https://learn.microsoft.com/es-es/rest/api/storageservices/create-account-sas).
    
- Cree una [SAS de nivel de servicio](https://learn.microsoft.com/es-es/rest/api/storageservices/create-service-sas).
    
- Cree una [SAS de delegación de usuarios](https://learn.microsoft.com/es-es/rest/api/storageservices/create-user-delegation-sas#construct-a-user-delegation-sas).
    
- Use [claves administradas por el cliente para el cifrado de Azure Storage](https://learn.microsoft.com/es-es/azure/storage/common/customer-managed-keys-overview).
    

## Más información con el aprendizaje autodirigido

- Proteja su [cuenta de almacenamiento de Azure](https://learn.microsoft.com/es-es/training/modules/secure-azure-storage-account/).
    
- Implemente la [seguridad de Azure Storage](https://learn.microsoft.com/es-es/training/modules/security-storage/).













## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Private Endpoints]]
