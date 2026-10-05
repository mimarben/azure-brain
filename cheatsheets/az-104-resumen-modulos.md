---
title: "Resumen AZ-104 — Tipos por módulo"
aliases: [Resumen AZ-104 por módulo]
tags: [certification]
certification: [AZ-104]
updated: 2026-10-05
sources:
  - notes/AZ-104/roadmap.md
  - certifications/AZ-104/test-exams/exam-online.md
  - certifications/AZ-104/test-exams/exam-online-2.md
  - knowledge/az104-storage-accounts.md
  - knowledge/az104-vm-availability.md
  - knowledge/az104-app-service-plans.md
  - knowledge/az104-network-security-groups.md
  - knowledge/az104-azure-dns.md
  - knowledge/az104-load-balancer.md
  - knowledge/az104-azure-backup.md
  - knowledge/az104-azure-files.md
---

# Resumen AZ-104 — Tipos por módulo

Repaso imprimible de **todos los módulos** del [roadmap](../notes/AZ-104/roadmap.md): para cada uno, la tabla de "qué **tipos** existen" y, donde hay planes o servicios enfrentables, la **matriz de diferencias** (P1 vs P2, tiers, SKUs, vaults…). Sin comandos (los tienes en las chuletas de [identidad](az-104-identity-governance.md) · [storage](az-104-storage.md) · [compute](az-104-compute.md) · [CLI](azure-cli.md)) y sin teoría (en las fichas de `knowledge/`). Foco calibrado con los [simulacros](../certifications/AZ-104/test-exams/README.md) y el practice assessment.

---

## Bloque 0 — Prerrequisitos

### 0.1 Azure Cloud Shell

| Tipo | Qué es | Nota |
|---|---|---|
| Bash | Shell con Azure CLI (`az`) preinstalado | Autenticado con tu sesión, no introduces credenciales |
| PowerShell | Shell con módulo Az (`Get-Az*`) | Ambos shells tienen ambos toolkits disponibles |
| Almacenamiento | Pide cuenta de storage + Azure Files share para persistir `$HOME` | Sin montarla, la sesión es efímera |

### 0.2 Plantillas ARM

