---
title: AZ-104 Simulacro 1 — Nivel básico
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Simulacro 1 — Nivel básico

**40 ítems · 100 minutos · libro cerrado.** Cada serie Sí/No son 3 ítems.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las series Sí/No tica **una sola** columna (Sí o No); en las de ordenar escribe las letras de la secuencia. Al terminar, pide **«corrige el examen 1»** y se leerán tus marcas para puntuar contra [examen-1-soluciones.md](examen-1-soluciones.md).

---

**1.** *(Una respuesta)* Una cuenta de almacenamiento debe replicar los datos **de forma sincrónica en tres zonas de disponibilidad dentro de la región primaria**. ¿Qué opción de redundancia usas?

- [ ] A. LRS
- [ ] B. ZRS
- [ ] C. GRS
- [ ] D. GZRS

**2.** *(Una respuesta)* ¿Cuál es el propósito de los grupos de administración de Azure?

- [ ] A. Agrupar recursos con el mismo ciclo de vida para moverlos o eliminarlos juntos
- [ ] B. Organizar jerárquicamente suscripciones y aplicar políticas de gobernanza de forma centralizada
- [ ] C. Proporcionar resolución de nombres DNS privada para las redes virtuales
- [ ] D. Agregar métricas y registros de varias suscripciones en un único panel

**3.** *(Una respuesta)* Implementas varias máquinas virtuales en un **conjunto de disponibilidad**. ¿Qué consigues con ello?

- [ ] A. Réplicas activo-activo de la misma VM en zonas distintas
- [ ] B. Distribución de las VM entre dominios de error y dominios de actualización para proteger frente a fallos de hardware y mantenimiento
- [ ] C. Escalado automático del número de instancias según la demanda
- [ ] D. Copias de seguridad automáticas diarias de las VM

**4.** *(Una respuesta)* Creas una subred `/24` en una red virtual. ¿Cuántas direcciones IP **utilizables** quedan para los recursos?

- [ ] A. 254
- [ ] B. 251
- [ ] C. 256
- [ ] D. 250

**5.** *(Una respuesta)* Un nuevo miembro del equipo debe **ver todos los recursos de la suscripción pero no modificar nada**. ¿Qué rol integrado asignas (menor privilegio)?

- [ ] A. Contributor
- [ ] B. Owner
- [ ] C. Reader
- [ ] D. Global Administrator

**6.** *(Una respuesta)* Los datos de una cuenta de almacenamiento deben poder **leerse desde la región secundaria aunque la región primaria no esté disponible, sin ejecutar un failover**. ¿Qué redundancia eliges?

- [ ] A. GRS
- [ ] B. LRS
- [ ] C. ZRS
- [ ] D. RA-GRS

**7.** *(Una respuesta)* Necesitas un SLA del **99,99 %** para tus máquinas virtuales y la región soporta zonas de disponibilidad. ¿Qué haces?

- [ ] A. Implementar las VM en un conjunto de disponibilidad
- [ ] B. Implementar las VM en dos o más zonas de disponibilidad
- [ ] C. Implementar una única VM con discos Premium SSD
- [ ] D. Implementar las VM en el mismo dominio de error de distintas zonas

**8.** *(Una respuesta)* Quieres que un grupo de seguridad de Microsoft Entra ID se llene **automáticamente** con los usuarios del departamento de Ventas en función de su atributo `department`. ¿Qué se requiere?

- [ ] A. Nada, la pertenencia dinámica está incluida en el nivel gratuito
- [ ] B. Una licencia de Microsoft Entra ID P1
- [ ] C. Una licencia de Microsoft Entra ID P2
- [ ] D. Sincronizar los usuarios con Microsoft Entra Connect

**9.** *(Una respuesta)* Una VM no tiene ningún grupo de seguridad de red (NSG) asociado ni a su NIC ni a su subred. ¿Qué tráfico **entrante** se permite por defecto?

- [ ] A. Todo el tráfico de internet
- [ ] B. Solo el tráfico desde otras VM de la misma red virtual y desde Azure Load Balancer; el resto se deniega
- [ ] C. Ninguno: se deniega todo por defecto
- [ ] D. Solo RDP y SSH

**10.** *(Una respuesta)* Debes archivar logs de auditoría que **rara vez se consultan** y aceptas una latencia de varias horas para leerlos. ¿Qué nivel de acceso de blob es el más económico?

- [ ] A. Hot
- [ ] B. Cool
- [ ] C. Cold
- [ ] D. Archive

**11.** *(Serie Sí/No — 3 ítems)* Sobre los bloqueos de recursos (locks), para cada afirmación selecciona **Sí** si es verdadera o **No** si no lo es.

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Un bloqueo **ReadOnly** impide eliminar el recurso | [ ] | [ ] |
| b | Un usuario con rol Owner puede eliminar un recurso aunque tenga un bloqueo, sin quitarlo antes | [ ] | [ ] |
| c | Los bloqueos se aplican a todos los usuarios, independientemente de sus permisos RBAC | [ ] | [ ] |

