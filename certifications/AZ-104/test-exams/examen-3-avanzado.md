---
title: AZ-104 Simulacro 3 — Nivel avanzado
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-05
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Simulacro 3 — Nivel avanzado

**40 ítems · 100 minutos · libro cerrado.** Incluye exhibits y un **caso práctico** (preguntas 31–36): léelo entero antes de responder sus preguntas; puedes volver a él cuantas veces quieras. Cada serie Sí/No son 3 ítems.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos/tres" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna; en las de ordenar escribe las letras. Al terminar, pide **«corrige el examen 3»** y se leerán tus marcas contra [examen-3-soluciones.md](examen-3-soluciones.md).

> [!failure] Corrección — 05/10/2026: **17/40 (42,5 %)** · no superado (corte 28) — nivel avanzado, igual o superior al real
> Fallos: 1, 2, 4a, 4c, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16, 19, 20, 23, 24, 26, 27, 29, 30, 32.
>
> Por dominio — Identidades y gobernanza **3/10** ⚠ · Almacenamiento **2/7** ⚠ · Procesos **7/10** · Redes **3/7** · Supervisión **2/6** ⚠.
>
> Lo positivo: el **caso práctico 5/6** (solo falla el 32 de PIM) y Procesos 7/10 — las arquitecturas de decisión te salen; lo que falla es el **detalle de mecanismo** de cada servicio. Patrón: (1) herramientas de supervisión (umbrales dinámicos, Event Hub vs destinos, consola serie, agentes de VM insights, IP flow verify) — 4 fallos; (2) Storage avanzado (decodificar SAS, failover → LRS, cloud tiering, purge protection de CMK) — 4 fallos; (3) identity gotchas (deny assignments, roles personalizados, grupos dinámicos sin grupos, PIM).

---

**1.** *(Una respuesta)* Un auditor pregunta quién puede crear **asignaciones de denegación (deny assignments)** en Azure. ¿Cuál es la respuesta correcta?

- [ ] A. Cualquier usuario con rol Owner en la suscripción
- [ ] B. Solo Azure las crea (por ejemplo, con Azure Blueprints o aplicaciones administradas); los usuarios no pueden crearlas directamente
- [x] C. Cualquier usuario con un rol personalizado que incluya `Microsoft.Authorization/denyAssignments/write`
- [ ] D. Solo el soporte técnico de Microsoft, a petición

> [!failure] Incorrecta — la correcta es la B
> Marcaste C, pero las **deny assignments solo las crea y gestiona Azure** (Blueprints, aplicaciones administradas, deployment stacks) para proteger los recursos que gestiona: **no son creables por usuarios**, ni con Owner ni con esa acción en un rol personalizado. La "denegación" hecha por ti se hace con Azure Policy o condiciones RBAC. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).

**2.** *(Una respuesta — exhibit)* Analiza esta SAS (Statement of Access Signature) de una cuenta de almacenamiento:

```text
https://stluz01.blob.core.windows.net/documentos?sv=2024-05-04&ss=b&srt=c&sp=rwl&se=2026-10-02T20:00:00Z&sig=abc123...
```

¿Qué concede exactamente?

- [ ] A. Leer, escribir y listar blobs del **servicio Blob** a nivel de **contenedor**, hasta las 20:00 UTC
- [x] B. Leer, escribir y listar en todos los servicios (blob, file, queue, table) de la cuenta, hasta las 20:00 UTC
- [ ] C. Solo lectura sobre el blob `documentos`, sin límite temporal
- [ ] D. Acceso completo de propietario a la cuenta de almacenamiento, incluida la gestión de claves

> [!failure] Incorrecta — la correcta es la A
> Marcaste B, pero hay que **decodificar los query params**: `ss=b` = solo el **servicio Blob** (una SAS de cuenta con todos los servicios no llevaría `ss=b` así), `srt=c` = ámbito **contenedor** (`documentos`), `sp=rwl` = **r**ead + **w**rite + **l**ist, `se` = expira a las **20:00 UTC**. Eso es exactamente A. Decodificar una SAS a partir de los parámetros es pregunta habitual del examen. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).

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
- [x] B. Las instancias se actualizan en lotes del 20 % con pausas de un minuto; si supera el 20 % de instancias no saludables, la actualización se aborta
- [ ] C. Las instancias no se actualizan hasta que las reinicies manualmente una a una
- [ ] D. Se crea un segundo conjunto de escalado y el tráfico se migra con un swap

