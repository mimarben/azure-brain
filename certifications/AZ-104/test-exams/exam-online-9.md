




Tiene una suscripción de Azure que contiene varias cuentas de almacenamiento.

Una cuenta de almacenamiento denominada storage1 tiene un recurso compartido de archivos denominado share1 que almacena vídeos de marketing. Los usuarios informaron de que el 99 % del almacenamiento asignado está en uso.

Debe asegurarse de que share1 puede admitir archivos grandes y almacenar hasta 100 TiB.

¿Cuáles son los dos comandos de PowerShell que debe ejecutar? Cada respuesta correcta presenta parte de la solución.

### Su respuesta

- `New-AzRmStorageShare -ResourceGroupName RG1 -Name -StorageAccountName storage1 -Name share1 -QuotaGiB 100GB`
    
    **Esta respuesta no es correcta.**
    
- `Set-AzStorageAccount -ResourceGroupName RG1 -Name storage1 -EnableLargeFileShare`
    
    **Esta respuesta es correcta.**
    

### Respuesta correcta

- `Set-AzStorageAccount -ResourceGroupName RG1 -Name storage1 -EnableLargeFileShare`
    
    **Esta respuesta es correcta.**
    
- `Update-AzRmStorageShare -ResourceGroupName RG1 -Name -StorageAccountName storage1 -Name share1 -QuotaGiB 102400`
    
    **Esta respuesta es correcta.**
    

Debe habilitar la cuenta de almacenamiento para admitir archivos grandes y actualizar la cuota de la cuenta de almacenamiento a 102 400 GB. No es necesario cambiar el tipo de cuenta de almacenamiento y está actualizando la compartición existente.

Información general sobre la replicación de objetos - [Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/blobs/object-replication-overview)

[Configure Azure Blob Storage - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-blob-storage/)

## Pregunta 25 de 50

Tiene una plantilla de Azure Resource Manager (ARM) denominada Template1 que se usa para implementar las máquinas virtuales de Azure.

Template1 contiene el texto siguiente. 

"recursos": [  
  {  
    "type": "Microsoft. Compute/virtualMachines",  
    "apiVersion": "2025-04-01",  
    "name": "[parameters('vmName')]",  
    "location": "[resourceGroup().location]",  
    "propiedades": {  
      < texto eliminado>  
    }  
  }  
]

Debe implementar dos máquinas virtuales Azure mediante Template1.

¿Qué debe agregar a Template1?

### Su respuesta

- la ubicación del grupo de recursos
    
    **Esta respuesta no es correcta.**
    

### Respuesta correcta

- un elemento de copia
    
    **Esta respuesta es correcta.**


La solución correcta consiste en agregar un elemento de copia, ya que las plantillas de ARM usan la propiedad copy para implementar varias instancias de un recurso, como dos máquinas virtuales, en una sola implementación. La versión de la API ya está especificada en la plantilla y no controla el número de recursos implementados. El identificador de suscripción nunca está codificado de forma dura en las plantillas de ARM, ya que las implementaciones tienen el ámbito de una suscripción y la ubicación del grupo de recursos ya se proporciona a través de "[resourceGroup().location]". Por lo tanto, solo el elemento copy permite a la plantilla crear dos máquinas virtuales a partir de una única definición de recurso.

