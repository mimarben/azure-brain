---
title: AZ-104 — Protección de las máquinas virtuales con Azure Backup
aliases: ["Protección de las máquinas virtuales con Azure Backup (AZ-104)"]
tags: [associate, backup, compute]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/protect-virtual-machines-with-azure-backup/
---

# AZ-104 — Protección de las máquinas virtuales con Azure Backup

Módulo 27 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 5 — Supervisión y copia de seguridad de recursos de Azure · Área: Supervisión y mantenimiento de recursos de Azure (10–15%).

## Concepto

Proteger servidores locales, VMs, SQL Server, recursos compartidos de archivos y otras cargas de trabajo con Azure Backup.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Realización de operaciones de copia de seguridad y restauración mediante Azure Backup
> - Configuración e interpretación de informes y alertas para copias de seguridad


# Introducción.

Su empresa tiene varias cargas de trabajo críticas de máquinas virtuales (VM) que se ejecutan en Azure. Como arquitecto principal de la solución, se le pide que garantice que la empresa puede recuperar estas máquinas virtuales en caso de pérdida o daños en los datos. Se le pide que use las funciones integradas de Azure Backup para ayudar a proteger estas máquinas virtuales.

Azure Backup es un servicio que permite realizar copias de seguridad de máquinas virtuales de Azure, servidores locales, recursos compartidos de archivos de Azure y SQL Server o SAP HANA (dispositivo analítico de alto rendimiento) que se ejecutan en máquinas virtuales de Azure y otras cargas de trabajo de aplicaciones.

En este módulo obtendrá información sobre Azure Backup y verá cómo puede usar Azure Portal para realizar copias de seguridad y restaurar una máquina virtual.

## Objetivos de aprendizaje

En este módulo:

- Identifique los escenarios para los que Azure Backup proporciona funciones de copia de seguridad y restauración.
- Realice una copia de seguridad y restaure una máquina virtual de Azure.


# Características y escenarios de Azure Backup.

El plan de continuidad empresarial y recuperación ante desastres (BCDR) de su empresa requiere una funcionalidad de copia de seguridad y restauración completa para todos los servidores de alto riesgo. Se le pide que habilite y pruebe la función de copia de seguridad y restauración de estos recursos críticos de Windows y Linux.

En esta unidad, verá cómo funciona Azure Backup y estudiará algunos de los casos de uso que admite este servicio.

## ¿Qué es Azure Backup?

Azure Backup es un servicio integrado de Azure que proporciona una copia de seguridad segura para todos los recursos de datos administrados por Azure. Utiliza soluciones de infraestructura cero para habilitar copias de seguridad y restauraciones de autoservicio, con administración a escala a un costo más bajo y predecible. Actualmente, Azure Backup ofrece soluciones de copia de seguridad especializadas para máquinas virtuales (VM) de Azure y locales. Azure Backup también proporciona cargas de trabajo como SQL Server o SAP HANA (dispositivo analítico de alto rendimiento) que se ejecutan en las máquinas virtuales de Azure opciones de copia de seguridad y restauración de clase empresarial.

A diferencia de las soluciones de copia de seguridad tradicionales que pueden suponer un esfuerzo de configuración considerable, Azure Backup se administra fácilmente a través de Azure Portal.

### Diferencias entre Azure Backup y Azure Site Recovery

Tanto Azure Backup como Azure Site Recovery tienen como objetivo que el sistema sea más resistente a los errores, pero usan dos enfoques diferentes. El objetivo principal de Backup es mantener copias de datos con estado que le permiten volver en el tiempo. Sin embargo, Site Recovery replica los datos casi en tiempo real y permite una conmutación por error.

En ese sentido, si hay problemas de red o de interrupción de energía, puede usar zonas de disponibilidad. Para un desastre en toda una región (por ejemplo, desastres naturales), se usa Site Recovery. Las copias de seguridad se usan en casos de pérdida accidental de datos, daños en los datos o ataques de ransomware.

Además, la elección de un enfoque de recuperación depende de la criticidad de la aplicación, los requisitos de objetivo de punto de recuperación (RPO) y de objetivo de tiempo de recuperación (RTO) y las implicaciones de costo.

### ¿Por qué usar Azure Backup?

Las soluciones de copia de seguridad tradicionales, como las de disco y cinta, no ofrecen el máximo nivel de integración con soluciones basadas en la nube. Azure Backup tiene varias ventajas en comparación con las soluciones de copia de seguridad más tradicionales:

**Copia de seguridad de infraestructura cero**: Azure Backup elimina la necesidad de implementar y administrar cualquier infraestructura de copia de seguridad o almacenamiento. No hay ninguna sobrecarga en el mantenimiento de los servidores de respaldo o en el escalado o la reducción del almacenamiento, a medida que varían las necesidades.

**Retención a largo plazo**: Satisfaga las rigurosas necesidades de cumplimiento y auditoría conservando las copias de seguridad durante muchos años, después de lo cual la funcionalidad integrada de administración del ciclo de vida elimina automáticamente los puntos de recuperación.

**Seguridad**: Azure Backup proporciona seguridad al entorno de copia de seguridad, tanto si los datos están en tránsito como en reposo:

- **Control de acceso basado en rol de Azure**: El control de acceso basado en rol permite repartir las tareas dentro del equipo y conceder a los usuarios únicamente el nivel de acceso necesario para realizar su trabajo.
    
