
Tiene una red virtual Azure que contiene cuatro subredes. Cada subred contiene diez máquinas virtuales.

Tiene previsto configurar un grupo de seguridad de red (NSG) que permitirá el tráfico entrante a través del puerto TCP 8080 a dos máquinas virtuales en cada subred. El NSG se asociará a cada subred.

Debe recomendar una solución para configurar el acceso entrante mediante el menor número de reglas de NSG posibles.

¿Qué debe usar como destino en el grupo de seguridad de red?

Seleccione solo una respuesta.

Un grupo de seguridad de aplicaciones

**Esta respuesta es correcta.**

una etiqueta de servicio

las subredes de las máquinas virtuales

**Esta respuesta no es correcta.**

Los grupos de seguridad de aplicaciones permiten agrupar las interfaces de red de varias máquinas virtuales y, a continuación, usar el grupo como origen o destino en una regla de NSG. Las interfaces de red deben estar en la misma red virtual.

Puede usar la dirección IP de cada máquina virtual como destino, pero debe crear una regla para cada máquina virtual.

El uso de las subredes requerirá cuatro reglas y también permitirá el tráfico a todas las máquinas virtuales de esas subredes.

Las etiquetas de servicio son para servicios de Azure específicos, como Azure App Service o Azure Backup.

Introducción a los grupos de seguridad de aplicaciones [Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/application-security-groups)

[Configurar grupos de seguridad de red: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-network-security-groups/)

iene una red virtual Azure denominada VNet1.

Cree una zona Azure DNS privado denominada contoso.com.

Debe asegurarse de que las máquinas virtuales de VNet1 se registren en la zona DNS privada contoso.com.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Agregue un vínculo de red virtual a contoso.com.

**Esta respuesta es correcta.**

Agregue el resolutor privado de DNS de Azure a VNet1.

Configure cada máquina virtual para usar un servidor DNS personalizado.

Configure VNet1 para usar un servidor DNS personalizado.

**Esta respuesta no es correcta.**

Para asociar una red virtual a una zona DNS privada, agregue la red virtual a la zona mediante la creación de un vínculo de red virtual.

Azure DNS Private Resolver se utiliza para intermediar en las consultas DNS entre entornos locales y Azure DNS.

Un servidor DNS personalizado funcionará si implementa un servidor DNS como una máquina virtual o un dispositivo, sin embargo, esta configuración no funciona con una zona DNS privada.

[Quickstart: creación de una zona DNS privada de Azure mediante el portal de Azure | Microsoft Learn](https://learn.microsoft.com/azure/dns/private-dns-getstarted-portal)

[Configure Azure DNS - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-azure-dns/)

5. Supervisión y mantenimiento de recursos de Azure

[](https://aka.ms/yourcaliforniaprivacychoices)

___
Debe crear las alertas de Azure basadas en los valores métricos y los eventos del registro de actividad.

El plan debe cumplir los requisitos siguientes:

- Establezca un límite en el número de veces que se envía una notificación de alerta.
- Llame a una función Azure cuando se desencadene una alerta.
- Configure la alerta para que tenga una determinada gravedad de advertencia cuando se desencadene.

¿Qué dos recursos debe crear? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

Un grupo de acción

**Esta respuesta es correcta.**

una regla de alertas

**Esta respuesta es correcta.**

Una notificación

**Esta respuesta no es correcta.**

un webhook seguro

Debe crear un grupo de acciones para configurar una acción y crear una regla de alerta para establecer la gravedad de los errores. Una notificación solo se usa para enviar correos electrónicos y no es necesario invocar un webhook.

[Administrar grupos de acción en el portal de Azure: Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/alerts/action-groups)

___
Tiene una suscripción de Azure que contiene un usuario denominado User1 y una bóveda de servicios de recuperación denominada Vault1.

Los informes de Azure Backup se usan para supervisar el estado de los recursos protegidos.

Debe notificar al usuario1 por correo electrónico cuando un informe de copia de seguridad muestra un estado de error. La solución debe minimizar el esfuerzo administrativo.

¿Qué debe hacer primero?

Seleccione solo una respuesta.

Configure las propiedades de Vault1.

Configure los valores de Control de acceso (IAM) para Vault1.

Cree un grupo de acciones en Azure Monitor.

**Esta respuesta es correcta.**

Cree una regla de procesamiento de alertas en Azure Monitor.

**Esta respuesta no es correcta.**

**Objetivo:**

5.2 Implementación de copias de seguridad y recuperación

**Qué prueba este elemento:**

Configuración e interpretación de informes y alertas para copias de seguridad

**Lectura adicional:**

[Preguntas frecuentes: Supervisión e informes de Azure Backup - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/azure/backup/backup-azure-monitor-alert-faq)

**Justificación:**

Correcto: primero se debe crear un grupo de acciones para definir el destino de notificación por correo electrónico antes de que se pueda asociar a cualquier alerta de Azure Monitor, lo que lo convierte en el paso inicial necesario al configurar las notificaciones de alerta de copia de seguridad.

Incorrecto: las propiedades del almacén de claves y la configuración de IAM no configuran notificaciones de alerta, y las reglas de procesamiento de alertas son modificadores opcionales posteriores que no pueden enviar notificaciones sin un grupo de acciones existente.
___
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

**Esta respuesta no es correcta.**

En storage1, habilite una firma de acceso compartido (SAS).

La solución correcta consiste en configurar primero el acceso basado en identidades para los recursos compartidos de archivos de Azure en storage1, ya que esto permite la autenticación y la autorización a través de Microsoft Entra ID (sincronizados desde AD DS local). Sin habilitar el acceso basado en identidades, Server1 no puede usar credenciales de dominio para acceder al recurso compartido. La modificación de pertenencias a grupos en Server1 o el cambio de la configuración de seguridad en el recurso compartido de archivos solo son relevantes después de configurar el acceso basado en identidad. Una firma de acceso compartido (SAS) proporciona acceso basado en tokens, pero no se integra con identidades de AD DS/Entra, por lo que no permitiría la autenticación de dominio sin problemas. Por lo tanto, habilitar el acceso basado en identidades para el recurso compartido de archivos es el primer paso necesario.

[Información general de la autenticación basada en identidades de Azure Files para el acceso SMB](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-active-directory-overview "Información general de la autenticación basada en identidades de Azure Files para el acceso SMB")  
[Resumen: autenticación de Active Directory Domain Services locales a través de SMB para recursos compartidos de archivos de Azure](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-identity-ad-ds-overview "Resumen: autenticación de Active Directory Domain Services locales a través de SMB para recursos compartidos de archivos de Azure")  
[Identidad y Control de Acceso](https://learn.microsoft.com/en-us/training/modules/introduction-to-azure-files/4-identity-and-access-control "Identidad y Control de Acceso")


![[Pasted image 20261008093444.png]]

