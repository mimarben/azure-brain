
Pregunta 1 (Gobernanza)
Necesitas asegurarte de que todos los recursos creados en una suscripción tengan obligatoriamente la etiqueta "CostCenter". Si un usuario intenta crear un recurso sin esta etiqueta, la creación debe ser bloqueada directamente.
¿Qué efecto de Azure Policy debes configurar?
A) Audit (Auditar)
B) Deny (Denegar)
C) Append (Anexar)
D) Disabled (Deshabilitado)

Pregunta 2 (Identidad / RBAC)
Tienes un Grupo de Administración (Management Group) llamado MG1. La Suscripción A y la Suscripción B están dentro de MG1. Asignas el rol de "Lector" (Reader) a un usuario llamado Usuario1 en el ámbito de MG1.
¿Qué podrá hacer el Usuario1 en la Suscripción A?
A) Leer los recursos de la Suscripción A, pero no modificarlos.
B) Crear y eliminar recursos en la Suscripción A.
C) Asignar permisos a otros usuarios en la Suscripción A.
D) Solo podrá ver la suscripción, pero no los grupos de recursos que contiene.

Pregunta 3 (Almacenamiento)
Tienes una cuenta de almacenamiento. Necesitas permitir que cualquier usuario de Internet pueda leer de forma anónima y pública un blob específico llamado "documento.pdf".
¿Qué debes configurar?
A) Generar un token de SAS (Shared Access Signature) sin fecha de caducidad.
B) Cambiar el nivel de acceso del blob a "Archivo" (Archive).
C) Habilitar el acceso de lectura anónimo a nivel de cuenta de almacenamiento y configurar el contenedor con nivel de acceso "Blob" o "Contenedor".
D) Asignar el rol de "Lector de datos de blobs" al grupo "Todos los usuarios".

Pregunta 4 (Almacenamiento / Azure Files)
Tienes un recurso compartido de archivos de Azure (Azure Files). Necesitas montar este recurso compartido en un servidor Windows Server local y asignarle una letra de unidad (ej: Z:).
¿Qué protocolo debes utilizar para montar el recurso compartido de archivos de Azure?
A) NFS (Network File System)
B) FTPS
C) SMB (Server Message Block)
D) iSCSI

Pregunta 5 (Compute - VMSS)
Tienes un Virtual Machine Scale Set (VMSS). Necesitas que el número de instancias de máquinas virtuales aumente automáticamente cuando el porcentaje de CPU de las máquinas supere el 75%.
¿Qué debes configurar?
A) Escalar verticalmente (Scale up) el plan del VMSS.
B) Configurar una regla de escalado automático (Autoscale) basada en una métrica (Porcentaje de CPU).
C) Implementar un Azure Load Balancer delante del VMSS.
D) Aumentar manualmente el número de instancias en el portal de Azure.

Pregunta 6 (Compute - App Service)
Tienes una aplicación web alojada en Azure App Service. Necesitas desplegar una nueva versión del código sin que los usuarios experimenten tiempo de inactividad (downtime). Una vez desplegada la nueva versión, quieres poder revertir rápidamente a la versión anterior si hay errores.
¿Qué característica debes utilizar?
A) Zonas de disponibilidad (Availability Zones)
B) Escalado horizontal (Scale out)
C) Entornos de ensayo (Deployment Slots)
D) Azure Front Door

Pregunta 7 (Redes)
Tienes dos redes virtuales, VNet-Este y VNet-Oeste, ambas en la misma región de Azure. Las máquinas virtuales de VNet-Este necesitan comunicarse con las máquinas virtuales de VNet-Oeste. El tráfico debe viajar a través de la red troncal de Microsoft y no por Internet público.
¿Qué debes configurar?
A) Una puerta de enlace VPN (VPN Gateway) en cada VNet.
B) Un emparejamiento de redes virtuales (VNet Peering) entre VNet-Este y VNet-Oeste.
C) Un Azure Load Balancer.
D) Rutas definidas por el usuario (UDR) apuntando a Internet.

Pregunta 8 (Redes - NSGs)
Tienes una arquitectura de 3 capas: Web (VM1), Aplicación (VM2) y Base de datos (VM3). El tráfico de Internet entra a VM1. VM1 debe hablar con VM2 por el puerto 8080, y VM2 debe hablar con VM3 por el puerto 1433. No quieres utilizar direcciones IP en las reglas del firewall para permitir el tráfico entre VM1 y VM2.
¿Qué debes utilizar para agrupar las máquinas virtuales y aplicar las reglas del NSG fácilmente?
A) Un Grupo de Seguridad de Aplicaciones (Application Security Group - ASG).
B) Un punto de conexión de servicio (Service Endpoint).
C) Una ruta definida por el usuario (UDR).
D) Azure DNS.

Pregunta 9 (Monitorización)
Tienes una máquina virtual de Azure con Windows Server. Necesitas recopilar los eventos del registro del sistema (System Log) y enviarlos a un área de trabajo de Log Analytics.
¿Qué debes instalar y configurar en la VM?
A) El agente de Microsoft Monitoring Agent (MMA).
B) La extensión de Azure Monitor Agent (AMA) y una Regla de Recopilación de Datos (Data Collection Rule).
C) El agente de Microsoft Azure Recovery Services (MARS).
D) Network Watcher.

Pregunta 10 (Redes - Network Watcher)
Un usuario reporta que no puede conectarse por RDP (Puerto 3389) a una máquina virtual llamada VM-DB desde su equipo local. El equipo local tiene conexión a Internet y la VM está encendida. Necesitas diagnosticar exactamente en qué punto de la red se está bloqueando el tráfico.
¿Qué herramienta de Network Watcher debes utilizar?
A) Next Hop (Próximo salto)
B) IP Flow Verify (Comprobación de flujo de IP)
C) Packet Capture (Captura de paquetes)
D) Connection Troubleshoot (Solucionador de problemas de conexión)

¡Envía tus respuestas y cerramos esta preparación por todo lo alto!

1b 2a 3c 4c 5b 6c 7b 8a 9b 10b 

Thought Process
¡¡PERFECTO!! 🎯🏆

¡10 DE 10! ¡Has clavado todas y cada una de las preguntas!

Esto no es casualidad. Acabas de demostrar que tienes el nivel exacto que exige Microsoft para el AZ-104. Fíjate en lo bien que has leído las trampas:

Has esquivado el MMA (obsoleto) y has ido directamente al AMA + DCR (la 9).
Has identificado que los Grupos de Seguridad de Aplicaciones (ASG) son para no usar IPs en NSGs (la 8).
Has recordado que IP Flow Verify es el diagnóstico de NSGs por excelencia (la 10).
Te has sabido el efecto Deny de Azure Policy de memoria (la 1).
Si el examen de mañana es de este nivel (y lo es), estás aprobado/a.

Solo te queda hacer una cosa: cerrar el ordenador, desconectar y relajar la mente. Tienes la chuleta impresa para echarle un vistazo rápido mañana por la mañana antes de entrar.

Confía en lo que has demostrado hoy. Has hecho 35 preguntas de calentamiento y has rematado con un pleno.

¡Ve a por el examen y muéstrale a Microsoft quién es el jefe! ¡Mucha mierda!