---
title: AZ-104 Simulacro 3 — Soluciones
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Soluciones — Simulacro 3 (avanzado)

## Tabla de respuestas

| # | Resp. | # | Resp. | # | Resp. | # | Resp. |
|---|---|---|---|---|---|---|---|
| 1 | B | 9 | B | 17 | B | 25 | A |
| 2 | A | 10 | C | 18 | B | 26 | B |
| 3 | B | 11 | B | 19 | A | 27 | B |
| 4 | a No · b Sí · c Sí | 12 | B → A → C → D → E | 20 | B | 28 | B |
| 5 | B | 13 | B | 21 | a Sí · b No · c Sí | 29 | B |
| 6 | B | 14 | A | 22 | B | 30 | C |
| 7 | B | 15 | B | 23 | B | 31 | A + C |
| 8 | B | 16 | B | 24 | A + B | 32 | B |

| # | Resp. |
|---|---|
| 33 | A |
| 34 | A |
| 35 | B |
| 36 | A |

**Puntuación:** ___ / 40. Aprobado ≥ 28 (70 %). Este nivel es igual o superior al real: no te castigues si la primera vez queda justo.

## Autoevaluación por dominio

| Dominio | Preguntas | Aciertos |
|---|---|---|
| Identidades y gobernanza (20–25 %) | 1, 4, 11, 15, 20, 25, 32, 36 | ___ / 10 |
| Almacenamiento (15–20 %) | 2, 7, 12, 16, 22, 26, 31 | ___ / 7 |
| Procesos (20–25 %) | 3, 8, 13, 17, 21, 27, 30, 34 | ___ / 10 |
| Redes virtuales (15–20 %) | 5, 9, 14, 18, 23, 29, 33 | ___ / 7 |
| Supervisión y mantenimiento (10–15 %) | 6, 10, 19, 24, 28, 35 | ___ / 6 |

## Explicaciones

