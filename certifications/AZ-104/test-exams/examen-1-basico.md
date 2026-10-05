---
title: AZ-104 Simulacro 1 — Nivel básico
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-05
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Simulacro 1 — Nivel básico

**40 ítems · 100 minutos · libro cerrado.** Cada serie Sí/No son 3 ítems.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las series Sí/No tica **una sola** columna (Sí o No); en las de ordenar escribe las letras de la secuencia. Al terminar, pide **«corrige el examen 1»** y se leerán tus marcas para puntuar contra [examen-1-soluciones.md](examen-1-soluciones.md).

> [!success] Corrección — 05/10/2026: **32/40 (80 %)** · aprobado (corte 28)
> Fallos: 4, 8, 11a, 14, 15, 19, 22, 23 — las marcas de estos ítems ya se corrigieron sobre el archivo (resaltadas en rojo); el callout rojo de cada uno explica la trampa y la correcta.
>
> Por dominio — Identidades y gobernanza **5/9** ⚠ · Almacenamiento **8/8** · Procesos **9/10** · Redes **6/8** · Supervisión **4/5**.
>
> Patrón: 4 de los 8 fallos en gobernanza (efecto Deny de Policy, flujo de Policy, bloqueos ReadOnly, licencias P1/P2), 2 de facts (5 IPs reservadas por subred, 93 días de retención de Metrics) y 2 de elección de servicio (Compute Gallery, VPN vs ExpressRoute). Repaso: [Azure Policy](../../../knowledge/az104-azure-policy.md), [chuleta de identidad y gobernanza](../../../cheatsheets/az-104-identity-governance.md).

---

**1.** *(Una respuesta)* Una cuenta de almacenamiento debe replicar los datos **de forma sincrónica en tres zonas de disponibilidad dentro de la región primaria**. ¿Qué opción de redundancia usas?

- [ ] A. LRS
- [x] B. ZRS
- [ ] C. GRS
- [ ] D. GZRS

> [!success] Correcta — B
> ZRS replica **sincrónicamente** en tres zonas de la región primaria. LRS solo en un centro de datos; GRS/GZRS replican además a una región secundaria, pero de forma **asíncrona**. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).

**2.** *(Una respuesta)* ¿Cuál es el propósito de los grupos de administración de Azure?

- [ ] A. Agrupar recursos con el mismo ciclo de vida para moverlos o eliminarlos juntos
- [x] B. Organizar jerárquicamente suscripciones y aplicar políticas de gobernanza de forma centralizada
- [ ] C. Proporcionar resolución de nombres DNS privada para las redes virtuales
- [ ] D. Agregar métricas y registros de varias suscripciones en un único panel

> [!success] Correcta — B
> Los grupos de administración organizan **suscripciones** en jerarquías para aplicar Azure Policy y RBAC de forma centralizada. Agrupar recursos con ciclo de vida común es el rol de los grupos de recursos (A).

**3.** *(Una respuesta)* Implementas varias máquinas virtuales en un **conjunto de disponibilidad**. ¿Qué consigues con ello?

- [ ] A. Réplicas activo-activo de la misma VM en zonas distintas
- [x] B. Distribución de las VM entre dominios de error y dominios de actualización para proteger frente a fallos de hardware y mantenimiento
- [ ] C. Escalado automático del número de instancias según la demanda
- [ ] D. Copias de seguridad automáticas diarias de las VM

> [!success] Correcta — B
> El conjunto de disponibilidad reparte las VM en **dominios de error** (hardware distinto) y **dominios de actualización** (reinicios escalonados) → SLA 99,95 %. No replica (A), no escala (C, eso es VMSS) ni hace backups (D). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).

**4.** *(Una respuesta)* Creas una subred `/24` en una red virtual. ¿Cuántas direcciones IP **utilizables** quedan para los recursos?

- [ ] A. 254
- [x] B. 251
- [ ] C. 256
- [ ] D. 250

> [!failure] Fallada en el intento — la correcta es la B (251)
> Azure reserva **5 direcciones por subred** (las 4 primeras y la última) para sus servicios: 256 − 5 = **251**. La trampa es A (254): el cálculo clásico 2⁸−2 de redes on-premises olvida que Azure retiene 5 IPs, no 2.

