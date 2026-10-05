---
title: AZ-104 Simulacro 1 — Soluciones
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Soluciones — Simulacro 1 (básico)

## Tabla de respuestas

| # | Resp. | # | Resp. | # | Resp. | # | Resp. |
|---|---|---|---|---|---|---|---|
| 1 | B | 9 | B | 17 | C | 25 | B |
| 2 | B | 10 | D | 18 | a No · b Sí · c No | 26 | A |
| 3 | B | 11 | a Sí · b No · c Sí | 19 | C | 27 | C |
| 4 | B | 12 | B | 20 | B | 28 | B |
| 5 | C | 13 | a Sí · b No · c Sí | 21 | B | 29 | B |
| 6 | D | 14 | B | 22 | B | 30 | B |
| 7 | B | 15 | A | 23 | B → C → D → A | 31 | B |
| 8 | B | 16 | a Sí · b Sí · c No | 24 | A | 32 | B |

**Puntuación:** 32 / 40 (80 %). Aprobado ≥ 28 (70 %). Para convertir mentalmente a la escala real: tu % × 1000 ≈ tu puntuación en la escala del examen (700 = aprobado).

## Autoevaluación por dominio

| Dominio | Preguntas | Aciertos |
|---|---|---|
| Identidades y gobernanza (20–25 %) | 2, 5, 8, 11, 19, 23, 24 | 5 / 9 — fallos: 8, 11a, 19, 23 |
| Almacenamiento (15–20 %) | 1, 6, 10, 13, 17, 21 | 8 / 8 |
| Procesos (20–25 %) | 3, 7, 12, 14, 16, 20, 27, 31 | 9 / 10 — fallo: 14 |
| Redes virtuales (15–20 %) | 4, 9, 18, 22, 25, 28 | 6 / 8 — fallos: 4, 22 |
| Supervisión y mantenimiento (10–15 %) | 15, 26, 29, 30, 32 | 4 / 5 — fallo: 15 |

## Explicaciones