| Tipo | Qué es | Nota |
|---|---|---|
| Secciones de la plantilla | `parameters` → `variables` → `functions` → `resources` → `outputs` (+ `schema`, `contentVersion`) | El orden es libre salvo referencias; memoriza el flujo |
| Ámbito de despliegue | Grupo de recursos (`az deployment group` / `New-AzResourceGroupDeployment`) · Suscripción (`New-AzDeployment`) · MG · Tenant | Cada ámbito, cmdlet/orden distinto |
| Origen de la plantilla | `-TemplateFile` (local) · **`-TemplateUri`** (web: GitHub/**Blob storage**) · `-TemplateSpecId` (template spec guardada en Azure) | ⭐ pregunta literal del assessment |
| Paso de parámetros | Inline (`--parameters foo=bar`, **arrays incluidos**) o fichero de parámetros (`@params.json` / `-TemplateParameterFile`) | ⭐ un array inline va en `--parameters`, no en `--template-file` |
| Bicep | `az bicep decompile` convierte ARM→Bicep; `build` al revés | ⭐ el examen pide interpretar/modificar/exportar/convertir |

**Modos de despliegue** ⭐:

| | Incremental (default) | Complete |
|---|---|---|
| Recursos en la plantilla | crea/actualiza | crea/actualiza |
| Recursos que **no** están en la plantilla | **los deja tal cual** | **los borra** |
| Cuándo | iterar sin miedo | imponer el estado exacto |

---

## Bloque 1 — Identidad y gobernanza (20–25 %)

### 1.1 Microsoft Entra ID

| Tipo | Qué es | Nota |
|---|---|---|
| **Entra ID** | Identidad en la nube: usuarios, grupos, apps. Estructura **plana**, OAuth/SAML/OpenID, Graph API | ≠ AD DS |
| **AD DS** | Active Directory on-prem: OU jerárquicas, Kerberos/NTLM, LDAP, GPO | Se sincroniza con Entra ID vía Entra Connect |
| **Entra Domain Services** | Dominio gestionado en la nube para apps legacy (LDAP/Kerberos) sin mantener controladores | Licencia P1 |
| Tenant | Instancia dedicada y aislada de Entra ID | Frontera de confianza; una suscripción confía en **un** tenant |

**Entra ID vs AD DS vs Entra DS** ⭐:

| | Entra ID | AD DS | Entra DS |
|---|---|---|---|
| Qué es | identidad en la nube | directorio on-prem tuyo | dominio gestionado en la nube |
| Estructura | plana (users/groups/apps) | jerárquica (OU, GPO) | plana + GPO **parciales** |
| Autenticación | OAuth 2.0 / SAML / OpenID | Kerberos / NTLM | Kerberos / NTLM (compatible legacy) |
| Protocolos | REST (Graph) | LDAP / SMB | LDAP, LDAPS, Kerberos |
| Quién lo mantiene | Microsoft | tú (DCs, parches) | Microsoft (tú solo configuras) |
| Cuándo | apps modernas/SaaS | red corporativa clásica | lift & shift legacy sin desplegar DCs |

**Ediciones Free / P1 / P2** ⭐⭐ (la comparativa que pides):

| Característica | Free | P1 | P2 |
|---|---|---|---|
| Usuarios, grupos, SSO de apps | ✓ | ✓ | ✓ |
| MFA básico (security defaults) | ✓ | ✓ | ✓ |
| **SSPR** para usuarios (reset) | ✗ (solo admins) | ✓ | ✓ |
| **Conditional access** granular | ✗ (solo security defaults) | ✓ | ✓ |
| **Grupos dinámicos** | ✗ | ✓ | ✓ |
| **Licencias por grupo** | ✗ | ✓ | ✓ |
| SSPR **writeback** (híbrido) | ✗ | ✓ | ✓ |
| Entra Connect Health | ✗ | ✓ | ✓ |
| **Identity Protection** (login/riesgo) | ✗ | ✗ | ✓ |
| **PIM** (just-in-time, aprobaciones) | ✗ | ✗ | ✓ |
| Access reviews | ✗ | ✗ | ✓ |

> Regla: P1 = **gobernanza del acceso** (conditional access, dinámicos, SSPR) · P2 = P1 + **protección avanzada** (riesgo, PIM).

### 1.2 Identidades

| Tipo | Qué es | Nota |
|---|---|---|
| Usuario cloud | Creado directo en Entra ID | — |
| Usuario sincronizado | Viene de AD DS vía Entra Connect | Origen sincronizado |
| Invitado B2B | Usuario externo invitado (colaboración externa) | Consume licencia al **acceder** a recursos de pago; quién puede invitar se configura en "external collaboration" (Invitador de usuarios invitados, Admin de usuarios, Global Admin) ⭐ |
| Grupo — Security | Delegar permisos (RBAC) | — |
| grupo — Microsoft 365 | Colaboración (mailbox, Teams, SharePoint) | — |
| Membresía — Assigned | Manual/estática | Gratis |
| Membresía — Dynamic (user/device) | Por **reglas de atributos** | Requiere **P1** ⭐ |
| Licencias | Directas o **basadas en grupos** (se heredan al entrar) | ⭐ group-based licensing = P1 |

**Service principal vs Managed identity**:

| | Service principal | Managed identity |
|---|---|---|
| Cómo nace | la creas tú (registro de app) | la activas en el recurso |
| Credenciales | secreto/certificado que **rotas tú** | sin credenciales visibles (Azure las gestiona) |
| Ciclo de vida | manual | ligado al recurso |
| Cuándo | apps de terceros, pipelines legacy | apps dentro de Azure que llaman a recursos Azure ⭐ |

**Managed identity — system vs user-assigned**:

| | System-assigned | User-assigned |
|---|---|---|
| Ciclo de vida | nace y muere **con el recurso** | recurso independiente |
| Cuántas | 1 por recurso | N por recurso, **compartidas** |
| Cuándo | caso simple, credencial desechable | compartir identidad entre recursos o que sobreviva |

### 1.3 Componentes arquitectónicos (ficha [AZ-900](../knowledge/az900-azure-architecture.md))

| Tipo | Qué es | Nota |
|---|---|---|
| Jerarquía | **Management groups → Suscripción → Resource group → Recurso** | MG: hasta 6 niveles bajo la raíz |
| Suscripción | Frontera de facturación, cuotas y gobernanza | — |
| Resource group | Contenedor lógico de **ciclo de vida** | Un recurso vive en 1 RG; el RG "no tiene región" — recursos del RG pueden estar en **distintas regiones** ⭐ |
| Región / par de regiones / zona de disponibilidad | Set de DCs / copia de seguridad a ≥500 km para DR / DCs aislados dentro de la región | No todos los servicios en todas las regiones |

**Herramientas de coste** ⭐:

| | Alertas de crédito/cuota | Presupuesto (budget) | Advisor |
|---|---|---|---|
| Qué | avisa de saldo/cuota (solo Enterprise) | notificaciones al llegar a **% del gasto** | recomendaciones de optimización |
| Detiene el gasto | ✗ | ✗ (solo avisa) | ✗ |
| Cuándo | contratos EA | controlar mensualidad | ahorro/seguridad/rendimiento |

### 1.4 Azure Policy

| Tipo | Qué es | Nota |
|---|---|---|
| Efecto **Audit / AuditIfNotExists** | Marca no-compliance; **no bloquea** | — |
| Efecto **Deny / DenyAction** | Bloquea la creación/actualización / bloquea **acciones** (p. ej. borrar) | Deny aplica incluso a Owner ⭐ |
| Efecto **Append / Modify** | Añade campos (tags…); Modify puede **remediar** existentes (managed identity) | — |
| Efecto **DeployIfNotExists** | Despliega lo que falte (p. ej. diagnostic settings) | Requiere remediation |
| Definición vs **Iniciativa** | Política vs conjunto de políticas con **una** asignación | ⭐ examen |
| Evaluación | Al crear/actualizar + cada ~24 h + **scan manual** | Compliance: portal o `az policy state list` |

**Policy vs RBAC** ⭐ (se confunden a propósito):

| | Azure Policy | RBAC |
|---|---|---|
| Controla | **qué recursos** pueden crearse y con qué propiedades | **qué acciones** puede hacer cada identidad |
| Aplica a Owner | **sí** (Deny bloquea hasta a Owner) | por asignación de rol |
| Ejemplo | "prohibido VM sin tag" | "Ana puede borrar en RG1" |

### 1.5 RBAC (+ bloqueos)

Roles integrados ⭐:

| Rol | Crear/gestionar recursos | Gestionar accesos (RBAC) |
|---|---|---|
| **Owner** | ✓ | ✓ |
| **Contributor** | ✓ | ✗ |
| **Reader** | ✗ (solo leer) | ✗ |
| **User Access Administrator** | ✗ | ✓ |

| Tipo | Qué es | Nota |
|---|---|---|
| Asignación | **Principal + rol + ámbito** (MG · sub · RG · recurso) | Hereda hacia abajo; permisos **aditivos** (se suman, nunca restan) ⭐ |
| Roles de datos | `Storage Blob Data Reader/Contributor` etc. para el **plano de datos** | RBAC normal no da acceso a los datos ⭐ |
| Deny assignments | Bloqueos explícitos creados por Azure (Blueprints, managed apps) | No creables directamente por usuarios |
| Bloqueo **CanNotDelete** | Impide borrar (heredado) | Ni Owner lo salta: hay que quitar el lock ⭐ |
| Bloqueo **ReadOnly** | Todo queda en solo lectura (como Reader para todos) | Efectos raros: p. ej. no listar claves |

**Bloqueos (locks) vs RBAC**:

| | Lock | RBAC |
|---|---|---|
| Qué limita | **operaciones** sobre el recurso (delete/read) | permisos de identidades |
| Es identidad | ✗ (aplica a **todos**, hasta Owner) | ✓ |
| Ámbito | hereda hacia abajo | hereda hacia abajo |

### 1.6 SSPR

| Tipo | Qué es | Nota |
|---|---|---|
| Métodos de autenticación | Notificación de app móvil · código de app móvil · email · móvil (SMS/llamada) · teléfono de oficina · **preguntas de seguridad** | El admin elige cuáles habilitar |
| Métodos para restablecer | 1 o 2 (configurable) | — |
| Habilitación | Nobody / **Selected group** / All | Empezar con un grupo piloto |
| **Password writeback** | Sincroniza el reset a usuarios híbridos (AD DS) | Requiere **P1** + Entra Connect ⭐ |
| Registro combinado | Un solo flujo registra MFA + SSPR | Default en tenants nuevos |

---

## Bloque 2 — Almacenamiento (15–20 %)

### 2.1 Cuentas de storage

**Tipos de cuenta** ⭐:

| | Standard GPv2 | Premium BlockBlobStorage | Premium FileStorage |
|---|---|---|---|
| Servicios | blob + file + queue + table | **solo blobs** | **solo Files** |
| Medios | HDD/SSD estándar | SSD | SSD |
| Redundancia | todas (LRS → RA-GZRS) | solo LRS/ZRS | solo LRS/ZRS |
| Tiers | Hot/Cool/Cold/Archive | solo Hot | — |
| Cuándo | la default, salvo necesidad premium | blobs de latencia mínima | Files de alto rendimiento |

> Legacies que no se crean ya: GPv1 (`Storage`) y `BlobStorage`. Endpoint: `https://<cuenta>.blob.core.windows.net` (`.file`, `.queue`, `.table`, `.dfs`) — nombre **globalmente único** ⭐.

Redundancia (⭐ cae siempre):

| Tipo | Copias | Alcance | Fallo del que te protege |
|---|---|---|---|
| **LRS** | 3 | 1 DC de la región | Fallo de disco/rack |
| **ZRS** | 3 | 3 zonas de la región | Fallo de zona (sin ir a secundaria) |
| **GRS** | 3+3 | Región + secundaria (pareja) | Fallo de región (failover manual) |
| **GZRS** | 3 zonas + 3 | Región (zonas) + secundaria | Zona y región |
| **RA-GRS / RA-GZRS** | = GRS/GZRS | + **lectura** desde secundaria sin failover | Solo lectura si la primaria cae |

### 2.2 Blob Storage

| Tipo | Qué es | Nota |
|---|---|---|
| Blob **en bloques** | Bloques discretos (texto/binario, imágenes, backups) | El 99 % de los casos |
| Blob **de anexión** | Solo añadir al final (logs) | — |
| Blob **en páginas** | Discos VHD aleatorios | Base de los discos managed |
| Nivel del tier | Default de cuenta o por blob (set-tier) | — |
| Ciclo de vida | Management policy: reglas por filtros (sin acceso X días → Cool/Archive/borrar) | Automatiza los tiers |
| Replicación de objetos | Copia async de blobs en bloques entre cuentas | Requiere versionado en ambas ⭐ |
| Acceso público del contenedor | **Disabled** (default, recomendado) / Blob (lectura anónima de blobs) / Container (listar + leer) | ⭐ trampa frecuente |

**Tiers de blob** ⭐⭐ (regla: cuanto más abajo, más barato **guardar** y más caro **tocar**):

| Tier | Guardar | Acceder | Mínimo | Recuperación |
|---|---|---|---|---|
| **Hot** | caro | barato | — | inmediata |
| **Cool** | barato | caro | 30 días | inmediata |
| **Cold** | muy barato | más caro | 90 días | inmediata |
| **Archive** | casi gratis | muy caro | 180 días | **horas** — rehidratar primero |

**Versionado vs snapshot vs soft delete** ⭐ (el examen los mezcla):

| | Versionado | Snapshot | Soft delete |
|---|---|---|---|
| Qué | versión **automática** en cada escritura | copia puntual **manual** | retiene lo **borrado** |
| Te salva de | sobrescritura/borrado de un blob | "quiero el estado de ayer" | borrado accidental |
| Ámbito | blob | blob | blob · contenedor · **file share** (1–365 días) |
| Se activa | off por defecto | on demand | configurable |

### 2.3 Seguridad de Storage

**Autenticación** ⭐:

| | Claves de cuenta | SAS | Entra ID + RBAC de datos |
|---|---|---|---|
| Alcance | **todo** la cuenta | recurso/operaciones concretas + expiración | por rol (`Storage Blob Data *`) |
| Riesgo | alto (no delegar) | medio (URL viaja) | bajo ⭐ |
| Cuándo | nunca en producción / tooling propio | acceso temporal (p. ej. **24 h** a un partner ⭐) | siempre que se pueda (`--auth-mode login`) |

**Tipos de SAS** ⭐:

| | User delegation | Service | Account |
|---|---|---|---|
| Firmada con | credenciales **Entra ID** (sin clave) | clave de cuenta | clave de cuenta |
| Alcance | **solo Blob** | un servicio | **varios servicios** a nivel de cuenta |
| Stored access policy | ✗ (siempre ad-hoc) | ✓ | ✗ |
| Revocar | quitar RBAC / revocar clave de delegación | cambiar la policy o rotar clave de cuenta | rotar clave de cuenta |
| Cuándo | la **más segura** ⭐ | caso general | multi-servicio |

> SAS ad-hoc **no se puede revocar** (salvo rotar claves); la emitida desde una **stored access policy** sí (se cambia la política). ⭐

**Acceso por red**:

| | Firewall / reglas IP | Service endpoint | Private endpoint |
|---|---|---|---|
| Qué | default Deny + IPs/CIDRs | permite por **subred** de una VNet | IP **privada** del PaaS en tu VNet |
| El PaaS sigue público | sí | sí (pero solo desde tu subred) | **no** (se puede cerrar el acceso público) |
| Cuándo | oficina/VPN concreta | reglas simples por subred | aislamiento total |

⭐ "Solo desde la red local vía ExpressRoute" → configurar **firewall y redes virtuales** de la cuenta, no SAS ni tablas de rutas.

### 2.4 Azure Files

**Tiers de file share** ⭐ (medios y facturación según ficha [Azure Files](../knowledge/az104-azure-files.md)):

| Tier | Medios | Cuenta | Facturación | Cuándo |
|---|---|---|---|---|
| **Premium** | SSD | FileStorage | **aprovisionada** (pagas lo reservado) | latencia mínima |
| **Transaction optimized** | HDD | GPv2 | pago por uso | muchísimas transacciones |
| **Hot** | HDD | GPv2 | pago por uso | uso general/equipos |
| **Cool** | HDD | GPv2 | pago por uso | acceso esporádico, backups |

| Tipo | Qué es | Nota |
|---|---|---|
| Protocolo | **SMB** (3.x, ACL de Windows; ISP bloquean 445) · **NFS 4.1** (solo Premium) | ⭐ qué protocolo con qué identidad |
| Acceso con identidad | Cuenta+clave / SAS / **AD DS** (on-prem) / **Entra ID Kerberos** (cloud) / Entra DS | RBAC `Storage File Data SMB Share *` |
| **Azure File Sync** | Cache local: share en la nube + Windows Server local | Puerto 443; sin puertos entrantes |
| Componentes de File Sync | **Storage Sync Service** → sync group → **cloud endpoint** (share) + **server endpoint** (carpeta registrada) | ⭐ nombres de piezas en preguntas |
| **Cloud tiering** | Deja en local solo lo caliente (política de % libre / días sin acceso) | El resto a petición |

---

## Bloque 3 — Cómputo (20–25 %)

### 3.1 Virtual Machines

| Tipo | Qué es | Nota |
|---|---|---|
| Origen de imagen | Marketplace · captura de VM **generalizada** (imagen propia) · **Shared Image Gallery** (versiones, replicación) · VHD especializado | ⭐ generalizar antes de capturar |
| Series de tamaño | **B** burstable (dev, créditos) · **D** general · **E** memoria · **F** CPU · **L** storage · **H** HPC · **N** GPU | ⭐ elegir serie por requisito |
| Estados de facturación | **Deallocated** (no factura cómputo) vs **Stopped** (stopped: factura) | ⭐ `deallocate` ≠ `stop` |
| Movimiento | Entre RG/suscripción (`az resource move`) · entre **regiones** (Azure Resource Mover) | ⭐ cae en assessment |
| Cifrado | **SSE** en reposo (default) · **CMK** (Key Vault + disk encryption set) · **Encryption at host** (caché/temporal) · **ADE** (BitLocker/dm-crypt, dentro del SO) · Confidential VM | ⭐ saber la capa de cada uno |
| Troubleshooting | **Redeploy** (reinstala en otro nodo del host) · Run Command / extensiones | ⭐ redeploy sin abrir puertos |

**Tipos de disco** ⭐:

| Disco | SKU | IOPS máx | Escenario |
|---|---|---|---|
| Standard HDD | `Standard_LRS` | ~2.000 | backups, acceso esporádico |
| Standard SSD | `StandardSSD_LRS/ZRS` | ~6.000 | web ligera, dev/test |
| **Premium SSD** | `Premium_LRS/ZRS` | 20.000 | **producción** — VM con `s` (B2**s**) |
| Premium SSD **v2** | `PremiumV2_LRS` | configurable | IOPS/throughput independientes del tamaño |
| **Ultra** | `UltraSSD_LRS/ZRS` | 160.000 | BD exigentes — **solo discos de datos** |

### 3.2 Disponibilidad de VMs

**Availability zone vs availability set vs nada** ⭐⭐:

| | Availability zone | Availability set | VM sola |
|---|---|---|---|
| Qué | DCs separados en la región | reparto dentro del DC | nada |
| Se reparte por | zonas | **fault domains** (≤3: rack/energía) + **update domains** (≤20: parcheo por tandas) | — |
| Protege de | fallo de zona/DC | fallo de rack + olas de actualización | nada |
| SLA | **99,99 %** | **99,95 %** | 99,9 % (con SSD premium) |
| Cuándo | la región lo soporta y quieres máximo | la región no tiene zonas o VM ligadas a un host concreto | dev/test |

| Tipo | Qué es | Nota |
|---|---|---|
| Escalado **vertical** (up/down) | Cambiar de tamaño (resize) → **reinicio** | — |
| Escalado **horizontal** (in/out) | Más instancias | — |
| Autoscale | Perfil min/default/max + reglas (métrica o **programadas**) | Cool-down para evitar flapping ⭐ |

**VMSS — Uniform vs Flexible**:

| | Uniform | Flexible |
|---|---|---|
| Instancias | **idénticas** | tamaños **mixtos** |
| Reparto | FD/UD del set | hasta 5 FD en región / zonas, sin set |
| Orquestación | completa (upgrade policy, autoscale clásico) | mínima (tú decides cuándo) |
| Cuándo | flota homogénea clásica | mezclar + máxima difusión (recomendado) |

### 3.3 App Service Plan

**Tiers del plan** ⭐⭐ (la matriz de diferencias entre planes):

| Plan | Compute | Slots | Autoscale | VNet integ. | Backup | Uso |
|---|---|---|---|---|---|---|
| **Free (F1)** | compartido con otros clientes | 0 | ✗ | ✗ | ✗ | dev (sin dominio propio) |
| **Shared (D1)** | compartido | 0 | ✗ | ✗ | ✗ | dev con dominio propio |
| **Basic (B1–B3)** | dedicado (tus apps) | 0 | **✗** | ✗ | ✗ | dev/test en pago ⭐ |
| **Standard (S1–S3)** | dedicado | **5** | ✓ | ✓ | ✓ | producción base |
| **Premium (P1v2/v3…)** | dedicado + | **20** | ✓ | ✓ | ✓ | rendimiento |
| **Isolated (I1v2–I3v2)** | **ASE** (VNet propia) | 20 | ✓ | ✓ nativo | ✓ | aislamiento/compliance |

- Facturación por **instancia del plan**, no por app: N apps en un plan comparten las mismas instancias ⭐.
- ⭐ Trampa del assessment: "escalar automáticamente al 80 % de CPU" con plan **Basic** → primero **subir de tier** (Standard+), luego crear la regla de autoscale.

### 3.4 App Service (apps)

| Tipo | Qué es | Nota |
|---|---|---|
| Despliegue | zip/war · local Git · **GitHub Actions / Azure DevOps** · contenedor (ACR/Docker Hub) | `az webapp up` = plan+app+código |
| **Deployment slots** | Apps paralelas (staging…) con su propio hostname; **swap** a producción | Config "sticky" (slot setting) no viaja en el swap ⭐ |
| Swap | Swap (directo) / swap con preview / auto-swap | ⭐ calienta antes de cambiar |
| Config de app | App settings (env vars) y connection strings | Marcarlas "slot setting" para no moverlas |
| Dominio personalizado | Subdominio → **CNAME**; dominio raíz → **A + TXT** (asuid de verificación) | ⭐ CNAME vs A+TXT |
| Red (in) | Access restrictions (allow/deny por IP/slot) | — |
| Red (out) | **VNet integration** (accede a recursos privados) · **Hybrid Connections** (TCP vía relay a on-prem) | — |
| Logs de diagnóstico | App logs · Web server logs · Detailed error messages · Failed request tracing | ⭐ los 4 tipos del assessment |

**Opciones TLS/SSL** ⭐:

| | Binding SNI | Binding IP-based | Managed Certificate | Traer tu cert |
|---|---|---|---|---|
| Qué | varios dominios por IP (moderno) | IP dedicada (legacy) | gratis, autorrenovable | subes el PFX (o Key Vault) |
| Wildcard | ✓ | — | ✗ | ✓ |
| Cuándo | default | compatibilidad antigua | domains sencillos | cumplimiento/CA corporativa |

**Backup** ⭐: manual + programado (requiere cuenta de storage) — disponible desde **Standard**.

### 3.5 Azure Container Instances

| Tipo | Qué es | Nota |
|---|---|---|
| **Container group** | Contenedores en el mismo host: comparten ciclo de vida, **IP**, FQDN y volúmenes | Como un pod de K8s ⭐ |
| OS | Linux (grupos multi-contenedor) · Windows (1 contenedor) | — |
| **Restart policy** | **Always** (default, servicio) · **OnFailure** (job hasta éxito) · **Never** (una vez) | ⭐ literal de examen |
| Recursos | CPU/memoria **por contenedor**, se fijan al crear | 0,1–4 vCPU / 0,1–16 GB |
| Deploy | YAML (`az container create --file`) · export de grupo existente (`az container export`) | ⭐ assessment pidió export/--file |
| Red | IP pública + DNS label, o despliegue **en VNet** (Linux, sin IP pública) | — |
| Registros privados | Admin user · service principal · **managed identity** | — |
| Volúmenes | Azure Files · secret · emptyDir | — |

Gap del examen — **ACR** ⭐:

| | Basic | Standard | Premium |
|---|---|---|---|
| Uso | dev | producción | escala / varias geos |
| Storage incluido | 10 GiB | 100 GiB | 500 GiB |
| **Geo-replicación** | ✗ | ✗ | ✓ |
| **Private link / firewall** | ✗ | ✗ | ✓ |
| Retention policies | ✗ | ✗ | ✓ |
| Webhooks | ✓ | ✓ | ✓ |

Auth del registro: admin user (dev) · service principal · **managed identity** (recomendado) · tokens con ámbito de repositorio.

**ACI vs Container Apps vs AKS** ⭐:

| | ACI | Container Apps | AKS |
|---|---|---|---|
| Qué es | contenedor suelto serverless | contenedores serverless **orquestados** | Kubernetes gestionado completo |
| Escala | pagas por segundo de ejecución | **KEDA**: HTTP/colas/CPU… hasta **0** | clúster completo (pods/nodos) |
| Despliegues | YAML/ARM | revisions + traffic split | manifiestos/Helm |
| Cuándo | jobs, event-driven, dev | microservicios sin operar K8s | control total de orquestación |

---

## Bloque 4 — Redes virtuales (15–20 %)

> El mapa "concepto → para qué → cuándo → mnemotecnia" de todo el bloque está en la tabla de [Notas propias del Bloque 4 del roadmap](../notes/AZ-104/roadmap.md).

### 4.1 VNets y direccionamiento

| Tipo | Qué es | Nota |
|---|---|---|
| Espacio de direcciones | CIDR privado (10/8, 172.16/12, 192.168/16) | No puede solaparse con VNets peer ⭐ |
| Subred | Segmento del espacio; **5 IP reservadas** (.0 red, .1 gateway, .2+.3 DNS, .255 broadcast) | ⭐ "¿cuántas utilizables?" |
| Subredes especiales | **GatewaySubnet** (/27+) para VPN/ER · **AzureBastionSubnet** (/26+) · subredes *delegadas* a un servicio | El nombre es obligatorio |
| IP privada | **Dynamic** (puede cambiar al rearrancar) vs **Static** (fija) | Estáticas para VMs que no pueden cambiar |

**IP pública — Basic vs Standard** ⭐:

| | Basic | Standard |
|---|---|---|
| Asignación | dynamic o static | **solo static** |
| Zonas | ✗ | zone-redundant o zonal |
| Seguridad | abierta por defecto | **segura por defecto** (exige NSG) |
| Estado | en retirada | la SKU a usar |

### 4.2 NSG y ASG

| Tipo | Qué es | Nota |
|---|---|---|
| Asociación | A **subred** (afecta a todos los NICs de esa subred) y/o a **NIC** | Solo a eso: **no** a VNets ni a VMs directamente ⭐⭐ literal del assessment |
| Regla | Prioridad **100–4096** (menor = primero), dirección in/out, protocolo TCP/UDP/ICMP/Any, origen/destino (IP, CIDR, **service tag**, **ASG**), puertos/rangos | ⭐ primera regla que matchea gana |
| Reglas por defecto | In: AllowVNetInBound, AllowAzureLoadBalancerInBound, **DenyAllInBound** · Out: AllowVNetOutBound, **AllowInternetOutBound**, DenyAllOutBound | No se borran, sí se puede sobrepriorizar |
| **Service tags** | `VirtualNetwork`, `AzureLoadBalancer`, `Internet`, `Storage.<región>`, `Sql`… | Origen/destino sin gestionar IPs |
| **ASG** | Grupo de NICs (o IPs) usado como origen/destino en reglas | "Aplicar la misma regla a los WebServers" ⭐ |
| Reglas efectivas | Combinación de NSG de subred + NSG de NIC | Effective security rules / Network Watcher |

**NSG de subred vs NSG de NIC**:

| | A subred | A NIC |
|---|---|---|
| Afectedos | todas las VMs de la subred | solo esa VM |
| Cuándo | política del segmento (frontend/backend) | excepción por máquina |
| Ambos a la vez | ✓ — se **combinan** (reglas efectivas) | |

### 4.3 Azure DNS

**Opciones de resolución de nombres** ⭐ (la del assessment):

| | Resolución de Azure (default) | Zona privada de Azure DNS | Servidor DNS en VM |
|---|---|---|---|
| Nombres propios | ✗ (nombres internos planos) | ✓ (`contoso.com`) | ✓ |
| Alcance | **una sola VNet** | VNets **enlazadas** (funciona con peering) + **auto-registration** | lo que configures |
| Esfuerzo | cero | bajo ⭐ | alto (mantener la VM) |
| Cuándo | VM↔VM dentro de la VNet | **FQDN entre VNets peer con mínimo esfuerzo** ⭐⭐ | requisitos especiales |

| Tipo | Qué es | Nota |
|---|---|---|
| Zona **pública** | Resuelve en Internet (delegación con NS en el registrador) | — |
| Registros | A, AAAA, CNAME, MX, NS, PTR, SOA, SRV, TXT (+ CAA) | SOA/NS se crean solos |
| **Alias records** | A/AAAA/CNAME que apuntan a un recurso Azure (IP pública, Traffic Manager…) y se actualizan solos | ⭐ |

### 4.4 VNet Peering

| Tipo | Qué es | Nota |
|---|---|---|
| Peering regional / **global** | Entre VNets de la misma región / de regiones distintas | Tráfico por backbone privado, baja latencia |
| Propiedades | Allow VNet access · **allow forwarded traffic** · **gateway transit** (el hub presta su gateway) / **use remote gateways** (el spoke lo usa) | ⭐ hub-spoke ⭐⭐ cae siempre |
| Transición | El peering **no es transitivo**: spoke↔spoke requiere su propio peering o NVA con UDR | ⭐ trampa estrella |
| Solapamiento | Espacios de direcciones **no pueden solaparse** | Revisa antes de peer ⭐ |
| Cross-subscription | Posible (incluso entre tenants) | Requiere registro del recurso |

**Peering vs VNet-to-VNet VPN**:

| | Peering | V2V VPN |
|---|---|---|
| Camino | backbone **privado** de Microsoft | túnel **cifrado** por Internet pública |
| Latencia | mínima | mayor |
| Cifrado | ✗ (no lo necesita) | ✓ (IPsec) |
| Cuándo | default, misma organización | exigencia de cifrado / entre entornos |

### 4.5 Rutas (UDR)

**Prioridad de rutas** ⭐ (gana el prefijo más largo; a igualdad):

| Prioridad | Ruta | Nota |
|---|---|---|
| 1 | **UDR** (route table en la subred) | tú mandas |
| 2 | **BGP** (VPN/ExpressRoute) | rutas on-prem |
| 3 | **Sistema** (default VNet/Internet) | no editables |

| Tipo | Qué es | Nota |
|---|---|---|
| Next hop | **VirtualNetwork** · **VirtualNetworkGateway** · **Virtual appliance** (IP del NVA) · **Internet** · **None** (descarta) | ⭐ tipos literales |
| `0.0.0.0/0 → NVA` | Todo el tráfico sale forzado por el firewall (forced tunneling / service chaining) | Escenario hub-spoke ⭐ |

**Service endpoint vs Private endpoint** ⭐⭐:

| | Service endpoint | Private endpoint |
|---|---|---|
| El PaaS | sigue siendo **público** (tráfico por backbone MS) | **IP privada** en tu VNet |
| IP de origen que ve el PaaS | la **privada** de la VM | la del endpoint privado |
| IPs de subred | no consume | consume IPs de la subred |
| Coste | gratis | de pago (endpoint + horas) |
| DNS | el público normal | zonas `privatelink.*` |
| Cerrar el acceso público del PaaS | ✗ | ✓ (aislamiento total) |
| Cuándo | reglas de red simples por subred | PaaS dentro de tu red privada |

### 4.6 Load Balancer

**SKU Basic vs Standard** ⭐:

| | Basic | Standard |
|---|---|---|
| SLA | sin SLA | **99,99 %** |
| Zonas | ✗ | zone-redundant / zonal |
| Seguridad | abierta | **segura por defecto** (NSG obligatorio) |
| Backend | NICs (VM/AS/VMSS) | + **IPs** (IP-based) y mixto |
| Health probes | TCP / HTTP | + **HTTPS** |
| Precio | gratis | de pago |
| Estado | en retirada | el actual |

| Tipo | Qué es | Nota |
|---|---|---|
| Frontend | **Público** (IP pública) vs **interno** (IP privada en la VNet) | ⭐ |
| Tier Gateway | Standard LB orientado a salida (egress intensivo) | Examen avanzado |
| Health probe | Intervalo 5 s, 2 fallos = down | Sin probe definida, LB asume up ⭐ |
| Reglas | **Load balancing rule** (grupo) · **inbound NAT rule** (a una VM/puerto concreto — RDP/SSH) · **outbound rule** (SNAT) | ⭐ NAT vs LB rule |
| **Modo de distribución** | **5-tupla** (src IP+port, dst IP+port, protocolo — el default y el más uniforme) · **source IP** (2-tupla, sesión pegada) · **source IP + protocolo** (3-tupla) | ⭐⭐ pregunta literal del assessment |
| HA ports | Todas las puertas en una regla (escenarios NVA/DR, LB interno) | Standard |
| Idle timeout | 4–100 min (Standard) | ⭐ "timeouts intermitentes" |

**Load Balancer vs Application Gateway** ⭐⭐:

| | Load Balancer | Application Gateway |
|---|---|---|
| Capa | **L4** | **L7** |
| Protocolo | TCP / UDP | **HTTP/HTTPS** |
| Routing | IP:puerto (hash) | por **URL path**, **multi-site** (host), redirecciones |
| TLS | ✗ | terminación / re-encrypt (Key Vault) |
| WAF | ✗ | ✓ (WAF_v2) |
| Cuándo | cualquier tráfico, baja latencia | aplicaciones web |

### 4.7 Application Gateway

| Tipo | Qué es | Nota |
|---|---|---|
| SKU | **Standard_v2** / **WAF_v2** (v1 retirada) | v2: autoscale, zonas, VIP estática |
| Listener | Puerto/protocolo/SNI; **multi-site** (por hostname) | — |
| Regla | **Basic** (todo a un pool) vs **path-based** (`/images` → pool A) | ⭐ routing por URL |
| Backend pool | NIC/IP/FQDN/**App Service** | Con App Service: activar host name override ⭐ |
| HTTP settings | Puerto/protocolo, cookie affinity, connection draining, probe, override del host | — |
| TLS | **Terminación** en el GW (cert en el listener) o **E2E/re-encrypt** al backend (trusted root) | Key Vault certs en v2 ⭐ |

**WAF — modos** ⭐:

| | Detection | Prevention |
|---|---|---|
| Qué | registra las coincidencias | **bloquea** la petición |
| Cuándo | afinar reglas sin impacto | protección real |

Reglas: conjuntos OWASP CRS (+ custom rules).

### 4.8 Network Watcher

| Herramienta | Responde a |
|---|---|
| **IP flow verify** | ¿Un NSG está bloqueando VM↔IP:puerto? |
| **Next hop** | ¿Por dónde sale este tráfico? (muestra tipo de next hop + ruta aplicada — UDR mal) |
| **Connection troubleshoot** | ¿Llega y con qué latencia? (one-shot) |
| **Connection Monitor** | Igual pero **continuo**, con alertas |
| **Effective security rules** | Reglas combinadas (subred + NIC) de un NIC |
| **Packet capture** | Captura de tráfico en VM (a storage) |
| **NSG flow logs** | Registro de flujos permitidos/denegados |
| **Topology** | Mapa visual de los recursos de red |

⭐ Trio de troubleshooting: IP flow (NSG) + next hop (rutas) + connection troubleshoot (conectividad).

---

## Bloque 5 — Supervisión y backup (10–15 %)

### 5.1 Azure Backup

**Recovery Services vault vs Backup vault** ⭐⭐ (qué vault para qué workload):

| | Recovery Services vault | Backup vault |
|---|---|---|
| Plataforma | clásica | nuevo dataplane |
| **VMs de Azure** | ✓ | ✗ |
| SQL / SAP HANA en VM | ✓ | ✗ |
| **Azure Files** | ✓ | ✗ |
| MARS / MABS / DPM (on-prem) | ✓ | ✗ |
| **Blobs** (operational backup) | ✗ | ✓ |
| **Discos managed** | ✗ | ✓ |
| PostgreSQL / ADLS / AKS / Cosmos DB | ✗ | ✓ |
| Cross-region restore | ✓ (GRS + CRR) | limitado |

> No se puede migrar un backup entre tipos de vault.

| Tipo | Qué es | Nota |
|---|---|---|
| Política | Horario (diaria/semanal) + retención (diaria/semanal/mensual/anual) | Instant snapshot retention 1–5 días |
| Tiers de backup | Snapshot → vault-standard → **vault-archive** (largo plazo, barato, restauración lenta) | ⭐ |
| Protección del vault | **Soft delete** (14 días, siempre activo en VMs) · inmutabilidad · multi-user authorization | ⭐ borrar backup ≠ inmediato |
| Backup Center | Panel único de toda la finca | — |

### 5.2 Backup de VMs y Site Recovery

| Tipo | Qué es | Nota |
|---|---|---|
| Agente extensión de VM | Snapshot de discos → vault (Windows VSS / VM Snapshot Linux) | Método por defecto de VM IaaS |
| Agente **MARS** | Archivos/carpetas desde dentro de la VM o on-prem (solo Windows) | ⭐ cuándo MARS vs extensión |
| Consistencia | **Application** (VSS/scripts, memoria+IO) · **File system** (fallback de VSS) · **Crash** (VM apagada, sin garantías) | ⭐ niveles literales |

**Opciones de restore** ⭐:

| | Crear VM nueva | Restaurar discos | Reemplazar existente | Cross-region | Files |
|---|---|---|---|---|---|
| Qué | VM completa del punto | solo los discos | cambia los discos de la VM actual | en la **secundaria** | monta el punto como unidad |
| Cuándo | restore rápido | personalizar luego | deshacer cambios en la misma VM | **DR** (GRS + CRR) ⭐ | recuperar ficheros sueltos |

**Azure Backup vs Azure Site Recovery** ⭐⭐:

| | Azure Backup | Azure Site Recovery |
|---|---|---|
| Qué | **copias puntuales** en el tiempo | **réplica casi en tiempo real** |
| RPO | según política (horas) | mínimos |
| Objetivo | recuperar **datos** (borrado, corrupción, ransomware) | **continuidad** (caída de región) |
| Salida | restore | **failover** (+ test failover, failback) |
| Cuándo | "he perdido datos" | "la región/regla ha caído" |

### 5.3 Azure Monitor

**Metrics vs Logs** ⭐⭐:

| | Metrics | Logs (Log Analytics) |
|---|---|---|
| Formato | número + timestamp (series temporales) | registros con columnas (eventos, trazas) |
| Latencia | ~1 min | minutos (ingesta) |
| Retención | 93 días | 30 días default (archivable años) |
| Consulta | metrics explorer | **KQL** |
| Alertas | metric alerts | log search alerts |
| Cuándo | rendimiento/estado en vivo, dashboards | auditoría, eventos, cruces de fuentes |

| Tipo | Qué es | Nota |
|---|---|---|
| Activity log — categorías | **Administrative · Policy · Security · Service Health · Resource Health · Alert · Autoscale** | ⭐ lista literal |
| Origen de datos | Platform metrics/logs (gratis) · **resource logs** (via *diagnostic setting*) · guest OS (**Azure Monitor Agent** + Data Collection Rules) | ⭐ destino del setting: workspace/storage/event hub |
| Insights | **VM** (mapa+rendimiento) · Container · Storage · Network | Packs de dashboards por servicio |
| **Alerta de métrica** | Umbral **estático** o **dinámico** (ML) | — |
| **Alerta de log** | `number of results` (filas) o `metric measurement` (medida por fila) | ⭐ dos subtipos |
| **Alerta de activity log** | Sobre eventos administrativos/service/resource health | — |
| Action group | **Notificaciones** (email/SMS/push/voz/ITSM) + **acciones** (webhook, logic app, function, runbook, event hub) | ⭐ dos bloques literales |
| **Alert processing rule** | Suprimir o aplicar acciones a un ámbito/horario (mantenimiento) | ⭐ |
| Estados de alerta | **Nuevo / Confirmado (Acknowledged) / Cerrado** · condición Fired/Resolved · severidad Sev0–Sev4 | ⭐ del assessment |

---

## Relacionado

- [Roadmap AZ-104](../notes/AZ-104/roadmap.md) (fuente de los módulos y pesos) · [Índice AZ-104](../certifications/AZ-104/INDEX.md) · [Simulacros](../certifications/AZ-104/test-exams/README.md)
- Chuletas de comandos: [Identidad y gobernanza](az-104-identity-governance.md) · [Storage](az-104-storage.md) · [Compute](az-104-compute.md) · [Azure CLI](azure-cli.md)
- Razonamiento "qué elegir": [guía de cómputo](../concepts/compute-decision-guide.md) · [guía de storage](../concepts/storage-decision-guide.md) · [guía de identidad y gobernanza](../concepts/identity-governance-decision-guide.md) · [modelo mental de red](../concepts/networking-primer.md)
- Fichas por módulo: carpetas `knowledge/az104-*` — cada bloque del roadmap enlaza las suyas
