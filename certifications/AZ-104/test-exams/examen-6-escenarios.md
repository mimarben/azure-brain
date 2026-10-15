---
title: AZ-104 Simulacro 6 — Escenarios de redes y cómputo
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-15
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
  - certifications/AZ-104/test-exams/repaso-factores-fallo.md
---

# Simulacro 6 — Escenarios de redes y cómputo

**40 ítems · 100 minutos · libro cerrado.** Creado tras el suspenso del 08/10/2026 (531/1000): todo son **escenarios aplicados** ("una empresa tiene…, debes garantizar…, mínimo esfuerzo/coste") del estilo del examen real o superior, con los **pesos desviados deliberadamente** a las áreas débiles detectadas — Redes (24 ítems) y Procesos/disponibilidad (15 ítems) — en vez de los pesos oficiales del examen. Es la **puerta de salida** del [plan de reintento](../../../notes/AZ-104/plan-reintento.md): criterio para reservar, **≥ 80 % (32/40)**.

Incluye un **caso práctico** (preguntas 34–40): léelo entero antes de responder las suyas. Cada serie Sí/No son 3 ítems puntuables.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos/tres" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna; en la de ordenar escribe las letras. Al terminar, pide **«corrige el examen 6»** y se leerán tus marcas contra [examen-6-soluciones.md](examen-6-soluciones.md).

---

## Bloque A — Redes virtuales

**1.** *(Una respuesta)* Tienes un Standard Load Balancer público llamado LB1 con dos VMs en su pool de back-end. Ambas VMs tienen IP pública **Basic** asignada. Los usuarios no pueden alcanzar la aplicación a través de LB1 y en el pool todas las instancias aparecen con estado de sondeo correcto. ¿Cuál es la causa más probable?

- [ ] A. El sondeo de estado usa el puerto equivocado
- [ ] B. Las IP públicas Basic no son compatibles con un Load Balancer Standard — hay que crearlas de nuevo con SKU Standard
- [ ] C. Falta una regla de salida en LB1
- [ ] D. Las VMs deben estar en el mismo conjunto de disponibilidad

**2.** *(Una respuesta)* En una arquitectura hub-spoke, la subred del spoke `Workloads` tiene una UDR `0.0.0.0/0` con próximo salto = IP privada de la NVA `nva-01` (en el hub) para inspección de todo el tráfico saliente. Los clientes envían paquetes y llegan a `nva-01` (lo ves en sus contadores), pero nada sale a internet. La NVA está configurada correctamente como firewall. ¿Qué falta?

- [ ] A. Asociar la UDR también a la subred de la NVA
- [ ] B. Habilitar **IP forwarding** en la NIC de `nva-01`
- [ ] C. Crear un peering global entre hub y spoke
- [ ] D. Cambiar el próximo salto a `VirtualAppliance` en lugar de una IP

**3.** *(Una respuesta)* VNet1 (10.10.0.0/16) y VNet2 (10.20.0.0/16) están emparejadas. Debes **comprobar si el tráfico de VM1 hacia el prefijo 10.20.0.0/16 usa el peering como próximo salto**, viendo todas las rutas aplicables (sistema, peering y de usuario) con su tipo de próximo salto. ¿Qué usas?

- [ ] A. Connection troubleshooter de VM1 a VM2
- [ ] B. Next hop de Network Watcher para VM1
- [ ] C. **Rutas efectivas** (effective routes) de la interfaz de red de VM1
- [ ] D. Captura de paquetes en VM1

**4.** *(Una respuesta — exhibit)* Cuatro VMs. ¿A cuál se puede acceder desde internet por el puerto 80?

| VM | Subred | NSG de subred | NIC → NSG |
|---|---|---|---|
| VM1 | Subnet1 | NSG-S1: **permite** 80 | NSG-A: **permite** 80 |
| VM2 | Subnet1 | NSG-S1: permite 80 | NSG-B: **bloquea** 80 |
| VM3 | Subnet2 | NSG-S2: **bloquea** 80 | sin NSG |
| VM4 | Subnet2 | NSG-S2: bloquea 80 | sin NSG |

- [ ] A. Solo VM1
- [ ] B. VM1 y VM2
- [ ] C. VM1 y VM4
- [ ] D. VM1, VM2 y VM4