> [!success] Correcta — B
> **Rolling** actualiza por lotes (`maxBatchInstancePercent` = 20 %) con pausas entre lotes (`pauseTimeBetweenBatches` = 1 min) y **aborta** si se supera `maxUnhealthyInstancePercent` (20 %). Automatic = todo a la vez (A); Manual = tú decides cuándo (C). Ver [VMs](../../../knowledge/az104-virtual-machines.md).

**4.** *(Serie Sí/No — 3 ítems)* Sobre Azure Policy:

| #   | Afirmación                                                                                                                                 | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------ | --- | --- |
| a   | Una directiva DeployIfNotExists corrige automáticamente los recursos existentes no conformes en cuanto se asigna, sin tarea de remediación | [X] | [ ] |
| b   | Las exenciones de directiva (exemptions) pueden configurarse con fecha de expiración                                                       | [X] | [ ] |
| c   | Una iniciativa puede asignarse a un grupo de administración                                                                                | [ ] | [X] |

> [!failure] 4a — incorrecta: marcaste Sí; la correcta es No
> DeployIfNotExists **evalúa** los recursos existentes en cuanto se asigna, pero la corrección de los no conformes requiere lanzar una **tarea de remediación** (remediation task) — no es automática. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

> [!success] 4b — correcta (Sí)
> Las exenciones admiten **fecha de expiración** — útiles para ventanas temporales (p. ej. eximir un recurso durante una migración).

> [!failure] 4c — incorrecta: marcaste No; la correcta es Sí
> Las iniciativas se asignan a **cualquier ámbito**: grupo de administración, suscripción o grupo de recursos — igual que una directiva individual. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

**5.** *(Una respuesta)* Añades a la tabla de rutas de una subred una UDR (**User Defined Route** (Ruta Definida por el Usuario)) `0.0.0.0/0` con tipo de próximo salto **None**. ¿Qué efecto tiene en las VMs de esa subred?.

- [x] A. Ninguno: es el comportamiento por defecto de la ruta de sistema
- [ ] B. El tráfico saliente a internet se descarta (las VMs pierden acceso a internet)
- [ ] C. El tráfico a internet se envía al equilibrador de carga
- [ ] D. Solo se bloquea el tráfico hacia redes virtuales emparejadas

> [!failure] Incorrecta — la correcta es la B
> Marcaste A, pero la ruta de sistema por defecto lleva próximo salto **`Internet`**; al **invalidarla** con una UDR `0.0.0.0/0` de próximo salto **None** creas un black hole: **el tráfico saliente a internet se descarta** y las VMs pierden la salida. Es una trampa clásica (con `Internet` como próximo salto sí mantendrías la salida). Ver [rutas](../../../knowledge/az104-user-defined-routes.md).

**6.** *(Una respuesta)* Una métrica de una app tiene un patrón diario muy variable (picos cada noche). Quieres alertas con **pocos falsos positivos** y sin ajustar umbrales a mano. ¿Qué configuras?

- [x] A. Una alerta de métrica con umbral estático bajo
- [ ] B. Una alerta de métrica con **umbrales dinámicos**
- [ ] C. Una alerta de registro cada 5 minutos
- [ ] D. Una alerta del registro de actividad

> [!failure] Incorrecta — la correcta es la B
> Marcaste A, pero un umbral estático bajo dispara en **cada pico nocturno normal** = falsos positivos constantes. Los **umbrales dinámicos** aprenden el patrón histórico de la serie (incluida la **estacionalidad diaria**) y solo alertan de desviaciones reales, sin ajuste manual — exactamente el requisito. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).

**7.** *(Una respuesta)* Ejecutas un **failover de cuenta** en una cuenta GRS (**Geo-Redundant Storage** (Almacenamiento con redundancia geográfica))porque la región primaria cayó. Tras el failover, ¿cómo queda la redundancia de la cuenta?

- [ ] A. GRS en la nueva región primaria, sin acción adicional
- [ ] B. LRS en la nueva región primaria: hay que volver a configurar la geo-redundancia
- [x] C. RA-GRS automáticamente
- [ ] D. La cuenta queda en modo de solo lectura permanente

