---
title: AZ-104 Simulacro 6 — Soluciones
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-15
sources:
  - certifications/AZ-104/test-exams/examen-6-escenarios.md
---

# Soluciones — Simulacro 6 (escenarios de redes y cómputo)

## Tabla de respuestas

| # | Resp. | # | Resp. | # | Resp. | # | Resp. |
|---|---|---|---|---|---|---|---|
| 1 | B | 11 | B | 21 | A | 31 | Sí |
| 2 | B | 12 | B | 22 | B | 32 | B → D → C → A |
| 3 | C | 13 | B | 23 | A | 33 | A |
| 4 | A | 14 | B | 24 | B | 34 | A |
| 5 | C | 15 | A | 25 | B | 35 | A + B |
| 6 | B | 16 | B | 26 | No | 36 | A |
| 7 | A + B | 17 | B | 27 | Sí | 37 | B |
| 8 | B + C | 18 | B | 28 | No | 38 | A + B + C |
| 9 | A | 19 | B | 29 | No | 39 | A |
| 10 | B | 20 | A + B | 30 | No | 40 | A + B |

**Puntuación:** 1 punto por ítem (las series cuentan 3). **Puerta de salida del reintento: ≥ 32/40 (80 %)** — el 70 % (28) es el mínimo de "aprobado", pero este simulacro está calibrado con las áreas débiles y con pesos sesgados a favor de Redes, así que exigir 80 % aquí es la señal correcta antes de pagar otros 152 €.

## Autoevaluación por dominio

| Dominio | Preguntas | Aciertos |
|---|---|---|
| Redes virtuales (sesgo deliberado: 24 ítems) | 1–15, 26–28, 32, 35–39 | ___ / 24 — fallos: |
| Procesos (sesgo deliberado: 15 ítems) | 16–25, 29–31, 33, 34 | ___ / 15 — fallos: |
| Supervisión (1 ítem) | 40 | ___ / 1 — |

Si Redes queda por debajo de 17/24, vuelve a la Fase 1–2 del [plan de reintento](../../../notes/AZ-104/plan-reintento.md) (labs 04–06 + páginas de red) antes de repetir.

## Explicaciones

### Bloque A — Redes

