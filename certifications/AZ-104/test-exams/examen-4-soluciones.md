---
title: AZ-104 Simulacro 4 — Soluciones
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
---

# Soluciones — Simulacro 4 (mixto estilo real)

## Tabla de respuestas

| # | Resp. | # | Resp. | # | Resp. | # | Resp. |
|---|---|---|---|---|---|---|---|
| 1 | B | 9 | C | 17 | a Sí · b Sí · c No | 25 | A |
| 2 | D | 10 | A | 18 | B | 26 | C |
| 3 | C | 11 | D | 19 | a Sí · b Sí · c No | 27 | D |
| 4 | A | 12 | A | 20 | D | 28 | A |
| 5 | B | 13 | A | 21 | a Sí · b No · c Sí | 29 | B |
| 6 | B | 14 | A + B | 22 | B | 30 | C |
| 7 | A | 15 | a Sí · b No · c Sí | 23 | B | 31 | C |
| 8 | B | 16 | C | 24 | C | 32 | A |

**Puntuación:** ___ / 40. Aprobado ≥ 28 (70 %).

## Autoevaluación por dominio

| Dominio | Preguntas | Aciertos |
|---|---|---|
| Identidades y gobernanza (20–25 %) | 1, 5, 11, 15, 20, 24 | ___ / 8 |
| Almacenamiento (15–20 %) | 2, 6, 10, 17, 25, 30 | ___ / 8 |
| Procesos (20–25 %) | 3, 7, 12, 18, 21, 26, 29 | ___ / 9 |
| Redes virtuales (15–20 %) | 4, 8, 13, 19, 23, 28 | ___ / 8 |
| Supervisión y mantenimiento (10–15 %) | 9, 14, 16, 22, 27, 31, 32 | ___ / 7 |

## Explicaciones