> [!failure] Incorrecta — la correcta es la B
> Marcaste C, pero nadie reconstruye la geo-redundancia por ti: tras el failover de cuenta, la secundaria promovida queda como **LRS** en la nueva región primaria — hay que **volver a configurar** la geo-redundancia y esperar la resincronización. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).

**8.** *(Una respuesta)* ¿Qué afirmación sobre **Azure Spot Virtual Machines** es cierta?

- [ ] A. Garantizan capacidad reservada durante un año con descuento
- [x] B. Pueden ser desalojadas por Azure en cualquier momento con 30 segundos de preaviso
- [ ] C. No soportan discos administrados
- [ ] D. Solo están disponibles en Linux

> [!success] Correcta — B
> Las Spot usan capacidad excedente: **desalojo con 30 s de preaviso** y precio con descuento. No reservan capacidad (A — eso son las reservas) y soportan discos gestionados en cualquier SO.

**9.** *(Una respuesta)* Tu Application Gateway con WAF v2 (**Web Application Firewall v2**.) recibe tráfico malicioso que quieres **bloquear**, dejando registro de lo bloqueado. ¿Qué modo configuras?

- [ ] A. Detection
- [ ] B. Prevention
- [ ] C. Auditoría
- [x] D. Cuarentena

> [!failure] Incorrecta — la correcta es la B
> Marcaste D, pero los modos del WAF son solo dos: **Detection** (observa y registra) y **Prevention** (**bloquea** y registra). "Cuarentena" y "Auditoría" no existen como modos — descartar opciones inventadas es media respuesta en el examen. Detection (A) dejaría pasar el tráfico malicioso.

**10.** *(Una respuesta)* Debes **transmitir en tiempo real** los registros de varios recursos a un SIEM (**Security Information and Event Management**.)externo. ¿Qué destino de la configuración de diagnóstico usas?

- [ ] A. Cuenta de almacenamiento
- [ ] B. Área de trabajo de Log Analytics
- [ ] C. Centro de eventos (Event Hub)
- [x] D. Azure Monitor Alerts

> [!failure] Incorrecta — la correcta es la C
> Marcaste D, pero las alertas **no son destino** de una configuración de diagnóstico (se definen aparte sobre métricas/logs). El **Event Hub** es el destino de **streaming en tiempo real** hacia SIEMs externos (Splunk, Sentinel, QRadar…). Storage (A) es archivo en frío; Log Analytics (B) es para consultarlo **dentro** de Azure. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).

**11.** *(Una respuesta)* Sobre roles personalizados de RBAC (RBased Access Control), ¿cuál afirmación es **cierta**?

- [ ] A. `NotActions` deniega explícitamente permisos incluso si otro rol los concede
- [ ] B. `AssignableScopes` debe incluir el ámbito (grupo de gestión o suscripción) donde se va a poder asignar el rol
- [ ] C. Las acciones del plano de datos (`DataActions`) se definen dentro de `Actions`
- [x] D. Los roles personalizados solo pueden crearse con la CLI, no en el portal

> [!failure] Incorrecta — la correcta es la B
> Marcaste D, pero los roles personalizados **sí pueden crearse en el portal** (IAM → Roles → añadir, clonando uno existente). La cierta es B: `AssignableScopes` **debe contener** el ámbito donde el rol podrá asignarse. A es la otra trampa: `NotActions` **resta** de `Actions` del mismo rol, no es un deny absoluto (otro rol puede conceder ese permiso); y las acciones de datos van en `DataActions`, no en `Actions` (C). Ver [RBAC](../../../knowledge/az104-azure-rbac.md).

**12.** *(Ordenar)* Ordena el despliegue de Azure File Sync para sincronizar una carpeta de un Windows Server con un share de Azure:

- A. Registrar el servidor Windows en el servicio (agente de File Sync)
- B. Crear el Storage Sync Service
- C. Crear el grupo de sincronización y su cloud endpoint (el share)
- D. Añadir el server endpoint (la carpeta del servidor) al grupo de sincronización
- E. Configurar la organización en niveles en la nube (cloud tiering) en el server endpoint