**5.** *(Una respuesta)* Un nuevo miembro del equipo debe **ver todos los recursos de la suscripción pero no modificar nada**. ¿Qué rol integrado asignas (menor privilegio)?

- [ ] A. Contributor
- [ ] B. Owner
- [x] C. Reader
- [ ] D. Global Administrator

> [!success] Correcta — C
> **Reader** da lectura de todos los recursos sin permisos de modificación — el menor privilegio que cumple. Contributor (A) ya permite cambios y Owner (B) además gestiona accesos. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).

**6.** *(Una respuesta)* Los datos de una cuenta de almacenamiento deben poder **leerse desde la región secundaria aunque la región primaria no esté disponible, sin ejecutar un failover**. ¿Qué redundancia eliges?

- [ ] A. GRS
- [ ] B. LRS
- [ ] C. ZRS
- [x] D. RA-GRS

> [!success] Correcta — D
> El prefijo **RA-** (read-access) habilita el endpoint de solo lectura de la secundaria **sin failover**. GRS replica, pero la secundaria no es legible sin failover. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).

**7.** *(Una respuesta)* Necesitas un SLA del **99,99 %** para tus máquinas virtuales y la región soporta zonas de disponibilidad. ¿Qué haces?

- [ ] A. Implementar las VM en un conjunto de disponibilidad
- [x] B. Implementar las VM en dos o más zonas de disponibilidad
- [ ] C. Implementar una única VM con discos Premium SSD
- [ ] D. Implementar las VM en el mismo dominio de error de distintas zonas

> [!success] Correcta — B
> VMs en ≥ 2 zonas → **99,99 %**. El conjunto de disponibilidad (A) da 99,95 %; una VM con Premium SSD (C) da 99,9 %. D anula la protección: mismo dominio de error = mismo hardware. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).

**8.** *(Una respuesta)* Quieres que un grupo de seguridad de Microsoft Entra ID se llene **automáticamente** con los usuarios del departamento de Ventas en función de su atributo `department`. ¿Qué se requiere?

- [ ] A. Nada, la pertenencia dinámica está incluida en el nivel gratuito
- [ ] B. Una licencia de Microsoft Entra ID P1
- [ ] C. Una licencia de Microsoft Entra ID P2
- [ ] D. Sincronizar los usuarios con Microsoft Entra Connect

> [!failure] Fallada en el intento — la correcta es la B (P1)
> La pertenencia **dinámica** a grupos requiere **Microsoft Entra ID P1** (mínimo). El nivel gratuito solo ofrece grupos de seguridad estáticos (A). La trampa C: P2 añade PIM e Identity Protection, pero no es necesario para grupos dinámicos. Ver [identidades](../../../knowledge/az104-identities.md).

**9.** *(Una respuesta)* Una VM no tiene ningún grupo de seguridad de red (NSG) asociado ni a su NIC ni a su subred. ¿Qué tráfico **entrante** se permite por defecto?

- [ ] A. Todo el tráfico de internet
- [x] B. Solo el tráfico desde otras VM de la misma red virtual y desde Azure Load Balancer; el resto se deniega
- [ ] C. Ninguno: se deniega todo por defecto
- [ ] D. Solo RDP y SSH

> [!success] Correcta — B
> Sin NSG se aplican las reglas por defecto: `AllowVnetInBound` (65000), `AllowAzureLoadBalancerInBound` (65001) y `DenyAllInBound` (65500) — el tráfico entrante de internet se **deniega**. Ver [NSGs](../../../knowledge/az104-network-security-groups.md).

**10.** *(Una respuesta)* Debes archivar logs de auditoría que **rara vez se consultan** y aceptas una latencia de varias horas para leerlos. ¿Qué nivel de acceso de blob es el más económico?

- [ ] A. Hot
- [ ] B. Cool
- [ ] C. Cold
- [x] D. Archive

> [!success] Correcta — D
> **Archive** es el más barato en almacenamiento; los datos quedan offline y rehidratarlos puede tardar horas — exactamente el trade-off aceptado. La consulta frecuente lo haría carísimo. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).

**11.** *(Serie Sí/No — 3 ítems)* Sobre los bloqueos de recursos (locks), para cada afirmación selecciona **Sí** si es verdadera o **No** si no lo es.

