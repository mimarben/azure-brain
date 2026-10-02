---
title: AZ-104 Simulacro 3 — Nivel avanzado
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Simulacro 3 — Nivel avanzado

**40 ítems · 100 minutos · libro cerrado.** Incluye exhibits y un **caso práctico** (preguntas 31–36): léelo entero antes de responder sus preguntas; puedes volver a él cuantas veces quieras. Cada serie Sí/No son 3 ítems.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos/tres" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna; en las de ordenar escribe las letras. Al terminar, pide **«corrige el examen 3»** y se leerán tus marcas contra [examen-3-soluciones.md](examen-3-soluciones.md).

---

**1.** *(Una respuesta)* Un auditor pregunta quién puede crear **asignaciones de denegación (deny assignments)** en Azure. ¿Cuál es la respuesta correcta?

- [ ] A. Cualquier usuario con rol Owner en la suscripción
- [ ] B. Solo Azure las crea (por ejemplo, con Azure Blueprints o aplicaciones administradas); los usuarios no pueden crearlas directamente
- [ ] C. Cualquier usuario con un rol personalizado que incluya `Microsoft.Authorization/denyAssignments/write`
- [ ] D. Solo el soporte técnico de Microsoft, a petición

**2.** *(Una respuesta — exhibit)* Analiza esta SAS de una cuenta de almacenamiento:

```text
https://stluz01.blob.core.windows.net/documentos?sv=2024-05-04&ss=b&srt=c&sp=rwl&se=2026-10-02T20:00:00Z&sig=abc123...
```

¿Qué concede exactamente?

- [ ] A. Leer, escribir y listar blobs del **servicio Blob** a nivel de **contenedor**, hasta las 20:00 UTC
- [ ] B. Leer, escribir y listar en todos los servicios (blob, file, queue, table) de la cuenta, hasta las 20:00 UTC
- [ ] C. Solo lectura sobre el blob `documentos`, sin límite temporal
- [ ] D. Acceso completo de propietario a la cuenta de almacenamiento, incluida la gestión de claves

**3.** *(Una respuesta — exhibit)* Tu conjunto de escalado uniforme tiene esta directiva:

```json
"upgradePolicy": {
  "mode": "Rolling",
  "rollingUpgradePolicy": {
    "maxBatchInstancePercent": 20,
    "pauseTimeBetweenBatches": "PT1M",
    "maxUnhealthyInstancePercent": 20
  }
}
```

Al publicar un nuevo modelo de VM, ¿qué ocurre?

- [ ] A. Todas las instancias se actualizan a la vez y la app deja de responder durante el proceso
- [ ] B. Las instancias se actualizan en lotes del 20 % con pausas de un minuto; si supera el 20 % de instancias no saludables, la actualización se aborta
- [ ] C. Las instancias no se actualizan hasta que las reinicies manualmente una a una
- [ ] D. Se crea un segundo conjunto de escalado y el tráfico se migra con un swap

**4.** *(Serie Sí/No — 3 ítems)* Sobre Azure Policy:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Una directiva DeployIfNotExists corrige automáticamente los recursos existentes no conformes en cuanto se asigna, sin tarea de remediación | [ ] | [ ] |
| b | Las exenciones de directiva (exemptions) pueden configurarse con fecha de expiración | [ ] | [ ] |
| c | Una iniciativa puede asignarse a un grupo de administración | [ ] | [ ] |

**5.** *(Una respuesta)* Añades a la tabla de rutas de una subred una UDR `0.0.0.0/0` con tipo de próximo salto **None**. ¿Qué efecto tiene en las VMs de esa subred?

- [ ] A. Ninguno: es el comportamiento por defecto de la ruta de sistema
- [ ] B. El tráfico saliente a internet se descarta (las VMs pierden acceso a internet)
- [ ] C. El tráfico a internet se envía al equilibrador de carga
- [ ] D. Solo se bloquea el tráfico hacia redes virtuales emparejadas

**6.** *(Una respuesta)* Una métrica de una app tiene un patrón diario muy variable (picos cada noche). Quieres alertas con **pocos falsos positivos** y sin ajustar umbrales a mano. ¿Qué configuras?