**5.** *(Una respuesta)* Una VNet con cuatro subredes. Dos VMs concretas en cada subred necesitan recibir tráfico entrante por TCP 8080; el NSG se asocia a cada subred. Necesitas el **menor número de reglas NSG** posible. ¿Qué usas como destino de la regla?

- [ ] A. Las direcciones IP públicas de las VMs
- [ ] B. Las cuatro subredes
- [ ] C. Un **grupo de seguridad de aplicaciones (ASG)** con las NICs de las ocho VMs
- [ ] D. La etiqueta de servicio `Internet`

**6.** *(Una respuesta)* Tu red local se conecta a Azure por **ExpressRoute**. Los usuarios on-prem deben acceder a una cuenta de almacenamiento `docs` alcanzándola por **IP privada** y sin que exista endpoint público. ¿Qué implementas?

- [ ] A. Un endpoint de servicio (service endpoint) en la subred
- [ ] B. Un **private endpoint** + zona DNS privada
- [ ] C. Reglas de firewall de la cuenta con los rangos públicos on-prem
- [ ] D. Una SAS de lectura para los usuarios

**7.** *(Elige dos)* Los nombres internos de las VMs de VNet1 deben **registrarse automáticamente** en la zona DNS privada `contoso.com`, y las VMs de VNet2 (emparejada) deben poder **resolverlos**. ¿Qué dos acciones?

- [ ] A. Crear un vínculo de VNet de `contoso.com` a VNet1 **con registro automático habilitado**
- [ ] B. Crear un vínculo de VNet de `contoso.com` a VNet2 (sin registro automático)
- [ ] C. Desplegar una VM con DNS server y apuntar ambas VNets a ella
- [ ] D. Usar la resolución de nombres proporcionada por Azure

**8.** *(Elige dos)* Configuras una VPN **de punto a sitio (P2S)** con autenticación de certificados. Los clientes usan Windows **y Linux**. ¿Qué protocolos puedes usar?

- [ ] A. SSTP
- [ ] B. IKEv2
- [ ] C. OpenVPN
- [ ] D. L2TP/IPsec

**9.** *(Una respuesta)* `spoke-prod` y `spoke-dev` están emparejadas solo con el hub. Una aplicación necesita que ambas spokes se comuniquen con la **menor latencia posible**. El peering no es transitivo. ¿Qué haces?

- [ ] A. Crear un **peering directo** entre `spoke-prod` y `spoke-dev`
- [ ] B. Una UDR en cada spoke que envíe el tráfico al firewall del hub
- [ ] C. Una VPN gateway en cada spoke
- [ ] D. Emparejar cada spoke con todas las VNets de la organización

**10.** *(Una respuesta)* Detrás de un Load Balancer, cuatro VMs sirven una web. Los usuarios informan de que **algunas VMs reciben mucho más tráfico** que otras y la carga está desigual. ¿Qué cambias?

- [ ] A. Habilitar la persistencia de sesión (afinidad por IP de origen)
- [ ] B. **Deshabilitar** la persistencia de sesión (distribución por hash de 5 tuplas)
- [ ] C. Subir la SKU del Load Balancer
- [ ] D. Añadir una regla NAT de entrada

**11.** *(Una respuesta)* VMs en el pool de back-end de un Standard Load Balancer **no tienen salida a internet** y necesitas darles salida con una **IP fija y máximo presupuesto de puertos SNAT**, con el menor esfuerzo. ¿Qué asocias a la subred?

- [ ] A. Una regla de salida en el Load Balancer con IP pública nueva
- [ ] B. Un **Azure NAT Gateway**
- [ ] C. IP pública a cada VM del pool
- [ ] D. Un Application Gateway

**12.** *(Una respuesta)* Application Gateway con un url path map: `/images` → pool2, `/video` → pool3. Llega una petición de `/api/orders` que no coincide con ninguna regla de ruta. ¿Qué ocurre?

- [ ] A. Devuelve 404
- [ ] B. Va al **pool de back-end por defecto** del url path map
- [ ] C. Se descarta la conexión
- [ ] D. Se redirige al listener HTTPS

**13.** *(Una respuesta)* Debes conectarte por RDP/SSH a VMs de producción **sin exponer los puertos al internet** y usando el navegador, con mínimo esfuerzo administrativo. ¿Qué despliegas?

- [ ] A. Azure Virtual Desktop
- [ ] B. Azure Bastion
- [ ] C. Una VM jumpbox con IP pública
- [ ] D. Azure Firewall con DNAT