| #                              | Afirmación                                                                                     | Sí  | No  |
| ------------------------------ | ---------------------------------------------------------------------------------------------- | --- | --- |
| <font color="#ff0000">a</font> | Un bloqueo **ReadOnly** impide eliminar el recurso                                             | [X] | []  |
| b                              | Un usuario con rol Owner puede eliminar un recurso aunque tenga un bloqueo, sin quitarlo antes | [ ] | [X] |
| c                              | Los bloqueos se aplican a todos los usuarios, independientemente de sus permisos RBAC          | [X] | [ ] |

> [!failure] 11a — fallada en el intento; la correcta es Sí
> **ReadOnly impide tanto escribir como eliminar** (solo deja leer operaciones GET). La trampa: pensar que ReadOnly solo bloquea modificaciones y que hace falta un lock Delete aparte para impedir el borrado — no: ReadOnly ya cubre ambos.

> [!success] 11b — correcta (No)
> Los bloqueos **prevalecen sobre RBAC para todos**, incluidos los Owners: deben quitar el lock antes de poder eliminar. Es justo su razón de ser: proteger contra borrados accidentales incluso de administradores.

> [!success] 11c — correcta (Sí)
> Se aplican a todos los usuarios independientemente de sus permisos RBAC (la herencia de locks ignora los roles).

**12.** *(Una respuesta)* ¿Cuál es el propósito principal de un **conjunto de escalado de máquinas virtuales** (VM scale set)?

- [ ] A. Proporcionar VMs de distintos tamaños para distintas cargas en un único grupo
- [x] B. Escalar automáticamente de forma horizontal un conjunto de VMs idénticas según métricas o programación
- [ ] C. Aumentar verticalmente el tamaño de una VM cuando sube la CPU
- [ ] D. Replicar VMs en una región secundaria para recuperación ante desastres

> [!success] Correcta — B
> El scale set despliega VMs **idénticas** y escala horizontalmente (más/menos instancias) con reglas de autoescala por métrica o programación. C es escalado vertical (resize), no VMSS.

**13.** *(Serie Sí/No — 3 ítems)* Sobre las directivas de **administración del ciclo de vida** de Azure Blob Storage:

| #   | Afirmación                                                                           | Sí  | No  |
| --- | ------------------------------------------------------------------------------------ | --- | --- |
| a   | Pueden mover blobs automáticamente al nivel Cool o Archive según su antigüedad       | [X] | [ ] |
| b   | El nivel de acceso de un blob solo puede establecerse a nivel de cuenta, no por blob | []  | [X] |
| c   | Pueden eliminar automáticamente versiones y snapshots antiguos                       | [X] | [ ] |
|     |                                                                                      |     |     |

> [!success] 13a — correcta (Sí)
> Mover blobs a Cool/Archive según días transcurridos es el caso de uso canónico de las directivas de ciclo de vida. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).

> [!success] 13b — correcta (No)
> El tier **sí** puede fijarse por blob (el Last-Access-Time y el tier de cuenta son solo el valor predeterminado).

> [!success] 13c — correcta (Sí)
> Además de mover tiers, las directivas pueden **purgar versiones y snapshots** antiguos.

**14.** *(Una respuesta)* Tu organización quiere **compartir imágenes de VM versionadas** entre varias suscripciones y replicarlas en otras regiones. ¿Qué servicio usas?

- [ ] A. Instantáneas (snapshots) de disco gestionado
- [x] <font color="#ff0000"> B. Azure Compute Gallery</font>
- [ ] C. Imágenes administradas almacenadas en una cuenta de almacenamiento
- [ ] D. Azure Image Builder por sí solo

> [!failure] 14 — fallada en el intento; la correcta es la B (Azure Compute Gallery)
> La galería da los tres requisitos: imágenes **versionadas**, **compartidas** entre suscripciones/tenants y **replicables** a otras regiones. Las snapshots (A) y las imágenes administradas (C) ni versionan ni replican; Image Builder (D) *crea* imágenes, no es el servicio de compartir/versionar.

**15.** *(Una respuesta)* ¿Qué tipo de datos recopila **Azure Monitor Metrics** de forma predeterminada para la mayoría de recursos?

- [x] <font color="#ff0000"> A. Series temporales numéricas de bajo rendimiento casi en tiempo real, con 93 días de retención</font>
- [ ] B. Registros detallados consultables con KQL, con 30 días de retención
- [ ] C. Eventos del plano de control de la suscripción, con 90 días de retención
- [ ] D. Capturas de paquetes de red de las VM

