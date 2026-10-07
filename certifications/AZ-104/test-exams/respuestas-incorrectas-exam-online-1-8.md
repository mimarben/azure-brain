---
title: AZ-104 — Respuestas incorrectas de assessments online 1–8
tags: [certification, exam-review, mistakes]
certification: [AZ-104]
updated: 2026-10-06
sources:
  - certifications/AZ-104/test-exams/exam-online-1.md
  - certifications/AZ-104/test-exams/exam-online-2.md
  - certifications/AZ-104/test-exams/exam-online-3.md
  - certifications/AZ-104/test-exams/exam-online-4.md
  - certifications/AZ-104/test-exams/exam-online-5.md
  - certifications/AZ-104/test-exams/exam-online-6.md
  - certifications/AZ-104/test-exams/exam-online-7.md
  - certifications/AZ-104/test-exams/exam-online-8.md
---

# AZ-104 — Respuestas incorrectas (online 1–8)

**70 errores distintos** extraídos solo de respuestas marcadas como incorrectas. Cada entrada muestra la respuesta fallada y por qué no cumple; no es un examen de opción múltiple.

## Errores

### 1. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene un tenant de Microsoft Entra denominado contoso.com que contiene un grupo denominado Group1. Group1 contiene los siguientes usuarios: - User1 — Tipo: Miembro; Sincronización desde el entorno local: Sí - User2 — Tipo: Miembro; Sincronización desde el entorno local: No - User3 — Tipo: Invitado; Sincronización desde el entorno local: No La escritura diferida de contraseñas está habilitada en Microsoft Entra Connect Sync. Habilitas el autoservicio de restablecimiento de contraseñas (SSPR) para Group1. Debe identificar qué usuarios pueden usar SSPR. ¿Qué usuarios deben identificar?

**Respuesta incorrecta seleccionada:**
- Solo User2

**Por qué es incorrecta:** El registro de SSPR es necesario para los usuarios dentro del ámbito que son aptos para utilizar SSPR. En este escenario, Group1 está en el ámbito e incluye dos usuarios miembros (User1 y User2) y un usuario invitado (User3). Dado que la reversión de contraseñas está habilitada, el miembro sincronizado, User1, puede usar SSPR para escribir los cambios de nuevo en el AD local. Por otro lado, el miembro que opera únicamente en la nube, User2, puede restablecer su contraseña en Entra ID. Ambos usuarios deben registrarse. Los usuarios invitados (User3) no son compatibles con SSPR en el inquilino de recursos (administran contraseñas en su inquilino principal), por lo que no necesitan registrarse aquí. Introduction   Administrar autoservicio de restablecimiento de contraseña en Microsoft Entra ID   Ejercicio para configurar e implementar el autoservicio de restablecimiento de contraseña   Tutorial: Active la escritura de vuelta de restablecimiento de contraseña de autoservicio de Microsoft Entra en un entorno local   ¿Qué es la autenticación de Microsoft Entra?

### 2. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción Azure que contiene varias máquinas virtuales.   Debe asegurarse de que un usuario llamado User1 pueda ver todos los recursos de un grupo de recursos denominado RG1. Debes usar el principio de privilegios mínimos. ¿Qué rol debe asignarle a User1?

**Respuesta incorrecta seleccionada:**
- Colaborador

**Por qué es incorrecta:** El rol Lector permite ver todos los recursos, pero no realizar ningún cambio. El rol Colaborador permite administrar todos los recursos, el rol Lector de facturación proporciona acceso de solo lectura a los datos de facturación y el rol Colaborador de etiquetas le permite administrar etiquetas de entidad sin proporcionar acceso a las entidades.

### 3. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción de Azure que contiene cientos de máquinas virtuales que se migraron desde un centro de datos local. Necesita identificar qué máquinas virtuales están infrautilizadas. ¿Qué Azure Advisor configuración debe usar?

**Respuesta incorrecta seleccionada:**
- Rendimiento

**Por qué es incorrecta:** La hoja de Costos le permite optimizar y reducir el gasto general de Azure. Puede usarla para identificar las máquinas virtuales infrautilizadas. La hoja Rendimiento lo ayuda a mejorar la velocidad de las aplicaciones. La opción de alta disponibilidad no está habilitada a través de Azure Advisor. La Excelencia operativa ayuda a conseguir eficiencia en los procesos y flujos de trabajo, manejabilidad de los recursos y procedimientos recomendados para las implementaciones.

### 4. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción Azure que contiene los siguientes recursos: - Ocho redes virtuales - 24 máquinas virtuales - 16 cuentas de almacenamiento Debe implementar una solución de supervisión que proporcione la capacidad de ver los datos de diagnóstico y telemetría generados por Azure recursos. ¿Qué deberías incluir en la solución?

**Respuesta incorrecta seleccionada:**
- registros de métricas

**Por qué es incorrecta:** Un área de trabajo de Log Analytics es un entorno único para los datos de registro de Azure Monitor y otros servicios de Azure, como Microsoft Sentinel y Microsoft Defender for Cloud. Cada área de trabajo tiene su propio repositorio de datos y configuración, y puede combinar datos de varios servicios.

### 5. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene 100 máquinas virtuales implementadas en Azure. Tiene configuradas alertas de Azure Monitor para el consumo de CPU y memoria de las máquinas virtuales. Usted abre las alertas de Azure Monitor y detecta 50 alertas cerradas para las máquinas virtuales. ¿Qué puede hacer que el estado de la alerta sea Cerrado?

**Respuesta incorrecta seleccionada:**
- Las condiciones que provocaron las alertas ya no están presentes.

**Por qué es incorrecta:** El usuario establece manualmente el estado de la alerta y no tiene ninguna lógica automatizada detrás de ella. El estado de la alerta puede ser Nuevo, Confirmado o Cerrado.

### 6. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una máquina virtual Azure denominada Server1 que ejecuta Windows Server. Debe configurar Azure Backup para realizar copias de seguridad de archivos y carpetas. ¿Qué debe instalar en Servidor1?

**Respuesta incorrecta seleccionada:**
- Microsoft Azure Backup Server (MABS)

**Por qué es incorrecta:** El agente de Microsoft Azure Recovery Service (MARS) debe estar instalado en los servidores. El agente de MARS es obligatorio para realizar servicios de copia de seguridad y recuperación para cualquier servidor.

### 7. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una máquina virtual Azure de la que realiza una copia de seguridad mediante Azure Backup. El subtipo de directiva de copia de seguridad es Estándar y la directiva de copia de seguridad tiene las siguientes configuraciones: - Frecuencia de programación de la copia de seguridad: Semanal - Conservar las instantáneas de recuperación rápida durante: 5 días - Retención del punto de copia de seguridad semanal: El domingo a las 8:00 h durante 12 semanas Detecta que la restauración instantánea consume más almacenamiento de lo esperado. Debe reducir la cantidad de almacenamiento consumido por la restauración instantánea. ¿Qué debe hacer primero?

**Respuesta incorrecta seleccionada:**
- Aprovisione un contenedor de Blob Storage adicional.

**Por qué es incorrecta:** Correcto: la configuración "Conservar instantáneas de recuperación instantánea" determina directamente cuánto tiempo se almacenan localmente las instantáneas antes de transferirse al almacén de Recovery Services. Al reducir esto de 5 días a 2 días, se reduce el uso del almacenamiento de restauración instantánea.

### 8. [exam-online-1](exam-online-1.md) · [exam-online-5](exam-online-5.md)

**Contexto:** Tiene una suscripción de Azure que contiene una cuenta de almacenamiento denominada storage1 y está vinculada a un inquilino de Microsoft Entra denominado contoso.com. Tiene previsto proporcionar acceso basado en la identidad a storage1. ¿Qué servicio de datos storage1 se puede configurar para usar el acceso basado en identidades?

**Respuesta incorrecta seleccionada:**
- contenedores

**Por qué es incorrecta:** Los recursos compartidos de archivos se pueden configurar para usar Microsoft Entra Kerberos y así proporcionar acceso basado en identidad al almacenamiento de datos.

### 9. [exam-online-1](exam-online-1.md) · [exam-online-3](exam-online-3.md) · [exam-online-5](exam-online-5.md) · [exam-online-6](exam-online-6.md)

**Contexto:** Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1. Debe conceder acceso a una aplicación de terceros a Storage1 durante los próximos 30 días. ¿Qué debe usar?

