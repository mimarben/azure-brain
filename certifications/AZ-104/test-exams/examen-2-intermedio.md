---
title: AZ-104 Simulacro 2 — Nivel intermedio
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-05
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Simulacro 2 — Nivel intermedio

**40 ítems · 100 minutos · libro cerrado.** Estilo escenario: lee el requisito y elige la mejor opción. Cada serie Sí/No son 3 ítems.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos/tres" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna; en las de ordenar escribe las letras. Al terminar, pide **«corrige el examen 2»** y se leerán tus marcas contra [examen-2-soluciones.md](examen-2-soluciones.md).

> [!failure] Corrección — 05/10/2026: **23/40 (57,5 %)** · no superado (corte 28)
> Fallos: 3, 5, 7, 8b, 9, 10, 12, 13a, 13b, 14, 16, 22, 24, 25, 27, 28, 32.
>
> Por dominio — Identidades y gobernanza **7/9** · Almacenamiento **3/8** ⚠ · Procesos **5/9** · Redes **4/8** ⚠ · Supervisión **4/6**.
>
> Patrón: las **4 multi-selección falladas por dejar opciones sin marcar** (10, 16, 27, 32 — se tica una sola cuando piden dos/tres); 3 fallos de Storage entre redundancia, tiering y AzCopy (7, 12, 24) y 2 de SAS (13a, 13b). Repaso prioritario: [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md), [seguridad de Storage](../../../knowledge/az104-storage-security.md), [SLA de VMs](../../../knowledge/az104-vm-availability.md).

---

**1.** *(Una respuesta)* Contratas a un administrador externo que debe **iniciar, desasignar y redimensionar máquinas virtuales**, pero **no debe conectarse a las VMs por RDP/SSH ni gestionar permisos**. ¿Qué rol integrado asignas?

- [ ] A. Contributor en la suscripción
- [x] B. Virtual Machine Contributor en el grupo de recursos de las VMs
- [ ] C. Owner en el grupo de recursos de las VMs
- [ ] D. DevTest Labs User en la suscripción

> [!success] Correcta — B
> Virtual Machine Contributor gestiona el ciclo de vida de las VMs (iniciar/desasignar/redimensionar) **sin acceso al sistema operativo invitado** (no RDP/consola serie) ni gestión de RBAC. Contributor en la suscripción (A) se pasa de amplio y Owner (C) además gestiona permisos. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).

**2.** *(Una respuesta)* Un informe debe leer datos de la cuenta de almacenamiento cada noche **incluso si la región primaria sufre una interrupción**, sin que el equipo ejecute ningún failover. La replicación entre regiones es suficiente (no se exigen zonas). ¿Qué eliges?

- [ ] A. GRS
- [x] B. RA-GRS
- [ ] C. ZRS
- [ ] D. LRS con failover manual

> [!success] Correcta — B
> RA-GRS expone el endpoint de solo lectura `-secondary`, legible **sin failover** aunque la primaria caiga — exactamente lo que pide el informe nocturno. GRS (A) replica pero el secundario no es legible sin failover; ZRS (C) no sale de la región primaria. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).

**3.** *(Una respuesta — exhibit)* Tu conjunto de escalado usa esta configuración de autoescala:

```json
{
  "profiles": [{
    "name": "default",
    "capacity": { "minimum": "2", "maximum": "8", "default": "2" },
    "rules": [{
      "metricTrigger": { "metricName": "Percentage CPU",
        "operator": "GreaterThan", "threshold": 75 },
      "scaleAction": { "direction": "Increase", "value": "2",
        "cooldown": "PT5M" }
    }]
  }]
}
```

El conjunto tiene ahora **4 instancias** y la CPU se mantiene en el 80 %. ¿Qué ocurre?

- [ ] A. No ocurre nada hasta que se añada una regla de reducción (scale-in)
- [x] B. Se añaden 2 instancias una sola vez y se permanece en 6 hasta que baje la CPU
- [ ] C. Cada 5 minutos se añaden 2 instancias hasta el máximo de 8
- [ ] D. El conjunto se escala inmediatamente al máximo de 8 instancias

