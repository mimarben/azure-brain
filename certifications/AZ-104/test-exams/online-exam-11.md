Tiene previsto configurar la replicación de objetos entre dos cuentas de Azure Storage.

Blob service de la cuenta de almacenamiento de origen tiene la siguiente configuración:

- Espacio de nombres jerárquico: Deshabilitado
- Nivel de acceso predeterminado: Caliente
- Acceso público a blobs: habilitado
- Eliminación temporal de blobs: Habilitado (7 días)
- Eliminación reversible de contenedores: Habilitado (7 días)
- Control de versiones: Deshabilitado
- Flujo de cambios: Habilitado
- NFS v3: Deshabilitado
- Permitir replicación entre inquilinos: habilitado

¿Qué configuración se debe modificar en la cuenta de almacenamiento de origen para admitir la replicación de objetos?

Seleccione solo una respuesta.

Eliminación reversible de blobs

Fuente de cambios

**Esta respuesta no es correcta.**

Espacio de nombres jerárquico

Control de versiones

**Esta respuesta es correcta.**

Control de versiones debe estar habilitado en las cuentas de origen y destino. En este escenario, el control de versiones está deshabilitado actualmente.

Descripción de la replicación de [objetos - Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/blobs/object-replication-overview)

[Configure Azure Blob Storage - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-blob-storage/)

Cree una cuenta de Azure Storage.

Debe crear una regla de administración del ciclo de vida para mover blobs al almacenamiento 'Cool' si los blobs no se han accedido durante 30 días.

¿Qué debe hacer primero?

Seleccione solo una respuesta.

Habilite el seguimiento de acceso.

**Esta respuesta es correcta.**

Habilite el control de versiones para blobs.

**Esta respuesta no es correcta.**

Actualice el inventario de blobs.

Gire las claves de cuenta de almacenamiento.

Se puede usar una regla de administración del ciclo de vida para mover o eliminar blobs automáticamente. La regla puede basarse en la hora en que se modificó por última vez el blob o la hora en que se accedió por última vez al blob (lectura o escritura). Para realizar una acción en función de la hora de acceso, se debe habilitar el seguimiento de acceso. Esto puede suponer costos de almacenamiento adicionales.

[Configurar una directiva de administración del ciclo de vida: Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/blobs/lifecycle-management-policy-configure?tabs=azure-portal)

[Configure Azure Blob Storage - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-blob-storage/)

___
Tiene una suscripción Azure que contiene un grupo de recursos denominado RG1.

Tiene previsto crear y configurar un grupo de seguridad de red (NSG) denominado NSG1 para los siguientes tipos de tráfico:

- Administración de Escritorio remoto
- HTTP

NSG1 se usará en las subredes de varias redes virtuales.

¿Qué dos cmdlets se deben ejecutar? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

`Add-AzLoadBalancerFrontendIpConfig`

`Add-AzNetworkInterfaceTapConfig`

**Esta respuesta no es correcta.**

`New-AzNetworkSecurityGroup`

**Esta respuesta es correcta.**

`New-AzNetworkSecurityRuleConfig`

**Esta respuesta es correcta.**

`New-AzNetworkSecurityRuleConfig` permite crear una regla y proporcionar el tipo, el protocolo, la dirección y el número de puerto. `New-AzNetworkSecurityGroup` crea un grupo de seguridad de red (NSG). - `SecurityRules` especifica una lista de objetos de regla de seguridad de red que se van a crear en un NSG.

[New-AzNetworkSecurityRuleConfig (Az.Network) | Microsoft Learn](https://learn.microsoft.com/powershell/module/az.network/new-aznetworksecurityruleconfig?view=azps-9.2.0&viewFallbackFrom=azps-7.5.0)

[New-AzNetworkSecurityGroup (Az.Network) | Microsoft Learn](https://learn.microsoft.com/powershell/module/az.network/new-aznetworksecuritygroup?view=azps-9.2.0&viewFallbackFrom=azps-7.5.0)

Introducción a los grupos de seguridad de red de [Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/network-security-groups-overview)

[Configurar grupos de seguridad de red: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-network-security-groups/)

___
Su empresa ha implementado un Azure Load Balancer para distribuir el tráfico entre varias máquinas virtuales de una granja de servidores web. Los usuarios notifican tiempos de espera de conexión intermitentes al acceder a la aplicación web.

Debe resolver los problemas de tiempo de espera de conexión y asegurarse de que el balanceador de carga distribuya el tráfico uniformemente.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Cambie el modo de distribución a hash de cinco tuplas.

**Esta respuesta es correcta.**

Configure un sondeo de estado para el equilibrador de carga.

**Esta respuesta no es correcta.**

Habilite la persistencia de sesión con afinidad de IP de origen.

Actualice el equilibrador de carga a una SKU superior.

Cambiar el modo de distribución a un conjunto de cinco hash asegura una distribución uniforme del tráfico teniendo en cuenta varios parámetros, lo cual ayuda a solucionar los problemas de espera en la conexión. La configuración de un sondeo de estado para el equilibrador de carga no afecta a la distribución interna del tráfico ni resuelve los tiempos de espera de conexión. La habilitación de la persistencia de sesión con afinidad de IP de origen puede provocar una distribución de tráfico desigual, lo que dirige las solicitudes del mismo cliente a la misma máquina virtual, lo que no resuelve el problema. La actualización del equilibrador de carga a una SKU superior sin solucionar el modo de distribución no resolverá los problemas de tiempo de espera de conexión o distribución de tráfico desiguales.

[Improvear la escalabilidad y resistencia de las aplicaciones mediante Azure Load Balancer](https://learn.microsoft.com/en-us/training/modules/improve-app-scalability-resiliency-with-load-balancer/)


____

Una organización usa un Microsoft Azure Standard Load Balancer para distribuir el tráfico entre varias máquinas virtuales (VM) en un grupo de back-end. Los usuarios notifican problemas de conectividad intermitentes con las aplicaciones en estas máquinas virtuales.

Debe solucionar y resolver problemas de conectividad.

¿Qué tres acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

Compruebe la configuración del sondeo de estado.

**Esta respuesta es correcta.**

Asegúrese de que las máquinas virtuales responden al puerto configurado.

**Esta respuesta es correcta.**

Aumente el valor del tiempo de espera.

Modifique la configuración de persistencia de la sesión.

**Esta respuesta no es correcta.**

Reinicie las máquinas virtuales.

Compruebe que las reglas de NSG permiten el tráfico entrante.

**Esta respuesta es correcta.**

Para solucionar problemas de conectividad con una Microsoft Azure Standard Load Balancer, es esencial comprobar la configuración del sondeo de estado, asegurarse de que las máquinas virtuales responden al puerto configurado y comprueban que las reglas de NSG permiten el tráfico entrante. Estas acciones abordan posibles errores de configuración que podrían impedir que el tráfico llegue a las máquinas virtuales. Modificar la configuración de persistencia de sesión, aumentar la configuración de tiempo de espera o reiniciar las máquinas virtuales no resuelve directamente los problemas de conectividad y puede introducir nuevas limitaciones o ideas erróneas.

[Puntos de conexión de almacenamiento seguro | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/7-secure-storage-endpoints)  
[Crear reglas de grupo de seguridad de red | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/configure-network-security-groups/5-create-network-security-groups-rules)


![[Pasted image 20261008091541.png]]