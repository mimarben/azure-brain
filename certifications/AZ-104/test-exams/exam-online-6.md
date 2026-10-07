Tiene una suscripción Azure que contiene 10 máquinas virtuales.

Debe asegurarse de que un usuario denominado User1 puede etiquetar todas las máquinas virtuales mediante el portal de Azure. La solución debe seguir el principio de privilegios mínimos.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

En el portal de Azure, cree un rol personalizado que tenga el permiso Microsoft.Compute/virtualMachines/*/write.

En el portal de Azure, modifique la configuración de Control de acceso (IAM) de las máquinas virtuales.

**Esta respuesta es correcta.**

En el portal de Azure, modifique la configuración directivas de la suscripción de Azure.

**Esta respuesta no es correcta.**

En la línea de comandos, ejecute el comando "az role assignment create".

La solución correcta consiste en actualizar la configuración de control de acceso (IAM) de las máquinas virtuales en el portal de Azure y asignar a User1 un rol que conceda derechos de etiquetado, como el rol integrado Colaborador de etiquetas. Esto sigue el principio de privilegios mínimos porque concede a User1 solo los permisos necesarios para aplicar y administrar etiquetas, sin conceder derechos administrativos o de escritura completos. La creación de un rol personalizado con permisos completos para virtualMachines/*/write es innecesaria y demasiado amplia, la modificación de directivas solo impone reglas de etiquetado en lugar de conceder permisos, y el uso del comando az role assignment create es otra forma de asignar roles, pero no especifica los roles con privilegios mínimos o el método basado en el portal solicitado en el escenario.