> [!failure] Incorrecta — la correcta es la C
> B asume un disparo único, pero la condición **sigue cumpliéndose** (CPU 80 % > 75 %): pasada la ventana de cooldown de 5 minutos la regla vuelve a disparar y se añaden +2 cada ciclo (4 → 6 → 8) hasta el máximo. La falta de regla de scale-in (A) solo impide reducir, no crecer; la D ignora el cooldown y el incremento gradual.

**4.** *(Una respuesta — exhibit)* La subred de una VM tiene este NSG asociado:

| Prioridad | Dirección | Origen | Puerto destino | Acción |
|---|---|---|---|---|
| 100 | Entrada | Internet | 3389 | Denegar |
| 200 | Entrada | Cualquiera | Cualquiera | Permitir |

¿Puedes conectarte por **RDP desde internet** a la VM?

- [ ] A. Sí: la regla 200 con menor prioridad numérica pero más reciente se aplica primero
- [x] B. No: la regla de prioridad 100 se procesa primero y deniega el tráfico RDP de internet
- [ ] C. Sí: ambas reglas se combinan y el tráfico RDP de internet queda permitido
- [ ] D. No: RDP de internet siempre está bloqueado en Azure salvo Azure Bastion

> [!success] Correcta — B
> El NSG procesa las reglas por **prioridad ascendente** y aplica la primera que coincide: la 100 deniega el RDP de internet antes de que se evalúe la 200 (las reglas no se "combinan", C). La justificación de A invierte el criterio (menor número = mayor prioridad). Ver [NSGs](../../../knowledge/az104-network-security-groups.md).

**5.** *(Una respuesta)* Cada domingo de 02:00 a 06:00 haces mantenimiento en tus VMs y **no quieres recibir alertas** en ese periodo, sin borrar las reglas de alerta. ¿Qué usas?

- [ ] A. Una regla de procesamiento de alertas (alert processing rule) con supresión programada
- [ ] B. Deshabilitar el grupo de acciones cada semana
- [ ] C. Una consulta KQL que filtre las horas nocturnas
- [x] D. Un presupuesto con umbral del 100 %

> [!failure] Incorrecta — la correcta es la A
> Marcaste D, pero un presupuesto avisa de gasto, no silencia alertas. Una consulta KQL (C) no detiene las notificaciones de alertas ya creadas. La **regla de procesamiento de alertas** con supresión programada silencia exactamente ese rango horario recurrente (domingos 02:00–06:00) sin tocar las reglas de alerta ni el grupo de acciones — su caso de uso canónico.

**6.** *(Una respuesta)* Un equipo borra por error grupos de recursos de producción. Debes **impedir eliminaciones pero permitir cambios de configuración**. ¿Qué aplicas?

- [ ] A. Bloqueo ReadOnly en cada grupo de recursos de producción
- [x] B. Bloqueo Delete (CanNotDelete) en cada grupo de recursos de producción
- [ ] C. Rol Reader para todo el equipo
- [ ] D. Una directiva Audit en la suscripción

> [!success] Correcta — B
> `CanNotDelete` impide eliminar pero permite modificar. ReadOnly (A) también bloquearía los cambios de configuración, que deben seguir siendo posibles; Reader (C) quita permisos de cambio y Audit (D) solo informa, no impide. Ver [RBAC y bloqueos](../../../knowledge/az104-azure-rbac.md).

**7.** *(Una respuesta)* Normativa interna: los datos deben sobrevivir a la **interrupción completa de la región primaria** con la menor pérdida de datos posible y, además, tolerar el fallo de una zona dentro de la región primaria. ¿Qué redundancia eliges?

- [ ] A. GRS
- [ ] B. GZRS
- [ ] C. RA-LRS
- [x] D. ZRS

> [!failure] Incorrecta — la correcta es la B (GZRS)
> Marcaste D, pero ZRS **no sobrevive a la interrupción completa de la región primaria**: los tres conjuntos están en la misma región. GZRS = ZRS en primaria (tolera el fallo de zona) + réplica asíncrona a una región secundaria (sobrevive al fallo de región) — cumple **ambos** requisitos. GRS (A) fallaría el de zona. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).