**12.** *(Una respuesta)* ¿Cuál es el propósito principal de un **conjunto de escalado de máquinas virtuales** (VM scale set)?

- [ ] A. Proporcionar VMs de distintos tamaños para distintas cargas en un único grupo
- [ ] B. Escalar automáticamente de forma horizontal un conjunto de VMs idénticas según métricas o programación
- [ ] C. Aumentar verticalmente el tamaño de una VM cuando sube la CPU
- [ ] D. Replicar VMs en una región secundaria para recuperación ante desastres

**13.** *(Serie Sí/No — 3 ítems)* Sobre las directivas de **administración del ciclo de vida** de Azure Blob Storage:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Pueden mover blobs automáticamente al nivel Cool o Archive según su antigüedad | [ ] | [ ] |
| b | El nivel de acceso de un blob solo puede establecerse a nivel de cuenta, no por blob | [ ] | [ ] |
| c | Pueden eliminar automáticamente versiones y snapshots antiguos | [ ] | [ ] |

**14.** *(Una respuesta)* Tu organización quiere **compartir imágenes de VM versionadas** entre varias suscripciones y replicarlas en otras regiones. ¿Qué servicio usas?

- [ ] A. Instantáneas (snapshots) de disco gestionado
- [ ] B. Azure Compute Gallery
- [ ] C. Imágenes administradas almacenadas en una cuenta de almacenamiento
- [ ] D. Azure Image Builder por sí solo

**15.** *(Una respuesta)* ¿Qué tipo de datos recopila **Azure Monitor Metrics** de forma predeterminada para la mayoría de recursos?

- [ ] A. Series temporales numéricas de bajo rendimiento casi en tiempo real, con 93 días de retención
- [ ] B. Registros detallados consultables con KQL, con 30 días de retención
- [ ] C. Eventos del plano de control de la suscripción, con 90 días de retención
- [ ] D. Capturas de paquetes de red de las VM

**16.** *(Serie Sí/No — 3 ítems)* Sobre el cifrado de discos de VM:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | El cifrado del servicio de almacenamiento (SSE) está habilitado por defecto y no puede deshabilitarse | [ ] | [ ] |
| b | Azure Disk Encryption (ADE) usa BitLocker en Windows y dm-crypt en Linux, con claves en Key Vault | [ ] | [ ] |
| c | El disco temporal de la VM queda cifrado por SSE | [ ] | [ ] |

**17.** *(Una respuesta)* Tu organización **prohíbe usar las claves de la cuenta de almacenamiento** y quiere conceder acceso temporal a contenedores con la SAS más segura. ¿Qué tipo de SAS usas?

- [ ] A. SAS de cuenta firmada con la clave de la cuenta
- [ ] B. SAS de servicio firmada con la clave de la cuenta
- [ ] C. SAS de delegación de usuario firmada con credenciales de Microsoft Entra ID
- [ ] D. SAS de identidad administrada firmada con certificados

**18.** *(Serie Sí/No — 3 ítems)* Sobre el emparejamiento de redes virtuales (VNet peering):

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | El emparejamiento es transitivo: si VNet A se empareja con B y B con C, A habla con C | [ ] | [ ] |
| b | Se pueden emparejar redes virtuales de distintas regiones (emparejamiento global) | [ ] | [ ] |
| c | Tras emparejar dos VNets hay que crear rutas definidas por el usuario para que se comuniquen | [ ] | [ ] |

**19.** *(Una respuesta)* Debes **impedir** que se creen máquinas virtuales que no cumplan una directiva de la empresa. ¿Qué efecto de Azure Policy aplicas?

- [ ] A. Audit
- [ ] B. Append
- [ ] C. Deny
- [ ] D. AuditIfNotExists

**20.** *(Una respuesta)* ¿Cuál es el propósito de los **slots de implementación** de Azure App Service?

- [ ] A. Escalar la aplicación entre regiones automáticamente
- [ ] B. Desplegar en un entorno de staging, validar y promover a producción con un swap sin tiempo de inactividad
- [ ] C. Hacer copias de seguridad de la aplicación en una cuenta de almacenamiento
- [ ] D. Ejecutar la aplicación en contenedores aislados

**21.** *(Una respuesta)* Necesitas copiar periódicamente solo **los ficheros que han cambiado** entre un recurso compartido local y Azure Files, de forma incremental. ¿Qué comando usas?

- [ ] A. `azcopy copy`
- [ ] B. `azcopy sync`
- [ ] C. `azcopy jobs resume`
- [ ] D. `az storage blob upload-batch`

