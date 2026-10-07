---
title: AZ-104 Simulacro 5 — Soluciones
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-07
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Soluciones — Simulacro 5 (avanzado, 50 ítems)

## Tabla de respuestas

| # | Resp. | # | Resp. | # | Resp. | # | Resp. |
|---|---|---|---|---|---|---|---|
| 1 | C | 13 | D → B → A → C | 25 | A | 37 | D |
| 2 | B | 14 | a Sí · b No · c No | 26 | D | 38 | A |
| 3 | D | 15 | B | 27 | B | 39 | C |
| 4 | A | 16 | A | 28 | A | 40 | B |
| 5 | C | 17 | C | 29 | a Sí · b No · c Sí | 41 | A |
| 6 | B | 18 | D | 30 | C | 42 | A + B |
| 7 | a Sí · b Sí · c No | 19 | B | 31 | B | | |
| 8 | C | 20 | A | 32 | A | | |
| 9 | D | 21 | C | 33 | D | | |
| 10 | A + B + D | 22 | a Sí · b Sí · c No | 34 | C | | |
| 11 | A | 23 | D | 35 | B | | |
| 12 | C | 24 | B | 36 | A | | |

**Puntuación:** ___ / 50. Aprobado ≥ 35 (70 %).

## Autoevaluación por dominio

| Dominio | Preguntas | Aciertos |
|---|---|---|
| Identidades y gobernanza (20–25 %) | 1, 2, 3, 4, 5, 6, 7(a–c), 37, 42 | ___ / 11 |
| Almacenamiento (15–20 %) | 8, 9, 10, 11, 12, 13, 14(a–c), 38 | ___ / 10 |
| Procesos (20–25 %) | 15, 16, 17, 18, 19, 20, 21, 22(a–c), 39 | ___ / 11 |
| Redes virtuales (15–20 %) | 23, 24, 25, 26, 27, 28, 29(a–c), 40 | ___ / 10 |
| Supervisión y mantenimiento (10–15 %) | 30, 31, 32, 33, 34, 35, 36, 41 | ___ / 8 |

## Explicaciones

### Identidades y gobernanza

1. **C — elevar el acceso.** Ser administrador global de Entra ID **no da acceso a las suscripciones**: RBAC y roles de directorio son planos distintos. El admin global puede *elevar el acceso* (Entra ID → Propiedades, o IAM → *Elevate access*), lo que le asigna User Access Administrator en el ámbito raíz `/` para entonces autoasignarse roles. Ver [RBAC](../../../knowledge/az104-azure-rbac.md) y [Entra ID](../../../knowledge/az104-entra-id.md).
2. **B.** `*/read` da lectura de todo, `virtualMachines/*` gestión completa de VMs y `NotActions` **resta** `delete` dentro de este rol — no es un deny absoluto (C falso: otro rol que conceda `delete` sí dejaría borrar). El comodín no ignora NotActions (D). Ver [RBAC](../../../knowledge/az104-azure-rbac.md).
3. **D — se eliminan las asignaciones.** Al mover la suscripción a otro directorio, los principales del tenant antiguo dejan de resolverse: roles (incluidos los de identidades administradas) se pierden y hay que reasignar. Gotcha clásico de examen. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).
4. **A — password writeback.** SSPR solo en la nube no toca AD; para que el cambio **se reescriba al AD local** hace falta Entra Connect con PHS/PTA, writeback habilitado y licencia de pago (P1). Ver [SSPR](../../../knowledge/az104-sspr.md).
5. **C — one-time passcode.** Invitados B2B sin cuenta Microsoft ni Entra pueden autenticarse con un código de un solo uso enviado a su correo — característica integrada (activada por defecto). B2B direct connect (B) es para equipos Teams internos de otro tenant, no Gmail. Ver [identidades](../../../knowledge/az104-identities.md).
6. **B — roles de datos.** Contributor es solo plano de control (gestionar el recurso); leer/escribir **datos** exige roles `Storage Blob Data *`. El menor privilegio para leer es **Storage Blob Data Reader**. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).
7. **a Sí · b Sí · c No.** Las exenciones llevan categoría (*Waiver* = renuncia, *Mitigated* = mitigada) y expiración; **Modify** necesita identidad administrada con permisos sobre el recurso; y la tarea de remediación es **puntual** — corrige los recursos no conformes existentes en el momento de crearla; los futuros no conformes requieren tareas nuevas (o DINE en el despliegue). Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

### Almacenamiento