**Respuesta incorrecta seleccionada:**
- una directiva de acceso condicional

**Por qué es incorrecta:** La solución correcta consiste en usar una firma de acceso compartido (SAS), ya que solo SAS puede especificar el acceso limitado de tiempo a Azure almacenamiento. Una clave de acceso proporciona acceso ilimitado a la cuenta de almacenamiento de Azure, un rol de Azure puede proporcionar acceso o administración del recurso de Azure, que no tiene límite de tiempo, y una directiva de acceso condicional actúa como un motor de directivas de confianza cero, "si-entonces", que evalúa señales como la identidad del usuario, el cumplimiento de dispositivos, la ubicación y el riesgo para tomar decisiones de acceso en tiempo real.

### 10. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1. storage1 contiene un recurso compartido de Azure Files denominado share1. Debe asegurarse de que los usuarios pueden autenticarse en share1 mediante Microsoft Entra y acceder al recurso compartido de archivos mediante SMB. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Genere una firma de acceso compartido (SAS) y una cadena de conexión.

**Por qué es incorrecta:** los tokens de SAS y las claves de acceso proporcionan acceso basado en claves, en lugar de acceso basado en identidades, y la habilitación del acceso a la red pública no configura la autenticación ni la autorización.

### 11. [exam-online-1](exam-online-1.md)

**Contexto:** Debe crear una cuenta de Azure Storage que cumpla los siguientes requisitos: - Almacena datos en un mínimo de dos zonas de disponibilidad - Proporciona alta disponibilidad ¿Qué tipo de redundancia de almacenamiento debe usar?

**Respuesta incorrecta seleccionada:**
- almacenamiento con redundancia geográfica (GRS)

**Por qué es incorrecta:** El almacenamiento con redundancia de zona (ZRS) replica una cuenta de almacenamiento de forma sincrónica en tres zonas de disponibilidad Azure en la región primaria. Para garantizar la alta disponibilidad, Microsoft recomienda usar ZRS en la región primaria y también replicar en una región secundaria.

### 12. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una cuenta de Azure Storage denominada corpimages y una carpeta compartida local denominada \server1\images. Debe migrar todo el contenido de \server1\images a corpimages. ¿Cuáles son los dos comandos que puede usar? Cada respuesta correcta presenta una solución completa.

**Respuesta incorrecta seleccionada:**
- `Azcopy sync \\server1\images https://corpimages.blob.core.windows.net/public -recursive`

**Por qué es incorrecta:** El comando AzCopy permite copiar todos los archivos en una cuenta de almacenamiento. A continuación, use Get-ChildItem con el parámetropath, recurse para seleccionar todo y, a continuación, use el cmdlet Set-AzureStorageBlobContent.

### 13. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una cuenta de Azure Storage. Debe copiar datos en la cuenta de almacenamiento mediante la herramienta AzCopy. ¿Qué dos tipos de almacenamiento de datos son compatibles con AzCopy? Cada respuesta correcta presenta una solución completa.

**Respuesta incorrecta seleccionada:**
- tabla

**Por qué es incorrecta:** Puede proporcionar credenciales de autorización mediante Microsoft Entra o mediante un token de firma de acceso compartido (SAS). Ambos tipos de almacenamiento, blob y archivo se admiten en AzCopy.

### 14. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción Azure. Tiene planeado crear una cuenta de almacenamiento denominada storage1. Debe asegurarse de que storage1 proporciona listas de control de acceso (ACL) compatibles con POSIX. ¿Qué opción debe configurar al crear storage1?

**Respuesta incorrecta seleccionada:**
- nivel de acceso

**Por qué es incorrecta:** Para habilitar listas de control de acceso (ACL) compatibles con POSIX, se debe usar el espacio de nombres jerárquico. Las opciones restantes son válidas para una cuenta de almacenamiento, pero no proporcionan la característica compatible con POSIX.

### 15. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción de Azure que contiene varias cuentas de almacenamiento. Una cuenta de almacenamiento denominada storage1 tiene un recurso compartido de archivos denominado share1 que almacena vídeos de marketing. Los usuarios informaron de que el 99 % del almacenamiento asignado está en uso. Debe asegurarse de que share1 puede admitir archivos grandes y almacenar hasta 100 TiB. ¿Cuáles son los dos comandos de PowerShell que debe ejecutar? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- `New-AzRmStorageShare -ResourceGroupName RG1 -Name -StorageAccountName storage1 -Name share1 -QuotaGiB 100GB`

**Por qué es incorrecta:** Debe habilitar la cuenta de almacenamiento para admitir archivos grandes y actualizar la cuota de la cuenta de almacenamiento a 102 400 GB. No es necesario cambiar el tipo de cuenta de almacenamiento y está actualizando la compartición existente.

### 16. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una plantilla de Azure Resource Manager (ARM) denominada Template1 que se usa para implementar las máquinas virtuales de Azure. Template1 contiene el texto siguiente.  "recursos": [     {       "type": "Microsoft. Compute/virtualMachines",       "apiVersion": "2025-04-01",       "name": "[parameters('vmName')]",       "location": "[resourceGroup().location]",       "propiedades": {         < texto eliminado>       }     }   ] Debe implementar dos máquinas virtuales Azure mediante Template1. ¿Qué debe agregar a Template1?

**Respuesta incorrecta seleccionada:**
- el identificador de suscripción de Azure

**Por qué es incorrecta:** La solución correcta consiste en agregar un elemento de copia, ya que las plantillas de ARM usan la propiedad copy para implementar varias instancias de un recurso, como dos máquinas virtuales, en una sola implementación. La versión de la API ya está especificada en la plantilla y no controla el número de recursos implementados. El identificador de suscripción nunca está codificado de forma dura en las plantillas de ARM, ya que las implementaciones tienen el ámbito de una suscripción y la ubicación del grupo de recursos ya se proporciona a través de "[resourceGroup().location]". Por lo tanto, solo el elemento copy permite a la plantilla crear dos máquinas virtuales a partir de una única definición de recurso. Agregar flexibilidad a la plantilla de Azure Resource Manager mediante funciones de plantilla   Examinar plantillas de Azure Resource Manager   documentación de Azure Resource Manager

### 17. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene dos Azure máquinas virtuales denominadas VM1 y VM2 que ejecutan Windows Server. VM1 tiene un único disco de datos que almacena los archivos de copia de seguridad.   Debe mover el disco de datos de VM1 a VM2 lo antes posible. ¿Qué debe hacer primero?

**Respuesta incorrecta seleccionada:**
- Detenga VM1.

**Por qué es incorrecta:** Puede desasociar un disco de una máquina virtual en ejecución (eliminación activa). No es necesario detener VM2 ni reiniciar VM1.

### 18. [exam-online-1](exam-online-1.md)

**Contexto:** Pregunta 33 de 50 Tiene una máquina virtual Azure. Recibirá una notificación de que la máquina virtual se verá afectada por una actividad de mantenimiento subyacente en la infraestructura física. Debe mover la máquina virtual a otro host para evitar una interrupción del servicio. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Aplique una directiva de Azure.

**Por qué es incorrecta:** Debe volver a implementar la máquina virtual, lo que puede permitir moverla a otro host. Azure apagará la máquina virtual y moverá la máquina virtual a un nuevo nodo dentro de la infraestructura de Azure.

### 19. [exam-online-1](exam-online-1.md)

**Contexto:** iene una suscripción Azure que contiene una imagen de contenedor de Docker denominada container1. Tiene previsto crear una nueva aplicación web Azure App Service denominada WebApp1. Debe asegurarse de que puede usar container1 para WebApp1. ¿Qué configuración de WebApp1 deberías ajustar?

**Respuesta incorrecta seleccionada:**
- Pila en tiempo de ejecución

**Por qué es incorrecta:** Si desea ejecutar un contenedor de Docker como un servicio web Azure, debe configurar la opción Publicar y seleccionar Contenedor de Docker. La pila de ejecución especifica la pila que desea utilizar para la aplicación web. Si quiere desplegar un contenedor Docker en forma de aplicación web, la opción de entorno de ejecución no está disponible. La implementación continua es una estrategia para las versiones de software. Esta opción no está disponible al publicar un contenedor de Docker como una aplicación web de Azure.