Secuencia (letras): c → d → b → e → a

> [!failure] Incorrecta — la secuencia correcta es B → A → C → D → E
> Tu orden arranca por el grupo de sincronización (C), pero el **Storage Sync Service** (B) es el recurso padre de todo. Orden con sus dependencias: **B** crear el servicio → **A** registrar el servidor Windows **en ese servicio** (el agente se registra contra el servicio, que ya debe existir) → **C** crear el grupo de sincronización con el cloud endpoint → **D** añadir el server endpoint **al grupo** → **E** configurar cloud tiering **sobre ese server endpoint**. Cada paso depende del anterior. Ver [Azure Files](../../../knowledge/az104-azure-files.md).

**13.** *(Una respuesta)* Una App Service web app debe llamar a una base de datos que **solo es accesible dentro de una red virtual**. ¿Qué usas para el **tráfico saliente** de la app hacia esa red?

- [ ] A. El acceso público de la base de datos con IP allowlist
- [ ] B. La integración de red virtual regional (VNet integration) con una subred delegada
- [x] C. Un Application Gateway delante de la app
- [ ] D. Un private endpoint en la web app

> [!failure] Incorrecta — la correcta es la B
> Marcaste C, pero Application Gateway es un equilibrador **entrante** (delante de la app); no saca el tráfico de la app. La **integración de VNet regional** (subred delegada `Microsoft.Web/sites`) hace que las **llamadas salientes** de la app viajen por tu VNet y alcancen la BD privada. Y el private endpoint (D) es también para tráfico **entrante** hacia un servicio, no para la salida de la app. Ver [App Service](../../../knowledge/az104-app-service.md).

**14.** *(Una respuesta)* Despliegas **dos NVAs (Network Virtual Appliance (Dispositivo Virtual de Red)) en activo-pasivo** y quieres que el tráfico les llegue a través de un equilibrador interno. ¿Qué configuración de Load Balancer usas?

- [x] A. Un Load Balancer interno **estándar** con regla de **HA ports**
- [ ] B. Un Load Balancer básico con regla de puerto 80
- [ ] C. Un Load Balancer público con afinidad de IP de origen
- [ ] D. Un Application Gateway interno con WAF

> [!success] Correcta — A
> **HA ports** (todos los puertos, TCP+UDP, con floating IP) en un LB interno **estándar** es el patrón canónico para pares NVA activo-pasivo. El básico no soporta HA ports. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).

**15.** *(Una respuesta)* Una app heredada usa la **clave de la cuenta de almacenamiento** en su cadena de conexión. El equipo de seguridad aplica un bloqueo **ReadOnly** a la cuenta "para protegerla". ¿Qué ocurre con la app?

- [x] A. Nada: la app usa el plano de datos, no el plano de control
- [ ] B. Deja de funcionar: el bloqueo ReadOnly impide listar/obtener las claves de la cuenta
- [ ] C. Sigue funcionando pero más lenta
- [ ] D. Pasa a usar automáticamente la identidad administrada

> [!failure] Incorrecta — la correcta es la B
> Marcaste A, pero es el **gotcha documentado** de los locks: ReadOnly bloquea las operaciones del plano de control, incluida **List Keys**, y las operaciones de plano de datos que dependen de recuperar la clave fallan → la app **deja de autenticarse** y se cae. El examen adora este caso. Ver [RBAC y bloqueos](../../../knowledge/az104-azure-rbac.md).

**16.** *(Una respuesta)* En un server endpoint de Azure File Sync configuras cloud tiering con **volume free space = 20 %**. ¿Qué hace File Sync cuando el espacio libre del volumen cae por debajo?

- [ ] A. Detiene la sincronización hasta liberar espacio manualmente
- [ ] B. Convierte en punteros (reparse points) los archivos menos usados más antiguos hasta recuperar el 20 % de espacio libre; el contenido queda solo en el share de Azure
- [x] C. Comprime los archivos más antiguos en el servidor
- [ ] D. Recupera (recall) archivos desde Azure al volumen local