8. **C — Archive.** Con 200 días sin modificación supera el umbral de 180 → `tierToArchive`. Las reglas se evalúan en cascada sobre el blob actual (no cronológicas por etapas) y aplican tanto a blobs existentes como nuevos. La eliminación llegaría a los 365. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
9. **D — stored access policy.** El SAS asociado a una directiva de acceso almacenada se revoca **quitando la política o cambiando su expiración** — sin rotar claves. Los SAS ad-hoc (A) no se pueden revocar (no existe "Revocar SAS"); la delegación de usuario (B) no se revoca rotando claves (ni siquiera las usa). Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).
10. **A + B + D.** La replicación de objetos exige **versionado de blobs en ambas cuentas** y **change feed en la origen** (quien registra los cambios a replicar). La destino no necesita change feed. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
11. **A — Last Sync Time.** La propiedad *Hora de última sincronización* de la cuenta marca hasta qué momento la secundaria está garantizada consistente — es la medida del desfase (RPO) que pide el auditor. RA-GRS no garantiza RPO cero (D). Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).
12. **C.** Los shares NFS 4.1 solo existen en cuentas **FileStorage (Premium)**, se acceden desde la VNet (no hay endpoint público para NFS) y usan AUTH_SYS — sin Entra ID. Un share es SMB **o** NFS, no ambos. Ver [Azure Files](../../../knowledge/az104-azure-files.md).
13. **D → B → A → C.** Confirmar la clave en uso (D) → regenerar la clave **libre** (B, sin impacto) → mover todas las apps a esa clave (A) → regenerar la clave antigua (C). Regenerar primero la clave en uso cortaría el servicio. Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).
14. **a Sí · b No · c No.** El ciclo de vida aplica solo a blobs en bloques (no append ni página); borrar el blob base **no arrastra** sus snapshots (la API exige tratarlas explícitamente); y un blob en Archive hay que **rehidratarlo** (copiarlo a Hot/Cool) antes de leerlo. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).

### Procesos

15. **B — Flexible.** Trata las instancias como VMs individuales repartidas entre dominios de error (y zonas), permite mezclar tamaños; **no** tiene directiva Rolling (A es Uniform) ni exige modelo único (C). El escalado automático existe en ambos modos (D). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
16. **A.** Para que las instancias de un VMSS entren al pool backend, la `ipConfigurations` del **perfil de red del VMSS** debe referenciar `loadBalancerBackendAddressPools` — hacerlo a mano por NIC no escala y las nuevas instancias nacerían fuera del pool. Después hay que actualizar las instancias al nuevo modelo. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
17. **C — Deallocate.** En VMSS Spot, la política de desalojo puede ser `Delete` (borra VM y discos) o **`Deallocate`** (conserva los discos administrados — se paga solo el almacenamiento — y la instancia puede retomar al reescalar). Ver [VMs](../../../knowledge/az104-virtual-machines.md).
18. **D — Specialized.** Sin Sysprep la imagen es **especializada** (`osState: Specialized`): conserva nombre de máquina, SID y unión al dominio; las VMs se crean directamente sin aprovisionamiento. Generalized (A) exige Sysprep; snapshots/VHD (B, C) no son versiones de galería. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
19. **B — auto-swap.** El swap automático del slot staging hacia producción se dispara al terminar el despliegue y Azure **calienta la app antes** de conmutar — sin arranque en frío. Requiere Standard o superior. Ver [App Service](../../../knowledge/az104-app-service.md).
20. **A — subred delegada y vacía.** La inyección en VNet de ACI exige una subred sin otros recursos delegada en `Microsoft.ContainerInstance/containerGroups` (de ahí el error *subred no vacía*). Ver [ACI](../../../knowledge/az104-container-instances.md).
21. **C — Premium + geo-replicación.** La geo-replicación del registro crea réplicas por región tras el **mismo endpoint** (pull de la réplica más cercana). Es exclusiva del SKU Premium; el *import* (B) no da un único endpoint. Ver [ACI](../../../knowledge/az104-container-instances.md).
22. **a Sí · b Sí · c No.** El ASE con ILB publica las apps en IP privada de tu VNet; los slots requieren Standard+; y una app **no puede moverse a un plan de otra región** (app y plan comparten región) — para cambiar de región se clona/redespliega. Ver [App Service](../../../knowledge/az104-app-service.md).

### Redes

23. **D — tránsito de puerta de enlace.** *Allow gateway transit* en hub→spoke + *Use remote gateways* en spoke→hub: los spokes usan la puerta de enlace del hub sin tener la suya. Es el patrón canónico del hub-spoke con VPN. Ver [peering](../../../knowledge/az104-vnet-peering.md).
24. **B — ASG por VNet.** Un grupo de seguridad de aplicaciones solo puede incluir interfaces de la **misma VNet** — no funciona entre peering ni global peering. Ver [NSGs](../../../knowledge/az104-network-security-groups.md).
25. **A — NAT gateway.** Da SNAT simplificado a gran escala (64 000 puertos por IP, ampliable con prefijos) con IP de salida **estática y predecible** asociada a la subred. La regla de salida del LB (D) ayudaría, pero con frontend dinámico no cumple la IP fija. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
26. **D — pool por defecto.** `/index.html` no encaja en `/api/*` ni `/img/*`, así que aplica el `defaultBackendAddressPool` del path map (`pool-web`) — no un 404. Ver [Application Gateway](../../../knowledge/az104-application-gateway.md).
27. **B — VNet flow logs.** Los NSG flow logs clásicos dejaron de crearse el 30/6/2025 y se retiran el 30/9/2027; su sustituto son los **VNet flow logs** (capturan a nivel de VNet, con destino a Log Analytics/cuenta de almacenamiento). La captura de paquetes y IP flow verify no generan logs continuos. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).
28. **A — se descarta.** Emparejamiento por **prefijo más largo**: para 10.20.3.7 gana la UDR `10.20.0.0/16` (más específica que `0.0.0.0/0`), y su próximo salto es **None** → black hole. La UDR 0.0.0.0/0 al NVA solo aplicaría a destinos sin ruta más larga. Ver [rutas](../../../knowledge/az104-user-defined-routes.md).
29. **a Sí · b No · c Sí.** El peering global conecta regiones sin gateway; el NAT gateway es **por VNet** (no alcanza subredes de VNets emparejadas); y los service tags regionales (`Storage.NorthEurope`) filtran por región en reglas NSG. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).