**14.** *(Una respuesta)* 500 VMs; `VM501` no puede comunicar con `VM20` y sospechas de un NSG. Debes **identificar si un NSG bloquea la comunicación y qué regla concreta**, con el menor esfuerzo. ¿Qué usas?

- [ ] A. Captura de paquetes de Network Watcher
- [ ] B. **IP flow verify** de Network Watcher
- [ ] C. Los registros de flujo de NSG
- [ ] D. Connection Monitor

**15.** *(Una respuesta)* Las VMs de una subred deben alcanzar **Azure Storage** por la red troncal de Azure (sin salir a internet), solo desde esa VNet, **sin coste añadido** y sin IP privadas. ¿Qué configuras?

- [ ] A. Un **endpoint de servicio** `Microsoft.Storage` en la subred
- [ ] B. Un private endpoint por cuenta de almacenamiento
- [ ] C. Un NAT Gateway en la subred
- [ ] D. Un Azure Firewall con reglas FQDN de salida

## Bloque B — Procesos y disponibilidad

**16.** *(Una respuesta)* Cuatro VMs de una app crítica en una región. La dirección exige que la app sobreviva al **fallo completo de un bastidor (rack) del centro de datos** de Azure. ¿Qué opción de disponibilidad eliges al crear las VMs?

- [ ] A. Zonas de disponibilidad
- [ ] B. **Conjunto de disponibilidad** (dominios de error)
- [ ] C. SLA por defecto de VM única con Premium SSD
- [ ] D. Azure Site Recovery

**17.** *(Una respuesta)* Un conjunto de disponibilidad en Este de EE. UU. con **15 VMs, 3 dominios de error (FD) y 10 dominios de actualización (UD)**. Microsoft ejecuta **mantenimiento planeado** (por UD). ¿Cuántas VMs como máximo estarán no disponibles a la vez?

- [ ] A. 5
- [ ] B. 2
- [ ] C. 10
- [ ] D. 15

**18.** *(Una respuesta)* Una app web debe ofrecer **99,99 %** de SLA en una región con varias VMs detrás de un balanceador. ¿Qué arquitectura la consigue?

- [ ] A. Dos VMs en un conjunto de disponibilidad + Load Balancer
- [ ] B. Una VM por zona de disponibilidad (2+ zonas) detrás de un Load Balancer
- [ ] C. Una sola VM grande con discos Premium SSD (99,9 %) y zona DNS
- [ ] D. Una VM con réplica en frío en otra región

**19.** *(Una respuesta)* Un VMSS desplegado en tres zonas. Durante una rebaja de capacidad de una zona, Azure quitó instancias solo de dos zonas y la distribución quedó desequilibrada. Quieres que **siempre se mantenga el reparto equilibrado entre zonas**, incluso esperando por capacidad. ¿Qué propiedad activas?

- [ ] A. `singlePlacementGroup: true`
- [ ] B. `zoneBalance: true`
- [ ] C. `overprovision: true`
- [ ] D. `upgradePolicy: Automatic`

**20.** *(Elige dos)* Evaluas usar VMs **Spot**. ¿Qué **dos** factores pueden provocar el desalojo de una instancia Spot?

- [ ] A. Que Azure necesite la **capacidad** para cargas de pago por uso
- [ ] B. Que el **precio** Spot supere tu precio máximo
- [ ] C. La media de uso de CPU de la instancia
- [ ] D. La duración de la instancia (máximo 24 h)

**21.** *(Una respuesta)* Recibes aviso de que tu VM se verá afectada por **mantenimiento del host físico**. Debes moverla a otro host del mismo centro de datos. ¿Qué haces?

- [ ] A. Volver a implementar (**Redeploy**)
- [ ] B. Aplicar una directiva de Azure Policy de mantenimiento
- [ ] C. Redimensionar la VM
- [ ] D. Mover la VM a otro grupo de recursos

**22.** *(Una respuesta)* Debes **cambiar 30 VMs de región** (de Oeste de Europa a Norte de Europa) conservando recursos y configuración. ¿Qué usas?

- [ ] A. Azure Site Recovery planificado
- [ ] B. **Azure Resource Mover**
- [ ] C. Mover los grupos de recursos a la otra región
- [ ] D. Capturar imágenes y redesplegar a mano