[Agregar flexibilidad a la plantilla de Azure Resource Manager mediante funciones de plantilla](https://learn.microsoft.com/en-us/training/modules/modify-azure-resource-manager-template-reuse/2-azure-resource-manager-functions)  
[Examinar plantillas de Azure Resource Manager](https://learn.microsoft.com/en-us/training/modules/explore-azure-governance-manageability/3-examine-azure-resource-manager-templates)  
documentación de [Azure Resource Manager](https://learn.microsoft.com/en-us/training/modules/arm-template-whatif/2-deployment-modes)


## Pregunta 35 de 50

Tiene una suscripción Azure que contiene una red virtual denominada VNet1.

Tiene previsto habilitar la conectividad de VNet1 con recursos locales mediante una conexión cifrada.

¿Qué debe configurar para VNet1?

### Su respuesta

- una conexión de extremo privado
    
    **Esta respuesta no es correcta.**
    

### Respuesta correcta

- una puerta de enlace de red virtual
    
    **Esta respuesta es correcta.**
    

Una puerta de enlace de VPN es un tipo de puerta de enlace de red virtual que envía tráfico cifrado entre una red virtual y una ubicación local a través de una conexión pública. También puede usar una puerta de enlace de VPN para enviar tráfico entre redes virtuales a través de la red troncal de Azure. Una conexión de puerta de enlace de VPN se basa en la configuración de varios recursos, cada uno de los cuales contiene valores configurables.

[Introducción a Azure VPN Gateway - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-vpn-gateway/)

## Pregunta 35 de 50

Tiene una suscripción Azure que contiene una red virtual denominada VNet1.

Tiene previsto habilitar la conectividad de VNet1 con recursos locales mediante una conexión cifrada.

¿Qué debe configurar para VNet1?

### Su respuesta

- una conexión de extremo privado
    
    **Esta respuesta no es correcta.**
    

### Respuesta correcta

- una puerta de enlace de red virtual
    
    **Esta respuesta es correcta.**
    

Una puerta de enlace de VPN es un tipo de puerta de enlace de red virtual que envía tráfico cifrado entre una red virtual y una ubicación local a través de una conexión pública. También puede usar una puerta de enlace de VPN para enviar tráfico entre redes virtuales a través de la red troncal de Azure. Una conexión de puerta de enlace de VPN se basa en la configuración de varios recursos, cada uno de los cuales contiene valores configurables.

[Introducción a Azure VPN Gateway - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-vpn-gateway/)
## Pregunta 37 de 50

Tiene una suscripción de Azure que contiene las siguientes redes virtuales:

- VNet1: tiene un espacio de direcciones IP de 10.10.0.0/16 y contiene una subred denominada Subnet1 (10.10.1.0/24) que hospeda una máquina virtual denominada VM1 que ejecuta Windows Server.
- VNet2: tiene un espacio de direcciones IP de 10.20.0.0/16 y contiene una subred denominada Subnet2 (10.20.1.0/24) que hospeda una máquina virtual denominada VM2 que ejecuta Windows Server.

VNet1 y VNet2 están conectados mediante el emparejamiento de red virtual.

Los usuarios informan de que VM1 no se puede conectar a VM2.

Debe comprobar si el tráfico de VM1 a la subred 10.20.0.0/16 usa el emparejamiento de red virtual como próximo salto.

¿Qué debe usar?

### Su respuesta

- Azure Network Watcher próximo salto para la interfaz de red de VM1
    
    **Esta respuesta no es correcta.**
    

### Respuesta correcta

- rutas eficaces para la interfaz de red de VM1
    
    **Esta respuesta es correcta.**
    

**Objetivo:**

4.1 Configuración y administración de redes virtuales en Azure

**Qué prueba este elemento:**

Creación y configuración de redes virtuales y subredes

**Lectura adicional:**

[Restricciones para redes virtuales enlazadas: formación | Microsoft Learn](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview#troubleshoot)

Diagnosticador de problemas de red - Entrenamiento | Microsoft Learn

[Administrar redes virtuales: entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/describe-microsoft-azure-resources-management/4-manage-virtual-networks)

**Justificación:**

Al ver las rutas efectivas en la interfaz de red de VM1, se muestran todas las rutas que Azure aplica al tráfico saliente, incluidas las definidas por el sistema, el emparejamiento y el usuario, así como el tipo de siguiente salto para el prefijo 10.20.0.0/16.

La solución de problemas de conexión valida la accesibilidad, pero no muestra las decisiones de enrutamiento.

Azure Network Watcher próximo salto es una herramienta de diagnóstico que identifica el próximo salto de enrutamiento (tipo, dirección IP e identificador de tabla de rutas) para el tráfico que sale de una máquina virtual. El siguiente salto no muestra las decisiones de enrutamiento.

El rol de Controlador de Red en Windows Server es un punto de administración centralizado y programable para Redes Definidas por Software (SDN).

![[Pasted image 20261007133832.png]]