> [!failure] Incorrecta — la correcta es la B
> Marcaste C, pero File Sync **no comprime** nada. Cloud tiering convierte los archivos **menos recientemente usados y más antiguos** en punteros (reparse points): el contenido queda solo en el share de Azure y se recupera bajo demanda al abrirlos. El objetivo es mantener el **20 % de espacio libre** configurado. D es justo la operación contraria (recall). Ver [Azure Files](../../../knowledge/az104-azure-files.md).

**17.** *(Una respuesta)* Haces swap entre staging y producción. La cadena de conexión de staging está marcada como **slot setting**. ¿Dónde queda tras el swap?

- [ ] A. Se intercambia con la de producción: se queda en producción
- [x] B. Permanece en el slot de staging (los valores sticky no se intercambian)
- [ ] C. Se elimina y hay que recrearla
- [ ] D. Se duplica en ambos slots

> [!success] Correcta — B
> Los **slot settings** (sticky) **no se intercambian** en el swap: la cadena se queda en staging. Es exactamente para lo que sirven (p. ej. que staging apunte siempre a la BD de pruebas). Ver [App Service](../../../knowledge/az104-app-service.md).

**18.** *(Una respuesta)* Los servidores DNS **on-premises** deben resolver nombres de zonas DNS privadas de Azure a través del ExpressRoute. ¿Qué despliegues?

- [ ] A. Un reenviador condicional a `168.63.129.16` desde on-premises directamente
- [x] B. Un **Azure DNS Private Resolver** con endpoint de entrada, y reenviar on-premises hacia él
- [ ] C. Una zona DNS pública con los mismos nombres
- [ ] D. Nada: las zonas privadas se resuelven automáticamente desde on-premises

> [!success] Correcta — B
> `168.63.129.16` solo responde **dentro** de Azure (A); para que **on-premises** resuelva tus zonas privadas, la solución soportada es un **Azure DNS Private Resolver** con **endpoint de entrada** al que on-prem reenvía sus consultas. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).

**19.** *(Una respuesta)* Una VM Linux crítica no acepta conexiones SSH (el servicio de red está caído) pero el sistema operativo está encendido. Necesitas una consola para investigar **sin depender de la red**. ¿Qué usas?

- [ ] A. La consola serie de Azure (requiere diagnóstico de arranque habilitado)
- [x] B. Azure Bastion
- [ ] C. El comando `az vm run-command` (que usa SSH)
- [ ] D. Una extensión de script personalizado

> [!failure] Incorrecta — la correcta es la A
> Marcaste B, pero **Bastion llega a la VM por su IP privada dentro de la VNet** — depende de la red de la VM, que está caída. La **consola serie** accede al SO **por el canal serie del hipervisor**, sin tocar la red: es la herramienta para cuando la red/SSH está rota (requiere diagnóstico de arranque habilitado). run-command (C) también usa la infraestructura de agentes/red. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).

**20.** *(Una respuesta)* Un administrador quiere un grupo cuya pertenencia dinámica se calcule **a partir de otros grupos** (miembros = grupos "Ventas-Europa" y "Ventas-América"). ¿Qué le respondes?

- [x] A. Es posible con reglas de pertenencia avanzadas usando `memberOf`
- [ ] B. No es posible: los grupos dinámicos solo pueden contener usuarios o dispositivos (no grupos)
- [ ] C. Es posible solo con licencia P2
- [ ] D. Es posible si los grupos miembros son de distribución

> [!failure] Incorrecta — la correcta es la B
> Marcaste A, pero `memberOf` **no se puede usar** como operador en reglas de pertenencia dinámica. Regla de oro: un grupo dinámico contiene **solo usuarios o solo dispositivos** — nunca grupos. La alternativa es anidar manualmente o usar licencias por grupo. Ver [identidades](../../../knowledge/az104-identities.md).

**21.** *(Serie Sí/No — 3 ítems)* Sobre cómputo en Azure:

| #   | Afirmación                                                                                                    | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | Los contenedores de un grupo de Azure Container Instances comparten ciclo de vida y espacio de nombres de red | [X] | [ ] |
| b   | Se puede añadir un contenedor a un grupo de ACI ya en ejecución sin recrear el grupo                          | [ ] | [X] |
| c   | Los entornos de App Service (ASE) se implementan dentro de tu red virtual                                     | [X] | [ ] |

> [!success] 21a — correcta (Sí)
> El grupo es el host lógico: red (misma IP y espacio de nombres de puertos) y ciclo de vida compartidos.

