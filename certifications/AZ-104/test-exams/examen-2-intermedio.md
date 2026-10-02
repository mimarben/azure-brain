---
title: AZ-104 Simulacro 2 — Nivel intermedio
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Simulacro 2 — Nivel intermedio

**40 ítems · 100 minutos · libro cerrado.** Estilo escenario: lee el requisito y elige la mejor opción. Cada serie Sí/No son 3 ítems.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos/tres" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna; en las de ordenar escribe las letras. Al terminar, pide **«corrige el examen 2»** y se leerán tus marcas contra [examen-2-soluciones.md](examen-2-soluciones.md).

---

**1.** *(Una respuesta)* Contratas a un administrador externo que debe **iniciar, desasignar y redimensionar máquinas virtuales**, pero **no debe conectarse a las VMs por RDP/SSH ni gestionar permisos**. ¿Qué rol integrado asignas?

- [ ] A. Contributor en la suscripción
- [ ] B. Virtual Machine Contributor en el grupo de recursos de las VMs
- [ ] C. Owner en el grupo de recursos de las VMs
- [ ] D. DevTest Labs User en la suscripción

**2.** *(Una respuesta)* Un informe debe leer datos de la cuenta de almacenamiento cada noche **incluso si la región primaria sufre una interrupción**, sin que el equipo ejecute ningún failover. La replicación entre regiones es suficiente (no se exigen zonas). ¿Qué eliges?

- [ ] A. GRS
- [ ] B. RA-GRS
- [ ] C. ZRS
- [ ] D. LRS con failover manual

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
- [ ] B. Se añaden 2 instancias una sola vez y se permanece en 6 hasta que baje la CPU
- [ ] C. Cada 5 minutos se añaden 2 instancias hasta el máximo de 8
- [ ] D. El conjunto se escala inmediatamente al máximo de 8 instancias

**4.** *(Una respuesta — exhibit)* La subred de una VM tiene este NSG asociado:

| Prioridad | Dirección | Origen | Puerto destino | Acción |
|---|---|---|---|---|
| 100 | Entrada | Internet | 3389 | Denegar |
| 200 | Entrada | Cualquiera | Cualquiera | Permitir |

¿Puedes conectarte por **RDP desde internet** a la VM?

- [ ] A. Sí: la regla 200 con menor prioridad numérica pero más reciente se aplica primero
- [ ] B. No: la regla de prioridad 100 se procesa primero y deniega el tráfico RDP de internet
- [ ] C. Sí: ambas reglas se combinan y el tráfico RDP de internet queda permitido
- [ ] D. No: RDP de internet siempre está bloqueado en Azure salvo Azure Bastion

**5.** *(Una respuesta)* Cada domingo de 02:00 a 06:00 haces mantenimiento en tus VMs y **no quieres recibir alertas** en ese periodo, sin borrar las reglas de alerta. ¿Qué usas?

- [ ] A. Una regla de procesamiento de alertas (alert processing rule) con supresión programada
- [ ] B. Deshabilitar el grupo de acciones cada semana
- [ ] C. Una consulta KQL que filtre las horas nocturnas
- [ ] D. Un presupuesto con umbral del 100 %

**6.** *(Una respuesta)* Un equipo borra por error grupos de recursos de producción. Debes **impedir eliminaciones pero permitir cambios de configuración**. ¿Qué aplicas?

- [ ] A. Bloqueo ReadOnly en cada grupo de recursos de producción
- [ ] B. Bloqueo Delete (CanNotDelete) en cada grupo de recursos de producción
- [ ] C. Rol Reader para todo el equipo
- [ ] D. Una directiva Audit en la suscripción

**7.** *(Una respuesta)* Normativa interna: los datos deben sobrevivir a la **interrupción completa de la región primaria** con la menor pérdida de datos posible y, además, tolerar el fallo de una zona dentro de la región primaria. ¿Qué redundancia eliges?

- [ ] A. GRS
- [ ] B. GZRS
- [ ] C. RA-LRS
- [ ] D. ZRS