1. **B.** Los grupos de administración propagan asignaciones de Policy/RBAC a todas las suscripciones hijas: una asignación en el ámbito correcto sustituye 50. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).
2. **D — Data Box.** Microsoft envía el dispositivo, copias localmente y lo devuelves; pensado para decenas de TB. Import/Export requiere que **tú** compres/gestiones los discos compatibles y la logística.
3. **C — what-if.** Muestra el diff (~Create/Modify/Delete/NoChange) sin aplicar nada. `validate` solo comprueba sintaxis/prerequisitos, no cambios.
4. **A — Performance.** Dirige al endpoint con menor latencia de red al usuario. Weighted reparte por peso (no por latencia) y LB/round-robin no son enrutamiento global por latencia.
5. **B — Backup Contributor.** Administra backups (políticas, configuración, parada) pero **no puede eliminar el almacén**. Backup Operator solo ejecuta operaciones de backup/restauración, sin configurar.
6. **B.** Cada escritura crea una versión; se restaura promoviendo la versión previa (copy over la actual). PITR también valdría con su prerequisite a efectos prácticos, pero con versionado el mecanismo directo es la promoción de versión.
7. **A — Complete.** Borra lo que no está en la plantilla; Incremental deja los recursos existentes intactos. Solo para RG controlados íntegramente por plantilla. Ver [plantillas ARM](../../../knowledge/az104-arm-templates.md).
8. **B — Route-based.** Policy-based queda limitada a un escenario S2S básico (un túnel, sin P2S, sin activo-activo, sin coexistencia con ExpressRoute).
9. **C — Service Health.** Tiene tipos para *problemas de servicio*, *mantenimiento planeado*, *avisos de salud* y *avisos de seguridad*; se alerta por región con grupo de acciones.
10. **A — FileStorage (Premium).** Shares en almacenamiento SSD de baja latencia; el tier estándar queda corto para ERP. Ver [Azure Files](../../../knowledge/az104-azure-files.md).
11. **D — Modify.** Modifica/añade la etiqueta en despliegues (con identidad administrada) y remedia los existentes con tarea de remediación. Deny solo bloquea. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).
12. **A.** `az vmss update` aplica el cambio al **modelo**; como la política es Manual, `az vmss update-instances` propaga ese modelo a las instancias elegidas. `reimage` solo restaura el SO de las instancias con la imagen vigente del modelo — no sirve para propagar un cambio de imagen recién aplicado.
13. **A — Bastion.** RDP/SSH vía 443 desde el portal sin IP públicas en las VMs. La P2S también es válida pero es gestión de certificados por usuario y no la pregunta pide mínimo esfuerzo.
14. **A + B.** Categorías de Advisor: Coste, Fiabilidad, Seguridad, Excelencia operativa y Rendimiento. "Cumplimiento de contraseñas" y "Facturación de reservas" no existen.
15. **a Sí · b No · c Sí.** Los locks se heredan hacia abajo; cada suscripción reporta a **un solo** MG a la vez; la jerarquía admite 6 niveles bajo el root.
16. **C.** Filtra el contador correcto, agrega media por VM y ordena descendente tomando 5. La A toma picos puntuales sin media; la D ordena por número de muestras.
17. **a Sí · b Sí · c No.** Change feed = log de cambios por blob; soft delete de blobs/contenedores son dos interruptores distintos; y con soft delete el estado previo a una **sobrescritura** sí se conserva (soft-deleted version) — la trampa es el versionado vs soft delete como mecanismos complementarios. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
18. **B — Compute Gallery.** Réplicas de versión por región, versionado y compartición entre suscripciones/tenants. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
19. **a Sí · b Sí · c No.** Delegación = NS del registrador → NS de la zona; alias apunta a recursos y sigue sus cambios (útil en el apex); el auto-registro es de zonas **privadas** con link. Ver [Azure DNS](../../../knowledge/az104-azure-dns.md).
20. **D.** El ámbito del SSPR admite None / Selected (grupo de seguridad) / All. No requiere condiciones ni roles. Ver [SSPR](../../../knowledge/az104-sspr.md).
21. **a Sí · b No · c Sí.** Desasignar para la facturación de cómputo pero discos (y una IP reservada) siguen; la IP pública **dinámica se libera** al desasignar (la estática se conserva); AS: 5 dominios de actualización por defecto, máximo 20.
22. **B.** La retención interactiva del workspace es configurable hasta 730 días (y con niveles de archivo de largo plazo se llega a 12 años). Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
23. **B — Front Door.** Entrada global L7 con TLS, WAF y aceleración/caché en POPs edge. Traffic Manager es solo DNS (L4), sin TLS/WAF/caché.
24. **C — PIM elegible con expiración.** La asignación caduca a los 90 días (elegible o activa); sin asignación permanente. Requiere P2. Ver [identidades](../../../knowledge/az104-identities.md).
25. **A.** AzCopy registra jobs: `jobs list` + `jobs resume` continua transfiriendo lo pendiente (reutiliza el SAS guardado si no caducó).
26. **C — liveness probe.** Si el sondeo falla, el contenedor se reinicia. `OnFailure` solo actúa si el **proceso** termina con error — aquí el proceso sigue vivo pero colgado. Ver [ACI](../../../knowledge/az104-container-instances.md).
27. **D — MARS.** Agente para ficheros/carpetas/system state de servidores (Windows) físicos o virtuales on-premises hacia un RSV. La extensión de VM es para VMs IaaS de Azure.
28. **A.** Cadena raíz → cliente: la puerta de enlace valida los clientes contra el certificado raíz subido. Revocación por certificado raíz o listas de revocación. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).
29. **B — módulo Bicep.** Encapsula y reutiliza; al compilar se genera la plantilla ARM con los módulos resueltos. Ver [plantillas ARM](../../../knowledge/az104-arm-templates.md).
30. **C — servicios de confianza.** Excepción del firewall de la cuenta para servicios de Microsoft que operan con identidad verificada. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).
31. **C.** File recovery genera un script (exe/CLI) que monta el snapshot del punto de recuperación en una VM accesible; copias los ficheros y desmontas. Ver [backup de VMs](../../../knowledge/az104-vm-backup.md).
32. **A — planned failover.** Cierra/sincroniza antes de conmutar → sin pérdida de datos, con ventana planificada. El de prueba no conmuta producción; el no planeado asume pérdida según el último punto.

## Registro de intentos

| Fecha | Nota | Dominio más débil | Acción de repaso |
|---|---|---|---|
| | | | |