### 20. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción de Azure que contiene una aplicación de contenedor Azure denominada cont1. Planea agregar reglas de escalado a cont1. Debe asegurarse de que las réplicas de cont1 sean creadas en función de los mensajes recibidos en Azure Service Bus. ¿Qué activador de escala debe seleccionar?

**Respuesta incorrecta seleccionada:**
- Tráfico HTTP

**Por qué es incorrecta:** Azure Container Apps permite que un conjunto de desencadenadores cree nuevas instancias, denominadas réplicas. Para Azure Service Bus, se puede usar un desencadenador controlado por eventos para ejecutar el método de escalación. Los desencadenadores de escala restantes no pueden usar una regla de escalado basada en mensajes de un bus de servicio de Azure.

### 21. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción de Azure que contiene varios grupos de recursos y aplicaciones web de Azure App Service. Un grupo de recursos denominado RG1 hospeda una aplicación web denominada appservice1. App Service usa un certificado SSL. Cree un grupo de recursos con el nombre RG2. Tiene previsto mover todos los recursos de RG1 a RG2.   ¿Qué dos acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- Cree un nuevo plan de App Service en RG2.

**Por qué es incorrecta:** El certificado SSL debe eliminarse. Tendrá que mover todos los demás recursos a RG2. > [!warning] Brain — Respuesta: Eliminar el certificado SSL de RG1 y cargarlo en RG2 + Mover todos los recursos de RG1 a RG2 — no cubierto en mi documentación > > Los certificados de App Service no se pueden mover entre grupos de recursos: eliminar del origen, mover el resto y volver a cargarlo en el destino. > > ⚠️ Gap: limitaciones de movimiento de recursos sin página; lo más cercano es [az104-app-service.md](../../../knowledge/az104-app-service.md).

### 22. [exam-online-1](exam-online-1.md)

**Contexto:** iene una suscripción Azure que contiene una aplicación web Azure App Service denominada App1. Tiene las siguientes configuraciones de registro de diagnóstico: - Registro de la aplicación (FileSystem): Error - Registro de Aplicación (Blob): Información - Mensajes de error detallados: Advertencia - Registro del servidor web: Verbose Debe configurar el registro de diagnóstico para almacenar todas las advertencias o superiores.   ¿Qué tipos de registro de diagnóstico y qué nivel de severidad debería habilitar?

**Respuesta incorrecta seleccionada:**
- Mensaje de error detallado

**Por qué es incorrecta:** Debe habilitar el diagnóstico de Application Logging (Blob), que se puede almacenar por más de una semana. También debe establecer el nivel de gravedad en advertencia, para almacenar mensajes de registro críticos, errores y advertencias.

### 23. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción Azure. Tiene previsto implementar una aplicación web en un contenedor de Docker basado en Linux. Necesita recomendar una solución para la implementación de la aplicación web que cumpla los requisitos siguientes: - Admite un nombre de dominio personalizado - Proporciona la capacidad de escalar horizontalmente de forma automática en función de la demanda. - Minimiza el esfuerzo administrativo - Minimiza los costos ¿Qué solución debe recomendar?

**Respuesta incorrecta seleccionada:**
- Azure Container Instances (Instancias de contenedores de Azure)

**Por qué es incorrecta:** Azure App Service cumple todos los requisitos indicados. Azure Virtual Machine Scale Sets, Azure Kubernetes Service (AKS) y Azure Container Instances son más difíciles de administrar y más costosos.

### 24. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción de Azure que contiene una red virtual denominada VNet1 y una máquina virtual denominada VM1. Solo se puede acceder a VM1 desde la red interna. Un contratista externo necesita acceso a VM1. La solución debe minimizar el esfuerzo administrativo. ¿Qué debe configurar?

**Respuesta incorrecta seleccionada:**
- Azure Firewall

**Por qué es incorrecta:** Para compartir una máquina virtual con un usuario externo, debe agregar una dirección IP pública a la máquina virtual. En este caso, una dirección IP o una configuración de firewall adicionales no le ayudarán. La configuración de una VPN S2S no tiene un esfuerzo administrativo mínimo. Quickstart: creación de una máquina virtual de Windows en el portal de Azure: Azure Virtual Machines | Microsoft Learn

### 25. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción Azure que contiene una red virtual denominada VNet1. Tiene previsto habilitar la conectividad de VNet1 con recursos locales mediante una conexión cifrada. ¿Qué debe configurar para VNet1?

**Respuesta incorrecta seleccionada:**
- una conexión de extremo privado

**Por qué es incorrecta:** Una puerta de enlace de VPN es un tipo de puerta de enlace de red virtual que envía tráfico cifrado entre una red virtual y una ubicación local a través de una conexión pública. También puede usar una puerta de enlace de VPN para enviar tráfico entre redes virtuales a través de la red troncal de Azure. Una conexión de puerta de enlace de VPN se basa en la configuración de varios recursos, cada uno de los cuales contiene valores configurables.

### 26. [exam-online-1](exam-online-1.md) · [exam-online-3](exam-online-3.md)

**Contexto:** Tiene dos suscripciones Azure denominadas Sub1 y Sub2. Sub1 contiene una red virtual denominada VNet1 y una puerta de enlace de VPN. Sub2 contiene una red virtual denominada VNet2. Tiene un dispositivo local denominado Device1 que ejecuta Windows y tiene instalado un cliente VPN de punto a sitio (P2S). Configuras el emparejamiento de redes entre VNet1 y VNet2. Debe asegurarse de que Device1 puede acceder a VNet2 cuando se establece una conexión VPN. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Creación de un punto de conexión privado en Sub2.

**Por qué es incorrecta:** Para asegurarse de que se están descargando las nuevas rutas en el cliente, los clientes VPN de punto a sitio (P2S) deben descargarse e instalarse de nuevo después de que el emparejamiento de red virtual se haya configurado correctamente. No se requiere un punto de conexión privado ni Azure Front Door para poder acceder a VNet2 desde VNet1. Device1 ya tiene un certificado digital al instalar el cliente VPN P2S, por lo que no es necesario crear un certificado nuevo manualmente.

### 27. [exam-online-1](exam-online-1.md)

**Contexto:** Puede crear varias máquinas virtuales Azure que ejecutan Windows Server. Debe conectarse a las máquinas virtuales sin exponer los puertos RDP a través de Internet. ¿Qué Azure servicio debe implementar?

**Respuesta incorrecta seleccionada:**
- Azure Virtual Desktop

**Por qué es incorrecta:** Azure Bastion es un servicio que permite conectarse a una máquina virtual mediante un explorador, sin exponer los puertos RDP y SSH. Azure Monitor le ayuda a maximizar la disponibilidad y el rendimiento de las aplicaciones y los servicios. Azure Network Watcher proporciona herramientas para supervisar, diagnosticar, ver métricas y habilitar o deshabilitar registros de recursos en una red virtual de Azure. Escritorio remoto es una característica del sistema operativo, que expone el puerto RDP para conectarse a un servidor desde Internet.

### 28. [exam-online-1](exam-online-1.md) · [exam-online-6](exam-online-6.md)

**Contexto:** Su empresa planea migrar servidores de un entorno local a Azure. Habrá máquinas virtuales de desarrollo, pruebas y producción en una sola red virtual. Debe restringir el tráfico entre las máquinas virtuales de desarrollo, pruebas y producción a puertos específicos. ¿Qué debe usar?

**Respuesta incorrecta seleccionada:**
- un firewall de Azure

**Por qué es incorrecta:** Debe configurar reglas del grupo de seguridad de red (NSG) para permitir el tráfico TCP o ICMP para puertos específicos. Azure Firewall es un servicio administrado que protege los servicios de Azure en varias redes virtuales. Los equilibradores de carga se usan para distribuir el tráfico entrante entre los servidores back-end disponibles. Azure VPN se usa para tener un establecimiento de conexión entre el entorno local y Azure.

### 29. [exam-online-1](exam-online-1.md)

**Contexto:** Tiene una suscripción Azure que contiene una aplicación ASP.NET. La aplicación se hospeda en cuatro máquinas virtuales Azure que ejecutan Windows Server. Tiene un equilibrador de carga llamado LB1 que distribuye las solicitudes a las máquinas virtuales. Debe asegurarse de que los usuarios del sitio se conectan al mismo servidor web para todas las solicitudes realizadas a la aplicación. ¿Qué dos acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- Configure una regla NAT de entrada.