**8.** *(Serie Sí/No — 3 ítems)* Los usuarios están sincronizados desde on-premises con sincronización de hash de contraseñas (PHS) y habilitáis el autoservicio de restablecimiento de contraseña (SSPR):

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Para que un usuario cambie su contraseña mediante SSPR y esa contraseña vuelva a on-premises, es necesario el writeback de contraseñas de Microsoft Entra Connect | [ ] | [ ] |
| b | A los administradores se les exigen siempre dos métodos de autenticación para restablecer, sin poder bajar a uno | [ ] | [ ] |
| c | SSPR está incluido sin coste en el nivel gratuito de Microsoft Entra ID | [ ] | [ ] |

**9.** *(Una respuesta)* Una aplicación necesita un SLA **de al menos el 99,9 %** y quieres **minimizar el coste**. ¿Qué diseño eliges?

- [ ] A. Una única VM con disco de SO Standard HDD
- [ ] B. Una única VM con discos Premium SSD
- [ ] C. Dos VMs en zonas de disponibilidad distintas con Load Balancer
- [ ] D. Dos VMs en un conjunto de disponibilidad con Load Balancer

**10.** *(Una respuesta — elige dos)* Enrutas el tráfico entre dos VNets spokes a través de una appliance virtual de red (NVA) en el hub. ¿Qué dos cosas son necesarias?

- [ ] A. Una ruta definida por el usuario (UDR) en las subredes de los spokes con el próximo salto en la IP privada del NVA
- [ ] B. IP forwarding habilitado en la NIC del NVA
- [ ] C. Un emparejamiento transitivo entre los spokes
- [ ] D. Un Azure Firewall en cada spoke

**11.** *(Una respuesta)* Necesitas revisar la **tendencia de CPU de una VM durante los últimos 90 días** para justificar un redimensionamiento. ¿Qué usas?

- [ ] A. Azure Monitor Metrics (Metrics Explorer) con el rango de 90 días
- [ ] B. Los registros de la tabla `Perf` con retención de 30 días
- [ ] C. Las capturas de Network Watcher
- [ ] D. El gráfico de Azure Advisor

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

- [ ] A. `logs/app/trace.log`, sin modificar desde hace 45 días, está en nivel Cool
- [ ] B. `images/foto.jpg`, sin modificar desde hace 400 días, pasa automáticamente a Archive
- [ ] C. `logs/app/trace.log`, sin modificar desde hace 45 días, pasa directamente a Archive
- [ ] D. Todos los blobs de la cuenta pasan a Cool a los 30 días

**13.** *(Serie Sí/No — 3 ítems)* Sobre firmas de acceso compartido (SAS):

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Una SAS de delegación de usuario se firma con la clave de la cuenta de almacenamiento | [ ] | [ ] |
| b | Revocar una directiva de acceso almacenado (stored access policy) revoca las SAS de servicio asociadas a ella | [ ] | [ ] |
| c | Una SAS de cuenta puede conceder acceso a varios servicios (blob, file, queue, table) con la misma firma | [ ] | [ ] |

**14.** *(Una respuesta)* Debes **mover 30 VMs a otra región de Azure** con el menor esfuerzo administrativo posible. ¿Qué servicio usas?

- [ ] A. Azure Resource Mover
- [ ] B. Azure Site Recovery (replicación)
- [ ] C. Recrear las VMs con una plantilla Bicep y AzCopy para los discos
- [ ] D. Mover las VMs a otro grupo de recursos y cambiar la región del grupo

**15.** *(Una respuesta)* Quieres que **todos los recursos nuevos sin la etiqueta `costCenter` no se puedan crear**, y que los **existentes que no la tengan se marquen en un informe de cumplimiento**. ¿Qué despliegas?

- [ ] A. Una directiva con efecto Modify y una tarea de remediación
- [ ] B. Una iniciativa con una directiva Deny para los nuevos y una directiva Audit para los existentes
- [ ] C. Una directiva con efecto AuditIfNotExists y exenciones para producción
- [ ] D. Un grupo de administración con RBAC condicional

**16.** *(Una respuesta — elige dos)* 100 consultores con portátiles **Windows y Linux** se conectarán por VPN de punto a sitio (P2S) con autenticación de certificados. ¿Qué protocolos puedes usar?

