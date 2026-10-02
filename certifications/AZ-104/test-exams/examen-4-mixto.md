---
title: AZ-104 Simulacro 4 — Mixto estilo real
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-02
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
  - https://tutorialsdojo.com/az-104-microsoft-azure-administrator-sample-exam-questions/
  - https://github.com/Iamrushabhshahh/Microsoft-Azure-Administrator-AZ-104-Exam-Dump-Question-With-Solution
---

# Simulacro 4 — Mixto estilo real

**40 ítems · 100 minutos · libro cerrado.** Dificultad mezclada como el examen real (fácil + media + difícil, sin avisar cuál es cuál). Temario y estilo calibrados con las fuentes de arriba — las preguntas son originales (los ítems reales están bajo NDA).

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna. Al terminar, pide **«corrige el examen 4»** y se leerán tus marcas contra [examen-4-soluciones.md](examen-4-soluciones.md).

---

**1.** *(Una respuesta)* Tu empresa tiene **50 suscripciones** y quiere exigir una etiqueta y una restricción de SKU a todas ellas con el menor esfuerzo administrativo. ¿Qué haces?

- [ ] A. Crear un grupo de recursos por suscripción y asignar la directiva en cada uno
- [ ] B. Agrupar las suscripciones bajo grupos de administración y asignar la directiva (o iniciativa) en el grupo de administración raíz o intermedio
- [ ] C. Aplicar la directiva con un script CLI suscripción por suscripción
- [ ] D. Usar Azure Blueprints en cada suscripción individual

**2.** *(Una respuesta)* Debes transferir **80 TB de datos** a una cuenta de almacenamiento de Azure desde un datacenter sin conexión rápida a internet, con el mínimo esfuerzo logístico para ti. ¿Qué usas?

- [ ] A. Azure Import/Export con tus propios discos enviados por correo
- [ ] B. `azcopy copy` durante un fin de semana
- [ ] C. Azure File Sync
- [ ] D. Azure Data Box (dispositivo que envía Microsoft)

**3.** *(Una respuesta)* Antes de desplegar una plantilla ARM en producción, quieres **previsualizar los cambios** que aplicará sin ejecutarlos. ¿Qué usas?

- [ ] A. `az deployment group validate`
- [ ] B. El modo Incremental
- [ ] C. `az deployment group what-if`
- [ ] D. `az bicep build`

**4.** *(Una respuesta)* Tienes una web pública con usuarios en Europa y América y quieres dirigir cada usuario al endpoint regional **con menor latencia**, con DNS. ¿Qué servicio y método?

- [ ] A. Azure Traffic Manager con método de enrutamiento **Performance**
- [ ] B. Azure Traffic Manager con método **Weighted**
- [ ] C. Azure Load Balancer con afinidad de IP de origen
- [ ] D. Azure DNS con registros round-robin

**5.** *(Una respuesta)* Un operador debe **configurar y administrar las copias de seguridad** de un almacén de Recovery Services, pero **no puede eliminar el almacén**. ¿Qué rol asignas?

- [ ] A. Backup Operator
- [ ] B. Backup Contributor
- [ ] C. Contributor en el almacén
- [ ] D. Site Recovery Contributor

**6.** *(Una respuesta)* Un usuario sobrescribe un blob importante. Tienes habilitado el **versionado** de blobs. ¿Cómo recuperas el contenido anterior?

- [ ] A. Restaura desde una snapshot manual
- [ ] B. Promocionas la versión anterior del blob a versión actual (copy over)
- [ ] C. Ejecutas la restauración a un momento dado (PITR)
- [ ] D. El contenido anterior es irrecuperable: el versionado solo guarda la última versión

**7.** *(Una respuesta)* En un grupo de recursos de pruebas se acumulan recursos sobrantes de cada sprint. Quieres que desplegar la plantilla ARM/Bicep del equipo **elimine automáticamente** lo que no esté definido en la plantilla. ¿Qué usas?