1. **B — ZRS.** Réplica sincrónica en tres zonas de la región primaria. GRS/GZRS replican a una región secundaria (asíncrono); LRS solo dentro de un único centro de datos. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).
2. **B.** Los grupos de administración organizan suscripciones en jerarquías para aplicar políticas y RBAC de forma centralizada; no agrupan recursos (eso son los resource groups).
3. **B.** El conjunto de disponibilidad reparte las VM en dominios de error (hardware distinto) y de actualización (reinicios de mantenimiento escalonados) → SLA 99,95 %. No escala ni replica. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
4. <font color="#ff0000">**B — 251</font>.** Azure reserva 5 direcciones por subred (las 4 primeras y la última) para servicios. 256 − 5 = 251.
5. **C — Reader.** Lectura de todos los recursos sin permisos de modificación. Contributor ya permite cambios; Owner además gestiona accesos. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).
6. **D — RA-GRS.** El prefijo RA-* (read-access) habilita el endpoint de solo lectura de la región secundaria **sin** failover. GRS replica pero el secundario no es legible sin failover.
7. **B.** VMs en ≥ 2 zonas de disponibilidad → 99,99 %. Conjunto de disponibilidad → 99,95 %. Una VM con Premium SSD → 99,9 %. Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
8. <font color="#ff0000"> **B — P1</font>.** La pertenencia dinámica a grupos requiere Microsoft Entra ID P1 (nivel gratuito: solo seguridad estático). P2 añade PIM/Identity Protection.
9. **B.** Sin NSG se aplican las reglas por defecto: `AllowVnetInBound` (65000), `AllowAzureLoadBalancerInBound` (65001), `DenyAllInBound` (65500). El tráfico de internet entrante se **deniega**. Ver [NSGs](../../../knowledge/az104-network-security-groups.md).
10. **D — Archive.** El más barato en almacenamiento; datos sin conexión y rehidratación que puede tardar horas. La consulta frecuente lo hace carísimo. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
11. **a Sí · b No · c Sí.** ReadOnly bloquea tanto escrituras como eliminaciones; los bloqueos prevalecen sobre RBAC para **todos**, incluidos los Owners (deben quitarse el lock primero); por eso existen: protegen contra borrados accidentales incluso de administradores.
12. **B.** El scale set despliega VMs idénticas y escala horizontalmente (más/menos instancias) con reglas de autoescala por métrica o programación.
13. **a Sí · b No · c Sí.** Las directivas de ciclo de vida mueven/eliminan blobs por antigüedad; el tier **sí** puede fijarse por blob (el de cuenta es solo el predeterminado); y también pueden purgar versiones y snapshots. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
14. <font color="#ff0000">**B — Azure Compute Gallery.**</font> Imágenes versionadas, compartidas entre suscripciones/tenants y replicables a otras regiones. Las instantáneas e imágenes administradas no replican ni versionan.
15. **A.** Metrics = series numéricas casi en tiempo real, 93 días de retención. Los registros KQL son Logs (30 días por defecto) y los eventos del plano de control son el Activity Log (90 días). Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).
16. **a Sí · b Sí · c No.** SSE siempre activo y no desactivable; ADE = BitLocker/dm-crypt con claves en Key Vault. El **disco temporal** no está en el servicio de almacenamiento gestionado: no lo protege SSE (para cubrirlo: cifrado en host o ADE). Ver [VMs](../../../knowledge/az104-virtual-machines.md).
17. **C — SAS de delegación de usuario.** Se firma con credenciales de Entra ID en lugar de la clave de cuenta: es la opción recomendada cuando se prohíben claves de cuenta, y solo existe para Blob Storage. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).
18. **a No · b Sí · c No.** El peering **no es transitivo** (A–B y B–C no da A–C: hay que emparejar también A–C o enrutar por un NVA/hub); el emparejamiento global entre regiones sí existe; una vez emparejadas, la conectividad es automática, sin UDRs. Ver [peering](../../../knowledge/az104-vnet-peering.md).
19. **C — Deny.** Bloquea la creación/actualización de recursos no conformes en tiempo de despliegue. Audit solo registra; Append/Modify complementan propiedades. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).
20. **B.** Los slots permiten desplegar en staging, validar con tráfico parcial y hacer swap con producción sin downtime. Ver [App Service](../../../knowledge/az104-app-service.md).
21. **B — `azcopy sync`.** Replica solo las diferencias (compara fecha de modificación y hash) entre origen y destino. `copy` copia todo lo seleccionado. Ver [Azure Files](../../../knowledge/az104-azure-files.md).
22. **B — VPN Gateway S2S.** Túnel IPsec/IKE cifrado sobre internet. ExpressRoute es conectividad privada dedicada (no atraviesa internet). Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).
23. **B → C → D → A.** Definir → agrupar en iniciativa (opcional) → asignar a ámbito → revisar cumplimiento y remediar. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).
24. **A — tags.** Pares clave/valor para categorizar recursos; luego se analizan los costes agrupando por etiqueta (y se pueden exigir con Policy).
25. **B.** El sondeo marca instancias backend como up/down; el LB deja de enviar flujos nuevos a las caídas. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
26. **A — Activity Log.** Plano de control ("qué quién cuándo"), 90 días gratis, exportable a Log Analytics/Event Hub/Storage.
27. **C — Never.** El contenedor se ejecuta una vez y no se reinicia jamás. `OnFailure` reintenta si termina con error; `Always` (por defecto) reinicia siempre. Ver [ACI](../../../knowledge/az104-container-instances.md).
28. **B.** La vinculación (VNet link) con auto-registro crea automáticamente los registros A de las VMs de esa VNet en la zona privada. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).
29. **B — grupo de acciones.** Reutilizable entre alertas: email, SMS, voice, webhook, Logic App, Function, ITSM, app push.
30. **B.** `summarize count() by <columna>` agrega contando por grupo. `count by` no existe como operador directo tras la tabla; `project` solo selecciona columnas; `where` filtra filas.
31. **B — generalizar.** Para crear varias VMs a partir de una imagen, esta debe estar generalizada (Sysprep / `waagent -deprovision`) para eliminar la identidad de máquina, el nombre de host y las cuentas locales.
32. **B.** El almacén de Recovery Services debe estar en la misma región que las VMs (los datos de backup no cruzan regiones por diseño). Ver [Azure Backup](../../../knowledge/az104-azure-backup.md).

## Registro de intentos

| Fecha | Nota | Dominio más débil | Acción de repaso |
|---|---|---|---|
| 2026-10-05 | 32/40 (80 %) | Identidades y gobernanza 5/9: efectos de Policy (Deny), flujo de Policy, bloqueos ReadOnly, licencias P1/P2 | [Azure Policy](../../../knowledge/az104-azure-policy.md), bloqueos y licencias en [az-104-identity-governance](../../../cheatsheets/az-104-identity-governance.md) |