1. **B.** Las IP públicas **Basic y Standard no se mezclan**: un Standard Load Balancer exige IPs y pools Standard. El sondeo está bien (el estado es correcto); es la **SKU coincidente** lo que rompe la conectividad. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
2. **B.** La UDR ya lleva el tráfico a la NVA (los contadores lo prueban); lo que falta es que la NIC de la NVA **acepte reenviar paquetes que no son suyos**: IP forwarding en su NIC. Sin eso, el paquete llega y muere. Ver [rutas](../../../knowledge/az104-user-defined-routes.md).
3. **C.** **Rutas efectivas** en la NIC muestra *todas* las rutas (sistema, peering, UDR) con su próximo salto — exactamente lo pedido. Next hop dice a dónde va **un destino concreto**, no la tabla; Connection troubleshoot prueba reachability, no routing. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).
4. **A.** Subred y NIC se **intersectan**: si cualquiera deniega, no pasa. VM1: ambos permiten → accesible. VM2: NSG-B bloquea en NIC. VM3 y VM4: la subred bloquea. Ver [NSG](../../../knowledge/az104-network-security-groups.md).
5. **C.** Un **ASG** agrupa las NICs (misma VNet) y vale como destino de una única regla para las 8 VMs, estén en la subred que estén. Por IPs: 8 reglas. Por subredes: 4 reglas y además abre de más. Ver [NSG](../../../knowledge/az104-network-security-groups.md).
6. **B.** Desde **on-prem por ExpressRoute**, el service endpoint no aplica (solo optimiza tráfico originado *dentro* de la VNet). Para alcanzar PaaS **por IP privada desde híbrido**: private endpoint + su zona DNS privada (`privatelink.*`). Ver [Private Endpoints](../../../knowledge/private-endpoints.md).
7. **A + B.** El **registro automático** se habilita en el **vínculo de VNet** de la zona privada (A) y para que otra VNet resuelva basta su vínculo sin registro (B). La resolución proporcionada por Azure no cruza VNets con dominio propio. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).
8. **B + C.** Multiplataforma (Windows **y** Linux) con certificados: **IKEv2 y OpenVPN**. SSTP es solo Windows y **L2TP no existe** en P2S de Azure — opción inventada para descartar. Ver [peering](../../../knowledge/az104-vnet-peering.md).
9. **A.** El peering directo entre spokes es la opción de **menor latencia** (sin salto intermedio). La UDR por el hub funciona pero añade un hop y gestión; gateways por spoke, coste; full-mesh, no escala. Ver [Hub-Spoke](../../../knowledge/hub-spoke.md).
10. **B.** Distribución desigual = **afinidad activada**; el hash de 5 tuplas (persistencia deshabilitada) reparte uniformemente. Es el espejo del caso contrario (cliente siempre al mismo servidor → activarla). Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
11. **B.** **NAT Gateway** es la salida recomendada de Standard LB: IP de salida fija, máximo SNAT y desacoplado del LB. La regla de salida también da salida, pero con menos SNAT y acoplada al LB. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
12. **B.** Lo que no matchea ninguna regla de ruta va al **pool por defecto** del url path map. No hay 404. Ver [Application Gateway](../../../knowledge/az104-application-gateway.md).
13. **B.** **Bastion**: RDP/SSH desde el navegador sin exponer puertos ni IP públicas, gestionado. AVD es escritorio virtual, no administración puntual. Ver [lab de red](../../../labs/AZ-104/README.md).
14. **B.** **IP flow verify** es la herramienta exacta "¿me bloquea un NSG y con qué regla?" (5-tupla contra las reglas efectivas). La captura graba, no razona; los flow logs requieren configuración y análisis manual. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).
15. **A.** **Service endpoint**: acceso a PaaS por la troncal, gratis, identidad de la VNet en el firewall de la cuenta — cuando el origen es solo la VNet. El private endpoint (B) es para cuando necesitas IP privada/acceso híbrido (compárala con la 6 — esa es la pareja de examen). Ver [Private Endpoints](../../../knowledge/private-endpoints.md).

### Bloque B — Procesos

16. **B.** Ojo al enunciado: **bastidor** (rack) = dominio de error → **conjunto de disponibilidad**. Las zonas serían para fallo del centro de datos completo (compara con la 34 del caso práctico — esa es la pareja de examen). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
17. **B.** Mantenimiento planeado = por **UD**: 15 VMs en 10 UD → como máximo ⌈15/10⌉ = **2** a la vez. Si fuera fallo de bastidor (FD): 15/3 = 5. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
18. **B.** **99,99 %** = VMs repartidas por **zonas de disponibilidad** detrás de un balanceador. Set = 99,95; VM única con Premium SSD = 99,9 (la respuesta "mínimo coste" de otras variantes — aquí piden 99,99). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
19. **B.** `zoneBalance: true` fuerza reparto estricto entre las zonas del VMSS (espera por capacidad en la zona antes que romper el equilibrio). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
20. **A + B.** Desalojo por **capacidad** o por **precio** (superar tu máximo). Nunca por uso de CPU; Spot no tiene límite de 24 h (eso era el antiguo modelo de VM efímeras). Ver [VMs](../../../knowledge/az104-virtual-machines.md).
21. **A.** **Redeploy** apaga la VM y la recoloca en otro host del mismo DC. Policy no mueve nada; resize cambia de hardware pero no es la acción de mantenimiento. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
22. **B.** **Azure Resource Mover** mueve VMs (y más) entre regiones. Mover el RG no cambia la región (el RG no tiene región). Ver [VMs](../../../knowledge/az104-virtual-machines.md).
23. **A.** Sin Sysprep conservando el estado (unión a dominio incluida) = imagen **Specialized** en Compute Gallery. Generalized exige Sysprep. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
24. **B.** Mientras la métrica siga cumpliendo la condición, la regla **se dispara de nuevo tras cada cooldown** — no es un disparo único (4 → 6 → 8 instancias…). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
25. **B.** Los discos se pueden **desasociar en caliente** de una VM en ejecución: desasociar y asociar a VM2. Nada que detener. Ver [VMs](../../../knowledge/az104-virtual-machines.md).