**8.** *(Serie Sí/No — 3 ítems)* Los usuarios están sincronizados desde on-premises con sincronización de hash de contraseñas (PHS) y habilitáis el autoservicio de restablecimiento de contraseña (SSPR):

| #   | Afirmación                                                                                                                                                        | Sí  | No   |
| --- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- | ---- |
| a   | Para que un usuario cambie su contraseña mediante SSPR y esa contraseña vuelva a on-premises, es necesario el writeback de contraseñas de Microsoft Entra Connect | [X] | [ ]  |
| b   | A los administradores se les exigen siempre dos métodos de autenticación para restablecer, sin poder bajar a uno                                                  | [ ] | [X ] |
| c   | SSPR está incluido sin coste en el nivel gratuito de Microsoft Entra ID                                                                                           | [ ] | [X ] |

> [!success] 8a — correcta (Sí)
> Con PHS, sin writeback la contraseña vieja del AD local sobreescribiría el cambio en la siguiente sincronización. El writeback de Entra Connect es lo que devuelve el cambio a on-premises. Ver [SSPR](../../../knowledge/az104-sspr.md).

> [!failure] 8b — incorrecta: marcaste No; la correcta es Sí
> A los **roles de administrador** se les exigen siempre **dos métodos** para restablecer (métodos que no pueden ser preguntas de seguridad) y ese requisito **no se puede bajar a uno** — es una excepción fija respecto a los usuarios normales, que sí pueden configurarse con un solo método. Ver [SSPR](../../../knowledge/az104-sspr.md).

> [!success] 8c — correcta (No)
> SSPR requiere **Microsoft Entra ID P1** (incluida en las licencias de pago de M365, pero no en el nivel gratuito de Entra ID).

**9.** *(Una respuesta)* Una aplicación necesita un SLA **de al menos el 99,9 %** y quieres **minimizar el coste**. ¿Qué diseño eliges?

- [ ] A. Una única VM con disco de SO Standard HDD
- [ ] B. Una única VM con discos Premium SSD
- [x] C. Dos VMs en zonas de disponibilidad distintas con Load Balancer
- [ ] D. Dos VMs en un conjunto de disponibilidad con Load Balancer

> [!failure] Incorrecta — la correcta es la B
> Trampa clásica: el SLA pedido es "**al menos** 99,9 %", no exactamente. Una única VM con **todos los discos Premium SSD** ya alcanza el 99,9 % y es la opción más barata que lo cumple. Tu C (dos VMs en zonas + LB) da 99,99 % pero cuesta el doble de lo exigido — sobre-ingeniería que la pregunta descarta pidiendo minimizar coste. A (Standard HDD) no alcanza el SLA. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).

**10.** *(Una respuesta — elige dos)* Enrutas el tráfico entre dos VNets spokes a través de una appliance virtual de red (NVA) en el hub. ¿Qué dos cosas son necesarias?

- [ ] A. Una ruta definida por el usuario (UDR) en las subredes de los spokes con el próximo salto en la IP privada del NVA
- [ ] B. IP forwarding habilitado en la NIC del NVA
- [ ] C. Un emparejamiento transitivo entre los spokes
- [x] D. Un Azure Firewall en cada spoke

> [!failure] Incorrecta — las correctas son A + B
> Marcaste solo D (Azure Firewall por spoke es **otra solución posible**, no un requisito de esta arquitectura) y dejaste sin marcar los dos requisitos reales: **UDRs** en los spokes con próximo salto la IP privada del NVA (sin ellas el tráfico no pasa por él) e **IP forwarding** en la NIC del NVA (sin él, el NVA descarta los paquetes no dirigidos a su propia IP). C no existe: el peering **no es transitivo** — por eso hace falta el NVA. Ver [rutas definidas por el usuario](../../../knowledge/az104-user-defined-routes.md).

**11.** *(Una respuesta)* Necesitas revisar la **tendencia de CPU de una VM durante los últimos 90 días** para justificar un redimensionamiento. ¿Qué usas?