- [ ] A. El modo de despliegue **Complete**
- [ ] B. El modo de despliegue **Incremental**
- [ ] C. Una directiva con efecto Deny
- [ ] D. `az group delete` antes de cada despliegue

**8.** *(Una respuesta)* Necesitas **varios túneles S2S simultáneos** desde la misma puerta de enlace, IKEv2 para P2S y activo-activo. ¿Qué tipo de puerta de enlace VPN eliges?

- [ ] A. Policy-based
- [ ] B. Route-based
- [ ] C. ExpressRoute con fallback a VPN
- [ ] D. Cualquiera: ambas lo soportan

**9.** *(Una respuesta)* Quieres que el equipo de operaciones reciba un aviso del **mantenimiento planeado por Microsoft** que afectará a sus regiones. ¿Qué configuras?

- [ ] A. Una alerta de métrica sobre los recursos
- [ ] B. Una alerta del registro de actividad de la suscripción
- [ ] C. Una alerta de Service Health (tipo mantenimiento planeado) con grupo de acciones
- [ ] D. Azure Advisor semanal

**10.** *(Una respuesta)* Un ERP montado sobre Azure Files es sensible a la latencia y necesita las **máximas IOPS** en shares SMB. ¿Qué creas?

- [ ] A. Una cuenta **FileStorage** (Premium) con shares SMB
- [ ] B. Una cuenta StorageV2 estándar con share grande
- [ ] C. Un blob en bloques con nivel Hot
- [ ] D. Azure File Sync con cloud tiering agresivo

**11.** *(Una respuesta)* Quieres que **todos los recursos existentes** tengan la etiqueta `team` y que los nuevos la reciban automáticamente aunque el usuario no la ponga. ¿Qué usas?

- [ ] A. Una directiva con efecto Deny y etiquetado manual
- [ ] B. RBAC condicional por etiqueta
- [ ] C. Un bloqueo ReadOnly con etiquetas obligatorias
- [ ] D. Una directiva con efecto **Modify** (append/modify de tags) con tarea de remediación para los existentes

**12.** *(Una respuesta)* Cambias el modelo de un VMSS (nueva versión de imagen) pero la directiva de actualización es **Manual**. ¿Cómo aplicas el nuevo modelo a las instancias sin recrear el conjunto?

- [ ] A. `az vmss update` (modelo) y después `az vmss update-instances` para aplicar a las instancias
- [ ] B. Eliminar las instancias una a una y esperar el reescalado automático
- [ ] C. `az vmss reimage` en bucle
- [ ] D. No se puede: hay que recrear el VMSS

**13.** *(Una respuesta)* Vuestros administradores necesitan RDP/SSH a VMs que **no tienen IP pública** y no quieres abrir puertos de gestión a internet. ¿Qué despliegas?

- [ ] A. Azure Bastion en la VNet y conectarse desde el portal por HTTPS/443
- [ ] B. Un jumpbox con IP pública y RDP abierto a internet
- [ ] C. Una VPN P2S para cada administrador
- [ ] D. Azure Front Door con RDP permitido

**14.** *(Una respuesta — elige dos)* ¿Cuáles son categorías de recomendaciones de **Azure Advisor**?

- [ ] A. Coste
- [ ] B. Fiabilidad
- [ ] C. Cumplimiento de contraseñas
- [ ] D. Facturación de reservas

**15.** *(Serie Sí/No — 3 ítems)* Sobre bloqueos y grupos de administración:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Un bloqueo aplicado a un grupo de recursos o suscripción se hereda a los recursos hijos | [ ] | [ ] |
| b | Una suscripción puede depender de varios grupos de administración a la vez | [ ] | [ ] |
| c | La jerarquía de grupos de administración admite hasta 6 niveles por debajo del grupo raíz (sin contar el root ni las suscripciones) | [ ] | [ ] |

**16.** *(Una respuesta)* ¿Qué consulta devuelve las **5 VMs con mayor CPU media**?