- [ ] A. SSTP
- [ ] B. IKEv2
- [ ] C. OpenVPN
- [ ] D. L2TP

**17.** *(Una respuesta — exhibit)* ¿Qué devuelve esta consulta KQL?

```kusto
Perf
| where ObjectName == "Processor" and CounterName == "% Processor Time"
| summarize AvgCPU = avg(CounterValue) by _ResourceId, bin(TimeGenerated, 1h)
```

- [ ] A. El último valor de CPU de cada VM, una fila por VM
- [ ] B. La media de CPU por VM agrupada en intervalos de una hora
- [ ] C. Las VMs cuya CPU media supera un umbral del 80 %
- [ ] D. El recuento de eventos de CPU por VM y hora

**18.** *(Una respuesta)* Los datos de una cuenta de almacenamiento se consideran confidenciales: el tráfico **no debe salir por el endpoint público** del servicio. ¿Qué implementas?

- [ ] A. Service endpoints en la subred de las VMs
- [ ] B. Private endpoint + zona DNS privada para la cuenta de almacenamiento
- [ ] C. Una regla de firewall de la cuenta que permita la IP pública de las VMs
- [ ] D. Una SAS de delegación de usuario

**19.** *(Una respuesta)* Despliegas en Azure Container Instances un grupo con **dos contenedores** (app y agente de logs) que deben compartir ciclo de vida y red, con la app en el puerto 80 y el agente publicando en el 8081. ¿Cómo lo configuras?

- [ ] A. Dos grupos de contenedores con el mismo nombre DNS
- [ ] B. Un grupo de contenedores multi-contenedor (YAML) con ambos contenedores y sus puertos
- [ ] C. Un grupo con el contenedor de la app y un sidecar en AKS
- [ ] D. Un contenedor con dos imágenes superpuestas

**20.** *(Una respuesta)* Eliminas a un usuario del grupo al que estaba asignada la licencia de Microsoft 365 (licencias por grupo). ¿Qué ocurre con sus datos?

- [ ] A. Se borran inmediatamente
- [ ] B. Pierde la licencia y tiene un periodo de gracia de 30 días sobre los datos antes de la eliminación
- [ ] C. Conserva la licencia para siempre
- [ ] D. Pierde la licencia y los datos pasan directamente a otro usuario del grupo

**21.** *(Serie Sí/No — 3 ítems)* Sobre Azure App Service:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | El plan Free admite slots de implementación adicionales | [ ] | [ ] |
| b | En planes Standard o superior puedes enviar un porcentaje del tráfico de producción a un slot de staging | [ ] | [ ] |
| c | Los valores marcados como "slot settings" (sticky) permanecen en su slot y no se intercambian en el swap | [ ] | [ ] |

**22.** *(Una respuesta)* La empresa exige conectividad **privada dedicada** con Azure (sin atravesar internet) de al menos 1 Gbps. ¿Qué servicio usas?

- [ ] A. Azure VPN Gateway de sitio a sitio con SKU VpnGw5
- [ ] B. Azure ExpressRoute
- [ ] C. Azure Application Gateway con WAF
- [ ] D. Azure Front Door con Private Link

**23.** *(Una respuesta)* Debes **probar el plan de recuperación ante desastres** de una VM protegida con Azure Site Recovery **sin afectar a la replicación** en curso. ¿Qué haces?

- [ ] A. Un failover no planeado en la red virtual de producción
- [ ] B. Un failover de prueba (test failover) en una red virtual aislada
- [ ] C. Un failover planeado fuera de horario
- [ ] D. Deshabilitar la replicación, probar y reactivarla

**24.** *(Una respuesta)* Debes copiar 5 TB de blobs de la cuenta `srcstorage` a `dststorage` **sin que los datos pasen por tu máquina local**, usando SAS en ambas cuentas. ¿Qué comando?

- [ ] A. `azcopy sync "https://srcstorage...?SAS" "https://dststorage...?SAS"`
- [ ] B. `azcopy copy "https://srcstorage...?SAS" "https://dststorage...?SAS"`
- [ ] C. `azcopy copy "https://srcstorage...?SAS" ./local --recursive` y luego subir con `az storage blob upload-batch`
- [ ] D. `robocopy \\srcstorage\blob \\dststorage\blob /MIR`

