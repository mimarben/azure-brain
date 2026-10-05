---
title: AZ-104 Simulacro 2 — Soluciones
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-05
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Soluciones — Simulacro 2 (intermedio)

## Tabla de respuestas

| # | Resp. | # | Resp. | # | Resp. | # | Resp. |
|---|---|---|---|---|---|---|---|
| 1 | B | 9 | B | 17 | B | 25 | B |
| 2 | B | 10 | A + B | 18 | B | 26 | a Sí · b No · c No |
| 3 | C | 11 | A | 19 | B | 27 | A + B |
| 4 | B | 12 | A | 20 | B | 28 | B → C → D → A |
| 5 | A | 13 | a No · b Sí · c Sí | 21 | a No · b Sí · c Sí | 29 | A |
| 6 | B | 14 | A | 22 | B | 30 | B |
| 7 | B | 15 | B | 23 | B | 31 | A |
| 8 | a Sí · b Sí · c No | 16 | B + C | 24 | B | 32 | A + B + C |

**Puntuación:** 23 / 40 (57,5 %). Aprobado ≥ 28 (70 %) — **no superado**. Para convertir mentalmente a la escala real: tu % × 1000 ≈ tu puntuación en la escala del examen (700 = aprobado).

## Autoevaluación por dominio

| Dominio | Preguntas | Aciertos |
|---|---|---|
| Identidades y gobernanza (20–25 %) | 1, 6, 8, 15, 20, 27, 30 | 7 / 9 — fallos: 8b, 27 |
| Almacenamiento (15–20 %) | 2, 7, 12, 13, 18, 24 | 3 / 8 — fallos: 7, 12, 13a, 13b, 24 ⚠ |
| Procesos (20–25 %) | 3, 9, 14, 19, 21, 25, 31 | 5 / 9 — fallos: 3, 9, 14, 25 |
| Redes virtuales (15–20 %) | 4, 10, 16, 22, 26, 28 | 4 / 8 — fallos: 10, 16, 22, 28 |
| Supervisión y mantenimiento (10–15 %) | 5, 11, 17, 23, 29, 32 | 4 / 6 — fallos: 5, 32 |

## Explicaciones