- [ ] A. Una alerta de métrica con umbral estático bajo
- [ ] B. Una alerta de métrica con **umbrales dinámicos**
- [ ] C. Una alerta de registro cada 5 minutos
- [ ] D. Una alerta del registro de actividad

**7.** *(Una respuesta)* Ejecutas un **failover de cuenta** en una cuenta GRS porque la región primaria cayó. Tras el failover, ¿cómo queda la redundancia de la cuenta?

- [ ] A. GRS en la nueva región primaria, sin acción adicional
- [ ] B. LRS en la nueva región primaria: hay que volver a configurar la geo-redundancia
- [ ] C. RA-GRS automáticamente
- [ ] D. La cuenta queda en modo de solo lectura permanente

**8.** *(Una respuesta)* ¿Qué afirmación sobre **Azure Spot Virtual Machines** es cierta?

- [ ] A. Garantizan capacidad reservada durante un año con descuento
- [ ] B. Pueden ser desalojadas por Azure en cualquier momento con 30 segundos de preaviso
- [ ] C. No soportan discos administrados
- [ ] D. Solo están disponibles en Linux

**9.** *(Una respuesta)* Tu Application Gateway con WAF v2 recibe tráfico malicioso que quieres **bloquear**, dejando registro de lo bloqueado. ¿Qué modo configuras?

- [ ] A. Detection
- [ ] B. Prevention
- [ ] C. Auditoría
- [ ] D. Cuarentena

**10.** *(Una respuesta)* Debes **transmitir en tiempo real** los registros de varios recursos a un SIEM externo. ¿Qué destino de la configuración de diagnóstico usas?

- [ ] A. Cuenta de almacenamiento
- [ ] B. Área de trabajo de Log Analytics
- [ ] C. Centro de eventos (Event Hub)
- [ ] D. Azure Monitor Alerts

**11.** *(Una respuesta)* Sobre roles personalizados de RBAC, ¿cuál afirmación es **cierta**?

- [ ] A. `NotActions` deniega explícitamente permisos incluso si otro rol los concede
- [ ] B. `AssignableScopes` debe incluir el ámbito (grupo de administración o suscripción) donde se va a poder asignar el rol
- [ ] C. Las acciones del plano de datos (`DataActions`) se definen dentro de `Actions`
- [ ] D. Los roles personalizados solo pueden crearse con la CLI, no en el portal

**12.** *(Ordenar)* Ordena el despliegue de Azure File Sync para sincronizar una carpeta de un Windows Server con un share de Azure:

- A. Registrar el servidor Windows en el servicio (agente de File Sync)
- B. Crear el Storage Sync Service
- C. Crear el grupo de sincronización y su cloud endpoint (el share)
- D. Añadir el server endpoint (la carpeta del servidor) al grupo de sincronización
- E. Configurar la organización en niveles en la nube (cloud tiering) en el server endpoint

Secuencia (letras): ___ → ___ → ___ → ___ → ___

**13.** *(Una respuesta)* Una App Service web app debe llamar a una base de datos que **solo es accesible dentro de una red virtual**. ¿Qué usas para el **tráfico saliente** de la app hacia esa red?

- [ ] A. El acceso público de la base de datos con IP allowlist
- [ ] B. La integración de red virtual regional (VNet integration) con una subred delegada
- [ ] C. Un Application Gateway delante de la app
- [ ] D. Un private endpoint en la web app

**14.** *(Una respuesta)* Despliegas **dos NVAs en activo-pasivo** y quieres que el tráfico les llegue a través de un equilibrador interno. ¿Qué configuración de Load Balancer usas?

- [ ] A. Un Load Balancer interno **estándar** con regla de **HA ports**
- [ ] B. Un Load Balancer básico con regla de puerto 80
- [ ] C. Un Load Balancer público con afinidad de IP de origen
- [ ] D. Un Application Gateway interno con WAF

**15.** *(Una respuesta)* Una app heredada usa la **clave de la cuenta de almacenamiento** en su cadena de conexión. El equipo de seguridad aplica un bloqueo **ReadOnly** a la cuenta "para protegerla". ¿Qué ocurre con la app?

- [ ] A. Nada: la app usa el plano de datos, no el plano de control
- [ ] B. Deja de funcionar: el bloqueo ReadOnly impide listar/obtener las claves de la cuenta
- [ ] C. Sigue funcionando pero más lenta
- [ ] D. Pasa a usar automáticamente la identidad administrada