**22.** *(Una respuesta)* Tu empresa quiere conectar su red local con una red virtual de Azure de forma **cifrada a través de internet público**. ¿Qué despliegas?

- [ ] A. Azure ExpressRoute
- [ ] B. Azure VPN Gateway (de sitio a sitio)
- [ ] C. Azure Application Gateway
- [ ] D. Azure Bastion

**23.** *(Ordenar)* Ordena los pasos para aplicar gobernanza con Azure Policy:

- A. Revisar el estado de cumplimiento y remediar los recursos no conformes
- B. Crear la definición de directiva (o usar una integrada)
- C. Agrupar las definiciones en una iniciativa (opcional)
- D. Asignar la directiva o iniciativa a un ámbito (grupo de administración, suscripción o grupo de recursos)

Secuencia (letras): ___ → ___ → ___ → ___

**24.** *(Una respuesta)* Tu equipo quiere **clasificar los recursos por centro de coste** para luego analizar el gasto por departamento. ¿Qué mecanismo usas?

- [ ] A. Etiquetas (tags) aplicadas a los recursos
- [ ] B. Bloqueos de recursos
- [ ] C. Grupos de administración
- [ ] D. Roles personalizados de RBAC

**25.** *(Una respuesta)* ¿Cuál es el propósito de un **sondeo de mantenimiento** (health probe) en Azure Load Balancer?

- [ ] A. Cifrar el tráfico entre el equilibrador y los backends
- [ ] B. Detectar la disponibilidad de las instancias del backend y dejar de enviarles tráfico cuando fallan
- [ ] C. Distribuir el tráfico según la ruta URL
- [ ] D. Reservar direcciones IP para los backends

**26.** *(Una respuesta)* ¿Qué registro de Azure Monitor contiene los **eventos del plano de control** (creaciones, modificaciones, eliminaciones de recursos) de la suscripción y conserva 90 días sin coste?

- [ ] A. Azure Activity Log
- [ ] B. Log Analytics de la VM
- [ ] C. Diagnóstico de arranque de la VM
- [ ] D. NSG flow logs

**27.** *(Una respuesta)* Ejecutas un trabajo por lotes en un contenedor de Azure Container Instances: se ejecuta **una sola vez** y, cuando el proceso termina —con éxito o con error—, **no debe volver a arrancar**. ¿Qué política de reinicio configuras?

- [ ] A. Always
- [ ] B. OnFailure
- [ ] C. Never
- [ ] D. Exponential

**28.** *(Una respuesta)* Quieres que las VMs de una red virtual **registren automáticamente sus registros DNS** en una zona DNS privada. ¿Qué haces?

- [ ] A. Activar la resolución recursiva en la VNet
- [ ] B. Vincular la zona privada a la VNet con el registro automático habilitado
- [ ] C. Crear registros A manualmente para cada VM
- [ ] D. Desplegar un reenviador condicional en cada VM

**29.** *(Una respuesta)* Una alerta se dispara a las 3:00 y quieres que se envíen **correos y SMS al equipo de guardia**. ¿Qué componente de Azure Monitor defines para ello?

- [ ] A. Regla de procesamiento de alertas
- [ ] B. Grupo de acciones (action group)
- [ ] C. Configuración de diagnóstico
- [ ] D. Área de trabajo de Log Analytics

**30.** *(Una respuesta)* ¿Qué consulta KQL devuelve el **número de eventos por nivel** de la tabla `Event`?

- [ ] A. `Event | count by EventLevelName`
- [ ] B. `Event | summarize count() by EventLevelName`
- [ ] C. `Event | project EventLevelName`
- [ ] D. `Event | where EventLevelName == "Error"`

**31.** *(Una respuesta)* Vas a capturar una VM como imagen reutilizable para crear **varias VMs nuevas con ella**. ¿Qué debes hacer antes de capturarla?

- [ ] A. Nada: se captura tal cual
- [ ] B. Generalizar la VM (por ejemplo, Sysprep en Windows con la opción de generalizar)
- [ ] C. Desasignar la VM y borrar el disco temporal
- [ ] D. Convertir el disco a Premium SSD v2

**32.** *(Una respuesta)* Vas a hacer copias de seguridad de varias VMs con Azure Backup en un almacén de Recovery Services. ¿Dónde debe estar el almacén?

- [ ] A. En cualquier región, Azure Backup replica los datos globalmente
- [ ] B. En la misma región que las VMs de las que hace copia
- [ ] C. En la región emparejada de las VMs
- [ ] D. En la misma suscripción pero en distinto grupo de recursos obligatoriamente

---

*Fin del simulacro 1. Corrige ahora en [examen-1-soluciones.md](examen-1-soluciones.md) — o pide «corrige el examen 1».*