- [x] A. Azure Monitor Metrics (Metrics Explorer) con el rango de 90 días
- [ ] B. Los registros de la tabla `Perf` con retención de 30 días
- [ ] C. Las capturas de Network Watcher
- [ ] D. El gráfico de Azure Advisor

> [!success] Correcta — A
> Las métricas de plataforma se retienen **93 días**: justo suficiente para la ventana de 90. La tabla `Perf` (Logs) retiene 30 días por defecto (B) y Network Watcher (C) es tráfico de red, no CPU. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).

**12.** *(Una respuesta — exhibit)* La cuenta de almacenamiento tiene esta directiva de ciclo de vida:

```json
{ "rules": [{
  "name": "tiering-logs", "enabled": true,
  "definition": {
    "filters": { "blobTypes": ["blockBlob"], "prefixMatch": ["logs/"] },
    "actions": {
      "baseBlob": {
        "tierToCool":   { "daysAfterModificationGreaterThan": 30 },
        "tierToArchive":{ "daysAfterModificationGreaterThan": 90 } } } } }] }
```

¿Qué afirmación es **cierta**?

- [x] A. `logs/app/trace.log`, sin modificar desde hace 45 días, está en nivel Cool
- [ ] B. `images/foto.jpg`, sin modificar desde hace 400 días, pasa automáticamente a Archive
- [ ] C. `logs/app/trace.log`, sin modificar desde hace 45 días, pasa directamente a Archive
- [ ] D. Todos los blobs de la cuenta pasan a Cool a los 30 días

> [!failure] Incorrecta — la correcta es solo la A (y la pregunta admite una sola marca)
> Además de marcar dos opciones en una pregunta de una respuesta, B es **falsa**: `images/` no matchea el prefijo `logs/` del `prefixMatch`, así que la directiva no le aplica en absoluto (no pasa a Archive por sí sola). A sí es cierta: el prefijo `logs/` aplica recursivamente y 45 días > 30 pero < 90 → Cool (C confunde los umbrales). D ignora el filtro de prefijo. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).

**13.** *(Serie Sí/No — 3 ítems)* Sobre firmas de acceso compartido (SAS):

| #   | Afirmación                                                                                                    | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | Una SAS de delegación de usuario se firma con la clave de la cuenta de almacenamiento                         | [X] | [ ] |
| b   | Revocar una directiva de acceso almacenado (stored access policy) revoca las SAS de servicio asociadas a ella | []  | [X] |
| c   | Una SAS de cuenta puede conceder acceso a varios servicios (blob, file, queue, table) con la misma firma      | [X] | [ ] |

> [!failure] 13a — incorrecta: marcaste Sí; la correcta es No
> Es justo al revés: la SAS de **delegación de usuario** se firma con credenciales de **Microsoft Entra ID** ( OAuth), no con la clave de cuenta — esa es precisamente su ventaja: permite delegar acceso sin exponer la clave. Las firmadas con clave de cuenta son la SAS de **servicio** y la SAS de **cuenta**. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).

> [!failure] 13b — incorrecta: marcaste No; la correcta es Sí
> La directiva de acceso almacenado es **el mecanismo de revocación** de las SAS de servicio: al revocarla (o cambiar su firma/expiración) quedan invalidadas todas las SAS de servicio asociadas a ella. Por eso se recomienda usar SAS de directiva almacenada en vez de SAS ad-hoc (una SAS ad-hoc solo caduca con su expiry). Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).

> [!success] 13c — correcta (Sí)
> La SAS de **cuenta** puede delegar en varios servicios (blob, file, queue, table) con una misma firma; la SAS de servicio cubre un solo servicio, y la de delegación de usuario solo Blob Storage.

**14.** *(Una respuesta)* Debes **mover 30 VMs a otra región de Azure** con el menor esfuerzo administrativo posible. ¿Qué servicio usas?

- [ ] A. Azure Resource Mover
- [ ] B. Azure Site Recovery (replicación)
- [ ] C. Recrear las VMs con una plantilla Bicep y AzCopy para los discos
- [X] D. Mover las VMs a otro grupo de recursos y cambiar la región del grupo