> [!failure] 15 — fallada en el intento; la correcta es la A
> **Metrics** = series numéricas casi en tiempo real con retención de **93 días**. Las trampas cruzan los números de las otras dos tiendas: 30 días es **Logs** (KQL, tabla `Perf`) y 90 días es el **Activity Log** (plano de control). Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).

**16.** *(Serie Sí/No — 3 ítems)* Sobre el cifrado de discos de VM:

| #   | Afirmación                                                                                            | Sí   | No  |
| --- | ----------------------------------------------------------------------------------------------------- | ---- | --- |
| a   | El cifrado del servicio de almacenamiento (SSE) está habilitado por defecto y no puede deshabilitarse | [X ] | []  |
| b   | Azure Disk Encryption (ADE) usa BitLocker en Windows y dm-crypt en Linux, con claves en Key Vault     | [X]  | [ ] |
| c   | El disco temporal de la VM queda cifrado por SSE                                                      | []   | [X] |

> [!success] 16a — correcta (Sí)
> SSE está **siempre activo** y no se puede deshabilitar (cifra el servicio de almacenamiento en reposo).

> [!success] 16b — correcta (Sí)
> ADE = BitLocker (Windows) / dm-crypt (Linux) dentro del invitado, con claves custodiadas en **tu** Key Vault. Ver [VMs](../../../knowledge/az104-virtual-machines.md).

> [!success] 16c — correcta (No)
> El **disco temporal** no vive en el servicio de almacenamiento gestionado: SSE no lo protege (para cubrirlo, cifrado en host o ADE).

**17.** *(Una respuesta)* Tu organización **prohíbe usar las claves de la cuenta de almacenamiento** y quiere conceder acceso temporal a contenedores con la SAS más segura. ¿Qué tipo de SAS usas?

- [ ] A. SAS de cuenta firmada con la clave de la cuenta
- [ ] B. SAS de servicio firmada con la clave de la cuenta
- [x] C. SAS de delegación de usuario firmada con credenciales de Microsoft Entra ID
- [ ] D. SAS de identidad administrada firmada con certificados

> [!success] Correcta — C
> La SAS de **delegación de usuario** se firma con credenciales de **Entra ID**, no con la clave de cuenta — es la única que cumple la prohibición de usar claves (y solo existe para Blob Storage). Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).

**18.** *(Serie Sí/No — 3 ítems)* Sobre el emparejamiento de redes virtuales (VNet peering):

| #   | Afirmación                                                                                   | Sí  | No  |
| --- | -------------------------------------------------------------------------------------------- | --- | --- |
| a   | El emparejamiento es transitivo: si VNet A se empareja con B y B con C, A habla con C        | [ ] | [X] |
| b   | Se pueden emparejar redes virtuales de distintas regiones (emparejamiento global)            | [X] | [ ] |
| c   | Tras emparejar dos VNets hay que crear rutas definidas por el usuario para que se comuniquen | [ ] | [X] |

> [!success] 18a — correcta (No)
> El peering **no es transitivo**: A–B y B–C no da A–C (hay que emparejar también A–C o enrutar por un NVA/hub). Ver [peering](../../../knowledge/az104-vnet-peering.md).

> [!success] 18b — correcta (Sí)
> El emparejamiento **global** entre regiones sí existe (tráfico por la red troncal de Azure).

> [!success] 18c — correcta (No)
> Una vez emparejadas, la conectividad es **automática** — no hacen falta UDRs.

**19.** *(Una respuesta)* Debes **impedir** que se creen máquinas virtuales que no cumplan una directiva de la empresa. ¿Qué efecto de Azure Policy aplicas?

- [ ] A. Audit
- [ ] B. Append
- [x] <font color="#ff0000"> C. Deny</font>
- [ ] D. AuditIfNotExists

> [!failure] 19 — fallada en el intento; la correcta es la C (Deny)
> El requisito es **impedir**: **Deny** bloquea la creación/actualización de recursos no conformes en tiempo de despliegue. La trampa A: Audit solo **registra** el incumplimiento, no lo evita. Append/Modify añaden o corrigen propiedades, no bloquean. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

**20.** *(Una respuesta)* ¿Cuál es el propósito de los **slots de implementación** de Azure App Service?