### Bloque C — Series

26. **No.** El peering **no es transitivo**: hub-vinculado no implica spoke↔spoke; hay que emparejar directamente o enrutar por NVA.
27. **Sí.** El peering global (cross-región) viaja por la **red troncal de Microsoft**. Ver [peering](../../../knowledge/az104-vnet-peering.md).
28. **No.** NSG se asocia a **subred o NIC**, nunca a la VNet. Ver [NSG](../../../knowledge/az104-network-security-groups.md).
29. **No.** La zona de una VM se fija al crearla: moverla de zona = **recrearla/redeploy** (Resource Mover, imagen, etc.).
30. **No.** El set protege dentro de un **único** centro de datos (bastidores FD / hosts UD). Fallo de DC completo = **zonas**. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
31. **Sí.** La orquestación **flexible** reparte instancias entre dominios de error automáticamente (best effort dentro de la región/zonas elegidas). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).

### Bloque D

32. **B → D → C → A.** GatewaySubnet → VPN Gateway → puerta de enlace de red local → conexión. Sin GatewaySubnet no existe donde alojar la gateway; la conexión es lo último, cuando existen los dos extremos.
33. **A.** `zones: [1,2]` + `zoneBalance: true` = equilibrio estricto entre esas zonas; `singlePlacementGroup: false` = el VMSS puede **superar las 100 instancias** (agrupación en múltiples grupos de colocación). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).

### Bloque E — Caso Contoso Logistics

34. **A.** Fallo de **zona completa** → repartir las VMs entre zonas detrás del LB (99,99 con LB). El set no protege de zona (pregunta 30); multi-región es más de lo pedido. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
35. **A + B.** La pareja inseparable: **allow gateway transit** (lado hub) + **use remote gateways** (lado spoke). Con solo una de las dos no fluye. Ver [Hub-Spoke](../../../knowledge/hub-spoke.md) y [peering](../../../knowledge/az104-vnet-peering.md).
36. **A.** El registro automático se configura en el **vínculo de VNet** de la zona privada a `prod-weu` (la zona ya está vinculada a `dev-weu`, que seguirá resolviendo). Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).
37. **B.** Solo `prod-weu` + on-prem por ExpressRoute sin endpoint público = **private endpoint** + zona `privatelink.blob.core.windows.net` (el service endpoint no cubre el acceso híbrido — pregunta 6). El firewall por IP públicas deja el endpoint público vivo. Ver [Private Endpoints](../../../knowledge/private-endpoints.md).
38. **A + B + C.** Errores intermitentes con SO sano = problema de **sondeo/equilibrio**: configuración del sondeo, el servicio escuchando en el puerto del sondeo, y NSG permitiendo el tráfico. La persistencia (D) no da errores intermitentes por sí sola y la SKU del disco (E) no afecta al sondeo. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
39. **A.** **Bastion en el hub**: da RDP/SSH por navegador a VMs de **VNets emparejadas** (las spokes) sin IP públicas — una sola instancia para toda la topología. JIT sigue necesitando IP pública; jumpbox por spoke es más esfuerzo y más exposición. Ver [Hub-Spoke](../../../knowledge/hub-spoke.md).
40. **A + B.** Métricas del **SO invitado** → **AMA + regla de recopilación de datos (DCR)**. Las configuraciones de diagnóstico solo llevan métricas de plataforma; el Dependency Agent es para el mapa de dependencias de VM insights. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).

## Relacionado

- [Simulacro 6 — enunciado](examen-6-escenarios.md)
- [Plan de reintento](../../../notes/AZ-104/plan-reintento.md) — criterios de salida
- [Repaso por factores de fallo](repaso-factores-fallo.md)