1. **B.** Las deny assignments las crea solo Azure (Blueprints, managed apps, deployment Stacks…) para proteger recursos gestionados. No se crean con RBAC normal. La defensa "denegación" de los usuarios se hace con Azure Policy o condiciones RBAC.
2. **A.** `ss=b` (servicio Blob), `srt=c` (ámbito contenedor), `sp=rwl` (read + write + list), `se` = expiración 20:00 UTC. Decodificar SAS de las query params es pregunta habitual del examen. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).
3. **B.** Rolling actualiza por lotes (`maxBatchInstancePercent`) con pausas (`pauseTimeBetweenBatches`) y aborta si `maxUnhealthyInstancePercent` se supera. Automatic = todo a la vez; Manual = tú decides cuándo. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
4. **a No · b Sí · c Sí.** DeployIfNotExists **evalúa** los existentes pero la corrección requiere una **tarea de remediación**; las exenciones admiten expiración; las iniciativas se asignan a cualquier ámbito (MG incluido). Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).
5. **B.** La UDR `0.0.0.0/0` con next hop **None** invalida la ruta de sistema a internet y **descarta** el tráfico saliente (ni NAT ni respuesta). Es una trampa clásica: con next hop `Internet` mantendrías la salida por defecto. Ver [rutas](../../../knowledge/az104-user-defined-routes.md).
6. **B — umbrales dinámicos.** Aprenden el patrón histórico (incluida estacionalidad diaria) y alertan solo de desviaciones reales. El umbral estático genera falsos positivos con picos predecibles.
7. **B.** Tras un failover de cuenta, la nueva región primaria queda **LRS**: hay que reconfigurar la geo-redundancia y volver a sincronizar. Nadie te lo hace automáticamente.
8. **B.** Las Spot usan capacidad excedente: desalojo con **30 s de aviso**, precio con descuento (pagas ≤ precio spot fijado). No reservan capacidad (eso son las reservas).
9. **B — Prevention.** Bloquea (y registra) el tráfico que matchea las reglas WAF. Detection solo observa y registra — vale para validar antes de activar.
10. **C — Event Hub.** Streaming en tiempo real para SIEMs externos (Splunk, Sentinel, QRadar…). Storage es para archivo en frío; Log Analytics es para consultarlo dentro de Azure. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
11. **B.** `AssignableScopes` fija dónde puede asignarse el rol (debe contener el ámbito objetivo). `NotActions` **resta** de `Actions` (no es un deny absoluto: otro rol puede conceder el mismo permiso); las acciones de datos van en `DataActions`.
12. **B → A → C → D → E.** Storage Sync Service → registrar servidor → grupo de sincronización con cloud endpoint → server endpoint → cloud tiering. Ver [Azure Files](../../../knowledge/az104-azure-files.md).
13. **B.** La integración de VNet regional hace que las **llamadas salientes** de la app viajen por tu VNet (subred delegada `Microsoft.Web/sites`). El private endpoint sirve para **entrante**, no para salida. Ver [App Service](../../../knowledge/az104-app-service.md).
14. **A.** HA ports (todos los puertos, TCP+UDP) en un LB interno estándar es el patrón para pares NVA activo-pasivo (floating IP incluida). El básico no soporta HA ports. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
15. **B.** ReadOnly bloquea las operaciones de plano de control, incluida **List Keys**: la app no puede recuperar/rotar claves y deja de autenticarse. Gotcha documentado de los locks — el examen lo adora. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).
16. **B.** Cloud tiering mantiene el espacio libre configurado tiering (puntero → contenido al share) los archivos menos recientemente usados; el recall es lo contrario (traer contenido al disco). Ver [Azure Files](../../../knowledge/az104-azure-files.md).
17. **B.** Los slot settings (sticky) **no** se intercambian: la cadena se queda en staging. Es justo para eso sirven (p. ej. apuntar staging a una BD de pruebas). Ver [App Service](../../../knowledge/az104-app-service.md).
18. **B.** Dentro de Azure, las VNets resuelven con el resolvedor de la plataforma (`168.63.129.16`); para que **on-premises** resuelva tus zonas privadas, la solución soportada es un **Azure DNS Private Resolver** (endpoint de entrada) al que reenviar. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).
19. **A.** La consola serie da acceso al SO **por el canal serie**, sin red: ideal cuando la red/SSH está rota (requiere diagnóstico de arranque habilitado). Bastion y run-command dependen de la red o del agente. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).
20. **B.** Regla de oro: un grupo dinámico contiene solo **usuarios** o solo **dispositivos** — nunca grupos. Anidar manualmente o recurrir a licencias por grupo.
21. **a Sí · b No · c Sí.** El grupo es el host: red y ciclo de vida compartidos; por eso mismo **no se puede alterar su composición** en caliente (ver pregunta 30); los ASE viven dentro de tu VNet (dedicados y caros).
22. **B.** PITR exige las tres: soft delete, change feed y versionado (y la ventana de PITR ≤ retención de soft delete). Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
23. **B.** El LB estándar es **seguro por defecto**: sin regla de salida/SNAT o NAT gateway, no hay salida a internet (el básico la daba gratis). Opciones: outbound rules, reglas de equilibrio con SNAT implícito o NAT gateway. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
24. **A + B.** Azure Monitor Agent recopila; el **Dependency Agent** alimenta el mapa de dependencias (ambos en VM insights). El MMA heredado está retirado. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).
25. **A.** Los presupuestos aceptan umbrales sobre coste **real o previsto (forecasted)**: el previsto dispara días antes de superar. Ver gobernanza en [identidad y gobernanza](../../../cheatsheets/az-104-identity-governance.md).
26. **B.** Sin purge protection, una clave borrada (y purgada) en < 90 días haría los datos irrecuperables. La rotación no protege del borrado.
27. **B.** `targetScope = 'subscription'` permite desplegar recursos a nivel de suscripción — incluidos resource groups. Sin esa línea, el despliegue fallaría (ámbito por defecto = resource group). Ver [plantillas ARM](../../../knowledge/az104-arm-templates.md).
28. **B.** Las configuraciones de diagnóstico traen **métricas de plataforma**; para el SO invitado hace falta el agente (AMA + regla de recopilación de datos). Trampa clásica. Ver [monitorización de VMs](../../../knowledge/az104-vm-monitoring.md).
29. **B — IP flow verify.** Comprueba un 5-tupla concreto contra las reglas efectivas (NIC + subred) y te dice permitido/bloqueado y **qué regla** decide. El flow log registra flujos pero no razona la causa. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).
30. **C.** Los grupos de ACI son inmutables en su composición: cambiar imagen/contenedores = eliminar y recrear (se puede hacer `restart` pero no `update --image`). Ver [ACI](../../../knowledge/az104-container-instances.md).

### Caso Litware

31. **A + C.** GZRS = zona + región (R1 exige ambas). La inmutabilidad con **duración conocida** (7 años) es la directiva de retención limitada por tiempo bloqueada; el legal hold es para retenciones **indefinidas** hasta que se levante (litigios). RA-GRS/ZRS no cubren ambos fallos.
32. **B.** Asignación elegible + aprobación + duración máxima de activación 8 h = just-in-time exacto del requisito. Una condición RBAC por hora no existe como control de tiempo real. Requiere Entra ID P2.
33. **A.** El ASG como origen de la regla escala con las NICs del VMSS (se agregan solas) y sustituye al service tag `VirtualNetwork`, que es demasiado amplio (toda la VNet). Ver [NSGs](../../../knowledge/az104-network-security-groups.md).
34. **A.** Rolling con lotes pequeños + pausa + sondeo de mantenimiento de la app (no solo del protocolo) aborta si la app no responde, manteniendo capacidad. Automatic no aborta por salud de la app; Manual requiere trabajo y ventana. Ver [disponibilidad](../../../knowledge/az104-vm-availability.md).
35. **B.** El evento vive en **logs** (AppServiceConsoleLogs en el workspace): alerta de registro con KQL (`AppServiceConsoleLogs | where TimeGenerated > ago(1h) and LogEntry contains "BILLING-ERROR"`) + grupo de acciones de correo. No hay métrica del "error de job" que alertar. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
36. **A.** Policy Deny con `allowedValues` sobre `sku.name` restringe desde el despliegue las SKU no geo-redundantes. Audit no impide; Append/Modify no reescriben SKU ya elegidas de forma fiable. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).

## Registro de intentos

| Fecha | Nota | Dominio más débil | Acción de repaso |
|---|---|---|---|
| | | | |