**16.** *(Una respuesta)* En un server endpoint de Azure File Sync configuras cloud tiering con **volume free space = 20 %**. ¿Qué hace File Sync cuando el espacio libre del volumen cae por debajo?

- [ ] A. Detiene la sincronización hasta liberar espacio manualmente
- [ ] B. Convierte en punteros (reparse points) los archivos menos usados más antiguos hasta recuperar el 20 % de espacio libre; el contenido queda solo en el share de Azure
- [ ] C. Comprime los archivos más antiguos en el servidor
- [ ] D. Recupera (recall) archivos desde Azure al volumen local

**17.** *(Una respuesta)* Haces swap entre staging y producción. La cadena de conexión de staging está marcada como **slot setting**. ¿Dónde queda tras el swap?

- [ ] A. Se intercambia con la de producción: se queda en producción
- [ ] B. Permanece en el slot de staging (los valores sticky no se intercambian)
- [ ] C. Se elimina y hay que recrearla
- [ ] D. Se duplica en ambos slots

**18.** *(Una respuesta)* Los servidores DNS **on-premises** deben resolver nombres de zonas DNS privadas de Azure a través del ExpressRoute. ¿Qué despliegas?

- [ ] A. Un reenviador condicional a `168.63.129.16` desde on-premises directamente
- [ ] B. Un **Azure DNS Private Resolver** con endpoint de entrada, y reenviar on-premises hacia él
- [ ] C. Una zona DNS pública con los mismos nombres
- [ ] D. Nada: las zonas privadas se resuelven automáticamente desde on-premises

**19.** *(Una respuesta)* Una VM Linux crítica no acepta conexiones SSH (el servicio de red está caído) pero el sistema operativo está encendido. Necesitas una consola para investigar **sin depender de la red**. ¿Qué usas?

- [ ] A. La consola serie de Azure (requiere diagnóstico de arranque habilitado)
- [ ] B. Azure Bastion
- [ ] C. El comando `az vm run-command` (que usa SSH)
- [ ] D. Una extensión de script personalizado

**20.** *(Una respuesta)* Un administrador quiere un grupo cuya pertenencia dinámica se calcule **a partir de otros grupos** (miembros = grupos "Ventas-Europa" y "Ventas-América"). ¿Qué le respondes?

- [ ] A. Es posible con reglas de pertenencia avanzadas usando `memberOf`
- [ ] B. No es posible: los grupos dinámicos solo pueden contener usuarios o dispositivos (no grupos)
- [ ] C. Es posible solo con licencia P2
- [ ] D. Es posible si los grupos miembros son de distribución

**21.** *(Serie Sí/No — 3 ítems)* Sobre cómputo en Azure:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Los contenedores de un grupo de Azure Container Instances comparten ciclo de vida y espacio de nombres de red | [ ] | [ ] |
| b | Se puede añadir un contenedor a un grupo de ACI ya en ejecución sin recrear el grupo | [ ] | [ ] |
| c | Los entornos de App Service (ASE) se implementan dentro de tu red virtual | [ ] | [ ] |

**22.** *(Una respuesta)* Vas a habilitar la **restauración a un momento dado (PITR)** de blobs en bloques. ¿Qué funcionalidades deben estar habilitadas?

- [ ] A. Solo la eliminación temporal (soft delete)
- [ ] B. Eliminación temporal, control de cambios (change feed) y versionado de blobs
- [ ] C. Solo el versionado de blobs
- [ ] D. Inmutabilidad WORM y snapshots

**23.** *(Una respuesta)* Un conjunto de VMs tras un Load Balancer **estándar** con solo reglas de equilibrio entrantes necesita **salida a internet** (actualizaciones). ¿Qué configura?

- [ ] A. Nada: el estándar da salida a internet por defecto
- [ ] B. Una regla de salida (outbound rule), SNAT en las reglas de equilibrio o un NAT gateway
- [ ] C. Un Azure Firewall obligatoriamente
- [ ] D. Cambiar a un Load Balancer básico

**24.** *(Una respuesta — elige dos)* Para el **mapa de dependencias** de VM insights necesitas desplegar:

- [ ] A. Azure Monitor Agent
- [ ] B. Dependency Agent
- [ ] C. Agente de Log Analytics heredado (MMA)
- [ ] D. Extensión de diagnóstico de Azure (Diagnostics)

**25.** *(Una respuesta)* Finance quiere que el aviso salte **antes** de que el gasto real supere el presupuesto (con margen de días). ¿Qué opción del presupuesto usas?

- [ ] A. Umbral sobre el **coste previsto (forecasted)**, p. ej. 90 %
- [ ] B. Umbral sobre el coste real al 100 %
- [ ] C. Una alerta de Activity Log por cada implementación
- [ ] D. Azure Advisor semanal

**26.** *(Una respuesta)* Usas claves administradas por el cliente (CMK) para una cuenta de almacenamiento. ¿Qué se recomienda **habilitar en el Key Vault** para evitar que un borrado accidental de la clave deje los datos irrecuperables?

- [ ] A. Solo el firewall del vault
- [ ] B. Eliminación temporal y **protección contra purgas (purge protection)**
- [ ] C. RBAC de Key Vault con deny assignments
- [ ] D. Rotación automática de claves

**27.** *(Una respuesta — exhibit)* ¿Qué despliega este fichero Bicep?

```bicep
targetScope = 'subscription'

resource rgRed 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-red'
  location: 'westeurope'
}
```

- [ ] A. Una máquina virtual llamada rg-red en un grupo de recursos existente
- [ ] B. Un grupo de recursos llamado `rg-red` en West Europe, desplegado a nivel de suscripción
- [ ] C. Un error: los grupos de recursos no se pueden crear con Bicep
- [ ] D. Una suscripción nueva llamada rg-red

**28.** *(Una respuesta)* Necesitas recopilar el **% de CPU y la memoria vistos desde dentro del SO invitado** de varias VMs en Log Analytics. Las configuraciones de diagnóstico solo han traído métricas de plataforma. ¿Qué falta?

- [ ] A. Nada: las métricas de invitado no se pueden enviar a Log Analytics
- [ ] B. Desplegar Azure Monitor Agent (AMA) con una regla de recopilación de datos (DCR)
- [ ] C. Habilitar el diagnóstico de arranque en cada VM
- [ ] D. Subir las VMs a un plan Premium

**29.** *(Una respuesta)* Una VM no puede conectarse a `10.20.1.5:1433` y sospechas de un NSG. ¿Qué herramienta de Network Watcher te dice **si el tráfico está permitido o bloqueado y por qué regla**?

- [ ] A. Captura de paquetes
- [ ] B. Verificación de flujo IP (IP flow verify)
- [ ] C. Topología
- [ ] D. Registro de flujo de NSG

**30.** *(Una respuesta)* Debes cambiar la imagen de un contenedor de un grupo de Azure Container Instances en ejecución. ¿Cómo?

- [ ] A. `az container update --image ...`
- [ ] B. Actualizar el YAML y aplicar un patch en caliente
- [ ] C. Eliminar el grupo y recrearlo con la nueva imagen (los grupos no se pueden modificar en caliente)
- [ ] D. Reiniciar el grupo: al arrancar tira siempre de la última imagen

---

## Caso práctico — Litware, Inc.

*Lee el caso entero antes de responder las preguntas 31–36. Puedes consultarlo durante todo el caso.*

### Fondo

Litware tiene una suscripción de Azure con la siguiente arquitectura:

- **Red:** VNet hub `10.10.0.0/16` con un NVA de firewall, emparejada con los spokes `spoke-web` (10.11.0.0/16) y `spoke-data` (10.12.0.0/16). Conectividad on-premises por ExpressRoute.
- **Cómputo:** un conjunto de escalado `vmss-web` en `spoke-web` (6 instancias Ubuntu, app Node.js en HTTPS 443) y una App Service web app `portal-litware` (plan Standard) usada por el equipo de finanzas.
- **Datos:** cuenta de almacenamiento `stlitware01` con el contenedor `documentos-financieros` (blobs en bloques). Base de datos en `spoke-data` con puerto 1433.
- **Identidad:** 15 contratistas externos con cuentas invitadas (B2B) que colaboran puntualmente.
- **Monitorización:** área de trabajo de Log Analytics `litware-log`.