1. **B — Virtual Machine Contributor.** Gestiona el ciclo de vida de las VMs pero **sin acceso al sistema operativo invitado** (no RDP/consola serie) ni gestión de RBAC. Contributor en la suscripción se pasa de amplio. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).
2. **B — RA-GRS.** El endpoint `-secondary` de solo lectura está disponible sin failover cuando la cuenta es RA-GRS (o RA-GZRS). GRS solo replica; el secundario no es legible sin failover.
3. **C.** Con CPU > 75 % y regla de escala +2/cooldown 5 min, se añaden 2 instancias **cada ciclo de 5 minutos** hasta llegar al máximo (8). La B describe un trigger único; la D ignora el cooldown y el incremento gradual.
4. **B.** El NSG procesa por **prioridad ascendente** y aplica la primera regla que coincide: 100 deniega RDP de internet antes de evaluar la 200. Ver [NSGs](../../../knowledge/az104-network-security-groups.md).
5. **A — regla de procesamiento de alertas.** Suprime (o aplica grupos de acciones) a una programación/horario sin tocar las reglas de alerta. Reutilizable y aplicable por ámbito.
6. **B — bloqueo Delete.** `CanNotDelete` impide eliminar pero permite modificar. ReadOnly también bloquearía los cambios de configuración, que sí deben seguir siendo posibles.
7. **B — GZRS.** ZRS (zonas en primaria) + GRS (región secundaria). GRS no protege del fallo de zona en primaria; ZRS no protege del fallo de región. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).
8. **a Sí · b Sí · c No.** Con PHS, el writeback sincroniza el cambio de vuelta al AD local (si no, la vieja contraseña on-prem sobreescribiría). Los roles de administrador siempre requieren **dos** métodos. SSPR requiere licencia Entra ID P1 (gratis solo en las licencias de pago de M365, no el nivel gratuito de Entra ID). Ver [SSPR](../../../knowledge/az104-sspr.md).
9. **B.** Trampa clásica: una única VM con **todos los discos Premium SSD** ya tiene SLA del 99,9 % y es la opción más barata que lo cumple. La 9A (Standard HDD) no alcanza ese SLA y las C/D cuestan el doble o más de lo exigido. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
10. **A + B.** UDRs en los spokes apuntando al NVA + **IP forwarding** en la NIC del NVA (si no, descarta los paquetes que no van dirigidos a él). El peering no es transitivo; Azure Firewall por spoke es otra solución, no un requisito de esta arquitectura. Ver [rutas definidas por el usuario](../../../knowledge/az104-user-defined-routes.md).
11. **A — Metrics Explorer.** Las métricas de plataforma se retienen **93 días**: suficiente para 90. `Perf` (Logs) retiene 30 días por defecto y requeriría tabla/agentes. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).
12. **A.** El prefijo `logs/` aplica recursivamente; a los 30 días sin modificación pasa a Cool (45 > 30 y < 90 → Cool). `images/` no matchea el prefijo → no se toca. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
13. **a No · b Sí · c Sí.** La SAS de delegación de usuario se firma con credenciales **Entra ID**, no con la clave de cuenta (esa es su ventaja). La directiva de acceso almacenado es el mecanismo de revocación de las SAS de servicio. La SAS de cuenta abarca varios servicios; la de servicio, solo uno. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).
14. **A — Azure Resource Mover.** Orquesta el movimiento entre regiones (preparar → mover → confirmar). Conlleva downtime: las VMs se desasignan durante el proceso. ASR es para DR, no para mudanzas planeadas.
15. **B — iniciativa con Deny + Audit.** Deny bloquea el despliegue de recursos no conformes; Audit marca los existentes sin bloquear. Agrupadas en una iniciativa se asignan juntas. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).
16. **B + C.** IKEv2 (multiplataforma, UDP) y OpenVPN (TLS, atraviesa firewalls fácilmente). **SSTP es solo Windows** — trampa del examen. L2TP no es protocolo P2S de Azure.
17. **B.** `summarize avg() by` + `bin(TimeGenerated, 1h)` = media por recurso y por bucket horario. No hay `where` de umbral (C) ni `count()` (D).
18. **B — private endpoint.** Da al servicio una IP privada dentro de tu VNet (tráfico por la red troncal de Azure). El **service endpoint** sigue usando la IP pública del servicio (solo la identifica como de tu VNet) — es la distinción estrella del examen. Ver [private endpoints](../../../knowledge/private-endpoints.md).
19. **B.** Un grupo de contenedores = un host lógico: los contenedores comparten red (misma IP; por eso puertos distintos: 80 y 8081), ciclo de vida y volúmenes. Se define con YAML multi-contenedor. Ver [ACI](../../../knowledge/az104-container-instances.md).
20. **B.** Sin licencia, el usuario pasa al estado sin licencia con **30 días de gracia** de datos antes de que entre en modo de solo lectura/eliminación. Ver [identidades](../../../knowledge/az104-identities.md).
21. **a No · b Sí · c Sí.** Free no soporta slots (se necesitan niveles de pago; Standard 5, Premium 20). El enrutamiento de % de tráfico y los valores sticky son características de slots en Standard+. Ver [App Service](../../../knowledge/az104-app-service.md).
22. **B — ExpressRoute.** Conectividad privada dedicada que no atraviesa internet. La SKU de VPN más alta sigue siendo VPN sobre internet. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).
23. **B — test failover.** Crea copias aisladas en una red de prueba sin tocar la replicación ni producción. Es exactamente el caso de uso de la prueba de DR.
24. **B — `azcopy copy`.** Entre dos URIs de Azure con SAS hace **copia del lado del servidor** (los datos no bajan a tu máquina). `sync` además **borra** en destino lo que no existe en origen y es para mantener sincronizados dos árboles ya relacionados. Ver [Azure Files](../../../knowledge/az104-azure-files.md).
25. **B.** Identidad administrada asignada al grupo de contenedores + rol **AcrPull** en el registro: pull sin credenciales en claro. Ver [ACI](../../../knowledge/az104-container-instances.md).
26. **a Sí · b No · c No.** La resolución se extiende a VNets vinculadas (emparejadas incluidas, vinculándolas). El auto-registro solo crea registros de las VMs en VNets vinculadas **con registro habilitado**. SOA/NS de la raíz no se pueden eliminar. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).
27. **A + B.** Asignación **elegible** (debes activar para tener el rol) + aprobación + MFA al activar = elevación just-in-time controlada. La C deja el rol activo permanentemente entre activaciones. Requiere P2.
28. **B → C → D → A.** GatewaySubnet (la VNet ya existe) → puerta de enlace VPN → puerta de enlace de red local (define on-prem) → conexión entre ambas. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).
29. **A — Azure Update Manager.** Implementaciones de actualizaciones programadas y recurrentes con anillos (piloto → producción), sin agentes de Automation heredados ni trabajo manual.
30. **B — presupuesto + grupo de acciones.** Los presupuestos disparan notificaciones a umbrales (p. ej. 50/75/90/100 %) contra coste real o previsto. Las métricas de coste no son métricas de recurso alertables así.
31. **A — ADE.** `az vm encryption enable --disk-encryption-keyvault` cifra SO y datos con claves custodiadas en tu Key Vault (BitLocker/dm-crypt en el invitado). La B es SSE (plataforma, sin KV tuyo); la C es el mecanismo para CMK de discos gestionados (otra cosa); la D cifra en el host físico. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
32. **A + B + C.** Destinos: Log Analytics, Storage, Event Hub (y destinos de partner). **Application Insights no es destino de configuración de diagnóstico** (es para apps, ingiere su propia telemetría).

## Registro de intentos

| Fecha | Nota | Dominio más débil | Acción de repaso |
|---|---|---|---|
| 2026-10-05 | 23/40 (57,5 %) | Almacenamiento (3/8) | Redundancia de storage (GRS/RA-GRS/GZRS/ZRS, [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md)); SAS ([seguridad de Storage](../../../knowledge/az104-storage-security.md)); regla de multi-selección: tica **todas** las pedidas (10, 16, 27, 32); SLA mínimo vs coste ([disponibilidad de VMs](../../../knowledge/az104-vm-availability.md)) |
