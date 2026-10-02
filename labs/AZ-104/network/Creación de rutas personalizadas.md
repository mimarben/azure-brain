
Al implementar la estrategia de seguridad, quiere controlar cómo se enruta el tráfico de red a través de la infraestructura de Azure.

En el ejercicio siguiente, usará una aplicación virtual de red (NVA) para ayudar a proteger y supervisar el tráfico. Asegúrese de que la comunicación entre los servidores públicos front-end y los servidores privados internos siempre se enrute a través del dispositivo.

Configurará la red para que todo el tráfico que fluye desde una subred pública a una subred privada se enrute a través de la aplicación virtual de red. Para ello, creará una ruta personalizada para la subred pública, con el fin de enrutar este tráfico a una subred en la red perimetral. Más adelante, implementará una NVA en la subred de la red perimetral.

![Diagrama de red virtual, subredes y tabla de rutas.](https://learn.microsoft.com/es-es/training/modules/control-network-traffic-flow-with-routes/media/3-virtual-network-subnets-route-table.svg)

En este ejercicio, creará la tabla de rutas, la ruta personalizada y las subredes. Luego asociará la tabla de rutas a una subred.

> [!NOTE] 
> Este ejercicio es opcional. Si desea completar este ejercicio, deberá crear una suscripción de Azure antes de comenzar. Si no tiene una cuenta de Azure o no quiere crear una en este momento, puede leer las instrucciones para que comprenda la información que se presenta.
> 

> [!NOTE] 
> Debe usar un grupo de recursos para completar los pasos de este ejercicio. Puede usar un grupo de recursos que ya ha creado o puede crear un nuevo grupo de recursos específicamente para este ejercicio. Si decide crear un nuevo grupo de recursos, esto facilitará la limpieza de los recursos que cree a medida que complete el ejercicio. Si no tiene un grupo de recursos existente o desea crear uno nuevo específicamente para este ejercicio, puede seguir los pasos descritos en [Uso de Azure Portal y Azure Resource Manager para administrar grupos](https://learn.microsoft.com/es-es/azure/azure-resource-manager/management/manage-resource-groups-portal) de recursos para crear un grupo de recursos mediante Azure Portal, o puede seguir los pasos descritos en [Administración de grupos de recursos de Azure mediante la CLI de Azure](https://learn.microsoft.com/es-es/azure/azure-resource-manager/management/manage-resource-groups-cli) para crear un grupo de recursos mediante la CLI de Azure.

> [!NOTE] 
> En este ejercicio, reemplace **myResourceGroupName** en los ejemplos por el nombre de un grupo de recursos existente o el nombre del grupo de recursos que creó para este ejercicio.

## Creación de una tabla de rutas y una ruta personalizada

La primera tarea consiste en crear una tabla de enrutamiento y luego agregar una ruta personalizada para todo el tráfico que se dirige a la subred privada.

Nota:

Es posible que se le muestre un error que diga: _Este comando está en desuso implícitamente_. Puede omitir este error para este módulo de aprendizaje. ¡Estamos trabajando en ello!

1. Abra [Azure Cloud Shell](https://shell.azure.com/), seleccione **Configuración** y, a continuación, seleccione **Ir a la versión clásica**.
    
2. En Azure Cloud Shell, ejecute el siguiente comando para crear una tabla de rutas. Reemplace **myResourceGroupName** por el nombre del grupo de recursos.
    
    CLI de Azure
    
    ```
        az network route-table create \
            --name publictable \
            --resource-group "myResourceGroupName" \
            --disable-bgp-route-propagation false
    ```
    
3. Ejecute el comando siguiente en Cloud Shell para crear una ruta personalizada:
    
    CLI de Azure
    
    ```
        az network route-table route create \
            --route-table-name publictable \
            --resource-group "myResourceGroupName" \
            --name productionsubnet \
            --address-prefix 10.0.1.0/24 \
            --next-hop-type VirtualAppliance \
            --next-hop-ip-address 10.0.2.4
    ```
    

## Creación de una red virtual y subredes

La tarea siguiente consiste en crear la red virtual **vnet** y las tres subredes que necesita: **publicsubnet**, **privatesubnet** y **dmzsubnet**.

1. Ejecute el comando siguiente para crear la red virtual **vnet** y la subred **publicsubnet**:
    
    CLI de Azure
    
    ```
        az network vnet create \
            --name vnet \
            --resource-group "myResourceGroupName" \
            --address-prefixes 10.0.0.0/16 \
            --subnet-name publicsubnet \
            --subnet-prefixes 10.0.0.0/24
    ```
    
2. Ejecute el comando siguiente en Cloud Shell para crear la subred **privatesubnet**:
    
    CLI de Azure
    
    ```
        az network vnet subnet create \
            --name privatesubnet \
            --vnet-name vnet \
            --resource-group "myResourceGroupName" \
            --address-prefixes 10.0.1.0/24
    ```
    
3. Ejecute el comando siguiente para crear la subred **dmzsubnet**:
    
    CLI de Azure
    
    ```
        az network vnet subnet create \
            --name dmzsubnet \
            --vnet-name vnet \
            --resource-group "myResourceGroupName" \
            --address-prefixes 10.0.2.0/24
    ```
    
4. Ahora debe tener tres subredes. Ejecute el comando siguiente para mostrar todas las subredes de la red virtual **vnet**:
    
    CLI de Azure
    
    ```
        az network vnet subnet list \
            --resource-group "myResourceGroupName" \
            --vnet-name vnet \
            --output table
    ```
    

## Asocia la tabla de rutas con la subred pública

La tarea final de este ejercicio consiste en asociar la tabla de rutas a la subred **publicsubnet**.

Ejecute el comando siguiente para asociar la tabla de rutas a la subred pública.

CLI de Azure

```
    az network vnet subnet update \
        --name publicsubnet \
        --vnet-name vnet \
        --resource-group "myResourceGroupName" \
        --route-table publictable
```