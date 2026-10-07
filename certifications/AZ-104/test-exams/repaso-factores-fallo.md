---
title: AZ-104 — Repaso por factores de fallo (online 1–8 + simulacros 2, 3 y 5)
tags: [certification, exam-review, mistakes]
certification: [AZ-104]
updated: 2026-10-07
sources:
  - certifications/AZ-104/test-exams/respuestas-incorrectas-exam-online-1-8.md
  - certifications/AZ-104/test-exams/examen-2-intermedio.md
  - certifications/AZ-104/test-exams/examen-3-avanzado.md
  - certifications/AZ-104/test-exams/examen-5-avanzado.md
---

# Repaso por factores de fallo — vísperas del examen

Destila **118 intentos fallados** — los 70 errores de los assessments [online 1–8](respuestas-incorrectas-exam-online-1-8.md) y los 48 fallos de los simulacros [2](examen-2-intermedio.md) (17), [3](examen-3-avanzado.md) (23) y [5](examen-5-avanzado.md) (8) — en **15 factores** ordenados por frecuencia. Cada factor: reglas de oro, la trampa típica del redactado y enlaces a `knowledge/`.

**Cómo usarlo esta noche:** 1ª pasada a los factores 1–6 (2/3 de los fallos), 2ª pasada al resto, y mañana antes de entrar solo el [relámpago final](#relámpago-final) y la [técnica de examen](#técnica-de-examen). Nota para calibrar: simulacro 1 → 80 %, simulacro 2 → 57,5 %, simulacro 3 → 42,5 %, simulacro 5 → 84 %.

## Ranking de factores

| # | Factor | Fallos | Dominio del examen |
|---|---|---|---|
| 1 | [Supervisión: herramienta, agente y destino correctos](#1-supervisión-herramienta-agente-y-destino-correctos) | 11 | Supervisión (20–25 %) |
| 2 | [Storage: redundancia, replicación y protección de datos](#2-storage-redundancia-replicación-y-protección-de-datos) | 11 | Almacenamiento (15–20 %) |
| 3 | [Enrutamiento, VPN y DNS](#3-enrutamiento-vpn-y-dns) | 10 | Redes (15–20 %) |
| 4 | [Acceso a datos, Azure Files y AzCopy](#4-acceso-a-datos-azure-files-y-azcopy) | 10 | Almacenamiento |
| 5 | [VMs: disponibilidad, SLA y operaciones](#5-vms-disponibilidad-sla-y-operaciones) | 10 | Procesos (20–25 %) |
| 6 | [Gobernanza: RBAC, Policy y bloqueos](#6-gobernanza-rbac-policy-y-bloqueos) | 9 | Identidades y gobernanza (20–25 %) |
| 7 | [Load Balancer y Application Gateway](#7-load-balancer-y-application-gateway) | 8 | Redes |
| 8 | [SAS: el reincidente (5 preguntas, 8 intentos)](#8-sas-acceso-delegado-con-caducidad) | 5 ⚠ | Almacenamiento |
| 9 | [Identidad: SSPR, licencias, grupos, B2B y PIM](#9-identidad-sspr-licencias-grupos-b2b-y-pim) | 7 | Identidades y gobernanza |
| 10 | [Network Watcher: la herramienta exacta para cada diagnóstico](#10-network-watcher-la-herramienta-exacta-para-cada-diagnóstico) | 6 | Redes |
| 11 | [Contenedores: ACI, ACR y Container Apps](#11-contenedores-aci-acr-y-container-apps) | 6 | Procesos |
| 12 | [Azure Backup y Recovery Services vault](#12-azure-backup-y-recovery-services-vault) | 5 ⚠ | Supervisión |
| 13 | [App Service: planes y límites](#13-app-service-planes-y-límites) | 5 | Procesos |
| 14 | [NSG: asociación y reglas efectivas](#14-nsg-asociación-y-reglas-efectivas) | 5 | Redes |
| 15 | [ARM/Bicep: detalles de despliegue](#15-armbicep-detalles-de-despliegue) | 4 | Procesos |

⚠ = pocas preguntas pero **reincidentes** (falladas varias veces): máxima atención.

---

## 1. Supervisión: herramienta, agente y destino correctos

**Fallos:** online 3, 4, 5, 42, 48 (×2), 65 · sim 2: 5 · sim 3: 6, 10, 24, 28.

- **Retenciones:** métricas de plataforma **93 días** (Metrics Explorer cubre "tendencia de 90 días"); registro de actividad **90 días** → para un año, exportarlo con configuración de diagnóstico.
- **SO invitado** (CPU/memoria/disco vistos desde dentro, incl. espacio libre): **AMA + regla de recopilación de datos (DCR)**. Las configuraciones de diagnóstico solo traen métricas de plataforma.
- **Mapa de dependencias de VM insights:** AMA **+ Dependency Agent** (el que alimenta el mapa).
- **Destinos válidos de una configuración de diagnóstico:** Log Analytics, cuenta de almacenamiento, Event Hub (+ partner). **Nunca** Application Insights ni Alertas.
- **Streaming en tiempo real a un SIEM externo** (Splunk, Sentinel externo): **Event Hub**.
- **Estados de alerta** (Nuevo/Confirmado/Cerrado): los cambia **un usuario a mano** — no hay lógica automática que cierre.
- **Grupo de acciones primero** (define el destino del correo), luego la regla de alerta. **Regla de procesamiento de alertas** = silenciar ventanas recurrentes (mantenimiento dominical) sin tocar las reglas.
- **Umbrales dinámicos** para métricas con estacionalidad/picos (aprenden el patrón, pocos falsos positivos).
- **Herramienta/hoja correcta:** telemetría centralizada de diagnóstico → workspace de **Log Analytics** · fecha de creación de recursos → hoja **Implementaciones** del grupo de recursos · VMs infrautilizadas → Advisor hoja **Costos** · análisis temporal del rendimiento → **Azure Monitor Metrics** (series temporales).

→ [Monitorización de VMs](../../../knowledge/az104-vm-monitoring.md)

## 2. Storage: redundancia, replicación y protección de datos

**Fallos:** online 11, 14, 40 (×2), 54 · sim 2: 7, 12 · sim 3: 7, 22, 26 · sim 5: 13, 14b.

- **Árbol de decisión de redundancia:** fallo de zona sin salir de región → **ZRS** · fallo de región → **GRS** · ambos → **GZRS** · leer del secundario sin failover → prefijo **RA-**.
- **Failover de cuenta:** la secundaria promovida queda **LRS** — nadie reconstruye la geo-redundancia por ti.
- **Replicación de objetos:** versionado de blobs en **ambas** cuentas + change feed **solo en la de origen** (el destino no lo necesita).
- **PITR de blobs:** exige **soft delete + change feed + versionado** (la ventana PITR ≤ retención del soft delete).
- **CMK en Key Vault:** **soft delete + purge protection** — sin purge, un borrado con purga deja los datos irrecuperables.
- **ADLS Gen2 / ACL POSIX:** cuenta **GPv2 o Premium block blob** + **espacio de nombres jerárquico**.
- **Ciclo de vida:** `prefixMatch` filtra — lo que no matchea el prefijo **no se toca**; los umbrales cuentan desde la **última modificación** y se evalúan en cascada (200 días → Archive); solo blobs en bloques.
- **Snapshots:** borrar un blob base con snapshots **no es automático e incondicional** (hay que tratarlas; con soft delete quedan retenidas).
- **Rotación de claves sin corte:** confirmar la clave en uso → **regenerar la libre** → migrar las apps a la nueva → regenerar la antigua. Nunca regeneres la que está en uso.

→ [Cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md) · [Blob Storage](../../../knowledge/az104-blob-storage.md) · [Seguridad de Storage](../../../knowledge/az104-storage-security.md)

## 3. Enrutamiento, VPN y DNS

**Fallos:** online 26 (×2), 32, 47, 63, 67 · sim 2: 10, 16, 22, 28 · sim 3: 5.

- **Gana siempre el prefijo más largo.** Una UDR `0.0.0.0/0` con próximo salto **None** invalida la ruta de sistema a Internet → **black hole** (las VMs pierden la salida).
- **NVA de inspección:** UDR `0.0.0.0/0` con próximo salto = IP del NVA **+ IP forwarding en la NIC del NVA**. Ambas cosas; el peering no es transitivo.
- **Hub-spoke con una sola gateway:** *Allow gateway transit* (hub→spoke) + *Use remote gateways* (spoke→hub).
- **Tras crear/modificar un peering, los clientes P2S deben volver a descargar e instalar el cliente VPN** para recibir las rutas nuevas.
- **Conectividad cifrada on-prem = VPN Gateway** (S2S/P2S); **privada dedicada sin internet = ExpressRoute** (ninguna SKU de VPN Gateway deja de ir por internet).
- **Protocolos P2S:** con certificados y multiplataforma (Windows **y** Linux) → **IKEv2 y OpenVPN**. SSTP solo Windows; **L2TP no existe** en P2S de Azure. Con Entra ID → OpenVPN + Azure VPN Client.
- **Orden S2S:** GatewaySubnet → VPN Gateway → puerta de enlace de red local → conexión.
- **FQDN entre varias VNets emparejadas con mínimo esfuerzo:** zona **privada** de Azure DNS + vínculos de VNet (la resolución proporcionada por Azure es intra-VNet y sin dominios propios).
- **Auto-registro de VMs en zona privada:** vínculo de VNet (con registro automático). **Delegar un subdominio:** conjunto de registros **NS** `test` en la zona padre.

→ [Rutas definidas por el usuario](../../../knowledge/az104-user-defined-routes.md) · [Redes virtuales](../../../knowledge/az104-virtual-networks.md) · [Azure DNS](../../../knowledge/az104-azure-dns.md) · [Peering](../../../knowledge/az104-vnet-peering.md)

## 4. Acceso a datos, Azure Files y AzCopy

**Fallos:** online 8 (×3), 10, 12, 13, 15, 39, 69 · sim 2: 24 · sim 3: 12, 16.

- **Plano de control ≠ plano de datos:** Contributor/Reader gestionan el recurso; para leer/escribir **datos** hacen falta roles de datos (Storage Blob Data Reader/Contributor).
- **Acceso basado en identidad (SMB con Entra):** solo **Azure Files** (Entra Kerberos o AD DS). Habilitarlo es **el primer paso** — SAS/claves son acceso por clave, no identidad.
- **Restringir el origen** (solo on-prem por ExpressRoute, mínimo esfuerzo): **firewall y reglas de red** de la cuenta de almacenamiento.
- **AzCopy solo blob y archivo** (no table ni queue). Copia cuenta→cuenta con SAS en ambos extremos = **copia del lado del servidor** (los datos no pasan por tu máquina). `sync` sincroniza (y borra el exceso); `copy` copia.
- **Orden de File Sync:** crear el **Storage Sync Service** → registrar el servidor (agente) → grupo de sincronización + cloud endpoint → server endpoint → cloud tiering.
- **Cloud tiering** con volumen al 20 %: convierte en **punteros (reparse points)** los archivos menos usados y más antiguos hasta recuperar el espacio. No comprime ni detiene la sincronización.
- **Share de 100 TiB:** habilitar **large file share** en la cuenta + subir la cuota a 102 400 GB.

→ [Seguridad de Storage](../../../knowledge/az104-storage-security.md) · [Azure Files](../../../knowledge/az104-azure-files.md)

## 5. VMs: disponibilidad, SLA y operaciones

**Fallos:** online 17, 18, 24, 49, 50, 51 · sim 2: 3, 9, 14 · sim 5: 18.

- **Fallo de centro de datos → zonas de disponibilidad.** El conjunto de disponibilidad solo protege dentro de un único DC (bastidores/hosts: FD/UD).
- **Mates de FD/UD:** mantenimiento planeado (por UD) → como máximo ⌈N/UD⌉ VMs a la vez (18 VMs / 10 UD = 2); fallo de bastidor (por FD) → N/FD (18/2 = 9).
- **"Al menos 99,9 % y mínimo coste":** una sola VM con **todos los discos Premium SSD** ya cumple. No sobre-ingeniar con dos VMs + LB (eso es 99,99 % y el doble de coste).
- **Spot:** desalojo por **capacidad o precio** (nunca por uso de CPU), 30 s de preaviso. VMSS Spot: política **Delete o Deallocate** (Deallocate conserva los discos).
- **Discos:** se pueden desasociar de una VM **en ejecución** (no hay que parar nada).
- **Mover una VM a otro host por mantenimiento** → **Redeploy** (la apaga y la recoloca).
- **Cambiar 30 VMs de región** → **Azure Resource Mover** (mover de grupo de recursos no cambia la región: el RG no tiene región).
- **Imagen sin Sysprep conservando la unión a dominio** → versión de imagen **`osState: Specialized`** en Compute Gallery.
- **Autoescala:** mientras la condición se cumpla, la regla **vuelve a disparar tras cada cooldown** (4 → 6 → 8…), no es un disparo único.
- **Acceso de un externo a una VM interna con mínimo esfuerzo** → IP pública en la VM.

→ [Disponibilidad de VMs](../../../knowledge/az104-vm-availability.md) · [VMs](../../../knowledge/az104-virtual-machines.md)

## 6. Gobernanza: RBAC, Policy y bloqueos

**Fallos:** online 2, 44, 61, 66 · sim 3: 1, 4a, 4c, 11, 15.

- **Mapa de menor privilegio:** solo ver → **Reader** · gestionar todo sin asignar roles → **Contributor** · etiquetar → **Tag Contributor** · costes y presupuestos sin tocar recursos → **Cost Management Reader**.
- **Deny assignments:** solo las crea **Azure** (Blueprints, aplicaciones administradas). El usuario no puede crearlas — para denegar tú: Policy o condiciones RBAC.
- **`NotActions` resta dentro del rol**, no es un deny absoluto (si otro rol concede ese permiso, lo tiene). Las acciones de datos van en `DataActions`.
- **`AssignableScopes` debe incluir** el ámbito donde el rol podrá asignarse. Los roles personalizados **sí** se crean en el portal.
- **El admin global no ve suscripciones** → elevate access (User Access Administrator en `/`): roles de directorio y RBAC son planos distintos.
- **Policy:** DeployIfNotExists/Modify **no remedian solos** al asignarse — hace falta **tarea de remediación** (Modify además necesita identidad administrada). Las iniciativas se asignan a **cualquier ámbito**, incluido el grupo de administración.
- **Bloqueo ReadOnly** rompe `List Keys` → una app que usa la clave de la cuenta **se cae**. CanNotDelete permite cambios e impide borrar.

→ [RBAC](../../../knowledge/az104-azure-rbac.md) · [Azure Policy](../../../knowledge/az104-azure-policy.md)

## 7. Load Balancer y Application Gateway

**Fallos:** online 29, 33, 34, 55, 56 (×2) · sim 3: 9, 23 · sim 5: 16.

- **Distribución desigual → desactivar la persistencia de sesión.** Mismo servidor para todo el cliente → **activarla** (Source IP / Source IP + protocolo). La regla NAT de entrada no da afinidad.
- **Distribución por defecto = hash de 5 tuplas.** Timeouts intermitentes → revisar modo de distribución + **sondeo de estado** + reglas NSG + **SKU coincidente** entre LB e IP pública.
- **LB estándar seguro por defecto:** solo con reglas de equilibrio entrantes no hay salida → **regla de salida, SNAT o NAT gateway** (el recomendado, y da IP de salida fija).
- **NVA activo-pasivo:** LB interno **estándar** + regla **HA ports** (el Basic no la soporta).
- **VMSS en el pool:** falta referenciar **`loadBalancerBackendAddressPools`** en las `ipConfigurations` del perfil de red (síntoma: pool sin destinos).
- **WAF:** solo **Detection** (observa y registra) y **Prevention** (bloquea). "Cuarentena" y "Auditoría" no existen.
- **App Gateway path rules:** lo que no matchea ninguna regla va al **pool por defecto** del url path map (no hay 404).

→ [Load Balancer](../../../knowledge/az104-load-balancer.md) · [Application Gateway](../../../knowledge/az104-application-gateway.md)

## 8. SAS: acceso delegado con caducidad

**Fallos:** online 9 (**fallada 4 veces**), 38/62 · sim 2: 13a, 13b · sim 3: 2. La pregunta más reincidente de todo el histórico.

- **Acceso de un tercio que expire solo (24 h, 30 días) = SAS.** Claves = permanente; roles RBAC = sin límite temporal; acceso condicional = señales de identidad en tiempo real, no caducidad.
- **Decodificar la URL:** `ss=b` servicio blob · `srt=c` ámbito contenedor (`o` = objetos) · `sp=rwl` read/write/list · `se` expiración · `sig` firma.
- **Delegación de usuario:** firmada con credenciales de **Entra ID** (OAuth), solo Blob. **De cuenta:** varios servicios, firmada con clave. **De servicio:** un solo servicio, firmada con clave.
- **Revocación quirúrgica:** SAS ligada a una **directiva de acceso almacenada** — se revoca quitándola o adelantando su expiración, sin rotar claves. Las ad-hoc solo mueren con su `se` (o rotando la clave, con impacto global).

→ [Seguridad de Storage](../../../knowledge/az104-storage-security.md)

## 9. Identidad: SSPR, licencias, grupos, B2B y PIM

**Fallos:** online 1, 43 · sim 2: 8b, 27 · sim 3: 20, 32 · sim 5: 5.

- **SSPR — quién puede:** miembros del ámbito (cloud siempre; sincronizados **con writeback** para devolver el cambio al AD). **Los invitados NO**: gestionan su contraseña en su tenant de origen.
- **Administradores:** siempre **2 métodos** para restablecer (no bajable a 1), sin preguntas de seguridad. SSPR requiere **P1** (no está en el gratuito).
- **Licencias por grupo:** consumen **miembros, no propietarios**. La misma SKU heredada de varios grupos = **una** licencia; conflicto solo con SKUs distintas incompatibles. Al salir del grupo: 30 días de gracia.
- **Grupos dinámicos:** contienen **solo usuarios o solo dispositivos** — `memberOf` no se puede usar; los grupos nunca son miembros.
- **B2B:** Gmail sin cuenta Microsoft ni Entra → **código de acceso de un solo uso (OTP)**. B2B direct connect es solo entre **dos tenants de Entra** (canales compartidos de Teams).
- **PIM:** asignación **elegible** + aprobación + MFA al activar + duración máxima de activación. **No existe** condición RBAC "por hora del día".

→ [Identidades](../../../knowledge/az104-identities.md) · [SSPR](../../../knowledge/az104-sspr.md)

## 10. Network Watcher: la herramienta exacta para cada diagnóstico

**Fallos:** online 45/57, 46, 60 · sim 3: 19, 29 · sim 5: 30.

- **¿Me bloquea un NSG y qué regla?** → **IP flow verify** (5-tupla contra las reglas efectivas). La captura de paquetes graba, no razona.
- **¿Qué ruta se aplica a un prefijo?** → **rutas efectivas** (effective routes) de la NIC — muestra todas (sistema, peering, usuario) con su próximo salto. **Next hop** dice a dónde va **un destino concreto**, no la tabla.
- **Conectividad puntual** → Connection troubleshoot · **continua con métricas y alertas** → **Connection Monitor**.
- **Red rota, SO vivo** → **consola serie** (canal del hipervisor, requiere diagnóstico de arranque). Bastion llega por la IP privada: depende de la red.
- **Puertos a la escucha** en el servidor → `netstat -an` dentro del SO.
- **Registro continuo de flujos** → VNet flow logs (los NSG flow logs clásicos se retiran: sin creación desde 30/6/2025).

→ [Network Watcher](../../../knowledge/az104-network-watcher.md)

## 11. Contenedores: ACI, ACR y Container Apps

**Fallos:** online 20, 23, 52 · sim 2: 25 · sim 3: 30 · sim 5: 20.

- **Cambiar imagen/contenedores/puertos de un grupo ACI** = **eliminar y recrear** (composición inmutable; no hay `az container update --image`; reiniciar no tira de imagen nueva).
- **Inyección en VNet:** subred **vacía y delegada** en `Microsoft.ContainerInstance/containerGroups` (el error "subred no vacía" la delata).
- **Pull de ACR sin credenciales:** identidad administrada en el grupo + rol **AcrPull**. Multi-región con un solo endpoint → ACR **Premium con geo-replicación**.
- **App web contenedorizada** con dominio propio, autoscale, mínimo coste y esfuerzo → **App Service** (no ACI ni AKS).
- **Container Apps:** escalado por mensajes de Service Bus → desencadenador **Azure Service Bus** (KEDA), no "tráfico HTTP".
- Un grupo ACI comparte IP, puertos (distintos por contenedor), ciclo de vida y volúmenes.

→ [Container Instances](../../../knowledge/az104-container-instances.md)

## 12. Azure Backup y Recovery Services vault

**Fallos:** online 6, 7, 41 (×2), 53 (×2) · sim 5: 34.

- **Ficheros y carpetas de un Windows Server** → agente **MARS** (no MABS). Flujo MARS: **descargar credenciales del vault y registrar el servidor ANTES** de crear directivas.
- **Eliminar un vault:** detener la protección de todos los elementos → **deshabilitar soft delete** → **purgar los soft-deleted**. No hay que borrar las VMs.
- **Instant restore** (snapshots en `AzureBackupRG_*` junto a la VM): retención **1–5 días (2 por defecto)** — para gastar menos almacenamiento, bájala.
- **Soft delete:** 14 días para deshacer la eliminación de datos de copia.
- **Redundancia del vault inamovible con elementos protegidos** — antes de cambiar LRS/GRS hay que quitar la protección.
- **Share de Azure Files:** backup sin agentes, snapshot diaria, restauración por **fichero o carpeta**.

→ [Azure Backup](../../../knowledge/az104-azure-backup.md) · [Backup de VMs](../../../knowledge/az104-vm-backup.md)

## 13. App Service: planes y límites

**Fallos:** online 19, 21, 22, 37/68 (fallada 2 veces) · sim 3: 13.

- **Free/Shared/Basic: ni slots ni autoescala.** Pregunta "autoscale por CPU en plan Basic" → primer paso: **subir el plan a Standard o superior**.
- **Contenedor Docker:** la opción correcta es **Publicar = Contenedor de Docker** (la pila runtime no aplica).
- **Logs de aplicación persistentes más allá de una semana** → **Blob** (FileSystem se pierde); nivel **Warning** = warning + error + critical.
- **Tráfico saliente de la app hacia una VNet** (BD privada) → **integración de VNet regional** (subred delegada). App Gateway y private endpoints son de **entrada**.
- **Movimientos:** una app no se muda a un plan de otra región (clonar/redesplegar); los **certificados de App Service no se mueven de RG** (borrar, mover el resto, volver a subir).

→ [App Service](../../../knowledge/az104-app-service.md)

## 14. NSG: asociación y reglas efectivas

**Fallos:** online 28 (×2), 30, 31, 58, 59.

- Un NSG se asocia a **NIC y a subred** — nunca a una VNet ni "a la VM" directamente. Misma **región** que la VNet.
- **Subred + NIC deben permitir ambos:** si cualquiera de los dos deniega, el tráfico no pasa (VM con NSG de subred permisor y NSG de NIC restrictor = bloqueado).
- **Prioridad:** menor número gana, la primera coincidencia se aplica.
- **Minimizar reglas** para VMs concretas repartidas por subredes → **ASG** como origen/destino (NICs de la **misma VNet**, no entre VNets emparejadas).
- Restringir puertos entre VMs de una misma VNet → **NSG** (Azure Firewall es para escala multi-VNet/salida).

→ [Grupos de seguridad de red](../../../knowledge/az104-network-security-groups.md)

## 15. ARM/Bicep: detalles de despliegue

**Fallos:** online 16, 35, 36 · sim 3: 27.

- **Varias instancias de un recurso en ARM** → elemento **`copy`** (en Bicep, bucle `for`).
- **Plantilla almacenada en un blob/GitHub** → `-TemplateUri` (PowerShell) / `--template-uri`; local → `-TemplateFile`; guardada como especificación → `-TemplateSpecId`.
- **Array como parámetro inline** → pasarla en el propio `--parameters` del comando de despliegue.
- **Grupo de recursos con Bicep** → `targetScope = 'subscription'` (los RG se despliegan a nivel de suscripción; sin esa línea falla).

→ [Plantillas ARM](../../../knowledge/az104-arm-templates.md)

---

## Técnica de examen

- **Multi-selección incompleta — tu fallo de técnica más caro** (sim 2: preguntas 10, 16, 27 y 32 falladas dejando opciones sin marcar): tica **exactamente** el número que piden. Si crees que sobra una, casi siempre te falta una — las válidas suelen venir en pareja de "hacer X + habilitar Y".
- **Descarta opciones inventadas:** "Cuarentena" en WAF, L2TP en P2S, "condición RBAC por hora", `az container update --image`, ASG entre VNets emparejadas. Eliminar lo inexistente = media respuesta.
- **"Mínimo esfuerzo administrativo" / "menor privilegio"** descarta casi siempre la opción con más piezas (dos servicios, runbooks, firewalls cuando basta un NSG o un rol integrado).
- **Caso práctico:** una vez cerrada la sección no se vuelve — lee el caso entero y responde todas sus preguntas antes de avanzar.

## Relámpago final

Doce preguntas de un vistazo — respóndelas de memoria y comprueba:

1. Acceso de un partner a storage que caduque solo en 24 h → **SAS**
2. ¿Quién consume licencia en licencias por grupo? → **solo miembros** (misma SKU de varios grupos = 1)
3. LB con distribución desigual → **desactivar la persistencia de sesión**
4. UDR `0.0.0.0/0` con próximo salto None → **black hole: sin salida a internet**
5. ¿Me bloquea un NSG y con qué regla? → **IP flow verify**
6. Métricas del SO invitado en Log Analytics → **AMA + regla de recopilación de datos**
7. Autoescala en plan Basic → **imposible: subir a Standard+**
8. ¿Cómo queda una GRS tras failover de cuenta? → **LRS**
9. Cambiar la imagen de un ACI en ejecución → **eliminar y recrear el grupo**
10. SAS de delegación de usuario firmada con… → **credenciales de Entra ID (solo Blob)**
11. Sobrevivir zona + región en storage → **GZRS**
12. ¿Mantener 99,9 % con mínimo coste? → **una VM con Premium SSD**

## Relacionado

- [Respuestas incorrectas de assessments online 1–8](respuestas-incorrectas-exam-online-1-8.md) — el detalle pregunta a pregunta
- [Simulacros de examen AZ-104](README.md) — los cinco simulacros y sus soluciones
- [Chuleta de identidad y gobernanza](../../../cheatsheets/az104-identity-governance.md) · [compute](../../../cheatsheets/az104-compute.md) · [storage](../../../cheatsheets/az104-storage.md)
- [AZ-104 — Índice de certificación](../INDEX.md)