> [!failure] Incorrecta — la correcta es la A
> Marcaste D, pero un grupo de recursos **no tiene región** (solo metadatos) y los recursos no cambian de región al moverse de grupo. **Azure Resource Mover** orquesta el movimiento entre regiones (preparar → mover → confirmar) con el menor esfuerzo — conlleva downtime (las VMs se desasignan). ASR (B) es para DR, no para mudanzas planeadas; C es el camino manual máximo esfuerzo.

**15.** *(Una respuesta)* Quieres que **todos los recursos nuevos sin la etiqueta `costCenter` no se puedan crear**, y que los **existentes que no la tengan se marquen en un informe de cumplimiento**. ¿Qué despliegas?

- [ ] A. Una directiva con efecto Modify y una tarea de remediación
- [x] B. Una iniciativa con una directiva Deny para los nuevos y una directiva Audit para los existentes
- [ ] C. Una directiva con efecto AuditIfNotExists y exenciones para producción
- [ ] D. Un grupo de administración con RBAC condicional

> [!success] Correcta — B
> **Deny** bloquea en el despliegue los recursos no conformes (los nuevos) y **Audit** marca en cumplimiento sin bloquear (los existentes); la iniciativa agrupa ambas para asignarlas juntas. Modify (A) añadiría la etiqueta, no impediría la creación. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

**16.** *(Una respuesta — elige dos)* 100 consultores con portátiles **Windows y Linux** se conectarán por VPN de punto a sitio (P2S) con autenticación de certificados. ¿Qué protocolos puedes usar?

- [ ] A. SSTP
- [ ] B. IKEv2
- [ ] C. OpenVPN
- [x] D. L2TP

> [!failure] Incorrecta — las correctas son B + C
> Marcaste D, pero **L2TP no es un protocolo P2S de Azure VPN Gateway**. Los dos válidos multiplataforma (Windows **y** Linux) con autenticación de certificados son **IKEv2** y **OpenVPN**. SSTP (A) es la trampa clásica: solo Windows. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).

**17.** *(Una respuesta — exhibit)* ¿Qué devuelve esta consulta KQL?

```kusto
Perf
| where ObjectName == "Processor" and CounterName == "% Processor Time"
| summarize AvgCPU = avg(CounterValue) by _ResourceId, bin(TimeGenerated, 1h)
```

- [ ] A. El último valor de CPU de cada VM, una fila por VM
- [x] B. La media de CPU por VM agrupada en intervalos de una hora
- [ ] C. Las VMs cuya CPU media supera un umbral del 80 %
- [ ] D. El recuento de eventos de CPU por VM y hora

> [!success] Correcta — B
> `summarize avg(CounterValue) by _ResourceId, bin(TimeGenerated, 1h)` = media de CPU por recurso y por bucket horario. No hay `where` de umbral (C) ni `count()` (D), y no es el último valor (A, sería `take 1`/`arg_max`).

**18.** *(Una respuesta)* Los datos de una cuenta de almacenamiento se consideran confidenciales: el tráfico **no debe salir por el endpoint público** del servicio. ¿Qué implementas?

- [ ] A. Service endpoints en la subred de las VMs
- [x] B. Private endpoint + zona DNS privada para la cuenta de almacenamiento
- [ ] C. Una regla de firewall de la cuenta que permita la IP pública de las VMs
- [ ] D. Una SAS de delegación de usuario

> [!success] Correcta — B
> El **private endpoint** da al servicio una IP privada dentro de tu VNet (tráfico por la red troncal de Azure, nunca por el endpoint público) y la zona DNS privada resuelve el FQDN a esa IP. El service endpoint (A) sigue usando la IP pública del servicio — solo la identifica como de tu VNet — es la distinción estrella del examen. Ver [private endpoints](../../../knowledge/private-endpoints.md).

**19.** *(Una respuesta)* Despliegas en Azure Container Instances un grupo con **dos contenedores** (app y agente de logs) que deben compartir ciclo de vida y red, con la app en el puerto 80 y el agente publicando en el 8081. ¿Cómo lo configuras?

- [ ] A. Dos grupos de contenedores con el mismo nombre DNS
- [x] B. Un grupo de contenedores multi-contenedor (YAML) con ambos contenedores y sus puertos
- [ ] C. Un grupo con el contenedor de la app y un sidecar en AKS
- [ ] D. Un contenedor con dos imágenes superpuestas