> [!success] 21b — correcta (No)
> La composición del grupo es **inmutable** en caliente — por eso tampoco se puede cambiar una imagen sin recrearlo (pregunta 30).

> [!success] 21c — correcta (Sí)
> Los ASE se despliegan **dentro de tu VNet** (dedicados y caros); los planes normales son multiinquilino.

**22.** *(Una respuesta)* Vas a habilitar la **restauración a un momento dado (PITR Point-In-Time Restore (_restauración a un punto en el tiempo_))** de blobs en bloques. ¿Qué funcionalidades deben estar habilitadas?

- [ ] A. Solo la eliminación temporal (soft delete)
- [x] B. Eliminación temporal, control de cambios (change feed) y versionado de blobs
- [ ] C. Solo el versionado de blobs
- [ ] D. Inmutabilidad WORM y snapshots

> [!success] Correcta — B
> El PITR exige **las tres**: soft delete, change feed y versionado de blobs (además, la ventana de PITR no puede exceder la retención del soft delete). Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).

**23.** *(Una respuesta)* Un conjunto de VMs tras un Load Balancer **estándar** con solo reglas de equilibrio entrantes necesita **salida a internet** (actualizaciones). ¿Qué configura?

- [ ] A. Nada: el estándar da salida a internet por defecto
- [ ] B. Una regla de salida (outbound rule), SNAT en las reglas de equilibrio o un NAT gateway
- [x] C. Un Azure Firewall obligatoriamente
- [ ] D. Cambiar a un Load Balancer básico

> [!failure] Incorrecta — la correcta es la B
> Marcaste C, pero el firewall no es obligatorio para dar salida. El LB **estándar** es **seguro por defecto**: solo con reglas de equilibrio entrantes no hay salida — se consigue con una **regla de salida**, SNAT implícito en las reglas de equilibrio o un **NAT gateway** (la opción recomendada). El básico (D) sí la daba gratis, pero está en desuso. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).

**24.** *(Una respuesta — elige dos)* Para el **mapa de dependencias** de VM insights necesitas desplegar:

- [x] A. Azure Monitor Agent
- [ ] B. Dependency Agent
- [ ] C. Agente de Log Analytics heredado (MMA)
- [x] D. Extensión de diagnóstico de Azure (Diagnostics)

> [!failure] Incorrecta — las correctas son A + B
> A bien (AMA recopila ✔), pero marcaste D en vez de **B**: el **Dependency Agent** es el que alimenta el **mapa de dependencias** de VM insights (se apoya en los datos que envía el AMA). El agente MMA heredado está retirado y la extensión de diagnóstico no participa del mapa. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).

**25.** *(Una respuesta)* Finance quiere que el aviso salte **antes** de que el gasto real supere el presupuesto (con margen de días). ¿Qué opción del presupuesto usas?

- [x] A. Umbral sobre el **coste previsto (forecasted)**, p. ej. 90 %
- [ ] B. Umbral sobre el coste real al 100 %
- [ ] C. Una alerta de Activity Log por cada implementación
- [ ] D. Azure Advisor semanal

> [!success] Correcta — A
> Los presupuestos aceptan umbrales sobre coste **real o previsto (forecasted)**: el previsto dispara **días antes** de que el gasto real cruce el presupuesto — exactamente el margen que pide Finance.

**26.** *(Una respuesta)* Usas claves administradas por el cliente (CMK) para una cuenta de almacenamiento. ¿Qué se recomienda **habilitar en el Key Vault** para evitar que un borrado accidental de la clave deje los datos irrecuperables?

- [ ] A. Solo el firewall del vault
- [ ] B. Eliminación temporal y **protección contra purgas (purge protection)**
- [x] C. RBAC de Key Vault con deny assignments
- [ ] D. Rotación automática de claves

> [!failure] Incorrecta — la correcta es la B
> Marcaste C, pero las deny assignments **no se crean por ti** (ver pregunta 1) y el RBAC no protege del borrado por error. Lo recomendado es **soft delete + purge protection** en el vault: sin purge protection, una clave borrada y purgada en < 90 días dejaría los datos **irrecuperables**. La rotación (D) no protege del borrado. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).

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
- [x] D. Una suscripción nueva llamada rg-red