**23.** *(Una respuesta)* Necesitas crear una imagen de una VM **unida al dominio** para clonarla **sin ejecutar Sysprep** (conservando la unión). ¿Qué haces?

- [ ] A. Compute Gallery con versión de imagen `osState: Specialized`
- [ ] B. Compute Gallery con `osState: Generalized`
- [ ] C. Snapshot del disco OS y crear VM desde él
- [ ] D. Exportar la VM a VHDs y subirla a otra región

**24.** *(Una respuesta)* Una regla de autoescala añade 1 instancia cuando CPU > 75 %, con **enfriamiento (cooldown) de 5 minutos**. La CPU se mantiene por encima del 75 % durante 30 minutos. ¿Qué hace la regla?

- [ ] A. Añade una sola instancia y espera a que la CPU baje
- [ ] B. **Se vuelve a disparar tras cada cooldown** mientras se cumpla la condición (≈1 instancia cada 5 minutos)
- [ ] C. Añade instancias hasta el máximo de una sola vez
- [ ] D. Se desactiva tras el primer disparo

**25.** *(Una respuesta)* Debes mover un disco de datos de VM1 a VM2 **lo antes posible**. VM1 está en ejecución. ¿Qué haces primero?

- [ ] A. Detener VM1
- [ ] B. **Desasociar el disco de VM1** (se puede en caliente) y asociarlo a VM2
- [ ] C. Hacer snapshot del disco y crear una copia
- [ ] D. Detener ambas VMs

## Bloque C — Series Sí/No

**26–28.** *(Serie Sí/No — 3 ítems)* Sobre peering y seguridad de red:

| # | Afirmación | Sí | No |
|---|---|---|---|
| 26 | Si VNet1 se empareja con el hub y VNet2 se empareja con el hub, VNet1 y VNet2 se comunican automáticamente a través del hub | [ ] | [ ] |
| 27 | El peering global de VNets (entre regiones) viaja por la red troncal de Microsoft, no por internet público | [ ] | [ ] |
| 28 | Un NSG se puede asociar directamente a una red virtual completa | [ ] | [ ] |

**29–31.** *(Serie Sí/No — 3 ítems)* Sobre disponibilidad de cómputo:

| # | Afirmación | Sí | No |
|---|---|---|---|
| 29 | Una VM existente puede cambiar de zona de disponibilidad sin volver a crearla | [ ] | [ ] |
| 30 | Un conjunto de disponibilidad protege frente al fallo completo de un centro de datos de Azure | [ ] | [ ] |
| 31 | En un VMSS con orquestación flexible, las instancias se reparten automáticamente entre dominios de error | [ ] | [ ] |

## Bloque D — Ordenar y exhibit

**32.** *(Ordenar)* Estableces conectividad S2S entre VNet1 y tu red local. Escribe la secuencia correcta (ej. `B → A → D → C`):

- A. Crear la conexión (Connection)
- B. Crear la **GatewaySubnet** en VNet1
- C. Crear la **puerta de enlace de red local** (local network gateway) con el prefijo on-prem
- D. Crear la **VPN Gateway** en VNet1

Secuencia: ______________________________

**33.** *(Una respuesta — exhibit)* Un VMSS tiene esta configuración:

```json
"zones": [ "1", "2" ],
"properties": {
  "zoneBalance": true,
  "singlePlacementGroup": false
}
```

¿Qué garantiza esta configuración?

- [ ] A. Distribución estricta y equilibrada entre las zonas 1 y 2 (esperando por capacidad antes que desequilibrar) y posibilidad de escalar por encima de 100 instancias
- [ ] B. Solo 100 instancias en total, repartidas en dos zonas
- [ ] C. Las instancias se crean en una zona y conmutan a la otra por error manualmente
- [ ] D. El balance de zonas solo aplica durante el escalado automático

## Bloque E — Caso práctico (34–40)

> **Contoso Logistics.** Sede central en Fráncfort conectada a Azure por **ExpressRoute** hacia un hub VNet `hub-weu` (10.0.0.0/16, Oeste de Europa) con Azure Firewall y la puerta de enlace de ExpressRoute. Dos spokes emparejadas solo con el hub: `prod-weu` (10.1.0.0/16) y `dev-weu` (10.2.0.0/16). La app **ShipTrack** corre en 6 VMs Ubuntu en `prod-weu` detrás de un Standard Load balancer; la documentación vive en la cuenta de almacenamiento `stdocs`; el dominio interno es `contoso.com` (zona DNS privada ya creada y vinculada a `dev-weu`). Requisitos: la app debe tolerar fallos de zona, los usuarios on-prem deben acceder a ella, y el coste administrativo debe ser mínimo.