- **Cifrado de copias de seguridad**: Los datos de copia de seguridad se cifran automáticamente mediante claves administradas por Microsoft. De manera alternativa, puede cifrar los datos de los que se ha realizado una copia de seguridad mediante claves administradas por el cliente almacenadas en Azure Key Vault. 
    
- **No se requiere conectividad a Internet**: Cuando se usan máquinas virtuales de Azure, todas las transferencias de datos tienen lugar solo en la red troncal de Azure sin necesidad de acceder a la red virtual. Por lo tanto, no se requiere acceso a direcciones IP ni a nombres de dominio completos (FQDN).
    
- **Eliminación temporal**: con la eliminación temporal, los datos de copia de seguridad se conservan durante 14 días adicionales, incluso después de la eliminación del elemento de copia de seguridad. Esta retención protege contra a escenarios de eliminación accidental o eliminación malintencionada, lo que permite la recuperación de esas copias de seguridad sin pérdida de datos. Azure Backup también proporciona **eliminación temporal mejorada** que permite conservar un elemento eliminado en el estado de _eliminación temporal_ durante más tiempo.
    

Azure Backup también ofrece la capacidad de realizar copias de seguridad de máquinas virtuales cifradas con Azure Disk Encryption.

**Alta disponibilidad**: Azure Backup ofrece tres tipos de replicación:

- **Almacenamiento con redundancia local (LRS)**: Esta es la opción de menor costo, con protección básica frente a errores de bastidor y unidades en servidores. Se recomienda para escenarios no críticos.
    
- **Almacenamiento con redundancia geográfica (GRS)**: Esta opción intermedia tiene funcionalidad de conmutación por error en una región secundaria. Se recomienda para escenarios de copias de seguridad.
    
- **Almacenamiento con redundancia de zona (ZRS)**: Esta opción protege contra errores de nivel de centro de datos mediante la replicación de la cuenta de almacenamiento de forma sincrónica en tres zonas de disponibilidad de Azure. Se recomienda para escenarios de alta disponibilidad.
    

**Supervisión y administración centralizadas**: Azure Backup proporciona capacidades integradas de supervisión y alerta en una bóveda de servicios de recuperación. Estas funcionalidades están disponibles sin ninguna infraestructura de administración adicional.

### Escenarios que admite Azure Backup

Azure Backup admite los siguientes escenarios:

- **Máquinas virtuales de Azure**: copia de seguridad de máquinas virtuales de Azure con Windows o Linux. 
   Azure Backup proporciona copias de seguridad independientes y aisladas para impedir la destrucción accidental de los datos en las máquinas virtuales. Las copias de seguridad se almacenan en un almacén de Recovery Services con administración integrada de puntos de recuperación. La configuración y la escalabilidad son sencillas, las copias de seguridad están optimizadas y puede restaurarlas fácilmente cuando sea necesario.