### Requisitos

- **R1.** Los documentos financieros deben sobrevivir al fallo de una zona en la región primaria y al fallo completo de la región, y no poder borrarse ni modificarse durante **7 años** (normativa de auditoría).
- **R2.** Los contratistas pueden obtener acceso de administrador sobre el grupo de recursos `rg-finanzas` **solo con la aprobación** de su responsable y **como máximo por 8 horas** cada vez.
- **R3.** Únicamente el tier web (`vmss-web`) puede conectarse al puerto 1433 de `spoke-data`. Hoy una regla NSG permite 1433 desde `VirtualNetwork` (toda la VNet).
- **R4.** Las actualizaciones del `vmss-web` deben aplicarse en **lotes pequeños** y **abortarse** si la app deja de responder, sin bajar la disponibilidad del servicio.
- **R5.** El job nocturno de facturación escribe `BILLING-ERROR` en el log de consola de la App Service; el equipo de operaciones quiere que se les avise por correo si aparece.
- **R6.** Toda cuenta de almacenamiento que se cree en la suscripción debe ser geo-redundante.

### Preguntas del caso

**31.** *(R1 — elige dos)* ¿Qué dos configuraciones cumples para los documentos financieros?

- [ ] A. Cambiar la cuenta a **GZRS**
- [ ] B. Cambiar la cuenta a **RA-GRS**
- [ ] C. Directiva de inmutabilidad de **retención limitada por tiempo** (bloqueada) de 7 años sobre el contenedor
- [ ] D. **Retención legal (legal hold)** indefinida
- [ ] E. Cambiar la cuenta a **ZRS**

**32.** *(R2)* ¿Qué solución implementas para los contratistas?

- [ ] A. Asignarles Owner permanente en `rg-finanzas` con recordatorio mensual de quitárselo
- [ ] B. Privileged Identity Management (PIM): asignación **elegible** del rol en `rg-finanzas`, con aprobación y duración máxima de activación de 8 horas
- [ ] C. Cuentas locales en las VMs que expiren a las 8 horas
- [ ] D. Rol Contributor en la suscripción con condición RBAC por hora del día

**33.** *(R3)* ¿Cuál es la forma correcta de limitar el acceso a 1433 solo al tier web?

- [ ] A. Crear un grupo de seguridad de aplicaciones (ASG) `asg-web` con las NIC del VMSS y usarlo como **origen** de la regla de permiso 1433 (denegando el resto)
- [ ] B. Mover la base de datos a otra suscripción
- [ ] C. Crear un Azure Firewall que bloquee 1433 desde cualquier origen
- [ ] D. Usar una regla de puerto de origen basada en la IP pública del VMSS

**34.** *(R4)* ¿Qué configura en el `vmss-web`?

- [ ] A. Directiva de actualización **Rolling** con lotes pequeños, pausas entre lotes y un sondeo de mantenimiento de la app como criterio de fallo
- [ ] B. Directiva **Manual** y reiniciar las instancias en horario de mantenimiento
- [ ] C. Directiva **Automatic** y esperar al mejor momento
- [ ] D. Desplegar un segundo VMSS y mover el tráfico con DNS

**35.** *(R5)* ¿Qué alerta configuras?

- [ ] A. Una alerta de métrica sobre `portal-litware` con umbral 1
- [ ] B. Una **alerta de registro (log alert)** sobre una consulta KQL en `litware-log` que busque `BILLING-ERROR` en los logs de consola de la App Service, con grupo de acciones de correo
- [ ] C. Una alerta de Activity Log por cada reinicio de la app
- [ ] D. Un runbook que haga grep cada noche

**36.** *(R6)* ¿Qué directiva de Azure Policy creas?

- [ ] A. Una directiva **Deny** con `allowedValues` de las SKU geo-redundantes en el campo `sku.name` de `Microsoft.Storage/storageAccounts`
- [ ] B. Una directiva **Audit** que avise cuando alguien cree una cuenta LRS
- [ ] C. Una iniciativa con efectos **Append** que reescriba el SKU
- [ ] D. Un presupuesto por cuenta de almacenamiento

---

*Fin del simulacro 3. Corrige ahora en [examen-3-soluciones.md](examen-3-soluciones.md) — o pide «corrige el examen 3».*