**Por qué es incorrecta:** Al establecer la persistencia de sesión en IP y protocolo de cliente, asegúrese de que los usuarios del sitio se conectan al mismo servidor web para todas las solicitudes realizadas a la aplicación. Al establecer la persistencia de sesión en Ninguna, se deshabilitan las sesiones permanentes y se usa una regla NAT de entrada para reenviar el tráfico desde un front-end del equilibrador de carga a un grupo de back-end.

### 30. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una suscripción de Azure que contiene grupos de seguridad de red (NSG). ¿Qué dos recursos se pueden asociar a un NSG? Cada respuesta correcta presenta una solución completa.

**Respuesta incorrecta seleccionada:**
- Redes virtuales
- Máquinas virtuales

**Por qué es incorrecta:** Puedes usar un grupo de seguridad de red (NSG) para asignarlo a una interfaz de red. Los NSG se pueden asociar con las subredes o las instancias individuales de máquina virtual dentro de esa subred. Cuando un NSG está asociado a una subred, las reglas de ACL se aplican a todas las instancias de máquinas virtuales de esa subred.

### 31. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una suscripción de Azure que contiene dos grupos de recursos denominados RG1 y RG2. RG1 contiene los siguientes recursos: - Una red virtual denominada VNet1 ubicada en la región este de EE. UU. Azure - Un grupo de seguridad de red (NSG) denominado NSG1 ubicado en la región Azure del Oeste de EE. UU. RG2 contiene los siguientes recursos: - Una red virtual denominada VNet2 ubicada en la región este de EE. UU. Azure - Una red virtual denominada VNet3 ubicada en la región oeste de EE. UU. Azure Debe asociar NSG1. ¿A qué subredes puede asociar NSG1?

**Respuesta incorrecta seleccionada:**
- las subredes de todas las redes virtuales

**Por qué es incorrecta:** Puede asignar un grupo de seguridad de red (NSG) a la subred de la red virtual en la misma región, mientras que NSG1 se encuentra en la región Oeste de EE. UU.

### 32. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una suscripción Azure. Tiene previsto implementar cuatro redes virtuales de Azure que estarán emparejadas. Todas las máquinas virtuales usarán un sufijo DNS de contoso.com. Debe configurar la resolución de nombres de las redes virtuales para asegurarse de que todas las máquinas virtuales puedan comunicarse mediante sus FQDN. La solución debe minimizar el esfuerzo administrativo. ¿Qué debe usar?

**Respuesta incorrecta seleccionada:**
- resolución de nombres proporcionada por Azure

**Por qué es incorrecta:** Azure DNS privado permite la resolución de nombres privados entre redes virtuales de Azure. Azure DNS público proporciona DNS para el acceso público, como la resolución de nombres para un sitio web accesible públicamente. La resolución de nombres proporcionada por Azure no admite nombres de dominio definidos por el usuario y solo admite una red virtual. También se puede usar un servidor DNS en una máquina virtual para lograr el objetivo, pero implica mucho más esfuerzo administrativo para implementar y mantener que usar Azure DNS privado.

### 33. [exam-online-2](exam-online-2.md)

**Contexto:** Su empresa ha implementado un Azure Load Balancer para distribuir el tráfico entre varias máquinas virtuales de una granja de servidores web. Los usuarios notifican tiempos de espera de conexión intermitentes al acceder a la aplicación web. Debe resolver los problemas de tiempo de espera de conexión y asegurarse de que el balanceador de carga distribuya el tráfico uniformemente. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Actualice el equilibrador de carga a una SKU superior.

**Por qué es incorrecta:** Cambiar el modo de distribución a un conjunto de cinco hash asegura una distribución uniforme del tráfico teniendo en cuenta varios parámetros, lo cual ayuda a solucionar los problemas de espera en la conexión. La configuración de un sondeo de estado para el equilibrador de carga no afecta a la distribución interna del tráfico ni resuelve los tiempos de espera de conexión. La habilitación de la persistencia de sesión con afinidad de IP de origen puede provocar una distribución de tráfico desigual, lo que dirige las solicitudes del mismo cliente a la misma máquina virtual, lo que no resuelve el problema. La actualización del equilibrador de carga a una SKU superior sin solucionar el modo de distribución no resolverá los problemas de tiempo de espera de conexión o distribución de tráfico desiguales.

### 34. [exam-online-2](exam-online-2.md)

**Contexto:** Una organización usa un Microsoft Azure Standard Load Balancer para distribuir el tráfico entre varias máquinas virtuales (VM) en un grupo de back-end. Los usuarios notifican problemas de conectividad intermitentes con las aplicaciones en estas máquinas virtuales. Debe solucionar y resolver problemas de conectividad. ¿Qué tres acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- Modifique la configuración de persistencia de la sesión.

**Por qué es incorrecta:** Para solucionar problemas de conectividad con una Microsoft Azure Standard Load Balancer, es esencial comprobar la configuración del sondeo de estado, asegurarse de que las máquinas virtuales responden al puerto configurado y comprueban que las reglas de NSG permiten el tráfico entrante. Estas acciones abordan posibles errores de configuración que podrían impedir que el tráfico llegue a las máquinas virtuales. Modificar la configuración de persistencia de sesión, aumentar la configuración de tiempo de espera o reiniciar las máquinas virtuales no resuelve directamente los problemas de conectividad y puede introducir nuevas limitaciones o ideas erróneas. Puntos de conexión de almacenamiento seguro | Microsoft Learn   Crear reglas de grupo de seguridad de red | Microsoft Learn

### 35. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una plantilla de Azure Resource Manager (ARM) denominada deploy.json que se almacena en un contenedor de blobs de Azure. Tiene previsto implementar la plantilla mediante la ejecución del cmdlet `New-AzDeployment`. ¿Qué parámetro debe usar para hacer referencia a la plantilla?

**Respuesta incorrecta seleccionada:**
- `-Templatefile`

**Por qué es incorrecta:** Los cmdlets de implementación de PowerShell se pueden usar para implementar plantillas JSON que se almacenan localmente en un grupo de recursos como especificación de plantilla o desde una ubicación basada en web. Puede usar el parámetro -TemplateUri para especificar una ubicación basada en web, como GitHub o una cuenta de Azure Blob Storage. Puede usar -Templatefile para especificar un archivo local. Puede usar -TemplateSpecId para especificar una plantilla que se guardó en Azure como especificación de plantilla.

### 36. [exam-online-2](exam-online-2.md)

**Contexto:** Usted es un administrador de Azure para best for You Organics Company. La empresa usa plantillas de ARM para implementar recursos.   Debe pasar un array como parámetro en línea durante la implementación de la plantilla de ARM.   ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Cree un archivo de parámetros independiente que incluya los valores de matriz.

**Por qué es incorrecta:** Para pasar una matriz como parámetro insertado durante la implementación de una plantilla local, debe proporcionar los valores de matriz en el modificador --parameters del comando de implementación. Las otras opciones no son métodos correctos para pasar una matriz como parámetro insertado. Cómo usar plantillas de implementación de Azure Resource Manager (ARM) con CLI de Azure - Entrenamiento | Microsoft Learn   Explore la estructura de la plantilla de Azure Resource Manager - Formación | Microsoft Learn

### 37. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene un plan de Azure App Service básico que contiene una aplicación web. Debe asegurarse de que la aplicación web se puede escalar automáticamente cuando el uso de la CPU es superior a 80% durante un período de 15 minutos. ¿Qué dos acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- Configure una condición de escalado para escalar en función de un recuento de instancias y, a continuación, establezca el recuento de instancias.

**Por qué es incorrecta:** El plan de App Service básico no admite el escalado automático: debe actualizar el plan a la versión Premium (o superior) para admitir el escalado automático. Después de eso, debe configurar una condición de escalado basada en una métrica (CPU), que activará automáticamente la expansión horizontal de la aplicación web del servicio de aplicaciones.

### 38. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1. Debe proporcionar acceso a almacenamiento1 a una organización asociada. El acceso a Storage1 debe expirar automáticamente después de 24 horas. ¿Qué debe configurar?

**Respuesta incorrecta seleccionada:**
- clave de acceso