**25.** *(Una respuesta)* Un grupo de contenedores de Azure Container Instances debe descargar imágenes de un Azure Container Registry **sin credenciales en claro**. ¿Qué configuras?

- [ ] A. El usuario admin de ACR con la contraseña en una variable de entorno
- [ ] B. Una identidad administrada en el grupo de contenedores con el rol AcrPull sobre el registro
- [ ] C. Una SAS de cuenta para el registro
- [ ] D. Un token de PAT de Azure DevOps

**26.** *(Serie Sí/No — 3 ítems)* Sobre Azure DNS privado:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Una zona DNS privada puede resolver nombres para VNets emparejadas si se vinculan esas VNets a la zona | [ ] | [ ] |
| b | Los registros de las VMs se crean automáticamente aunque su VNet no esté vinculada a la zona | [ ] | [ ] |
| c | Los registros SOA y NS de la raíz de la zona pueden eliminarse | [ ] | [ ] |

**27.** *(Una respuesta — elige dos)* Los administradores elevados deben **pasar por una aprobación y completar MFA cada vez que activen** el rol, y dejar de tenerlo permanente. ¿Qué configuras (Microsoft Entra PIM)?

- [ ] A. Asignación elegible (eligible) del rol con aprobación al activar
- [ ] B. MFA exigido en la activación del rol
- [ ] C. Asignación activa (active) del rol con expiración de 8 horas
- [ ] D. Una directiva de acceso condicional por ubicación

**28.** *(Ordenar)* Ordena los pasos para crear una conexión VPN de sitio a sitio:

- A. Crear la conexión (connection) entre la puerta de enlace VPN y la puerta de enlace de red local
- B. Crear la subred `GatewaySubnet` en la VNet
- C. Crear la puerta de enlace VPN en la VNet
- D. Crear la puerta de enlace de red local con el espacio de direcciones on-premises y su IP pública

Secuencia (letras): ___ → ___ → ___ → ___

**29.** *(Una respuesta)* Debes aplicar parches mensuales de Windows a 200 VMs con **anillos de despliegue** (piloto una semana, producción la siguiente). ¿Qué usas?

- [ ] A. Azure Update Manager con implementaciones programadas
- [ ] B. Azure Automation State Configuration
- [ ] C. La pestaña de actualizaciones de cada VM en el portal, manualmente
- [ ] D. Un runbook que ejecute `apt upgrade`

**30.** *(Una respuesta)* Finance quiere un aviso por correo y SMS **cuando el gasto del proyecto alcance el 90 %** de lo presupuestado. ¿Qué configuras?

- [ ] A. Una alerta de métrica sobre el costo con umbral 90
- [ ] B. Un presupuesto (budget) con un grupo de acciones disparado al 90 %
- [ ] C. Una alerta del registro de actividad para cada compra de reserva
- [ ] D. Azure Advisor con notificaciones de coste

**31.** *(Una respuesta — exhibit)* Sobre una VM Linux en ejecución ejecutas:

```bash
az vm encryption enable \
  --resource-group RG1 --name VM1 \
  --disk-encryption-keyvault MiKV
```

¿Qué consigues?

- [ ] A. Cifrar los discos de SO y de datos con claves custodiadas en el Key Vault indicado (Azure Disk Encryption)
- [ ] B. Cifrar los discos con claves gestionadas por la plataforma, sin Key Vault
- [ ] C. Crear un conjunto de cifrado de disco (Disk Encryption Set) y asociarlo
- [ ] D. Habilitar el cifrado en el host (encryption at host)

**32.** *(Una respuesta — elige tres)* ¿Cuáles son destinos válidos de una **configuración de diagnóstico**?

- [ ] A. Área de trabajo de Log Analytics
- [ ] B. Cuenta de almacenamiento de Azure
- [ ] C. Centro de eventos (Event Hub)
- [ ] D. Application Insights

---

*Fin del simulacro 2. Corrige ahora en [examen-2-soluciones.md](examen-2-soluciones.md) — o pide «corrige el examen 2».*