> [!failure] Incorrecta — la correcta es la B
> Marcaste D, pero `Microsoft.Resources/resourceGroups` crea un **grupo de recursos**, no una suscripción. El detalle clave es `targetScope = 'subscription'`: los RG se despliegan **a nivel de suscripción** (sin esa línea, el despliegue fallaría porque el ámbito por defecto es el resource group). Bicep sí puede crear RGs (C falso). Ver [plantillas ARM](../../../knowledge/az104-arm-templates.md).

**28.** *(Una respuesta)* Necesitas recopilar el **% de CPU y la memoria vistos desde dentro del SO invitado** de varias VMs en Log Analytics. Las configuraciones de diagnóstico solo han traído métricas de plataforma. ¿Qué falta?

- [ ] A. Nada: las métricas de invitado no se pueden enviar a Log Analytics
- [ ] B. Desplegar Azure Monitor Agent (AMA) con una regla de recopilación de datos (DCR)
- [x] C. Habilitar el diagnóstico de arranque en cada VM
- [ ] D. Subir las VMs a un plan Premium

> [!success] Correcta — B
> Las configuraciones de diagnóstico traen **métricas de plataforma** (vistas desde el hipervisor); para el **SO invitado** hace falta un agente: **AMA + regla de recopilación de datos (DCR)**. Trampa clásica del examen. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).

**29.** *(Una respuesta)* Una VM no puede conectarse a `10.20.1.5:1433` y sospechas de un NSG. ¿Qué herramienta de Network Watcher te dice **si el tráfico está permitido o bloqueado y por qué regla**?

- [x] A. Captura de paquetes
- [ ] B. Verificación de flujo IP (IP flow verify)
- [ ] C. Topología
- [ ] D. Registro de flujo de NSG

> [!failure] Incorrecta — la correcta es la B
> Marcaste A, pero la captura de paquetes **graba el tráfico**, no razona sobre reglas. **IP flow verify** comprueba una 5-tupla concreta (origen, destino, protocolo, puerto) contra las **reglas efectivas** (NIC + subred) y te dice permitido/bloqueado **y qué regla lo decide** — exactamente lo pedido. El flow log de NSG (D) registra flujos pero no señala la regla causante. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).

**30.** *(Una respuesta)* Debes cambiar la imagen de un contenedor de un grupo de Azure Container Instances en ejecución. ¿Cómo?

- [ ] A. `az container update --image ...`
- [ ] B. Actualizar el YAML y aplicar un patch en caliente
- [ ] C. Eliminar el grupo y recrearlo con la nueva imagen (los grupos no se pueden modificar en caliente)
- [x] D. Reiniciar el grupo: al arrancar tira siempre de la última imagen

> [!failure] Incorrecta — la correcta es la C
> Marcaste D, pero reiniciar no cambia la imagen: el grupo sigue con la **misma definición** (no hay `update --image`, A no existe). La composición de un grupo de ACI es inmutable: cambiar imagen/contenedores/puertos = **eliminar y recrear**. Ver [ACI](../../../knowledge/az104-container-instances.md).

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

- [x] A. Cambiar la cuenta a **GZRS**
- [ ] B. Cambiar la cuenta a **RA-GRS**
- [x] C. Directiva de inmutabilidad de **retención limitada por tiempo** (bloqueada) de 7 años sobre el contenedor
- [ ] D. **Retención legal (legal hold)** indefinida
- [ ] E. Cambiar la cuenta a **ZRS**

> [!success] Correcta — A + C
> **GZRS** = ZRS en primaria (fallo de zona) + réplica geográfica (fallo de región) — R1 exige ambas. Y para "no borrarse ni modificarse durante 7 años" con **duración conocida**: directiva de inmutabilidad de **retención limitada por tiempo bloqueada**; el legal hold (D) es para retenciones **indefinidas** hasta que se levanten (litigios). RA-GRS/ZRS no cubren los dos fallos.

**32.** *(R2)* ¿Qué solución implementas para los contratistas?