**34.** *(Una respuesta)* ShipTrack debe seguir en servicio si falla **una zona de disponibilidad completa** de Oeste de Europa, con las 6 VMs y el menor coste. ¿Qué haces?

- [ ] A. Repartir las 6 VMs entre las zonas de disponibilidad (p. ej. 2-2-2) detrás del Load Balancer
- [ ] B. Crear un conjunto de disponibilidad con 6 dominios de error
- [ ] C. Mantener las VMs en una zona y una segunda VM en otra región con Azure Traffic Manager
- [ ] D. Réplica asíncrona de las VMs a `dev-weu`

**35.** *(Elige dos)* Los usuarios de Fráncfort deben alcanzar las VMs de `prod-weu` **a través de la puerta de enlace ExpressRoute del hub**. ¿Qué dos configuraciones?

- [ ] A. En el peering **hub → prod**: **permitir tránsito de puerta de enlace** (allow gateway transit)
- [ ] B. En el peering **prod → hub**: **usar las puertas de enlace remotas** (use remote gateways)
- [ ] C. Crear una VPN gateway adicional en `prod-weu`
- [ ] D. Habilitar el tránsito permitido solo en el lado hub

**36.** *(Una respuesta)* Los nombres de las 6 VMs de `prod-weu` deben **registrarse automáticamente** en `contoso.com` (la zona ya está vinculada a `dev-weu`). ¿Qué haces?

- [ ] A. Crear un vínculo de VNet de `contoso.com` a `prod-weu` **con registro automático habilitado**
- [ ] B. Crear registros A a mano para las 6 VMs
- [ ] C. Apuntar `prod-weu` al DNS personalizado 168.63.129.16
- [ ] D. Crear una zona pública contoso.com

**37.** *(Una respuesta)* `stdocs` debe ser accesible **solo** desde `prod-weu` y desde la red de Fráncfort (vía ExpressRoute), sin endpoint público. ¿Qué implementas?

- [ ] A. Endpoint de servicio en la subred de las VMs
- [ ] B. **Private endpoint** para `stdocs` (subred de `prod-weu`) + zona DNS privada `privatelink.blob.core.windows.net`
- [ ] C. Firewall de la cuenta con los rangos IP públicos de Fráncfort
- [ ] D. Reglas de NSG en la subred bloqueando internet

**38.** *(Elige tres)* Usuarios reportan **errores intermitentes** accediendo a ShipTrack. El SO de las VMs está sano. ¿Qué **tres** cosas revisas?

- [ ] A. La **configuración del sondeo de estado** (puerto, ruta, intervalo) del Load Balancer
- [ ] B. Que las VMs **escuchan en el puerto del sondeo** (p. ej. `netstat -an`)
- [ ] C. Que las **reglas NSG** permiten el tráfico del sondeo y del balanceador
- [ ] D. La persistencia de sesión de la regla de equilibrio
- [ ] E. La SKU del disco de datos de las VMs

**39.** *(Una respuesta)* Dos administradores desde Fráncfort necesitan **SSH** a VMs de `dev-weu` sin exponer puertos públicos y con mínimo esfuerzo. ¿Qué despliegas?

- [ ] A. Azure Bastion en el hub (`hub-weu`) — funciona también con VMs de VNets emparejadas
- [ ] B. Una jumpbox con IP pública en cada spoke
- [ ] C. Just-in-Time VM Access
- [ ] D. Una VPN P2S para los dos administradores

**40.** *(Elige dos)* Debes recolectar **CPU y memoria vistas desde dentro del SO** de las 6 VMs en un workspace de Log Analytics. ¿Qué dos cosas?

- [ ] A. Instalar el **agente de Azure Monitor (AMA)** en las VMs
- [ ] B. Crear una **regla de recopilación de datos (DCR)** con los contadores a recolectar
- [ ] C. Crear una configuración de diagnóstico por VM
- [ ] D. Instalar el agente Dependency Agent en las 6 VMs

---

*Hecho el examen: pide «corrige el examen 6» para puntuarlo contra las soluciones con desglose por dominio.*
