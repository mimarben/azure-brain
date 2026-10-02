Ahora que se han creado la aplicación virtual de red (NVA) y las máquinas virtuales (VM), enrutará el tráfico por medio de la NVA.

![Visualización de máquinas virtuales y direcciones IP.](https://learn.microsoft.com/es-es/training/modules/control-network-traffic-flow-with-routes/media/6-vms-ip-addresses.svg)

Nota:

Este ejercicio es opcional. Si desea completar este ejercicio, deberá crear una suscripción de Azure antes de comenzar. Si no tiene una cuenta de Azure o no quiere crear una en este momento, puede leer las instrucciones para que comprenda la información que se presenta.

## Creación de máquinas virtuales públicas y privadas

En los pasos siguientes se implementa una VM en las subredes públicas y privadas.

1. Abra el editor de [Azure Cloud Shell](https://shell.azure.com/) y cree un archivo denominado **cloud-init.txt**.
    
    Bash
    
    ```
    code cloud-init.txt
    ```
    
2. Agregue la información de configuración siguiente al archivo. Con esta configuración, se instala el paquete `inetutils-traceroute` al crear una máquina virtual. Este paquete contiene la utilidad `traceroute` que usará más adelante en este ejercicio.
    
    Text
    
    ```
    #cloud-config
    package_upgrade: true
    packages:
       - inetutils-traceroute
    ```
    
3. Presione Ctrl+S para guardar el archivo y, después, Ctr+Q para cerrar el editor.
    
4. Ejecute el comando siguiente en Cloud Shell para crear la máquina virtual **pública**. Reemplace `<password>` por una contraseña adecuada para la cuenta **azureuser**.
    
    CLI de Azure
    
    ```
    az vm create \
        --resource-group "myResourceGroupName" \
        --name public \
        --vnet-name vnet \
        --subnet publicsubnet \
        --image Ubuntu2204 \
        --admin-username azureuser \
        --no-wait \
        --custom-data cloud-init.txt \
        --admin-password <password>
    ```
    
5. Ejecute el comando siguiente para crear la máquina virtual **privada**. Reemplace `<password>` por una contraseña adecuada.
    
    CLI de Azure
    
    ```
    az vm create \
        --resource-group "myResourceGroupName" \
        --name private \
        --vnet-name vnet \
        --subnet privatesubnet \
        --image Ubuntu2204 \
        --admin-username azureuser \
        --no-wait \
        --custom-data cloud-init.txt \
        --admin-password <password>
    ```
    
6. Ejecute el siguiente comando `watch` de Linux para comprobar que las máquinas virtuales están en ejecución. El comando `watch` ejecuta periódicamente el comando `az vm list` para que pueda supervisar el progreso de las máquinas virtuales.
    
    Bash
    
    ```
    watch -d -n 5 "az vm list \
        --resource-group "myResourceGroupName" \
        --show-details \
        --query '[*].{Name:name, ProvisioningState:provisioningState, PowerState:powerState}' \
        --output table"
    ```
    
    Un valor **ProvisioningState** de "Correcto" y un valor **PowerState** de "Máquina virtual en ejecución" indican que la implementación es correcta. Cuando las tres máquinas virtuales estén en ejecución, podrá continuar. Presione Ctrl-C para detener el comando y continuar con el ejercicio.
    
7. Ejecute el comando siguiente para guardar la dirección IP pública de la máquina virtual **pública** en la variable denominada `PUBLICIP`:
    
    CLI de Azure
    
    ```
    PUBLICIP="$(az vm list-ip-addresses \
        --resource-group "myResourceGroupName" \
        --name public \
        --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
        --output tsv)"
    
    echo $PUBLICIP
    ```
    
8. Ejecute el comando siguiente para guardar la dirección IP pública de la máquina virtual **privada** en la variable denominada `PRIVATEIP`:
    
    CLI de Azure
    
    ```
    PRIVATEIP="$(az vm list-ip-addresses \
        --resource-group "myResourceGroupName" \
        --name private \
        --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
        --output tsv)"
    
    echo $PRIVATEIP
    ```
    

## Prueba del enrutamiento del tráfico a través de la aplicación virtual de red

Los últimos pasos consisten en usar la utilidad `traceroute` de Linux para mostrar cómo se enruta el tráfico. Usará el comando `ssh` para ejecutar `traceroute` en cada máquina virtual. La primera prueba muestra la ruta que siguen los paquetes ICMP enviados desde la máquina virtual **pública** a la **privada**. La segunda prueba muestra la ruta que siguen los paquetes ICMP enviados desde la máquina virtual **privada** a la **pública**.

1. Ejecute el comando siguiente para hacer el seguimiento de la ruta de **pública** a **privada**. Cuando se le solicite, escriba la contraseña de la cuenta **azureuser** que ha especificado antes.
    
    Bash
    
    ```
    ssh -t -o StrictHostKeyChecking=no azureuser@$PUBLICIP 'traceroute private --type=icmp; exit'
    ```
    
    Si recibe el mensaje error `bash: traceroute: command not found`, espere un minuto y vuelva a intentar el comando. La instalación automatizada de `traceroute` puede tardar un minuto o dos después de la implementación de la máquina virtual. Después de que el comando termine de forma correcta, el resultado debe ser similar al ejemplo siguiente:
    
    Text
    
    ```
    traceroute to private.kzffavtrkpeulburui2lgywxwg.gx.internal.cloudapp.net (10.0.1.4), 64 hops max
    1   10.0.2.4  0.710ms  0.410ms  0.536ms
    2   10.0.1.4  0.966ms  0.981ms  1.268ms
    Connection to 52.165.151.216 closed.
    ```
    
    Observe que el primer salto es a 10.0.2.4. Esta es la dirección IP privada de **nva**. El segundo salto es a 10.0.1.4, la dirección de **privada**. En el primer ejercicio ha agregado esta ruta a la tabla de rutas y ha vinculado la tabla a la subred **publicsubnet**. Por tanto, ahora todo el tráfico de **pública** a **privada** se enruta por medio de la aplicación virtual de red.
    
    ![Diagrama de ruta de pública a privada.](https://learn.microsoft.com/es-es/training/modules/control-network-traffic-flow-with-routes/media/6-public-private-route.svg)
    
2. Ejecute el comando siguiente para hacer el seguimiento de la ruta de **privada** a **pública**. Cuando se le solicite, escriba la contraseña de la cuenta **azureuser**.
    
    Bash
    
    ```
    ssh -t -o StrictHostKeyChecking=no azureuser@$PRIVATEIP 'traceroute public --type=icmp; exit'
    ```
    
    Debería ver que el tráfico va directamente a **pública** (10.0.0.4) y no a través de NVA, como se muestra en la salida del comando siguiente.
    
    Text
    
    ```
    traceroute to public.kzffavtrkpeulburui2lgywxwg.gx.internal.cloudapp.net (10.0.0.4), 64 hops max
    1   10.0.0.4  1.095ms  1.610ms  0.812ms
    Connection to 52.173.21.188 closed.
    ```
    
    La máquina virtual **privada** usa rutas predeterminadas y el tráfico se enruta directamente de una subred a otra.
    
    ![Diagrama de ruta de privada a pública.](https://learn.microsoft.com/es-es/training/modules/control-network-traffic-flow-with-routes/media/6-private-public-route.svg)
    

Ya ha configurado el enrutamiento entre subredes para dirigir el tráfico procedente de la red pública de Internet a través de la subred **dmzsubnet** antes de que llegue a la subred privada. En la subred **dmzsubnet**, ha agregado una máquina virtual que actúa como NVA. Puede configurar este NVA para detectar solicitudes potencialmente malintencionadas y bloquearlas antes de que lleguen a los destinos a los que se dirigen.