### Supervisión y mantenimiento

30. **C — Connection Monitor.** Monitorización **continua** (agente en los extremos) con métricas, topología y alertas. Connection troubleshoot (A) es una comprobación puntual on-demand — la pareja de herramientas favorita del examen. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).
31. **B — exportar el registro de actividad.** La retención integrada es de **90 días**; para 1 año hay que exportarlo (configuración de diagnóstico del nivel de suscripción) a Log Analytics o a una cuenta de almacenamiento. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
32. **A — 93 días.** Las métricas de plataforma se retienen 93 días por defecto; el historial largo exige enviarlas a un workspace (configuración de diagnóstico) y consultar con KQL. Pregunta espejo de la clásica "tendencia de 90 días" (que sí cabe en Metrics Explorer). Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
33. **D — última medición por equipo.** `arg_max(TimeGenerated, *)` toma, para cada grupo (`Computer`), la **fila completa más reciente**; el `where` posterior filtra las que quedan por debajo del 10 %. No es un máximo de valor (A), ni media (B), ni un top-N (C). Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
34. **C — bloqueada tras proteger.** La redundancia del Recovery Services vault (LRS/GRS) solo puede cambiarse mientras **no haya elementos protegidos** (ni backups configurados). Ver [Azure Backup](../../../knowledge/az104-azure-backup.md).
35. **B — 14 días.** El soft delete de Backup retiene los datos de copia eliminados durante **14 días** (estado *soft deleted*); se deshace la eliminación y se restauran. No depende de la redundancia. Ver [Azure Backup](../../../knowledge/az104-azure-backup.md).
36. **A — 1 a 5 días (por defecto 2).** Los snapshots de restauración instantánea viven junto a la VM (`AzureBackupRG_*`) para restores rápidos; su retención es corta e independiente de la del vault (2 días por defecto, configurable 1–5). Ver [backup de VMs](../../../knowledge/az104-vm-backup.md).

### Caso práctico

37. **D — una licencia.** Con licencias por grupo, la **misma SKU heredada de varios grupos se asigna una vez** (consume una sola licencia). El estado de error aparece solo con SKUs distintas que habilitan planes de servicio en conflicto. Ver [identidades](../../../knowledge/az104-identities.md).
38. **A — backup del file share.** La copia de Azure Files usa snapshots (sin agentes, cumple R3) desde el vault: políticas diarias, retención configurable (7 días) y restauración a **nivel de fichero/carpeta** o de share completo, en el original o en otra ubicación. MARS (B) exige agente; AzCopy (C) no da restauración por ítem; File Sync (D) no es backup. Ver [Azure Files](../../../knowledge/az104-azure-files.md) y [backup de VMs](../../../knowledge/az104-vm-backup.md).
39. **C — autoscale predictivo.** El escalado predictivo del VMSS modela el patrón de CPU y **escala antes del pico previsto** manteniendo la regla por CPU — exactamente "listas antes del pico, con desencadenador por CPU". El perfil programado (B) también anticiparía, pero es fijo e ignora la carga (R4 pide mantener CPU). Ver [VMs](../../../knowledge/az104-virtual-machines.md).
40. **B — P2S con Entra ID = OpenVPN.** La autenticación de punto a sitio con Entra ID **requiere el protocolo OpenVPN** y el cliente Azure VPN Client (Windows/macOS) — SSTP no soporta auth de Entra (C), los certificados contradicen R1 (A) y Bastion exige pasar por el portal (D). Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).
41. **A — AMA + DCR + alerta de registro.** El % de disco libre se ve desde el SO invitado: AMA con regla de recopilación de contadores al workspace y **alerta de registro** (KQL sobre `Perf`) con grupo de acciones. No existe métrica de plataforma de espacio libre (B) — la trampa gemela de la 32. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
42. **A + B — Deny + Modify.** Ubicaciones permitidas con **Deny** (cumple "solo pueden crearse en") y etiqueta requerida con **Modify** + identidad administrada + **tarea de remediación** (añade `dept` automáticamente a existentes y futuros). Audit (C) no impide; Append de herencia (D) no existe como directiva así y no remedia. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

## Registro de intentos

| Fecha | Nota | Dominio más débil | Acción de repaso |
|---|---|---|---|
| | | | |