- [ ] A. Asignarles Owner permanente en `rg-finanzas` con recordatorio mensual de quitárselo
- [x] B. Privileged Identity Management (PIM): asignación **elegible** del rol en `rg-finanzas`, con aprobación y duración máxima de activación de 8 horas
- [ ] C. Cuentas locales en las VMs que expiren a las 8 horas
- [ ] D. Rol Contributor en la suscripción con condición RBAC por hora del día

> [!success] la correcta es la B
> Marcaste D, pero **no existe una condición RBAC por hora del día** que conceda/retire roles en tiempo real (las condiciones filtran acciones, no programan accesos). El just-in-time exacto del requisito (aprobación + máximo 8 h) es **PIM con asignación elegible**: el contratista **activa** el rol cuando lo necesita, con aprobador y duración máxima de activación. Requiere Entra ID P2.

**33.** *(R3)* ¿Cuál es la forma correcta de limitar el acceso a 1433 solo al tier web?

- [x] A. Crear un grupo de seguridad de aplicaciones (ASG) `asg-web` con las NIC del VMSS y usarlo como **origen** de la regla de permiso 1433 (denegando el resto)
- [ ] B. Mover la base de datos a otra suscripción
- [ ] C. Crear un Azure Firewall que bloquee 1433 desde cualquier origen
- [ ] D. Usar una regla de puerto de origen basada en la IP pública del VMSS

> [!success] Correcta — A
> El **ASG** como origen de la regla escala solo con las NICs del VMSS (las nuevas instancias se agregan solas) y sustituye al service tag `VirtualNetwork`, demasiado amplio (toda la VNet, que es el problema a corregir). La IP pública del VMSS (D) ni siquiera es la IP con la que habla a la BD. Ver [NSGs](../../../knowledge/az104-network-security-groups.md).

**34.** *(R4)* ¿Qué configura en el `vmss-web`?

- [x] A. Directiva de actualización **Rolling** con lotes pequeños, pausas entre lotes y un sondeo de mantenimiento de la app como criterio de fallo
- [ ] B. Directiva **Manual** y reiniciar las instancias en horario de mantenimiento
- [ ] C. Directiva **Automatic** y esperar al mejor momento
- [ ] D. Desplegar un segundo VMSS y mover el tráfico con DNS

> [!success] Correcta — A
> **Rolling** con lotes pequeños + pausas + **sondeo de mantenimiento de la app** (application health probe, no solo del protocolo) aborta si la app deja de responder, manteniendo capacidad durante la actualización. Automatic no aborta por salud de la app; Manual requiere trabajo y ventana. Ver [disponibilidad](../../../knowledge/az104-vm-availability.md).

**35.** *(R5)* ¿Qué alerta configuras?

- [ ] A. Una alerta de métrica sobre `portal-litware` con umbral 1
- [x] B. Una **alerta de registro (log alert)** sobre una consulta KQL en `litware-log` que busque `BILLING-ERROR` en los logs de consola de la App Service, con grupo de acciones de correo
- [ ] C. Una alerta de Activity Log por cada reinicio de la app
- [ ] D. Un runbook que haga grep cada noche

> [!success] Correcta — B
> El evento vive en **logs** (`AppServiceConsoleLogs` en el workspace): alerta de **registro** con KQL tipo `AppServiceConsoleLogs | where LogEntry contains "BILLING-ERROR"` + **grupo de acciones** de correo. No existe una métrica de "error del job" que alertar (A). Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).

**36.** *(R6)* ¿Qué directiva de Azure Policy creas?

- [x] A. Una directiva **Deny** con `allowedValues` de las SKU geo-redundantes en el campo `sku.name` de `Microsoft.Storage/storageAccounts`
- [ ] B. Una directiva **Audit** que avise cuando alguien cree una cuenta LRS
- [ ] C. Una iniciativa con efectos **Append** que reescriba el SKU
- [ ] D. Un presupuesto por cuenta de almacenamiento

> [!success] Correcta — A
> **Deny** con `allowedValues` sobre `sku.name` (GRS/GZRS/RA-GRS/RA-GZRS) restringe **desde el despliegue** las SKU no geo-redundantes. Audit (B) solo avisa, no impide; Append/Modify no reescriben de forma fiable un SKU ya elegido. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

---

*Fin del simulacro 3. Corrige ahora en [examen-3-soluciones.md](examen-3-soluciones.md) — o pide «corrige el examen 3».*