**Por qué es incorrecta:** Una SAS proporciona acceso delegado a los recursos de la cuenta de almacenamiento. Con una SAS, tiene control granular sobre la forma en que un cliente puede tener acceso a los datos, incluidas las restricciones de tiempo. Las claves de acceso y Azure CDN proporcionan acceso permanente a los recursos. Requerirán pasos manuales para quitar el acceso. No es necesaria la administración del ciclo de vida.

### 39. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una red local. Tiene una suscripción Azure que contiene una red virtual denominada VNet1. VNet1 está conectado a la red local mediante ExpressRoute. Realice las siguientes acciones: - Creación de una cuenta de almacenamiento denominada storage1 - Asocie VNet1 a storage1 y configure el enrutamiento de red para usar Microsoft enrutamiento de red. Debe asegurarse de que solo se permiten conexiones desde la red local para acceder al almacenamiento1. La solución debe minimizar el esfuerzo administrativo. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Cree una tabla de enrutamiento. Agregue una regla de filtro a la tabla.

**Por qué es incorrecta:** La solución correcta consiste en configurar las opciones de red de la cuenta de almacenamiento, ya que Azure Storage permite restringir el acceso habilitando el firewall y las reglas de red virtual para que solo se permita el tráfico desde redes virtuales específicas o redes locales (a través de ExpressRoute o VPN). Este enfoque satisface directamente el requisito con un esfuerzo administrativo mínimo, ya que aprovecha la configuración de red integrada. La creación de una tabla de enrutamiento con reglas de filtro no bloquearía el acceso al almacenamiento; solo influye en el enrutamiento de paquetes. Un token de SAS controla la autenticación y los permisos, pero no restringe el origen de red de las solicitudes. La creación de otro circuito ExpressRoute y la configuración de filtros agrega complejidad innecesaria cuando las reglas de red de la cuenta de almacenamiento ya proporcionan el control necesario.

### 40. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene dos cuentas de blob en bloques premium Azure Storage llamadas storage1 y storage2. Debe configurar la replicación de objetos de storage1 a storage2. ¿Qué tres características se deben habilitar antes de configurar la replicación de objetos? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- fuente de cambios para storage2
- restauración a un momento dado para contenedores en storage2

**Por qué es incorrecta:** La replicación de objetos se puede usar para replicar blobs entre cuentas de almacenamiento. Antes de configurar la replicación de objetos, debe habilitar el versionado de blobs para ambas cuentas de almacenamiento, así como el feed de cambios para la cuenta de origen.

### 41. [exam-online-2](exam-online-2.md) · [exam-online-6](exam-online-6.md)

**Contexto:** Tiene una suscripción Azure que contiene dos máquinas virtuales denominadas VM1 y VM2. Se realiza una copia de seguridad de VM1 y VM2 en un almacén de Recovery Service denominado Vault1 mediante la misma directiva de copia de seguridad. Su empresa planea crear más máquinas virtuales y bóvedas de Recovery Services. Durante este proceso, Vault1 se retirará. Debe eliminar Vault1. ¿Qué tres acciones debe realizar antes de poder eliminar Vault1? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- Elimine VM1 y VM2.

**Por qué es incorrecta:** Debes parar las copias de seguridad para poder prepararte para pasar a la nueva política. La característica de eliminación temporal está habilitada de forma predeterminada, por lo que debe deshabilitarse. Debe quitar todos los elementos que están en estado de eliminación reversible. No es necesario eliminar las máquinas virtuales. No se puede eliminar la directiva sin eliminar la bóveda y la copia de seguridad, y no se necesita una nueva directiva.

### 42. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una suscripción de Azure que contiene un usuario denominado User1 y una bóveda de servicios de recuperación denominada Vault1. Los informes de Azure Backup se usan para supervisar el estado de los recursos protegidos. Debe notificar al usuario1 por correo electrónico cuando un informe de copia de seguridad muestra un estado de error. La solución debe minimizar el esfuerzo administrativo. ¿Qué debe hacer primero?

**Respuesta incorrecta seleccionada:**
- Cree una regla de procesamiento de alertas en Azure Monitor.

**Por qué es incorrecta:** Correcto: primero se debe crear un grupo de acciones para definir el destino de notificación por correo electrónico antes de que se pueda asociar a cualquier alerta de Azure Monitor, lo que lo convierte en el paso inicial necesario al configurar las notificaciones de alerta de copia de seguridad. las propiedades del almacén de claves y la configuración de IAM no configuran notificaciones de alerta, y las reglas de procesamiento de alertas son modificadores opcionales posteriores que no pueden enviar notificaciones sin un grupo de acciones existente.

### 43. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una suscripción Azure que contiene los siguientes usuarios: - User1: Miembro - User2: Miembro - User3: Invitado - User4: Miembro La suscripción contiene un grupo denominado Group1 con la siguiente configuración: - Tipo de pertenencia: asignado - Miembros: User1, User2, User3 - Propietarios: User4 Asigne una licencia de Microsoft 365 a Group1. ¿Cuántas licencias de Microsoft 365 se usarán?

**Respuesta incorrecta seleccionada:**
- 4

**Por qué es incorrecta:** Cuando asigna licencias a un grupo de Microsoft Entra, las licencias son consumidas solo por los miembros del grupo, no por los propietarios del grupo. En este caso, Group1 tiene tres miembros: User1, User2 y User3. Aunque User3 es un usuario invitado, la asignación de una licencia a ellos sigue consume una licencia a menos que la organización haya configurado licencias de invitado restringidas. User4 es solo propietario, no miembro, por lo que no consumen una licencia de esta asignación. Por lo tanto, se usan un total de tres licencias de Microsoft 365. Administración de licencias   ¿Qué es la licencia basada en grupos en Microsoft Entra ID?   Comprender la licencia Microsoft 365 E3 y E5 Funciones adicionales

### 44. [exam-online-2](exam-online-2.md)

**Contexto:** Tiene una suscripción Azure y un usuario denominado User1. Debe asignar a User1 un rol que permita al usuario crear y administrar todos los tipos de recursos de la suscripción. La solución debe asegurarse de que User1 no puede asignar roles a otros usuarios. ¿Qué rol de Azure debe asignar a User1?

**Respuesta incorrecta seleccionada:**
- Propietario

**Por qué es incorrecta:** Los usuarios con el rol Colaborador pueden crear y administrar todos los tipos de recursos, pero no pueden delegar el acceso nuevo a otros usuarios. Los usuarios con el rol Lector pueden ver los recursos de Azure existentes, pero no pueden realizar ninguna acción en ellos. Los usuarios con el rol de Colaborador de API Management solo pueden administrar servicios y API. Los usuarios con el rol Propietario tienen acceso total a todos los recursos, incluido el derecho a delegar el acceso a otros usuarios.

### 45. [exam-online-3](exam-online-3.md)

**Contexto:** Tiene una suscripción de Azure que contiene las siguientes redes virtuales: - VNet1: tiene un espacio de direcciones IP de 10.10.0.0/16 y contiene una subred denominada Subnet1 (10.10.1.0/24) que hospeda una máquina virtual denominada VM1 que ejecuta Windows Server. - VNet2: tiene un espacio de direcciones IP de 10.20.0.0/16 y contiene una subred denominada Subnet2 (10.20.1.0/24) que hospeda una máquina virtual denominada VM2 que ejecuta Windows Server. VNet1 y VNet2 están conectados mediante el emparejamiento de red virtual. Los usuarios informan de que VM1 no se puede conectar a VM2. Debe comprobar si el tráfico de VM1 a la subred 10.20.0.0/16 usa el emparejamiento de red virtual como próximo salto. ¿Qué debe usar?

**Respuesta incorrecta seleccionada:**
- Solución de problemas de conexión en Azure Network Watcher de VM1 a VM2

**Por qué es incorrecta:** Al ver las rutas efectivas en la interfaz de red de VM1, se muestran todas las rutas que Azure aplica al tráfico saliente, incluidas las definidas por el sistema, el emparejamiento y el usuario, así como el tipo de siguiente salto para el prefijo 10.20.0.0/16. Azure Network Watcher próximo salto es una herramienta de diagnóstico que identifica el próximo salto de enrutamiento (tipo, dirección IP e identificador de tabla de rutas) para el tráfico que sale de una máquina virtual. El siguiente salto no muestra las decisiones de enrutamiento. El rol de Controlador de Red en Windows Server es un punto de administración centralizado y programable para Redes Definidas por Software (SDN).