> [!success] Correcta — B
> Un grupo de contenedores es un host lógico único: sus contenedores comparten red (misma IP — por eso puertos distintos: 80 y 8081), ciclo de vida y volúmenes. Se despliega con YAML multi-contenedor. Ver [ACI](../../../knowledge/az104-container-instances.md).

**20.** *(Una respuesta)* Eliminas a un usuario del grupo al que estaba asignada la licencia de Microsoft 365 (licencias por grupo). ¿Qué ocurre con sus datos?

- [ ] A. Se borran inmediatamente
- [x] B. Pierde la licencia y tiene un periodo de gracia de 30 días sobre los datos antes de la eliminación
- [ ] C. Conserva la licencia para siempre
- [ ] D. Pierde la licencia y los datos pasan directamente a otro usuario del grupo

> [!success] Correcta — B
> Al salir del grupo pierde la licencia y entra en un periodo de gracia de **30 días** sobre los datos (después, modo de solo lectura y eventual eliminación). Nada se borra inmediatamente (A) ni se transfiere a otro usuario (D). Ver [identidades](../../../knowledge/az104-identities.md).

**21.** *(Serie Sí/No — 3 ítems)* Sobre Azure App Service:

| #   | Afirmación                                                                                               | Sí  | No  |
| --- | -------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | El plan Free admite slots de implementación adicionales                                                  | [ ] | [X] |
| b   | En planes Standard o superior puedes enviar un porcentaje del tráfico de producción a un slot de staging | [X] | [ ] |
| c   | Los valores marcados como "slot settings" (sticky) permanecen en su slot y no se intercambian en el swap | [X] | [ ] |

> [!success] 21a — correcta (No)
> El plan Free **no soporta slots**; hacen falta niveles de pago (Standard: 5 slots, Premium: 20).

> [!success] 21b — correcta (Sí)
> El enrutamiento de porcentaje de tráfico a un slot (staging) es una característica de slots en **Standard o superior**.

> [!success] 21c — correcta (Sí)
> Los *slot settings* (sticky) permanecen en su slot y **no se intercambian** durante el swap — así las cadenas de conexión de producción se quedan en producción. Ver [App Service](../../../knowledge/az104-app-service.md).

**22.** *(Una respuesta)* La empresa exige conectividad **privada dedicada** con Azure (sin atravesar internet) de al menos 1 Gbps. ¿Qué servicio usas?

- [x] A. Azure VPN Gateway de sitio a sitio con SKU VpnGw5
- [ ] B. Azure ExpressRoute
- [ ] C. Azure Application Gateway con WAF
- [ ] D. Azure Front Door con Private Link

> [!failure] Incorrecta — la correcta es la B
> Marcaste A, pero una VPN Gateway, **incluida la SKU más alta, sigue siendo VPN sobre internet público** — no cumple "sin atravesar internet". **ExpressRoute** es la conectividad privada dedicada (circuito, no internet) con anchuras desde 50 Mbps y superiores a 1 Gbps. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).

**23.** *(Una respuesta)* Debes **probar el plan de recuperación ante desastres** de una VM protegida con Azure Site Recovery **sin afectar a la replicación** en curso. ¿Qué haces?

- [ ] A. Un failover no planeado en la red virtual de producción
- [x] B. Un failover de prueba (test failover) en una red virtual aislada
- [ ] C. Un failover planeado fuera de horario
- [ ] D. Deshabilitar la replicación, probar y reactivarla

> [!success] Correcta — B
> El **test failover** crea copias aisladas de las VMs en una red de prueba sin tocar la replicación ni producción — es exactamente el mecanismo para ensayar el plan de DR. A y C afectan a producción y D rompe la replicación.

**24.** *(Una respuesta)* Debes copiar 5 TB de blobs de la cuenta `srcstorage` a `dststorage` **sin que los datos pasen por tu máquina local**, usando SAS en ambas cuentas. ¿Qué comando?