- [ ] A. Escalar la aplicación entre regiones automáticamente
- [x] B. Desplegar en un entorno de staging, validar y promover a producción con un swap sin tiempo de inactividad
- [ ] C. Hacer copias de seguridad de la aplicación en una cuenta de almacenamiento
- [ ] D. Ejecutar la aplicación en contenedores aislados

> [!success] Correcta — B
> Los slots permiten desplegar en staging, validar (incluso con % de tráfico) y hacer **swap** con producción sin downtime. Ver [App Service](../../../knowledge/az104-app-service.md).

**21.** *(Una respuesta)* Necesitas copiar periódicamente solo **los ficheros que han cambiado** entre un recurso compartido local y Azure Files, de forma incremental. ¿Qué comando usas?

- [ ] A. `azcopy copy`
- [X] B. `azcopy sync`
- [ ] C. `azcopy jobs resume`
- [ ] D. `az storage blob upload-batch`

> [!success] Correcta — B
> `azcopy sync` replica **solo las diferencias** (compara fecha de modificación y hash) — copia incremental. `copy` (A) copia todo lo seleccionado cada vez. Ver [Azure Files](../../../knowledge/az104-azure-files.md).

**22.** *(Una respuesta)* Tu empresa quiere conectar su red local con una red virtual de Azure de forma **cifrada a través de internet público**. ¿Qué despliegas?

- [ ] A. Azure ExpressRoute
- [x] <font color="#ff0000"> B. Azure VPN Gateway (de sitio a sitio)</font>
- [ ] C. Azure Application Gateway
- [ ] D. Azure Bastion

> [!failure] 22 — fallada en el intento; la correcta es la B (VPN Gateway S2S)
> La clave del enunciado es "**a través de internet público**": túnel IPsec/IKE cifrado sobre internet = **VPN Gateway de sitio a sitio**. La trampa A es justo lo contrario: ExpressRoute es conectividad **privada dedicada que no atraviesa internet**. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).

**23.** *(Ordenar)* Ordena los pasos para aplicar gobernanza con Azure Policy:

- A. Revisar el estado de cumplimiento y remediar los recursos no conformes
- B. Crear la definición de directiva (o usar una integrada)
- C. Agrupar las definiciones en una iniciativa (opcional)
- D. Asignar la directiva o iniciativa a un ámbito (grupo de administración, suscripción o grupo de recursos)

Secuencia (letras): <font color="#ff0000">B → C → D → A</font>

> [!failure] 23 — fallada en el intento; la secuencia correcta es B → C → D → A
> Flujo de Policy: **definir** (B) → agrupar en **iniciativa** (C, opcional) → **asignar** a un ámbito (D) → **revisar cumplimiento y remediar** (A). La trampa típica es querer remediar o auditar (A) antes de asignar la directiva: sin asignación no hay recursos evaluados que remediar. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

**24.** *(Una respuesta)* Tu equipo quiere **clasificar los recursos por centro de coste** para luego analizar el gasto por departamento. ¿Qué mecanismo usas?

- [x] A. Etiquetas (tags) aplicadas a los recursos
- [ ] B. Bloqueos de recursos
- [ ] C. Grupos de administración
- [ ] D. Roles personalizados de RBAC

> [!success] Correcta — A
> Las **etiquetas** son pares clave/valor para categorizar recursos; Cost Management permite luego analizar el gasto agrupando por etiqueta (y Policy puede exigirlas).

**25.** *(Una respuesta)* ¿Cuál es el propósito de un **sondeo de mantenimiento** (health probe) en Azure Load Balancer?

- [ ] A. Cifrar el tráfico entre el equilibrador y los backends
- [x] B. Detectar la disponibilidad de las instancias del backend y dejar de enviarles tráfico cuando fallan
- [ ] C. Distribuir el tráfico según la ruta URL
- [ ] D. Reservar direcciones IP para los backends

> [!success] Correcta — B
> El health probe marca instancias backend como up/down; el LB deja de enviar flujos nuevos a las caídas. Distribuir por ruta URL (C) es de Application Gateway, no del LB. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).

**26.** *(Una respuesta)* ¿Qué registro de Azure Monitor contiene los **eventos del plano de control** (creaciones, modificaciones, eliminaciones de recursos) de la suscripción y conserva 90 días sin coste?

- [x] A. Azure Activity Log
- [ ] B. Log Analytics de la VM
- [ ] C. Diagnóstico de arranque de la VM
- [ ] D. NSG flow logs