- **Local**: copia de seguridad de archivos, carpetas y el estado del sistema mediante el [agente Microsoft Azure Recovery Services (MARS)](https://learn.microsoft.com/es-es/azure/backup/backup-support-matrix-mars-agent). También puede usar [Microsoft Azure Backup Server (MABS)](https://learn.microsoft.com/es-es/azure/backup/backup-support-matrix-mabs-dpm) o el [servidor Data Protection Manager (DPM)](https://learn.microsoft.com/es-es/azure/backup/backup-support-matrix-mabs-dpm) para proteger las máquinas virtuales locales (Hyper-V y VMware) y otras cargas de trabajo locales.

- **Recursos compartidos de Azure Files**: Azure Files proporciona administración de instantáneas por parte de Azure Backup.

- **SQL Server en máquinas virtuales de Azure** y **bases de datos de SAP HANA en máquinas virtuales de Azure**: Azure Backup ofrece soluciones especializadas basadas en secuencias para realizar copias de seguridad de SQL Server o SAP HANA que se ejecutan en máquinas virtuales de Azure. Estas soluciones realizan copias de seguridad compatibles con cargas de trabajo que admiten diferentes tipos de copia de seguridad, como la recuperación completa, diferencial y de registro, el RPO de 15 minutos y la recuperación a un momento dado.

# Copia de seguridad de una máquina virtual de Azure con Azure Backup.

Quiere asegurarse de que los trabajos de copia de seguridad y restauración que implemente ofrezcan una forma de recuperar los servidores de la empresa. Teniendo en cuenta este requisito, le interesa investigar la mejor manera de implementar copias de seguridad para las máquinas virtuales (VM).

Las máquinas virtuales hospedadas en Azure pueden aprovechar las ventajas de Azure Backup. Puede realizar copias de seguridad y restaurar fácilmente máquinas sin necesidad de instalar software adicional.

En esta unidad, explorará todos los métodos de copia de seguridad de máquinas virtuales de Azure que proporciona Azure Backup y tomará una decisión sobre cuál implementar.

Las **máquinas virtuales de Azure** se realizan copias de seguridad mediante la toma de instantáneas de los discos subyacentes a intervalos definidos por el usuario y la transferencia de esas instantáneas al almacén de Recovery Services según la directiva definida por el cliente.

## Almacén de Recovery Services

Azure Backup usa un almacén de Recovery Services para administrar y almacenar los datos de copia de seguridad. Un almacén es una entidad de administración del almacenamiento que proporciona una experiencia sencilla para llevar a cabo y supervisar las operaciones de copia de seguridad y restauración. Con Azure Backup, no es necesario preocuparse por la implementación o administración de las cuentas de almacenamiento. De hecho, todo lo que deberá especificar es el almacén para el cual desea realizar una copia de seguridad de la máquina virtual (VM). Los datos de la copia de seguridad se transfieren a las cuentas de almacenamiento de Azure Backup (en un dominio de error independiente) en segundo plano. El almacén también actúa como un límite de control de acceso basado en roles para permitir el acceso seguro a los datos.

![Captura de pantalla en la que se resaltan los almacenes de Recovery Services disponibles en el contexto de los recursos que protegen.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/3-recovery-vault-in-context.png)

## Instantáneas

Una instantánea es una copia de seguridad de todos los discos de la máquina virtual en un momento dado. En el caso de las máquinas virtuales de Azure, Azure Backup usa extensiones distintas para cada sistema operativo compatible:

|Extensión|SO|Descripción|
|---|---|---|
|Instantánea de máquina virtual|Windows|La extensión funciona con el Servicio de instantáneas de volumen (VSS) para realizar una copia de los datos en disco y en memoria.|
|VM SnapshotLinux|Linux|La instantánea es una copia del disco.|

En función de cómo se tome la instantánea y lo que incluya, puede lograr diferentes niveles de coherencia:

- **Coherente con la aplicación**
    - La instantánea captura la máquina virtual en su conjunto. Usa escritores VSS Writer para capturar el contenido de la memoria de la máquina y las operaciones de E/S pendientes.
    - En el caso de las máquinas Linux, tendrá que escribir scripts anteriores o posteriores personalizados por aplicación para capturar el estado de la aplicación.
    - Puede obtener coherencia completa de la máquina virtual y de todas las aplicaciones en ejecución.
- **Coherente con el sistema de archivos**
    - Si se produce un error de VSS en Windows, o bien en los scripts anteriores y posteriores de Linux, Azure Backup sigue creando una instantánea coherente con el sistema de archivos.
    - Durante una recuperación, no se produce ningún daño dentro de la máquina. Pero las aplicaciones instaladas tendrán que realizar su propia limpieza durante el inicio para que sean coherentes.
- **Coherente frente a bloqueos**
    - Este nivel de coherencia se produce normalmente si la máquina virtual se apaga en el momento de la copia de seguridad.
    - Durante este tipo de copia de seguridad, no se capturan las operaciones de E/S ni el contenido de la memoria. Este método no garantiza la coherencia de los datos para el sistema operativo o la aplicación.

## Directiva de copia de seguridad

Puede definir la frecuencia de las copias de seguridad y la duración de la retención de las copias de seguridad. Actualmente, la copia de seguridad de máquinas virtuales se puede desencadenar diaria o semanalmente y se puede almacenar durante varios años. La directiva de copia de seguridad admite dos niveles de acceso: _el nivel de instantánea_ y el _nivel de bóveda_. Mediante la directiva mejorada, puede desencadenar copias de seguridad por hora.

**Copia de seguridad** selectiva de discos: Azure Backup proporciona la **funcionalidad de copia de seguridad y restauración** selectiva de discos mediante **la directiva mejorada**. Con esta funcionalidad, puede realizar una copia de seguridad selectiva de un subconjunto de los discos de datos que están conectados a la máquina virtual. A continuación, puede restaurar un subconjunto de los discos que están disponibles en un punto de recuperación, tanto desde la restauración instantánea como desde el nivel de almacén. Ayuda a administrar los datos críticos en un subconjunto de los discos de máquina virtual y a usar soluciones de copia de seguridad de bases de datos cuando desea realizar copias de seguridad solo de su disco del sistema operativo para reducir el costo.

**Nivel de instantánea**: todas las instantáneas se almacenan localmente durante un período máximo de cinco días, en lo que se denomina nivel de instantánea. En todas las operaciones de restauración, se recomienda realizar la operación a partir de las instantáneas, ya que es más rápido hacerlo. Esta funcionalidad se denomina **restauración instantánea**.

**Nivel de bóveda**: todas las instantáneas se transfieren además a la bóveda para mayor seguridad y una retención más prolongada. En este momento, el tipo de punto de recuperación cambia a “instantánea y almacén”.

## Proceso de copia de seguridad de una máquina virtual de Azure

Aquí se muestra cómo Azure Backup completa una copia de seguridad de las máquinas virtuales de Azure:

1. En el caso de las máquinas virtuales de Azure seleccionadas para la copia de seguridad, Azure Backup inicia un trabajo de copia de seguridad según la frecuencia de copia de seguridad que especifique en la directiva de copia de seguridad.
    
2. Durante la primera copia de seguridad, se instala una extensión de copia de seguridad en la máquina virtual, si esta está en ejecución:
    
    - En el caso de las máquinas virtuales Windows, se instala la extensión de instantánea de máquina virtual.
    - En el caso de las máquinas virtuales Linux, se instala la extensión de Linux de instantáneas de máquina virtual.
3. Una vez realizada la instantánea, los datos se almacenan localmente y se transfieren al almacén.
    
    - La copia de seguridad está optimizada mediante la copia de seguridad de cada disco de máquina virtual en paralelo.
    - Para cada disco del que se realiza una copia de seguridad, Azure Backup lee los bloques del disco e identifica y transfiere solo los bloques de datos que han cambiado (delta) desde la copia de seguridad anterior.
    - Es posible que los datos de instantánea no se copien inmediatamente en el almacén. Puede tardar varias horas en momentos de máxima actividad. El tiempo total de copia de seguridad de una máquina virtual es inferior a 24 horas para las directivas de copia de seguridad diaria.

![Diagrama que muestra la arquitectura de Azure Backup.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/3-azure-vm-backup-architecture.png)

Además, puede habilitar el [cifrado del almacén con las claves administradas por el cliente (CMK)](https://learn.microsoft.com/es-es/azure/backup/encryption-at-rest-with-cmk#configuring-a-vault-to-encrypt-using-customer-managed-keys?azure-portal=true). Mediante la **eliminación temporal mejorada** para un almacén de Recovery Services, puede proteger las copias de seguridad de la eliminación. También puede mantener la eliminación temporal mejorada _siempre activada_ para evitar que se desactive, protegiendo así las copias de seguridad de la eliminación accidental o de ataques de malware.


# Ejercicio: Realización de una copia de seguridad de una máquina virtual de Azure.

En la empresa, se ejecuta una combinación de cargas de trabajo de Windows y Linux. Se le pide que demuestre que Azure Backup es una buena opción para ambos tipos de máquinas virtuales (VM). Mediante una combinación de la CLI de Azure y Azure Portal, puede proteger los dos tipos de máquinas virtuales con Azure Backup.

Azure Backup se puede habilitar rápidamente para las máquinas virtuales en Azure. Puede habilitar Azure Backup desde el portal, la CLI de Azure o mediante comandos de PowerShell.

En este ejercicio, creará una máquina virtual (VM), configurará una copia de seguridad e iniciará una copia de seguridad.

> [!NOTE]
> Este ejercicio es opcional. Si no tiene una cuenta de Azure, puede leer las instrucciones para saber cómo se realiza una copia de seguridad de máquinas virtuales mediante Azure Backup. Si quiere completar este ejercicio pero no tiene una suscripción de Azure o prefiere no usar una cuenta propia, cree una [cuenta gratuita](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_4dfddec0-b74e-bc70-409c-e459854c16ee) antes de empezar.

## Creación de una copia de seguridad de máquinas virtuales de Azure

### Configuración del entorno

1. Inicie sesión en [Azure Portal](https://portal.azure.com/) y seleccione el icono para abrir Azure Cloud Shell.
    
    ![Captura de pantalla del icono de Cloud Shell en Azure Portal.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/4-azure-portal-cloudshell.png)
    
2. Cree un grupo de recursos en el que se incluirán todos los recursos necesarios para este ejercicio.
    
    CLI de Azure
    
    ```
    RGROUP=$(az group create --name vmbackups --location westus2 --output tsv --query name)
    ```
    
3. Use Cloud Shell para crear la red virtual **NorthwindInternal** y la subred **NorthwindInternal1**.
    
    CLI de Azure
    
    ```
    az network vnet create \
        --resource-group $RGROUP \
        --name NorthwindInternal \
        --address-prefixes 10.0.0.0/16 \
        --subnet-name NorthwindInternal1 \
        --subnet-prefixes 10.0.0.0/24
    ```
    

### Creación de una máquina virtual Windows mediante la CLI de Azure

Use el comando siguiente para crear la máquina virtual _NW-APP01_. Reemplace `<password>` con una contraseña de su elección, entre comillas dobles. Por ejemplo, `--admin-password "PassWord123!"`.

CLI de Azure

```
az vm create \
    --resource-group $RGROUP \
    --name NW-APP01 \
    --size Standard_DS1_v2 \
    --public-ip-sku Standard \
    --vnet-name NorthwindInternal \
    --subnet NorthwindInternal1 \
    --image Win2016Datacenter \
    --admin-username admin123 \
    --no-wait \
    --admin-password <password>
```

### Creación de una máquina virtual Linux mediante la CLI de Azure

Use el comando siguiente para crear la máquina virtual _NW-RHEL01_.

CLI de Azure

```
az vm create \
    --resource-group $RGROUP \
    --name NW-RHEL01 \
    --size Standard_DS1_v2 \
    --image RedHat:RHEL:8-gen2:latest \
    --authentication-type ssh \
    --generate-ssh-keys \
    --vnet-name NorthwindInternal \
    --subnet NorthwindInternal1
```

Nota:

Si recibe un `securityProfile.securityType is invalid` error al ejecutar el comando anterior, ejecute los siguientes comandos para registrar `UseStandardSecurityType`y, a continuación, vuelva a ejecutar el comando anterior.

CLI de Azure

```
az feature register --name UseStandardSecurityType --namespace Microsoft.Compute
az feature show --name UseStandardSecurityType --namespace Microsoft.Compute
```

Este comando puede tardar unos minutos en completarse. Espere a que finalice antes de continuar con el siguiente paso.

### Habilitación de la copia de seguridad de una máquina virtual mediante Azure Portal

1. En Azure Portal, busque y seleccione **Máquinas virtuales**.
    
    ![Captura de pantalla en la que se muestra la búsqueda de máquinas virtuales.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/4-portal-vms.png)
    
    Se mostrará el panel **Máquinas virtuales**.
    
2. En la lista, seleccione la máquina virtual **NW-RHEL01** que se ha creado.
    
    ![Captura de pantalla en la que se muestra la selección de una máquina virtual.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/4-portal-select-linux-vm.png)
    
    Se abre el panel de la máquina virtual **NW-RHEL01**.
    
3. En el panel de menús central, selecciona la pestaña **Capacidades** y, después, desplázate hacia abajo hasta **Copia de seguridad** y selecciona esta opción. Se abre el panel **Copia de seguridad** de la máquina virtual _NW-RHEL01_.
    
4. Seleccione el botón de radio de **Estándar**. Puede aceptar los valores predeterminados para las siguientes opciones:
    
    - **Almacén de copias de seguridad**: **vaultXXX** como nombre.
    - **Directiva de copia de seguridad**: **DailyPolicy-xxxxxxxx**, que crea una copia de seguridad diaria a las 12:00 UTC, con un intervalo de retención de 180 días.
    
    ![Captura de pantalla en la que se muestran las opciones de copia de seguridad.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/4-portal-azure-backup.png)
    
5. Seleccione el botón **Habilitar copia de seguridad**.
    
6. Una vez completada la implementación, vuelve a la máquina virtual **NW-RHEL01**, selecciona la pestaña **Capacidades** y desplázate hacia abajo hasta **Copia de seguridad** y selecciona esta opción. Se abre el panel **Copia de seguridad** de la máquina virtual _NW-RHEL01_.
    
7. Para realizar la primera copia de seguridad de este servidor, en la barra de menús superior, seleccione **Hacer copia de seguridad ahora**.
    
    Aparece el panel **Realizar copia de seguridad ahora** de _NW-RHEL01_.
    
8. Seleccione **Aceptar**.
    

### Habilitación de una copia de seguridad mediante la CLI de Azure

1. En primer lugar, cree el almacén de azure-backup mediante Cloud Shell:
    
    CLI de Azure
    
    ```
    az backup vault create \
        --resource-group vmbackups \
        --location westus2 \
        --name azure-backup
    ```
    
2. Con Cloud Shell, habilite una copia de seguridad para la máquina virtual _NW-APP01_.
    
    CLI de Azure
    
    ```
    az backup protection enable-for-vm \
        --resource-group vmbackups \
        --vault-name azure-backup \
        --vm NW-APP01 \
        --policy-name EnhancedPolicy
    ```
    
3. Supervise el progreso de la instalación mediante la CLI de Azure.
    
    CLI de Azure
    
    ```
    az backup job list \
        --resource-group vmbackups \
        --vault-name azure-backup \
        --output table
    ```
    
    Siga ejecutando el comando anterior hasta que vea que `ConfigureBackup` se ha completado.
    
    Resultados
    
    ```
    Name                                  Operation        Status      Item Name    Start Time UTC                    Duration
    ------------------------------------  ---------------  ----------  -----------  --------------------------------  --------------
    a3df79b4-be4f-4cc9-8b2c-a5ead44a6a12  ConfigureBackup  Completed   NW-APP01     2019-08-01T06:19:12.101048+00:00  0:00:31.305975
    5e1531a9-8b3d-4983-a642-86ee982f7036  Backup           InProgress  NW-RHEL01    2019-08-01T06:18:35.955118+00:00  0:01:22.734182
    860d4dca-9603-4a4e-9f3b-93f242a0a64d  ConfigureBackup  Completed   NW-RHEL01    2019-08-01T06:13:33.860598+00:00  0:00:31.256773    
    ```
    
4. Realice una copia de seguridad inicial de la máquina virtual, en lugar de esperar a que la programación la ejecute.
    
    CLI de Azure
    
    ```
    az backup protection backup-now \
        --resource-group vmbackups \
        --vault-name azure-backup \
        --container-name NW-APP01 \
        --item-name NW-APP01 \
        --retain-until 18-10-2030 \
        --backup-management-type AzureIaasVM
    ```
    
    No es necesario esperar a que finalice la copia de seguridad, ya que en la siguiente sección se muestra cómo supervisar el progreso en el portal.
    

## Supervisión de copias de seguridad en el portal

### Vista del estado de una copia de seguridad de una sola máquina virtual

1. En el menú de Azure Portal o en la página **Inicio**, seleccione **Todos los recursos**.
    
2. Escriba _Máquinas virtuales_ en el campo de búsqueda de la parte superior de la página y seleccione **Máquinas virtuales** en los resultados.
    
3. Seleccione la máquina virtual **NW-APP01**. Aparece el panel de la máquina virtual _NW-APP01_.
    
4. En el panel de menús central, selecciona la pestaña **Capacidades** y, después, desplázate hasta **Copia de seguridad** y selecciona esta opción. Aparece el panel **Copia de seguridad** para la máquina virtual _NW-APP01_.
    
    En la sección **Estado de copia de seguridad**, el campo **Estado de la última copia de seguridad** muestra el estado actual de la copia de seguridad.
    
    ![Captura de pantalla de la página Copia de seguridad una vez configurada.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/4-portal-backup-setup.png)
    

### Ver el estado de las copias de seguridad en el almacén de Recovery Services

1. En el menú de Azure Portal o en la página **Inicio**, seleccione **Todos los recursos**.
    
2. Ordene la lista por _Tipo_ y, después, seleccione el almacén de Recovery Services **azure-backup**. Se abre el panel del almacén de Recovery Services **azure-backup**.
    
3. En el panel **Información general**, seleccione la pestaña **Copia de seguridad** interior para ver un resumen de todos los elementos de copia de seguridad, el almacenamiento que se usa y el estado actual de los trabajos de copia de seguridad.
    
    ![Captura de pantalla del panel de Copia de seguridad.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/4-recovery-services-vault.png)
    

---

# Restauración de datos de la máquina virtual.

Las empresas que tienen un plan de continuidad empresarial y recuperación ante desastres (BCDR) normalmente programan series de pruebas para garantizar que la empresa se pueda recuperar correctamente frente a posibles desastres. Ahora que ha realizado correctamente una copia de seguridad de las máquinas virtuales, quiere explorar las opciones disponibles para restaurarlas como parte de las pruebas de BCDR.

En esta unidad, obtendrá información sobre las opciones para restaurar una máquina virtual (VM) de Azure a partir de una copia de seguridad anterior.

## Tipos de restauración

Azure Backup proporciona muchas maneras de restaurar una máquina virtual. Como se explicó anteriormente, puede realizar una restauración instantánea desde el nivel de instantánea (solución óptima para recuperaciones operativas) o desde el nivel de almacén.

|Opción de restauración|Detalles|
|---|---|
|**Crear una máquina virtual**|Crea y pone en funcionamiento rápidamente una máquina virtual básica a partir de un punto de restauración. La nueva máquina virtual debe crearse en la misma región que la máquina virtual de origen.|
|**Restaurar disco**|Restaura un disco de máquina virtual, que luego se puede usar para crear una máquina virtual. Los discos se copian en el grupo de recursos que especifique. Azure Backup proporciona una plantilla para ayudar a personalizar y crear la nueva máquina virtual. Como alternativa, puede asociar el disco a una máquina virtual existente o crear una nueva máquina virtual.  <br>  <br>Esta opción es útil si desea personalizar la máquina virtual, agregue opciones de configuración que no estuvieran allí en el momento de la copia de seguridad. O bien, agregue valores que deben configurarse mediante la plantilla o PowerShell.|
|**Reemplazar el existente**|Puede restaurar un disco y usarlo para reemplazarlo en la máquina virtual existente. Azure Backup toma una instantánea de la máquina virtual existente antes de reemplazar el disco y la almacena en la ubicación de almacenamiento provisional que especifique. Los discos existentes conectados a la máquina virtual se reemplazan por el punto de restauración seleccionado. La máquina virtual actual debe existir. No puede usar esta opción si se elimina la máquina virtual.|
|**Entre regiones (región secundaria)**|La restauración entre regiones puede usarse para restaurar máquinas virtuales de Azure en la región secundaria, que es una región emparejada de Azure.  <br>Esta característica está disponible para las siguientes opciones:  <br>- Crear una máquina virtual<br>- Recuperar discos  <br>    Actualmente no se admite la opción de reemplazo de discos existentes.|
|**Restauración entre suscripciones**|Los administradores de copia de seguridad y los administradores de aplicaciones pueden realizar la operación de restauración en regiones secundarias.  <br>La restauración entre suscripciones:  <br>  <br>- Permite restaurar Máquinas Virtuales de Azure o discos a una suscripción diferente, dentro del mismo tenant que la suscripción de origen. Según las funcionalidades de control de acceso basado en rol de Azure desde puntos de restauración.  <br>- Solo se permite si la propiedad Restauración entre suscripciones se habilita para el almacén de Recovery Services.  <br>- Funciona con la restauración entre regiones y la restauración entre zonas.  <br>- Solo se puede desencadenar la restauración entre suscripciones para máquinas virtuales administradas.  <br>- Se admite la restauración entre suscripciones para restaurar con identidades de sistema administradas (MSI).  <br>- No se admite para los puntos de recuperación de niveles de instantáneas.  <br>- No se admite para máquinas virtuales no administradas y máquinas virtuales cifradas con cifrado digital avanzado (ADE).|
|**Restauración entre zonas**|Permite restaurar Azure Virtual Machines o discos anclados a cualquier zona en diferentes zonas disponibles (según las funcionalidades de control de acceso basado en roles) a partir de puntos de restauración. Al seleccionar una zona para restaurarla, selecciona la zona lógica (y no la zona física) según la suscripción de Azure a la que se va a restaurar.  <br>- Solo se puede activar la restauración cruzada entre zonas para máquinas virtuales gestionadas.  <br>- Se admite la restauración entre zonas para restaurar con identidades de sistema administradas (MSI).  <br>- La restauración entre zonas admite la restauración de una máquina virtual anclada o no anclada a una zona de Azure desde un almacén con almacenamiento con redundancia de zona (ZRS) habilitado. Obtenga información sobre cómo establecer la redundancia de almacenamiento.  <br>- Solo puede usar la restauración entre zonas para restaurar una máquina virtual anclada a una zona de Azure desde un almacén con restauración entre regiones (CRR) en estas condiciones: la región secundaria admite zonas o el almacenamiento con redundancia de zona (ZRS) está habilitado.  <br>- La restauración entre zonas se admite desde regiones secundarias.  <br>- No se admite desde puntos de restauración de instantáneas.  <br>- No se admite para máquinas virtuales de Azure cifradas.|
|**Copia de seguridad de discos selectiva**|Permite realizar copias de seguridad y restaurar discos de máquina virtual selectivos mediante una directiva mejorada. Con esta funcionalidad, puede realizar una copia de seguridad selectiva de un subconjunto de los discos de datos que están conectados a la máquina virtual. A continuación, puede restaurar un subconjunto de los discos que están disponibles en un punto de recuperación, tanto desde la restauración instantánea como desde el nivel de almacén.  <br>  <br>La copia de seguridad selectiva de discos es útil cuando:  <br>  <br>- Administrar datos críticos de subconjuntos de discos de máquinas virtuales.  <br>- Usar soluciones de copia de seguridad de base de datos y querer realizar copias de seguridad solo del disco del sistema operativo para reducir costes.|

## Recuperación de archivos a partir de una copia de seguridad

También puede recuperar archivos individuales desde un punto de recuperación montando la instantánea en el equipo de destino mediante el iniciador iSCSI de la máquina. Para obtener más información, consulte [Recuperación de archivos de la copia de seguridad de máquinas virtuales de Azure](https://learn.microsoft.com/es-es/azure/backup/backup-azure-restore-files-from-vm).

## Restauración de una máquina virtual cifrada

Azure Backup admite la copia de seguridad y restauración de máquinas cifradas mediante Azure Disk Encryption. Disk Encryption funciona con Azure Key Vault para administrar los secretos relevantes que están asociados con el disco cifrado. Para obtener una capa de seguridad adicional, puede usar claves de cifrado de almacén de claves (KEK) para cifrar los secretos antes de que se escriban en el almacén de claves.

Al restaurar máquinas virtuales cifradas, se aplican ciertas limitaciones:

- Azure Backup solo admite el cifrado de claves independiente. Actualmente no se admiten las claves que formen parte de un certificado.
- Las restauraciones a nivel de archivo o carpeta no son compatibles con máquinas virtuales cifradas. Para restaurar a ese nivel de granularidad, se debe restaurar toda la máquina virtual. Después, el archivo o las carpetas se pueden copiar manualmente.
- La opción **Reemplazar la máquina virtual existente** no está disponible para las máquinas virtuales cifradas.

# Ejercicio: Restauración de datos de máquinas virtuales de Azure.

Unos días después de realizar la copia de seguridad de la primera máquina virtual (VM) de Azure, el servidor ha tenido problemas. La máquina virtual debe restaurarse a partir de una copia de seguridad. Quiere restaurar el disco de la máquina virtual y adjuntarlo al servidor activo problemático y, después, realizar el seguimiento de la restauración para asegurarse de que se ha completado correctamente.

En este ejercicio, verá cómo restaurar una copia de seguridad correcta para reemplazar una máquina virtual que se ha dañado y supervisar su progreso.

## Restauración de una máquina virtual en Azure Portal

### Creación de una cuenta de almacenamiento para usarla como ubicación de almacenamiento provisional

1. Si cerró Azure, inicie sesión en [Azure Portal](https://portal.azure.com/) con la misma cuenta que usó en el ejercicio anterior.
    
2. En Azure Portal, escriba **Cuentas de almacenamiento** en la barra de búsqueda superior y selecciónela.
    
    ![Seleccione Cuentas de almacenamiento.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-select-storage-accounts.png)
    
    Aparece el panel **Cuentas de almacenamiento** .
    
3. En la barra de menús, seleccione **Crear**. Aparece el panel **Crear una cuenta de almacenamiento** .
    
4. En la pestaña **Aspectos básicos** , escriba los valores siguientes para cada configuración para crear una cuenta de almacenamiento.
    
|Opción|Importancia|
|---|---|
|Grupo de recursos|En la lista desplegable, seleccione **vmbackups**.|
|**Detalles de la instancia**||
|Nombre de la cuenta de almacenamiento|Escriba un nombre único como **restorestagingYYYYMMDD**, donde YYYYMMDD se reemplaza por la fecha de hoy.|
|**Región**|En la lista desplegable, seleccione **(EE. UU.) Oeste de EE. UU. 2**.|
    
![Especifique las opciones de la cuenta de almacenamiento.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-specify-storage-account-options.png)
    
5. Seleccione **Revisar y crear**.
    
6. Una vez superada la validación, seleccione **Crear**.
    
    Espere a que se implemente la cuenta de almacenamiento.
    

### Detener la máquina virtual

No se puede restaurar una copia de seguridad si la máquina virtual está asignada y en ejecución. Si olvida detener la máquina virtual e intenta restaurarla, verá un error similar al ejemplo siguiente.

![Captura de pantalla que muestra los detalles del error cuando se ejecuta una máquina virtual.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-restore-error.png)

Para evitar este error, siga estos pasos:

1. En la parte superior izquierda de Azure Portal, seleccione **Inicio**, **Máquinas virtuales** y **NW-APP01**.
    
    ![Captura de pantalla que muestra la página de información general de la máquina virtual.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-vm-overview.png)
    
    El panel de la máquina virtual _NW-APP01_ aparece.
    
2. En la barra de menús, seleccione **Detener**.
    
    ![Captura de pantalla que muestra cómo detener la máquina virtual.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-stop-vm.png)
    
3. En el cuadro de diálogo **Detener esta máquina virtual** , seleccione **Aceptar**.
    
    ![Captura de pantalla de la solicitud de detención de esta máquina virtual.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-stop-this-vm.png)
    

### Restauración de la máquina virtual

Los almacenes de Recovery Services son accesibles en el nivel de suscripción. Cuando esté viendo la máquina virtual, Azure proporciona un vínculo rápido al almacén específico en **Operaciones**.

1. En el panel de menús, desplácese hasta **Operaciones** y seleccione **Copia de seguridad**.
    
    ![Captura de pantalla de la operación de copia de seguridad de una máquina virtual.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-vm-backup-menu.png)
    
2. Para restaurar la máquina virtual, en la barra de menús, seleccione **Restaurar máquina virtual**. Aparece el panel **Restaurar máquina virtual** para _NW-APP01_ .
    
3. En el cuadro de texto **Punto de restauración** , elija **Seleccionar**. Aparece el panel **Seleccionar punto de restauración** .
    
4. Las fechas de inicio y finalización están establecidas de manera predeterminada en un intervalo de dos semanas. Establezca la **fecha de inicio** en una fecha adecuada para nuestros puntos de restauración (**07/05/2021**), seleccione el punto de restauración que se usará para la recuperación y, a continuación, seleccione **Aceptar**.
    
    ![Captura de pantalla de la selección de un punto de restauración.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-restore-point.png)
    
    Aparece el panel **Restaurar máquina virtual** para _NW-APP01_ .
    
5. Configure el punto de restauración con los siguientes valores de cada configuración.
    
|Opción|Importancia|
|---|---|
|**Restaurar configuración**||
|Reemplazar el existente|Seleccione esta opción.|
|Ubicación de almacenamiento provisional|En la lista desplegable, seleccione la cuenta de almacenamiento que creó anteriormente.|
    
![Captura de pantalla que muestra las opciones de configuración de restauración.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-restore-configuration.png)
    
6. Seleccione **Restaurar**. Aparece el panel **Copia de seguridad** de la máquina virtual _NW-APP01_ . Fíjese en las notificaciones de la parte superior derecha de la barra de herramientas. La notificación más reciente muestra **Desencadenando la restauración de NW-APP01**.
    

## Seguimiento de una restauración

1. En la sección **Alertas y trabajos** , seleccione **Ver todos los trabajos**. Aparece el panel **Trabajos de copia de seguridad** .
    
    ![Captura de pantalla de los detalles del trabajo de restauración.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-review-jobs.png)
    
2. En la columna **Detalles** , seleccione **Ver detalles** para el trabajo **restaurar** .
    
    [![Captura de pantalla del progreso de la restauración.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-restore-progress.png)](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-restore-progress.png#lightbox)
    
    Aparece el panel **Restaurar** para _NW-APP01_.
    
3. El progreso de restauración de la máquina virtual se puede supervisar:
    
    - **Detalles del trabajo**: detalles sobre el trabajo de restauración que ha iniciado para esta máquina virtual.
    - **Estado del trabajo**: progreso en tiempo real del trabajo de restauración.
    - **Subtareas**: nombre y estado de las tareas dentro del trabajo.
    
    ![Captura de pantalla del panel de detalles del trabajo.](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/media/6-job-details.png)



# Resumen.

En este módulo, ha aprendido la importancia de tener una estrategia de copia de seguridad y recuperación probada para su organización. Ha obtenido información sobre los diferentes tipos de copias de seguridad de Azure y las razones por las que elegiría un tipo de copia de seguridad en lugar de otro, en función de su escenario.

Ha aprendido que puede hacer copias de seguridad tanto de máquinas virtuales de Azure como de máquinas locales. Además, aprendiste a hacer una copia de seguridad de una máquina virtual de Azure (VM). Después, la ha restaurado con las distintas opciones disponibles y ha podido supervisar el progreso.

Ahora puede usar Azure Backup para ayudar a proteger el entorno contra la pérdida de datos o daños en el disco. Puede restaurar los servicios de acuerdo a su plan de recuperación ante desastres y continuidad empresarial.

Importante

En este módulo, ha creado recursos mediante su suscripción de Azure. Quieres eliminar estos recursos para que no se te siga cobrando por ellos. Puede eliminar los recursos de forma individual o eliminar el grupo de recursos para eliminar todo el conjunto de recursos.

## Más información

Para obtener más información sobre Azure Backup, vea los artículos siguientes:

- [Precios y disponibilidad de Azure Backup más recientes](https://azure.microsoft.com/pricing/details/backup)
- [Documentación del servicio Azure Backup](https://learn.microsoft.com/es-es/azure/backup)
- [Matriz de compatibilidad para copia de seguridad de máquinas virtuales de Azure](https://learn.microsoft.com/es-es/azure/backup/backup-support-matrix-iaas)
- [Características de seguridad de Azure Backup](https://learn.microsoft.com/es-es/azure/backup/security-overview)
- [Funcionalidades de supervisión y alerta integradas](https://learn.microsoft.com/es-es/azure/backup/backup-azure-monitoring-built-in-monitor)
- [Azure Files: administración de instantáneas por parte de Azure Backup](https://learn.microsoft.com/es-es/azure/backup/backup-afs)
- [Copia de seguridad de bases de datos de SQL Server que se ejecutan en máquinas virtuales de Azure](https://learn.microsoft.com/es-es/azure/backup/backup-azure-sql-database)
- [Copia de seguridad de bases de datos de SAP HANA (dispositivo analítico de alto rendimiento) que se ejecutan en máquinas virtuales de Azure](https://learn.microsoft.com/es-es/azure/backup/backup-azure-sap-hana-database)
- [Azure Data Protection Manager (DPM)](https://learn.microsoft.com/es-es/azure/backup/backup-azure-dpm-introduction) y [Azure Backup Server (MABS)](https://learn.microsoft.com/es-es/azure/backup/backup-mabs-protection-matrix)

## Introducción a Azure

Elija la cuenta de Azure adecuada para usted. Pague a medida que habla o pruebe Azure gratis durante 30 días.[Regístrese.](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_e3bb2743-aee9-7170-826a-4bc5e8771b30)


























## Enlaces relacionados

**Módulo de Learn**: [Protección de las máquinas virtuales con Azure Backup](https://learn.microsoft.com/en-us/training/modules/protect-virtual-machines-with-azure-backup/) ([ES](https://learn.microsoft.com/es-es/training/modules/protect-virtual-machines-with-azure-backup/))

**Savill**: buscar "backup" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: —

**Laboratorio**: Lab 10 (Implement Data Protection) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)































## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Introducción a Azure Backup (AZ-104)]]