- [ ] A. `azcopy sync "https://srcstorage...?SAS" "https://dststorage...?SAS"`
- [ ] B. `azcopy copy "https://srcstorage...?SAS" "https://dststorage...?SAS"`
- [x] C. `azcopy copy "https://srcstorage...?SAS" ./local --recursive` y luego subir con `az storage blob upload-batch`
- [ ] D. `robocopy \\srcstorage\blob \\dststorage\blob /MIR`

> [!failure] Incorrecta — la correcta es la B
> Marcaste C, que hace justo lo que la pregunta **prohíbe**: baja los 5 TB a tu máquina local (`./local`) y los vuelve a subir. `azcopy copy` **entre dos URIs de Azure con SAS** hace una copia del lado del servidor (Server-Side Copy): los datos viajan dentro de Azure. A (`sync`) además **borra** en destino lo que no existe en origen y es para sincronizar árboles ya relacionados, no para una copia inicial. Ver [Azure Files](../../../knowledge/az104-azure-files.md).

**25.** *(Una respuesta)* Un grupo de contenedores de Azure Container Instances debe descargar imágenes de un Azure Container Registry **sin credenciales en claro**. ¿Qué configuras?

- [ ] A. El usuario admin de ACR con la contraseña en una variable de entorno
- [ ] B. Una identidad administrada en el grupo de contenedores con el rol AcrPull sobre el registro
- [ ] C. Una SAS de cuenta para el registro
- [x] D. Un token de PAT de Azure DevOps

> [!failure] Incorrecta — la correcta es la B
> Marcaste D, pero un PAT de Azure DevOps no autentica contra ACR (y sería una credencial más en claro). Lo canónico: **identidad administrada** asignada al grupo de contenedores + rol **AcrPull** sobre el registro → pull sin ninguna credencial almacenada. A usa usuario/contraseña admin de ACR (desaconsejado) y C no aplica (SAS es de Storage, no de ACR). Ver [ACI](../../../knowledge/az104-container-instances.md).

**26.** *(Serie Sí/No — 3 ítems)* Sobre Azure DNS privado:

| #   | Afirmación                                                                                             | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------ | --- | --- |
| a   | Una zona DNS privada puede resolver nombres para VNets emparejadas si se vinculan esas VNets a la zona | [X] | [ ] |
| b   | Los registros de las VMs se crean automáticamente aunque su VNet no esté vinculada a la zona           | [ ] | [X] |
| c   | Los registros SOA y NS de la raíz de la zona pueden eliminarse                                         | []  | [X] |

> [!success] 26a — correcta (Sí)
> La resolución se extiende a las VNets **vinculadas** a la zona (emparejadas incluidas, si se vinculan).

> [!success] 26b — correcta (No)
> El auto-registro solo crea registros de las VMs en VNets vinculadas **con registro automático habilitado**; sin vínculo no hay registros automáticos.

> [!success] 26c — correcta (No)
> Los registros **SOA y NS de la raíz** de la zona no se pueden eliminar. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).

**27.** *(Una respuesta — elige dos)* Los administradores elevados deben **pasar por una aprobación y completar MFA (Multi-Factor Authentication)cada vez que activen** el rol, y dejar de tenerlo permanente. ¿Qué configuras (Microsoft Entra PIM)?

- [x] A. Asignación elegible (eligible) del rol con aprobación al activar
- [x] B. MFA exigido en la activación del rol
- [ ] C. Asignación activa (active) del rol con expiración de 8 horas
- [ ] D. Una directiva de acceso condicional por ubicación

> [!failure] Incorrecta — las correctas son A + B
> B bien (MFA al activar ✔), pero dejaste sin marcar **A**, que es la mitad esencial del requisito: la asignación **elegible** quita el rol permanente — hay que activarlo (con aprobación) cada vez que se necesite. C mantiene el rol activo entre activaciones y D no controla elevación de roles. Requiere PIM (Entra ID P2).

**28.** *(Ordenar)* Ordena los pasos para crear una conexión VPN de sitio a sitio:

