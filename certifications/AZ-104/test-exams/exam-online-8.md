Tiene una suscripción Azure que contiene una zona Azure DNS denominada contoso.com.

Agregue un nuevo subdominio denominado test.contoso.com.

Tiene previsto delegar test.contoso.com a un servidor DNS diferente.

¿Cómo debe configurar la delegación del dominio?

Seleccione solo una respuesta.

Agregue un registro A para test.contoso.com.

Agregue un conjunto de registros NS denominado test a la zona de contoso.com.

**Esta respuesta es correcta.**

Agregue un registro SOA para test.contoso.com.

**Esta respuesta no es correcta.**

Modifique el registro A para contoso.com.

Debe crear un conjunto de registros NS DNS denominado test en la zona contoso.com. Se debe crear una zona NS en el vértice de la zona denominada contoso.com. No es necesario crear el conjunto de registros SOA en test.contoso.com. Solo se debe crear en contoso.com. No es necesario crear ni modificar el registro A de DNS.

[Delegar un subdominio - Azure DNS | Microsoft Learn](https://learn.microsoft.com/azure/dns/delegate-subdomain)

[Hospedar el dominio en Azure DNS - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/host-domain-azure-dns/)

___
Tiene un plan de Azure App Service básico que contiene una aplicación web.

Debe asegurarse de que la aplicación web se puede escalar automáticamente cuando el uso de la CPU es superior a 80% durante un período de 15 minutos.

¿Qué dos acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

Configura un espacio de implementación.

Configure una condición de escalado para escalar en función de una métrica y agregue las reglas.

**Esta respuesta es correcta.**

Configure una condición de escalado para escalar en función de un recuento de instancias y, a continuación, establezca el recuento de instancias.

Ampliar horizontalmente el plan de App Service.

**Esta respuesta no es correcta.**

Ampliar el plan de App Service.

**Esta respuesta es correcta.**

El plan de App Service básico no admite el escalado automático: debe actualizar el plan a la versión Premium (o superior) para admitir el escalado automático. Después de eso, debe configurar una condición de escalado basada en una métrica (CPU), que activará automáticamente la expansión horizontal de la aplicación web del servicio de aplicaciones.

[Escalado de características y capacidades: Azure App Service | Microsoft Learn](https://learn.microsoft.com/azure/app-service/manage-scale-up)

[Configure Azure App Service - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-azure-app-services/)

____
La red contiene un dominio local de Active Directory Services (AD DS) denominado contoso.com. El dominio contiene un servidor denominado Server1 que ejecuta Windows Server.

El dominio se sincroniza con un inquilino de Microsoft Entra denominado contoso.com.

Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1. La suscripción está vinculada a contoso.com.

Tiene previsto usar Server1 para acceder a un recurso compartido de archivos en storage1.

¿Qué debe hacer primero?

Seleccione solo una respuesta.

En la configuración del recurso compartido de archivos, configure el acceso basado en identidades para storage1.

**Esta respuesta es correcta.**

En Server1, modifique la pertenencia de un grupo local existente.

En Server1, modifique la configuración del recurso compartido de archivos de seguridad de storage1.

En storage1, habilite una firma de acceso compartido (SAS).

**Esta respuesta no es correcta.**

La solución correcta consiste en configurar primero el acceso basado en identidades para los recursos compartidos de archivos de Azure en storage1, ya que esto permite la autenticación y la autorización a través de Microsoft Entra ID (sincronizados desde AD DS local). Sin habilitar el acceso basado en identidades, Server1 no puede usar credenciales de dominio para acceder al recurso compartido. La modificación de pertenencias a grupos en Server1 o el cambio de la configuración de seguridad en el recurso compartido de archivos solo son relevantes después de configurar el acceso basado en identidad. Una firma de acceso compartido (SAS) proporciona acceso basado en tokens, pero no se integra con identidades de AD DS/Entra, por lo que no permitiría la autenticación de dominio sin problemas. Por lo tanto, habilitar el acceso basado en identidades para el recurso compartido de archivos es el primer paso necesario.

[Información general de la autenticación basada en identidades de Azure Files para el acceso SMB](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-active-directory-overview "Información general de la autenticación basada en identidades de Azure Files para el acceso SMB")  
[Resumen: autenticación de Active Directory Domain Services locales a través de SMB para recursos compartidos de archivos de Azure](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-identity-ad-ds-overview "Resumen: autenticación de Active Directory Domain Services locales a través de SMB para recursos compartidos de archivos de Azure")  
[Identidad y Control de Acceso](https://learn.microsoft.com/en-us/training/modules/introduction-to-azure-files/4-identity-and-access-control "Identidad y Control de Acceso")


___
Tiene dos cuentas de blob en bloques premium Azure Storage llamadas storage1 y storage2.

Debe configurar la replicación de objetos de storage1 a storage2.

¿Qué tres características se deben habilitar antes de configurar la replicación de objetos? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

control de versiones de blobs para almacenamiento1

**Esta respuesta es correcta.**

control de versiones de blobs para almacenamiento2

**Esta respuesta es correcta.**

fuente de cambios para storage1

**Esta respuesta es correcta.**

fuente de cambios para storage2

**Esta respuesta no es correcta.**

restauración a un momento dado para contenedores en storage1

restauración a un momento dado para contenedores en storage2

La replicación de objetos se puede usar para replicar blobs entre cuentas de almacenamiento. Antes de configurar la replicación de objetos, debe habilitar el versionado de blobs para ambas cuentas de almacenamiento, así como el feed de cambios para la cuenta de origen.

[Configurar la replicación de objetos - Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/blobs/object-replication-configure?tabs=portal)

[Configure Azure Blob Storage - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-blob-storage/)

___
![[Pasted image 20261006142556.png]]


![[Pasted image 20261006142621.png]]