[Aplicar etiquetas con el portal de Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources-portal)  
[Entender la Automatización de Azure](https://learn.microsoft.com/en-us/training/modules/manage-azure-paas-resources-using-automated-methods/3-understand-azure-automation)  
[Aplicar etiquetas con CLI de Azure](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources-cli)  
[Aplicar etiquetas con Azure PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources-powershell)  
[Etiqueta las cargas de trabajo críticas](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-mission-critical-workload)  
[Uso del etiquetado para organizar los recursos](https://learn.microsoft.com/en-us/training/modules/control-and-organize-with-azure-resource-manager/3-use-tagging-to-organize-resources)

___
Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1.

Debe proporcionar acceso a almacenamiento1 a una organización asociada. El acceso a Storage1 debe expirar automáticamente después de 24 horas.

¿Qué debe configurar?

Seleccione solo una respuesta.

firma de acceso compartido (SAS)

**Esta respuesta es correcta.**

clave de acceso

Azure Content Delivery Network (CDN)

administración del ciclo de vida

**Esta respuesta no es correcta.**

Una SAS proporciona acceso delegado a los recursos de la cuenta de almacenamiento. Con una SAS, tiene control granular sobre la forma en que un cliente puede tener acceso a los datos, incluidas las restricciones de tiempo.

Las claves de acceso y Azure CDN proporcionan acceso permanente a los recursos. Requerirán pasos manuales para quitar el acceso. No es necesaria la administración del ciclo de vida.

[Configurar la seguridad de Azure Storage - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-storage-security/)

[Grant limitó el acceso a los datos con firmas de acceso compartido (SAS): Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/common/storage-sas-overview)
____
Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1.

Debe conceder acceso a una aplicación de terceros a Storage1 durante los próximos 30 días.

¿Qué debe usar?

Seleccione solo una respuesta.

una directiva de acceso condicional

**Esta respuesta no es correcta.**

una firma de acceso compartido

**Esta respuesta es correcta.**

clave de acceso

un rol de Azure

La solución correcta consiste en usar una firma de acceso compartido (SAS), ya que solo SAS puede especificar el acceso limitado de tiempo a Azure almacenamiento. Una clave de acceso proporciona acceso ilimitado a la cuenta de almacenamiento de Azure, un rol de Azure puede proporcionar acceso o administración del recurso de Azure, que no tiene límite de tiempo, y una directiva de acceso condicional actúa como un motor de directivas de confianza cero, "si-entonces", que evalúa señales como la identidad del usuario, el cumplimiento de dispositivos, la ubicación y el riesgo para tomar decisiones de acceso en tiempo real.

[Detección de firmas de acceso compartido](https://learn.microsoft.com/en-us/training/modules/implement-shared-access-signatures/2-shared-access-signatures-overview)  
[Descripción de las firmas de acceso compartido](https://learn.microsoft.com/en-us/training/modules/secure-azure-storage-account/4-shared-access-signatures)

___

Tiene un área de trabajo de Log Analytics que recopila datos de varios orígenes de datos.

Crea una consulta de registro nueva de Azure Monitor.

Planeas ver datos fijados como gráfico en un panel compartido.

¿Cuál es el número máximo de días durante los que se pueden mostrar datos en el cuadro de mandos compartido?

Seleccione solo una respuesta.

14

30

**Esta respuesta es correcta.**

90

180

Los datos mostrados en un panel de control compartido solo pueden mostrarse durante un máximo de 30 días.

[Visualizaciones de gráficos en cuadernos de Azure Monitor - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/visualize/workbooks-chart-visualizations)

[Introducción a Azure Monitor](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-monitor/)

___

Tiene una suscripción Azure que contiene dos máquinas virtuales denominadas VM1 y VM2.

Se realiza una copia de seguridad de VM1 y VM2 en un almacén de Recovery Service denominado Vault1 mediante la misma directiva de copia de seguridad.

Su empresa planea crear más máquinas virtuales y bóvedas de Recovery Services. Durante este proceso, Vault1 se retirará.

Debe eliminar Vault1.

¿Qué tres acciones debe realizar antes de poder eliminar Vault1? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

Elimine VM1 y VM2.

**Esta respuesta no es correcta.**

Deshabilite la característica de eliminación temporal y elimine todos los datos.

**Esta respuesta es correcta.**

Habilite un bloqueo de lectura en Vault1.

Elimine permanentemente los elementos en estado de eliminación temporal.

**Esta respuesta es correcta.**

Detenga la copia de seguridad de VM1 y VM2.

**Esta respuesta es correcta.**

Debes parar las copias de seguridad para poder prepararte para pasar a la nueva política. La característica de eliminación temporal está habilitada de forma predeterminada, por lo que debe deshabilitarse. Debe quitar todos los elementos que están en estado de eliminación reversible. No es necesario eliminar las máquinas virtuales. No se puede eliminar la directiva sin eliminar la bóveda y la copia de seguridad, y no se necesita una nueva directiva.

[Información general de las bóvedas de Recovery Services: Azure Backup | Microsoft Learn](https://learn.microsoft.com/azure/backup/backup-azure-recovery-services-vault-overview)

[Eliminar una bóveda de Microsoft Azure Recovery Services: Azure Backup | Microsoft Learn](https://learn.microsoft.com/azure/backup/backup-azure-delete-vault?tabs=portal)

___
Su empresa tiene un conjunto de recursos implementados en una suscripción de Azure. Los recursos se implementan en un grupo de recursos denominado app-grp1 mediante plantillas de Azure Resource Manager (ARM).

Debe comprobar la fecha y la hora en que se crearon los recursos de app-grp1.

¿Qué hoja debe revisar para app-grp1 en el portal de Azure?

Seleccione solo una respuesta.

Implementaciones

**Esta respuesta es correcta.**

Configuración de diagnóstico

**Esta respuesta no es correcta.**

Pilas de implementación

Directiva

Navegar a la hoja Configuración de diagnóstico proporciona la capacidad de diagnosticar errores o revisar advertencias. Al navegar a la hoja Métricas se proporciona información de métricas (CPU, recursos) a los usuarios. En la hoja Implementaciones del grupo de recursos (app-grp1), todos los detalles relacionados con una implementación, como el nombre, el estado, la fecha de última modificación y la duración, son visibles. Al navegar al panel Directiva, solo se proporciona información relacionada con las directivas aplicadas en el grupo de recursos.

[Lista de comprobación de implementación de AD de Azure: Microsoft Entra | Microsoft Learn](https://learn.microsoft.com/azure/active-directory/fundamentals/active-directory-deployment-checklist-p2)

____
Tiene una suscripción Azure que contiene una red virtual denominada VNet1.

Tiene previsto implementar una máquina virtual denominada VM1 que se usará como dispositivo de inspección de red.

Asegúrese de que todo el tráfico de red pase a través de VM1.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Configure una ruta definida por el usuario.

**Esta respuesta es correcta.**

Cree una puerta de enlace de red virtual.

**Esta respuesta no es correcta.**

Modifique la ruta predeterminada.

Modifique la ruta del sistema.

Azure crea automáticamente una tabla de rutas para cada subred de una red virtual Azure y agrega rutas predeterminadas del sistema a la tabla. Puede invalidar algunas de las rutas del sistema de Azure con rutas personalizadas definidas por el usuario y agregar más rutas personalizadas a las tablas de rutas. Azure enruta el tráfico saliente desde una subred en función de las rutas de la tabla de rutas de una subred.

enrutamiento de tráfico de red virtual [Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/virtual-networks-udr-overview)

___
Su empresa planea migrar servidores de un entorno local a Azure. Habrá máquinas virtuales de desarrollo, pruebas y producción en una sola red virtual.

Debe restringir el tráfico entre las máquinas virtuales de desarrollo, pruebas y producción a puertos específicos.

¿Qué debe usar?

Seleccione solo una respuesta.

un grupo de seguridad de red (NSG)

**Esta respuesta es correcta.**

un firewall de Azure

**Esta respuesta no es correcta.**

un equilibrador de carga Azure

una red virtual Azure

Debe configurar reglas del grupo de seguridad de red (NSG) para permitir el tráfico TCP o ICMP para puertos específicos. Azure Firewall es un servicio administrado que protege los servicios de Azure en varias redes virtuales. Los equilibradores de carga se usan para distribuir el tráfico entrante entre los servidores back-end disponibles. Azure VPN se usa para tener un establecimiento de conexión entre el entorno local y Azure.

Introducción a los grupos de seguridad de red de [Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/network-security-groups-overview)

[Configurar grupos de seguridad de red: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-network-security-groups/)

___
Tiene una suscripción Azure que contiene una zona Azure DNS denominada contoso.com.

Agregue un nuevo subdominio denominado test.contoso.com.

Tiene previsto delegar test.contoso.com a un servidor DNS diferente.

¿Cómo debe configurar la delegación del dominio?

Seleccione solo una respuesta.

Agregue un registro A para test.contoso.com.

Agregue un conjunto de registros NS denominado test a la zona de contoso.com.

**Esta respuesta es correcta.**

Agregue un registro SOA para test.contoso.com.

Modifique el registro A para contoso.com.

Debe crear un conjunto de registros NS DNS denominado test en la zona contoso.com. Se debe crear una zona NS en el vértice de la zona denominada contoso.com. No es necesario crear el conjunto de registros SOA en test.contoso.com. Solo se debe crear en contoso.com. No es necesario crear ni modificar el registro A de DNS.

[Delegar un subdominio - Azure DNS | Microsoft Learn](https://learn.microsoft.com/azure/dns/delegate-subdomain)

[Hospedar el dominio en Azure DNS - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/host-domain-azure-dns/)

[](https://aka.ms/yourcaliforniaprivacychoices)

___
Ha implementado una aplicación web en Microsoft Azure mediante un Microsoft Load Balancer público para distribuir el tráfico entre máquinas virtuales. Los usuarios notifican problemas de conectividad intermitentes.

Debe solucionar los problemas de conectividad para el acceso coherente a las aplicaciones.

Cada respuesta correcta presenta parte de la solución. ¿Qué dos acciones debe realizar?

Seleccione todas las respuestas que procedan.

Cambie el modo de distribución del equilibrador de carga a Afinidad de IP de origen.

Compruebe la configuración del sondeo de estado.

**Esta respuesta es correcta.**

Compruebe las reglas del grupo de seguridad de red para las máquinas virtuales.

**Esta respuesta no es correcta.**

Compruebe las SKU coincidentes para el equilibrador de carga y la dirección IP pública.

**Esta respuesta es correcta.**

La comprobación de la configuración del sondeo de estado es fundamental porque un sondeo inactivo o configurado incorrectamente puede provocar que el tráfico se enrute a instancias incorrectas, lo que provoca problemas de conectividad. La comprobación de las SKU coincidentes para el equilibrador de carga y la dirección IP pública también es esencial, ya que las SKU no coincidentes pueden interrumpir el funcionamiento adecuado y provocar problemas de conectividad. La comprobación de las reglas del grupo de seguridad de red puede parecer relevante, pero no aborda la causa principal de los problemas de conectividad. Cambiar el modo de distribución del equilibrador de carga podría parecer que podría mejorar la persistencia de la sesión, pero no resuelve los problemas de configuración subyacentes que causan los problemas de conectividad.

___
Su organización usa un Azure Load Balancer para administrar el tráfico de las máquinas virtuales que hospedan una aplicación web. Los usuarios experimentan una distribución de tráfico desigual, con algunas máquinas virtuales que reciben más tráfico que otros.

Debe configurar el equilibrador de carga para garantizar la distribución del tráfico uniforme en todas las máquinas virtuales del grupo de back-end.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Agregue más máquinas virtuales al pool.

Ajuste la configuración de la regla de equilibrio de carga.

**Esta respuesta no es correcta.**

Deshabilite la persistencia de la sesión.

**Esta respuesta es correcta.**

Habilite la persistencia de sesión (afinidad de IP de origen).

Deshabilitar la persistencia de sesión garantiza incluso la distribución del tráfico quitando cualquier afinidad que dirija el tráfico a la misma máquina virtual. Ajustar la configuración de la regla de equilibrio de carga podría parecer una solución, pero no aborda la causa principal de la distribución desigual. La habilitación de la afinidad de IP de origen mantiene la persistencia de la sesión, lo que podría exacerbar la distribución desigual del tráfico. Agregar más máquinas virtuales no resuelve el problema de distribución causado por la configuración de persistencia de sesión.

[Configurar la configuración de la red de la máquina virtual de Azure - Formación | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/create-windows-virtual-machine-in-azure/6-manage-vm)

[](https://aka.ms/yourcaliforniaprivacychoices)

___
![[Pasted image 20261006120716.png]]