### 46. [exam-online-3](exam-online-3.md)

**Contexto:** Tiene una aplicación web funcionando en cuatro máquinas virtuales de Windows Server Azure detrás de un equilibrador de carga. Los usuarios experimentan problemas al acceder a la aplicación web. Sospecha de un problema con el servidor web y debe comprobar si el servidor está escuchando en el puerto 80. ¿Qué comando debe ejecutar?

**Respuesta incorrecta seleccionada:**
- `Get-AzVirtualNetworkUsageList`

**Por qué es incorrecta:** El uso de netstat -an enumerará los puertos en los que escucha el servidor. Test-NetConnection realizará una prueba de ping/ICMP. Nbtstat -c comprueba la memoria caché de NBT. Get-AzVirtualNetwork obtiene las redes virtuales en un grupo de recursos.

### 47. [exam-online-3](exam-online-3.md)

**Contexto:** Tiene una red virtual Azure denominada VNet1. Cree una zona Azure DNS privado denominada contoso.com. Debe asegurarse de que las máquinas virtuales de VNet1 se registren en la zona DNS privada contoso.com. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Configure VNet1 para usar un servidor DNS personalizado.

**Por qué es incorrecta:** Para asociar una red virtual a una zona DNS privada, agregue la red virtual a la zona mediante la creación de un vínculo de red virtual. Azure DNS Private Resolver se utiliza para intermediar en las consultas DNS entre entornos locales y Azure DNS. Un servidor DNS personalizado funcionará si implementa un servidor DNS como una máquina virtual o un dispositivo, sin embargo, esta configuración no funciona con una zona DNS privada.

### 48. [exam-online-3](exam-online-3.md) · [exam-online-6](exam-online-6.md)

**Contexto:** Su empresa tiene un conjunto de recursos implementados en una suscripción de Azure. Los recursos se implementan en un grupo de recursos denominado app-grp1 mediante plantillas de Azure Resource Manager (ARM). Debe comprobar la fecha y la hora en que se crearon los recursos de app-grp1. ¿Qué hoja debe revisar para app-grp1 en el portal de Azure?

**Respuesta incorrecta seleccionada:**
- Configuración de diagnóstico

**Por qué es incorrecta:** Navegar a la hoja Configuración de diagnóstico proporciona la capacidad de diagnosticar errores o revisar advertencias. Al navegar a la hoja Métricas se proporciona información de métricas (CPU, recursos) a los usuarios. En la hoja Implementaciones del grupo de recursos (app-grp1), todos los detalles relacionados con una implementación, como el nombre, el estado, la fecha de última modificación y la duración, son visibles. Al navegar al panel Directiva, solo se proporciona información relacionada con las directivas aplicadas en el grupo de recursos.

### 49. [exam-online-3](exam-online-3.md)

**Contexto:** Su empresa planea hospedar una aplicación en cuatro máquinas virtuales Azure. Debe asegurarse de que al menos dos máquinas virtuales están disponibles si se produce un error en un único centro de datos de Azure. ¿Qué opción de disponibilidad debe seleccionar para la máquina virtual?

**Respuesta incorrecta seleccionada:**
- Un conjunto de disponibilidad

**Por qué es incorrecta:** Para protegerse frente a errores de nivel de centro de datos y, si desea conectividad a varias máquinas, debe asegurarse de que las máquinas virtuales se implementan en varias zonas de disponibilidad.

### 50. [exam-online-3](exam-online-3.md)

**Contexto:** Va a implementar una máquina virtual mediante un conjunto de disponibilidad en la región de Azure del Este de EE. UU. Ha implementado 18 máquinas virtuales en dos dominios de fallo y 10 dominios de actualización. Microsoft realizó el mantenimiento planeado de hardware físico en la región Este de EE. UU. ¿Cuál es el número máximo de máquinas virtuales que estarán no disponibles?

**Respuesta incorrecta seleccionada:**
- 8

**Por qué es incorrecta:** 18 máquinas virtuales se comparten entre 10 dominios de actualización. Las primeras 10 máquinas virtuales van a 10 dominios de actualización, por lo que ocho dominios de actualización tendrán dos máquinas virtuales. Cuando hay mantenimiento de hardware físico, algunas máquinas virtuales no estarán disponibles en función de su configuración. Si hubiera un fallo en el bastidor, entonces 18 máquinas virtuales se distribuirán en dos dominios de error con nueve máquinas virtuales cada una.

### 51. [exam-online-3](exam-online-3.md)

**Contexto:** Tiene previsto implementar una máquina virtual Azure. Está evaluando si utilizar una instancia de Spot de Azure. ¿Qué dos factores pueden hacer que se desaloje una instancia de Spot de Azure? Cada respuesta correcta presenta una solución completa.

**Respuesta incorrecta seleccionada:**
- el promedio de usos de CPU de la instancia

**Por qué es incorrecta:** Instancias de Spot de Azure permiten aprovisionar máquinas virtuales a un costo reducido, pero Azure puede detener estas máquinas virtuales cuando necesita la capacidad para otras cargas de trabajo de pago por uso, o cuando el precio de la instancia de Spot supera el precio máximo que hayas establecido. Estas máquinas virtuales son adecuadas para desarrollo, pruebas o cargas de trabajo que no requieren ningún Acuerdo de Nivel de Servicio específico.

### 52. [exam-online-3](exam-online-3.md)

**Contexto:** Tiene una suscripción Azure que contiene una aplicación de contenedor denominada App1. App1 está configurada para usar datos almacenados en caché. Tiene previsto crear un contenedor nuevo. Debe asegurarse de que el nuevo contenedor actualice automáticamente la memoria caché usada por App1. ¿Qué tipo de contenedor debe configurar?

**Respuesta incorrecta seleccionada:**
- mancha

**Por qué es incorrecta:** Azure Container Apps administra los detalles de la orquestación de contenedores y Kubernetes. Los contenedores en Azure Container Apps pueden usar cualquier lenguaje de programación, entorno de ejecución o pila de desarrollo que elija. Puede definir varios contenedores en una sola aplicación contenedora para implementar el patrón sidecar, por ejemplo, un agente que lee los registros del contenedor de aplicaciones principal en un volumen compartido y los reenvía a un servicio de registro.

### 53. [exam-online-3](exam-online-3.md) · [exam-online-4](exam-online-4.md)

**Contexto:** Tiene una suscripción de Azure denominada Sub1 que contiene un grupo de recursos denominado RG1 y un servidor local denominado Server1 que ejecuta Windows Server. Tiene previsto realizar copias de seguridad de archivos y carpetas de Server1 a Azure mediante Azure Backup. En RG1, creas una bóveda de servicios de recuperación llamado Vault1. Instale el agente de Microsoft Azure Recovery Services (MARS) en Server1. Debe asegurarse de que Server1 puede realizar una copia de seguridad de los datos en Vault1. ¿Qué debe hacer a continuación?

**Respuesta incorrecta seleccionada:**
- Cree una directiva de copia de seguridad para Vault1.

**Por qué es incorrecta:** Correcto: es necesario descargar las credenciales del almacén y registrar el servidor con el almacén de Recovery Services antes de que se puedan producir operaciones de copia de seguridad, ya que esto establece la confianza entre el servidor local y el almacén. la configuración de una directiva de copia de seguridad, la habilitación de la eliminación temporal o la modificación de la configuración de seguridad del almacén solo se pueden realizar después de que el almacén registre y reconozca el servidor, por lo que estas acciones no habilitan la conectividad de copia de seguridad por sí sola.

### 54. [exam-online-4](exam-online-4.md)

**Contexto:** Debe crear una cuenta de Azure Storage que admita las funcionalidades de Azure Data Lake Storage Gen2. ¿Qué dos tipos de cuentas de almacenamiento puede usar? Cada respuesta correcta presenta una solución completa.

**Respuesta incorrecta seleccionada:**
- Recursos compartidos de archivos de nivel premium

**Por qué es incorrecta:** Para admitir Data Lake Storage, la cuenta de almacenamiento debe admitir Blob Storage, que está disponible como blobs en bloques estándar de uso general v2 y Premium. Además, al crear una cuenta de almacenamiento, debe habilitar el espacio de nombres jerárquico.

### 55. [exam-online-4](exam-online-4.md) · [exam-online-6](exam-online-6.md)