- [ ] A. `Perf | where CounterName == "% Processor Time" | top 5 by CounterValue`
- [ ] B. `Perf | limit 5`
- [ ] C. `Perf | where CounterName == "% Processor Time" | summarize AvgCPU=avg(CounterValue) by _ResourceId | top 5 by AvgCPU desc`
- [ ] D. `Perf | summarize count() by _ResourceId | top 5 by count_ desc`

**17.** *(Serie Sí/No — 3 ítems)* Sobre protección de datos en Blob Storage:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | El change feed registra el historial de cambios (creaciones y modificaciones) de los blobs de una cuenta | [ ] | [ ] |
| b | La eliminación temporal (soft delete) de blobs y la de contenedores se habilitan por separado | [ ] | [ ] |
| c | Con la eliminación temporal de blobs activada, un blob sobrescrito no puede recuperarse | [ ] | [ ] |

**18.** *(Una respuesta)* Tu imagen de VM debe estar disponible en **varias regiones** para desplegar rápido en cada una. ¿Qué usas?

- [ ] A. Replicar la imagen copiándola con AzCopy a cuentas de almacenamiento regionales
- [ ] B. Azure Compute Gallery con réplicas de la versión de imagen en las regiones objetivo
- [ ] C. Un blob de página replicado con GRS
- [ ] D. Instantáneas replicadas por ZRS

**19.** *(Serie Sí/No — 3 ítems)* Sobre DNS en Azure:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Para delegar una zona pública a Azure DNS hay que apuntar los registros NS del dominio (en el registrador) a los servidores de nombres de la zona | [ ] | [ ] |
| b | Los registros alias se actualizan automáticamente cuando cambia el recurso al que apuntan | [ ] | [ ] |
| c | Una zona DNS pública registra automáticamente las VMs de tus VNets | [ ] | [ ] |

**20.** *(Una respuesta)* Solo quieres que el SSPR esté disponible para el **equipo de soporte**, no para toda la organización. ¿Cómo lo configuras?

- [ ] A. Con una directiva de acceso condicional
- [ ] B. Con una asignación de rol de Password Administrator
- [ ] C. No es posible: el SSPR es por tenant
- [ ] D. En el ámbito del SSPR, seleccionar un grupo de seguridad específico en lugar de "All"

**21.** *(Serie Sí/No — 3 ítems)* Sobre cómputo y facturación de VMs:

| # | Afirmación | Sí | No |
|---|---|---|---|
| a | Al desasignar (deallocate) una VM se deja de pagar el cómputo, pero los discos gestionados siguen facturando | [ ] | [ ] |
| b | Al desasignar una VM, su IP pública dinámica se conserva y sigue asignada | [ ] | [ ] |
| c | En un conjunto de disponibilidad, el número de dominios de actualización es 5 por defecto (configurable hasta 20) | [ ] | [ ] |

**22.** *(Una respuesta)* Auditoría exige conservar los registros de un área de trabajo de Log Analytics **2 años** consultables. ¿Qué haces?

- [ ] A. Exportar cada mes a CSV
- [ ] B. Configurar la retención interactiva del área de trabajo en 730 días
- [ ] C. No es posible: la retención máxima es 90 días
- [ ] D. Crear un área de trabajo nueva cada año

**23.** *(Una respuesta)* El punto de entrada global de tu API debe terminar TLS, aplicar **WAF** y hacer caché en el **edge** cercano al usuario. ¿Qué servicio?

- [ ] A. Azure Traffic Manager
- [ ] B. Azure Front Door (con WAF)
- [ ] C. Azure Load Balancer estándar
- [ ] D. Azure DNS con alias

**24.** *(Una respuesta)* Un administrador tiene el rol de forma **permanente** y quieres que solo lo tenga cuando lo active, con un **límite de 90 días para la asignación** (tras el cual deba renovarse). ¿Qué configuras?

- [ ] A. Una alerta de Activity Log 90 días después
- [ ] B. Un rol personalizado con `assignableScopes` temporal
- [ ] C. PIM: asignación elegible con expiración a 90 días
- [ ] D. Rotación de contraseñas cada 90 días