> [!success] Correcta — A
> El **Activity Log** registra el plano de control ("quién hizo qué y cuándo"), conserva **90 días sin coste** y es exportable a Log Analytics/Event Hub/Storage. El plano de datos va a Logs.

**27.** *(Una respuesta)* Ejecutas un trabajo por lotes en un contenedor de Azure Container Instances: se ejecuta **una sola vez** y, cuando el proceso termina —con éxito o con error—, **no debe volver a arrancar**. ¿Qué política de reinicio configuras?

- [ ] A. Always
- [ ] B. OnFailure
- [x] C. Never
- [ ] D. Exponential

> [!success] Correcta — C
> **Never**: el contenedor se ejecuta una vez y no se reinicia jamás, termine bien o mal. OnFailure (B) reintenta si termina con error; Always (A) es el valor por defecto. Ver [ACI](../../../knowledge/az104-container-instances.md).

**28.** *(Una respuesta)* Quieres que las VMs de una red virtual **registren automáticamente sus registros DNS** en una zona DNS privada. ¿Qué haces?

- [ ] A. Activar la resolución recursiva en la VNet
- [x] B. Vincular la zona privada a la VNet con el registro automático habilitado
- [ ] C. Crear registros A manualmente para cada VM
- [ ] D. Desplegar un reenviador condicional en cada VM

> [!success] Correcta — B
> El **vínculo de red virtual (VNet link)** con **auto-registro** habilitado crea automáticamente los registros A de las VMs de esa VNet en la zona privada. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).

**29.** *(Una respuesta)* Una alerta se dispara a las 3:00 y quieres que se envíen **correos y SMS al equipo de guardia**. ¿Qué componente de Azure Monitor defines para ello?

- [ ] A. Regla de procesamiento de alertas
- [x] B. Grupo de acciones (action group)
- [ ] C. Configuración de diagnóstico
- [ ] D. Área de trabajo de Log Analytics

> [!success] Correcta — B
> El **grupo de acciones** define qué ocurre al dispararse una alerta (email, SMS, voice, webhook, Logic App, Function, ITSM...) y es reutilizable entre alertas.

**30.** *(Una respuesta)* ¿Qué consulta KQL devuelve el **número de eventos por nivel** de la tabla `Event`?

- [ ] A. `Event | count by EventLevelName`
- [x] B. `Event | summarize count() by EventLevelName`
- [ ] C. `Event | project EventLevelName`
- [ ] D. `Event | where EventLevelName == "Error"`

> [!success] Correcta — B
> `summarize count() by <columna>` agrega contando por grupo. `count by` (A) no existe como operador directo tras la tabla; `project` (C) solo selecciona columnas y `where` (D) filtra filas sin contar.

**31.** *(Una respuesta)* Vas a capturar una VM como imagen reutilizable para crear **varias VMs nuevas con ella**. ¿Qué debes hacer antes de capturarla?

- [ ] A. Nada: se captura tal cual
- [x] B. Generalizar la VM (por ejemplo, Sysprep en Windows con la opción de generalizar)
- [ ] C. Desasignar la VM y borrar el disco temporal
- [ ] D. Convertir el disco a Premium SSD v2

> [!success] Correcta — B
> Para crear varias VMs a partir de una imagen debe estar **generalizada** (Sysprep en Windows / `waagent -deprovision` en Linux): elimina la identidad de máquina, nombre de host y cuentas locales.

**32.** *(Una respuesta)* Vas a hacer copias de seguridad de varias VMs con Azure Backup en un almacén de Recovery Services. ¿Dónde debe estar el almacén?

- [ ] A. En cualquier región, Azure Backup replica los datos globalmente
- [x] B. En la misma región que las VMs de las que hace copia
- [ ] C. En la región emparejada de las VMs
- [ ] D. En la misma suscripción pero en distinto grupo de recursos obligatoriamente

> [!success] Correcta — B
> El almacén de Recovery Services debe estar en la **misma región** que las VMs: los datos de backup no cruzan regiones por diseño. Ver [Azure Backup](../../../knowledge/az104-azure-backup.md).

---

*Fin del simulacro 1. Corrige ahora en [examen-1-soluciones.md](examen-1-soluciones.md) — o pide «corrige el examen 1».*