**Contexto:** Ha implementado una aplicación web en Microsoft Azure mediante un Microsoft Load Balancer público para distribuir el tráfico entre máquinas virtuales. Los usuarios notifican problemas de conectividad intermitentes. Debe solucionar los problemas de conectividad para el acceso coherente a las aplicaciones. Cada respuesta correcta presenta parte de la solución. ¿Qué dos acciones debe realizar?

**Respuesta incorrecta seleccionada:**
- Compruebe las reglas del grupo de seguridad de red para las máquinas virtuales.

**Por qué es incorrecta:** mente puede provocar que el tráfico se enrute a instancias incorrectas, lo que provoca problemas de conectividad. La comprobación de las SKU coincidentes para el equilibrador de carga y la dirección IP pública también es esencial, ya que las SKU no coincidentes pueden interrumpir el funcionamiento adecuado y provocar problemas de conectividad. La comprobación de las reglas del grupo de seguridad de red puede parecer relevante, pero no aborda la causa principal de los problemas de conectividad. Cambiar el modo de distribución del equilibrador de carga podría parecer que podría mejorar la persistencia de la sesión, pero no resuelve los problemas de configuración subyacentes que causan los problemas de conectividad.

### 56. [exam-online-4](exam-online-4.md)

**Contexto:** Su organización usa un Azure Load Balancer para administrar el tráfico de las máquinas virtuales que hospedan una aplicación web. Los usuarios experimentan una distribución de tráfico desigual, con algunas máquinas virtuales que reciben más tráfico que otros. Debe configurar el equilibrador de carga para garantizar la distribución del tráfico uniforme en todas las máquinas virtuales del grupo de back-end. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Habilite la persistencia de sesión (afinidad de IP de origen).

**Por qué es incorrecta:** Deshabilitar la persistencia de sesión garantiza incluso la distribución del tráfico quitando cualquier afinidad que dirija el tráfico a la misma máquina virtual. Ajustar la configuración de la regla de equilibrio de carga podría parecer una solución, pero no aborda la causa principal de la distribución desigual. La habilitación de la afinidad de IP de origen mantiene la persistencia de la sesión, lo que podría exacerbar la distribución desigual del tráfico. Agregar más máquinas virtuales no resuelve el problema de distribución causado por la configuración de persistencia de sesión.

### 57. [exam-online-5](exam-online-5.md)

**Contexto:** Tiene una suscripción de Azure que contiene las siguientes redes virtuales: - VNet1: tiene un espacio de direcciones IP de 10.10.0.0/16 y contiene una subred denominada Subnet1 (10.10.1.0/24) que hospeda una máquina virtual denominada VM1 que ejecuta Windows Server. - VNet2: tiene un espacio de direcciones IP de 10.20.0.0/16 y contiene una subred denominada Subnet2 (10.20.1.0/24) que hospeda una máquina virtual denominada VM2 que ejecuta Windows Server. VNet1 y VNet2 están conectados mediante el emparejamiento de red virtual. Los usuarios informan de que VM1 no se puede conectar a VM2. Debe comprobar si el tráfico de VM1 a la subred 10.20.0.0/16 usa el emparejamiento de red virtual como próximo salto. ¿Qué debe usar?

**Respuesta incorrecta seleccionada:**
- Azure Network Watcher próximo salto para la interfaz de red de VM1

**Por qué es incorrecta:** Al ver las rutas efectivas en la interfaz de red de VM1, se muestran todas las rutas que Azure aplica al tráfico saliente, incluidas las definidas por el sistema, el emparejamiento y el usuario, así como el tipo de siguiente salto para el prefijo 10.20.0.0/16. Azure Network Watcher próximo salto es una herramienta de diagnóstico que identifica el próximo salto de enrutamiento (tipo, dirección IP e identificador de tabla de rutas) para el tráfico que sale de una máquina virtual. El siguiente salto no muestra las decisiones de enrutamiento. El rol de Controlador de Red en Windows Server es un punto de administración centralizado y programable para Redes Definidas por Software (SDN).

### 58. [exam-online-5](exam-online-5.md)

**Contexto:** Tiene una red virtual Azure que contiene cuatro subredes. Cada subred contiene diez máquinas virtuales. Tiene previsto configurar un grupo de seguridad de red (NSG) que permitirá el tráfico entrante a través del puerto TCP 8080 a dos máquinas virtuales en cada subred. El NSG se asociará a cada subred. Debe recomendar una solución para configurar el acceso entrante mediante el menor número de reglas de NSG posibles. ¿Qué debe usar como destino en el grupo de seguridad de red?

**Respuesta incorrecta seleccionada:**
- las subredes de las máquinas virtuales

**Por qué es incorrecta:** Los grupos de seguridad de aplicaciones permiten agrupar las interfaces de red de varias máquinas virtuales y, a continuación, usar el grupo como origen o destino en una regla de NSG. Las interfaces de red deben estar en la misma red virtual. Puede usar la dirección IP de cada máquina virtual como destino, pero debe crear una regla para cada máquina virtual. El uso de las subredes requerirá cuatro reglas y también permitirá el tráfico a todas las máquinas virtuales de esas subredes.

### 59. [exam-online-5](exam-online-5.md)

**Contexto:** Tiene tres grupos de seguridad de red (NSG) denominados NSG1, NSG2 y NSG3. El puerto 80 está bloqueado en NSG3 y se permite en NSG1 y NSG2. Tiene cuatro Azure máquinas virtuales que tienen las siguientes configuraciones: VM1: - Subred: Subnet1 - Tarjeta de red: NIC1 - NIC1 está asociado a NSG2. VM2: - Subred: Subnet1 - Tarjeta de red: NIC2 - NIC2 está asociado a NSG3. VM3: - Subred: Subnet3 - Tarjeta de red: NIC3 - NIC3 está asociado a NSG3. VM4: - Subred: Subnet2 Tiene las siguientes subredes: - Subnet1 está asociado a NSG1. - Subnet2 está asociado a NSG3. - La subred 3 no tiene asignado un NSG. ¿A qué máquina virtual se puede acceder a través de Internet en el puerto 80?

**Respuesta incorrecta seleccionada:**
- VM4

**Por qué es incorrecta:** En VM1, ambos grupos de seguridad de red asignados a Subnet1 y la tarjeta NIC1 permiten el tráfico en el puerto 80. En VM2, NSG1 permite el tráfico, pero NSG3 bloquea el tráfico para la interfaz de red. En VM3 y VM4, NSG3 bloquea el tráfico.

### 60. [exam-online-5](exam-online-5.md)

**Contexto:** Tiene una suscripción de Azure que contiene 20 redes virtuales y 500 máquinas virtuales. Debe implementar una nueva máquina virtual denominada VM501. Detecta que VM501 no puede comunicarse con una máquina virtual denominada VM20 en la suscripción. Sospecha que un grupo de seguridad de red (NSG) es la causa del problema. Debe identificar si un grupo de seguridad de red (NSG) está bloqueando las comunicaciones. La solución debe minimizar el esfuerzo administrativo. ¿Qué debe usar?

**Respuesta incorrecta seleccionada:**
- captura de paquetes

**Por qué es incorrecta:** La comprobación de flujo de IP permite especificar una dirección IPv4 de origen y destino, el puerto, el protocolo (TCP o UDP) y la dirección de tráfico (entrante y saliente). La comprobación del flujo de IP puede identificar el grupo de seguridad de red (NSG) específico que impide la comunicación. Los logs de flujo de NSG son una característica de Azure Network Watcher que registra información del tráfico IP que fluye a través de un NSG. Aunque los registros pueden ayudarle a identificar el origen del problema, requiere mucho más configuración y evaluación manual. La captura de paquetes permite crear sesiones de captura de paquetes para realizar el seguimiento del tráfico hacia y desde una máquina virtual. La captura de paquetes puede ayudar a reducir el ámbito del problema, pero no identificará el grupo de seguridad de red específico que impide la comunicación.

### 61. [exam-online-6](exam-online-6.md)

**Contexto:** Tiene una suscripción Azure que contiene 10 máquinas virtuales. Debe asegurarse de que un usuario denominado User1 puede etiquetar todas las máquinas virtuales mediante el portal de Azure. La solución debe seguir el principio de privilegios mínimos. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- En el portal de Azure, modifique la configuración directivas de la suscripción de Azure.