**25.** *(Una respuesta)* Una copia de AzCopy de 2 TB se **interrumpió** a mitad. ¿Cómo la continúas sin retransferir todo?

- [ ] A. `azcopy jobs list` + `azcopy jobs resume <job-id>` con el SAS original
- [ ] B. `azcopy sync` reemplaza automáticamente el job anterior
- [ ] C. `azcopy copy` con `--overwrite=false` desde cero
- [ ] D. No se puede: AzCopy no registra jobs

**26.** *(Una respuesta)* Un contenedor de Azure Container Instances se cuelga periódicamente (el proceso vive pero no responde). ¿Qué configuras para que se **reinicie al dejar de responder**?

- [ ] A. La política de reinicio `Never`
- [ ] B. Un segundo contenedor en el grupo que haga `kill -9`
- [ ] C. Un sondeo de **liveness** (liveness probe) en el contenedor
- [ ] D. Azure Monitor en el grupo de contenedores

**27.** *(Una respuesta)* Debes hacer backup de **carpetas concretas de un Windows Server on-premises** (no VMs de Azure) a un almacén de Recovery Services. ¿Qué usas?

- [ ] A. La extensión de backup de VM de Azure
- [ ] B. Azure Site Recovery
- [ ] C. `robocopy` al endpoint del blob
- [ ] D. El agente **MARS** (Microsoft Azure Recovery Services)

**28.** *(Una respuesta)* Configuras VPN P2S con autenticación de certificados. ¿Cómo se establece la confianza?

- [ ] A. Subes el **certificado raíz** a la puerta de enlace y generas **certificados de cliente** firmados por esa raíz para cada dispositivo
- [ ] B. Subes el certificado público de cada cliente a Key Vault
- [ ] C. Azure emite ambos certificados automáticamente
- [ ] D. Con una contraseña compartida rotada semanalmente

**29.** *(Una respuesta)* Tienes un bloque de plantilla reutilizable (VNet + NSG) que quieres mantener en un fichero aparte e invocar desde varias plantillas Bicep. ¿Qué usas?

- [ ] A. Copiar y pegar el bloque en cada plantilla
- [ ] B. Un **módulo** de Bicep invocado desde la plantilla principal
- [ ] C. `az bicep decompile` sobre cada plantilla
- [ ] D. Un runbook de Automation que genere Bicep

**30.** *(Una respuesta)* Una cuenta de almacenamiento bloquea todo el acceso público y de red. Ciertas herramientas de **servicios de Microsoft** (como Azure Backup o Azure Site Recovery) necesitan leer sus blobs. ¿Qué habilitas?

- [ ] A. Un private endpoint para cada servicio
- [ ] B. La clave pública de la cuenta
- [ ] C. La excepción "permitir servicios de Microsoft de confianza" en el firewall de la cuenta
- [ ] D. Redes virtuales de salida en la cuenta

**31.** *(Una respuesta)* Necesitas recuperar **tres ficheros** de una copia de seguridad de VM de ayer, sin restaurar la VM entera. ¿Qué usas?

- [ ] A. Restaurar la VM entera en otro grupo de recursos y copiar a mano
- [ ] B. AzCopy desde el almacén
- [ ] C. La recuperación a nivel de archivo de Azure Backup (script que monta el punto de recuperación en una VM y copias los ficheros)
- [ ] D. No es posible: solo se restaura VM o disco completos

**32.** *(Una respuesta)* Van a hacer mantenimiento de red en la región primaria de una VM protegida con Azure Site Recovery y quieres conmutar **sin perder datos** y con interrupción mínima y planificada. ¿Qué usas?

- [ ] A. Failover planeado (planned failover)
- [ ] B. Failover de prueba
- [ ] C. Failover no planeado
- [ ] D. Deshabilitar y reactivar la replicación

---

*Fin del simulacro 4. Corrige ahora en [examen-4-soluciones.md](examen-4-soluciones.md) — o pide «corrige el examen 4».*