- A. Crear la conexión (connection) entre la puerta de enlace VPN y la puerta de enlace de red local
- B. Crear la subred `GatewaySubnet` en la VNet
- C. Crear la puerta de enlace VPN en la VNet
- D. Crear la puerta de enlace de red local con el espacio de direcciones on-premises y su IP pública

Secuencia (letras): D→ C →B → A

> [!failure] Incorrecta — la secuencia correcta es B → C → D → A
> Tu orden crea la puerta de enlace VPN (C) **antes** que su `GatewaySubnet` (B), lo cual es imposible: sin la subred de puerta de enlace no se puede crear la puerta de enlace. Orden canónico: **B** (GatewaySubnet en la VNet) → **C** (puerta de enlace VPN sobre esa subred) → **D** (puerta de enlace de red local: define el espacio on-premises y su IP pública) → **A** (la conexión, que requiere ambas puertas de enlace ya creadas). Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).

**29.** *(Una respuesta)* Debes aplicar parches mensuales de Windows a 200 VMs con **anillos de despliegue** (piloto una semana, producción la siguiente). ¿Qué usas?

- [x] A. Azure Update Manager con implementaciones programadas
- [ ] B. Azure Automation State Configuration
- [ ] C. La pestaña de actualizaciones de cada VM en el portal, manualmente
- [ ] D. Un runbook que ejecute `apt upgrade`

> [!success] Correcta — A
> Azure Update Manager (Update Manager) permite **implementaciones de actualizaciones programadas y recurrentes** con anillos de despliegue (piloto → producción) sin agentes de Automation heredados ni trabajo manual.

**30.** *(Una respuesta)* Finance quiere un aviso por correo y SMS **cuando el gasto del proyecto alcance el 90 %** de lo presupuestado. ¿Qué configuras?

- [ ] A. Una alerta de métrica sobre el costo con umbral 90
- [x] B. Un presupuesto (budget) con un grupo de acciones disparado al 90 %
- [ ] C. Una alerta del registro de actividad para cada compra de reserva
- [ ] D. Azure Advisor con notificaciones de coste

> [!success] Correcta — B
> Los **presupuestos** de Cost Management disparan notificaciones (correo/SMS vía grupo de acciones) al alcanzar umbrales porcentuales (50/75/90/100 %) contra coste real o previsto. El coste no es una métrica de recurso alertable como en A.

**31.** *(Una respuesta — exhibit)* Sobre una VM Linux en ejecución ejecutas:

```bash
az vm encryption enable \
  --resource-group RG1 --name VM1 \
  --disk-encryption-keyvault MiKV
```

¿Qué consigues?

- [x] A. Cifrar los discos de SO y de datos con claves custodiadas en el Key Vault indicado (Azure Disk Encryption)
- [ ] B. Cifrar los discos con claves gestionadas por la plataforma, sin Key Vault
- [ ] C. Crear un conjunto de cifrado de disco (Disk Encryption Set) y asociarlo
- [ ] D. Habilitar el cifrado en el host (encryption at host)

> [!success] Correcta — A
> `az vm encryption enable --disk-encryption-keyvault` es **Azure Disk Encryption (ADE)**: cifra SO y datos con claves custodiadas en **tu** Key Vault (dm-crypt/BitLocker en el invitado). B es SSE (plataforma, sin KV tuyo), C es el mecanismo de CMK para discos gestionados y D cifra en el host físico. Ver [VMs](../../../knowledge/az104-virtual-machines.md).

**32.** *(Una respuesta — elige tres)* ¿Cuáles son destinos válidos de una **configuración de diagnóstico**?

- [x] A. Área de trabajo de Log Analytics
- [ ] B. Cuenta de almacenamiento de Azure
- [ ] C. Centro de eventos (Event Hub)
- [ ] D. Application Insights

> [!failure] Incorrecta — las correctas son A + B + C
> Marcaste solo A y dejaste sin marcar las otras dos válidas: **cuenta de almacenamiento** y **Event Hub** (además de destinos de partner). **Application Insights no es destino de una configuración de diagnóstico** — es para aplicaciones e ingiere su propia telemetría.

---

*Fin del simulacro 2. Corrige ahora en [examen-2-soluciones.md](examen-2-soluciones.md) — o pide «corrige el examen 2».*