**Por qué es incorrecta:** La solución correcta consiste en actualizar la configuración de control de acceso (IAM) de las máquinas virtuales en el portal de Azure y asignar a User1 un rol que conceda derechos de etiquetado, como el rol integrado Colaborador de etiquetas. Esto sigue el principio de privilegios mínimos porque concede a User1 solo los permisos necesarios para aplicar y administrar etiquetas, sin conceder derechos administrativos o de escritura completos. La creación de un rol personalizado con permisos completos para virtualMachines//write es innecesaria y demasiado amplia, la modificación de directivas solo impone reglas de etiquetado en lugar de conceder permisos, y el uso del comando az role assignment create es otra forma de asignar roles, pero no especifica los roles con privilegios mínimos o el método basado en el portal solicitado en el escenario. Aplicar etiquetas con el portal de Azure   Entender la Automatización de Azure   Aplicar etiquetas con CLI de Azure   Aplicar etiquetas con Azure PowerShell   Etiqueta las cargas de trabajo críticas   Uso del etiquetado para organizar los recursos

### 62. [exam-online-6](exam-online-6.md)

**Contexto:** Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1. Debe proporcionar acceso a almacenamiento1 a una organización asociada. El acceso a Storage1 debe expirar automáticamente después de 24 horas. ¿Qué debe configurar?

**Respuesta incorrecta seleccionada:**
- administración del ciclo de vida

**Por qué es incorrecta:** Una SAS proporciona acceso delegado a los recursos de la cuenta de almacenamiento. Con una SAS, tiene control granular sobre la forma en que un cliente puede tener acceso a los datos, incluidas las restricciones de tiempo. Las claves de acceso y Azure CDN proporcionan acceso permanente a los recursos. Requerirán pasos manuales para quitar el acceso. No es necesaria la administración del ciclo de vida.

### 63. [exam-online-6](exam-online-6.md)

**Contexto:** Tiene una suscripción Azure que contiene una red virtual denominada VNet1. Tiene previsto implementar una máquina virtual denominada VM1 que se usará como dispositivo de inspección de red. Asegúrese de que todo el tráfico de red pase a través de VM1. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Cree una puerta de enlace de red virtual.

**Por qué es incorrecta:** Azure crea automáticamente una tabla de rutas para cada subred de una red virtual Azure y agrega rutas predeterminadas del sistema a la tabla. Puede invalidar algunas de las rutas del sistema de Azure con rutas personalizadas definidas por el usuario y agregar más rutas personalizadas a las tablas de rutas. Azure enruta el tráfico saliente desde una subred en función de las rutas de la tabla de rutas de una subred.

### 64. [exam-online-6](exam-online-6.md)

**Contexto:** Su organización usa un Azure Load Balancer para administrar el tráfico de las máquinas virtuales que hospedan una aplicación web. Los usuarios experimentan una distribución de tráfico desigual, con algunas máquinas virtuales que reciben más tráfico que otros. Debe configurar el equilibrador de carga para garantizar la distribución del tráfico uniforme en todas las máquinas virtuales del grupo de back-end. ¿Qué tiene que hacer?

**Respuesta incorrecta seleccionada:**
- Ajuste la configuración de la regla de equilibrio de carga.

**Por qué es incorrecta:** Deshabilitar la persistencia de sesión garantiza incluso la distribución del tráfico quitando cualquier afinidad que dirija el tráfico a la misma máquina virtual. Ajustar la configuración de la regla de equilibrio de carga podría parecer una solución, pero no aborda la causa principal de la distribución desigual. La habilitación de la afinidad de IP de origen mantiene la persistencia de la sesión, lo que podría exacerbar la distribución desigual del tráfico. Agregar más máquinas virtuales no resuelve el problema de distribución causado por la configuración de persistencia de sesión.

### 65. [exam-online-7](exam-online-7.md)

**Contexto:** Tiene una máquina virtual Azure que hospeda una aplicación de terceros denominada App1. Los usuarios informan de que experimentan problemas de rendimiento cuando usan la aplicación. Debe encontrar la causa principal del problema de rendimiento. ¿Qué debe usar?

**Respuesta incorrecta seleccionada:**
- costo de Azure

**Por qué es incorrecta:** Azure Monitor almacena métricas en una base de datos de serie temporal optimizada para analizar datos con marca de tiempo. Los registros de actividad detectan y solucionan problemas de manera proactiva antes de que los usuarios los perciban. Azure Advisor analiza las métricas de configuración y uso, pero no proporciona datos temporales. Azure Cost solo ayuda a optimizar y reducir el gasto general en Azure.

### 66. [exam-online-7](exam-online-7.md)

**Contexto:** Una institución financiera está implementando Azure para mejorar su infraestructura. Deben mantener controles de acceso estrictos debido a los requisitos normativos.   Debe asegurarse de que el equipo financiero pueda ver los costos y administrar los presupuestos de Azure servicios sin la capacidad de modificar los recursos.   ¿Qué rol debe asignar al equipo financiero en el nivel de suscripción?

**Respuesta incorrecta seleccionada:**
- Colaborador

**Por qué es incorrecta:** Puede usar bloqueos de eliminación para bloquear la eliminación de máquinas virtuales, suscripciones y grupos de recursos. No se pueden usar bloqueos de eliminación en grupos de administración o datos de la cuenta de almacenamiento.

### 67. [exam-online-8](exam-online-8.md)

**Contexto:** Tiene una suscripción Azure que contiene una zona Azure DNS denominada contoso.com. Agregue un nuevo subdominio denominado test.contoso.com. Tiene previsto delegar test.contoso.com a un servidor DNS diferente. ¿Cómo debe configurar la delegación del dominio?

**Respuesta incorrecta seleccionada:**
- Agregue un registro SOA para test.contoso.com.

**Por qué es incorrecta:** Debe crear un conjunto de registros NS DNS denominado test en la zona contoso.com. Se debe crear una zona NS en el vértice de la zona denominada contoso.com. No es necesario crear el conjunto de registros SOA en test.contoso.com. Solo se debe crear en contoso.com. No es necesario crear ni modificar el registro A de DNS.

### 68. [exam-online-8](exam-online-8.md)

**Contexto:** Tiene un plan de Azure App Service básico que contiene una aplicación web. Debe asegurarse de que la aplicación web se puede escalar automáticamente cuando el uso de la CPU es superior a 80% durante un período de 15 minutos. ¿Qué dos acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- Ampliar horizontalmente el plan de App Service.

**Por qué es incorrecta:** El plan de App Service básico no admite el escalado automático: debe actualizar el plan a la versión Premium (o superior) para admitir el escalado automático. Después de eso, debe configurar una condición de escalado basada en una métrica (CPU), que activará automáticamente la expansión horizontal de la aplicación web del servicio de aplicaciones.

### 69. [exam-online-8](exam-online-8.md)

**Contexto:** La red contiene un dominio local de Active Directory Services (AD DS) denominado contoso.com. El dominio contiene un servidor denominado Server1 que ejecuta Windows Server. El dominio se sincroniza con un inquilino de Microsoft Entra denominado contoso.com. Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1. La suscripción está vinculada a contoso.com. Tiene previsto usar Server1 para acceder a un recurso compartido de archivos en storage1. ¿Qué debe hacer primero?

**Respuesta incorrecta seleccionada:**
- En storage1, habilite una firma de acceso compartido (SAS).

**Por qué es incorrecta:** Una SAS autoriza mediante un token y no integra las identidades de AD DS/Microsoft Entra. Por eso no permite que Server1 se autentique en Azure Files con credenciales de dominio; el acceso basado en identidades debe habilitarse primero.

### 70. [exam-online-8](exam-online-8.md)

**Contexto:** Tiene dos cuentas de blob en bloques premium Azure Storage llamadas storage1 y storage2. Debe configurar la replicación de objetos de storage1 a storage2. ¿Qué tres características se deben habilitar antes de configurar la replicación de objetos? Cada respuesta correcta presenta parte de la solución.

**Respuesta incorrecta seleccionada:**
- fuente de cambios para storage2

**Por qué es incorrecta:** La replicación de objetos se puede usar para replicar blobs entre cuentas de almacenamiento. Antes de configurar la replicación de objetos, debe habilitar el versionado de blobs para ambas cuentas de almacenamiento, así como el feed de cambios para la cuenta de origen.

