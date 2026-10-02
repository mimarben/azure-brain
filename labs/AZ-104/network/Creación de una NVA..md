
En la siguiente fase de la implementación de seguridad, implementará una aplicación virtual de red (NVA) para proteger y supervisar el tráfico entre los servidores públicos front-end y los servidores privados internos.

En primer lugar, configure el dispositivo para reenviar el tráfico IP. Si el reenvío IP no está habilitado, el tráfico que se enruta a través de la aplicación no llegará nunca los servidores de destino a los que se dirige.

En este ejercicio, implementará la aplicación de red **nva** en la subred **dmzsubnet**. Después, habilitará el reenvío IP para que el tráfico desde **`*`** y el tráfico que usa la ruta personalizada se envíen a la subred **privatesubnet**.

![Diagrama de una aplicación virtual de red con el reenvío IP habilitado.](https://learn.microsoft.com/es-es/training/modules/control-network-traffic-flow-with-routes/media/5-nva-ip-forwarding.svg)

En los pasos siguientes, implementará una NVA. Después, actualizará la NIC virtual de Azure y la configuración de red dentro de la aplicación para habilitar el reenvío IP.

> [!NOTE] 
> Este ejercicio es opcional. Si desea completar este ejercicio, deberá crear una suscripción de Azure antes de comenzar. Si no tiene una cuenta de Azure o no quiere crear una en este momento, puede leer las instrucciones para que comprenda la información que se presenta.

## Implementación de la aplicación virtual de red

Para compilar la NVA, implemente una instancia de Ubuntu LTS.

1. En [Azure Cloud Shell](https://shell.azure.com/), ejecute el siguiente comando para implementar el dispositivo. Reemplace `<password>` por una contraseña adecuada de su elección para la cuenta de **administrador de azureuser** y **myResourceGroupName** por el nombre del grupo de recursos.
    
    CLI de Azure
    
    ```
    az vm create \
        --resource-group "myResourceGroupName" \
        --name nva \
        --vnet-name vnet \
        --subnet dmzsubnet \
        --image Ubuntu2204 \
        --admin-username azureuser \
        --admin-password <password>
    ```
    

## Habilitación del reenvío IP en la interfaz de red de Azure

En los pasos siguientes, habilitará el reenvío IP para el dispositivo de red de **nva**. Cuando el tráfico fluye hacia la NVA, pero está previsto para otro destino, la NVA lo enrutará a su destino correcto.

1. Ejecute el comando siguiente para obtener el id. de la interfaz de red de NVA:
    
    CLI de Azure
    
    ```
    NICID=$(az vm nic list \
        --resource-group "myResourceGroupName" \
        --vm-name nva \
        --query "[].{id:id}" --output tsv)
    
    echo $NICID
    ```
    
2. Ejecute el comando siguiente para obtener el nombre de la interfaz de red de NVA:
    
    CLI de Azure
    
    ```
    NICNAME=$(az vm nic show \
        --resource-group "myResourceGroupName" \
        --vm-name nva \
        --nic $NICID \
        --query "{name:name}" --output tsv)
    
    echo $NICNAME
    ```
    
3. Ejecute el comando siguiente para habilitar el reenvío IP en la interfaz de red:
    
    CLI de Azure
    
    ```
    az network nic update --name $NICNAME \
        --resource-group "myResourceGroupName" \
        --ip-forwarding true
    ```
    

## Habilitación del reenvío IP en la aplicación

1. Ejecute el comando siguiente para guardar la dirección IP pública de la máquina virtual de NVA en la variable `NVAIP`:
    
    CLI de Azure
    
    ```
    NVAIP="$(az vm list-ip-addresses \
        --resource-group "myResourceGroupName" \
        --name nva \
        --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
        --output tsv)"
    
    echo $NVAIP
    ```
    
2. Ejecute el comando siguiente para habilitar el reenvío IP en la NVA:
    
    Bash
    
    ```
    ssh -t -o StrictHostKeyChecking=no azureuser@$NVAIP 'sudo sysctl -w net.ipv4.ip_forward=1; exit;'
    ```
    
    Cuando se le pida, escriba la contraseña que usó al crear la máquina virtual.