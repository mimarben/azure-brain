---
title: AZ-104 Simulacro 5 — Nivel avanzado (50 ítems)
tags: [certification, exam-sim]
certification: [AZ-104]
updated: 2026-10-07
sources:
  - https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104
  - raw/AZ-104T00/
  - https://learn.microsoft.com/en-us/azure/storage/blobs/object-replication-overview
  - https://learn.microsoft.com/en-us/azure/vpn-gateway/point-to-site-entra-authenticate
  - https://learn.microsoft.com/en-us/azure/network-watcher/vnet-flow-logs-overview
---

# Simulacro 5 — Nivel avanzado (50 ítems)

**50 ítems · 120 minutos · libro cerrado.** Preguntas originales de nivel igual o superior al examen real, centradas en **gotchas de mecanismo**, exhibits y trampas de redacto (muchas apuntan a los puntos débiles detectados en simulacros anteriores: detalle de supervisión, Storage avanzado e identidad). Incluye **4 series Sí/No** (preguntas 7, 14, 22 y 29 — cada serie son 3 ítems) y un **caso práctico** (preguntas 37–42): léelo entero antes de responder las suyas; puedes volver a él cuantas veces quieras.

**Cómo responder:** marca tu opción con una **x** dentro de los corchetes (`[x]`); en las de "elige dos/tres" tica **exactamente** ese número; en las series Sí/No tica **una sola** columna; en las de ordenar escribe las letras de la secuencia. Al terminar, pide **«corrige el examen 5»** y se leerán tus marcas contra [examen-5-soluciones.md](examen-5-soluciones.md).

---

## Identidades y gobernanza

**1.** *(Una respuesta)* El administrador global de Microsoft Entra ID abre el portal de Azure y **no ve ninguna suscripción** de la empresa. ¿Por qué y cómo lo resuelve?

- [ ] A. Un administrador global siempre tiene Owner sobre todas las suscripciones: si no las ve es caché del portal
- [ ] B. Se asigna el rol User Access Administrator en cada suscripción desde el panel IAM de cada una
- [ ] C. El rol de administrador global **no otorga acceso a Azure por defecto**: debe elevar el acceso (*elevate access*) en las propiedades de Entra ID, lo que le da User Access Administrator en el ámbito raíz `/`
- [ ] D. Crea una suscripción nueva desde Entra ID y desde ella ve las demás

**2.** *(Una respuesta — exhibit)* Analiza esta definición de rol personalizado:

```json
{
  "Name": "OperadorVM-Contoso",
  "AssignableScopes": ["/subscriptions/sub-xxxx"],
  "Permissions": [
    {
      "Actions": ["*/read", "Microsoft.Compute/virtualMachines/*"],
      "NotActions": ["Microsoft.Compute/virtualMachines/delete"]
    }
  ]
}
```

Un usuario tiene **solo** este rol. ¿Qué afirmación es cierta?

- [ ] A. Puede gestionar VMs pero no leer ningún otro recurso: `*/read` queda anulado por NotActions
- [ ] B. Puede leer todos los recursos, crear/redimensionar/reiniciar VMs y **no puede borrarlas con este rol**: NotActions resta de Actions dentro del rol, no es una denegación absoluta
- [ ] C. No podrá borrar VMs ni aunque otro rol que tenga lo permita, porque NotActions tiene prioridad sobre cualquier asignación
- [ ] D. Sí puede borrarlas: el comodín `virtualMachines/*` incluye `delete` y NotActions se ignora

**3.** *(Una respuesta)* Tras una fusión, la empresa **transfiere una suscripción de Azure al directorio (tenant) de Entra ID** de la matriz. ¿Qué ocurre con las asignaciones de roles RBAC de esa suscripción?

- [ ] A. Se conservan: RBAC es independiente del directorio y los usuarios siguen autenticando contra el tenant antiguo
- [ ] B. Se migran automáticamente: los usuarios se replican al nuevo tenant con sus mismos roles
- [ ] C. Solo se pierden las asignaciones de Owner; el resto se mantiene
- [ ] D. **Se eliminan**: usuarios, grupos, entidades de servicio e identidades administradas del tenant antiguo pierden su acceso; hay que reasignar los roles con identidades del nuevo tenant

**4.** *(Una respuesta)* Los usuarios se sincronizan desde AD DS on-premises con **sincronización de hash de contraseñas (PHS)**. Deben poder restablecer su contraseña desde el portal de autoservicio de Entra ID y que el cambio **se replique también en el AD local**. ¿Qué habilitas?

- [ ] A. El **reescritura de contraseñas (password writeback)** en Entra Connect (requiere PHS o PTA y licencia de pago, p. ej. P1) junto con SSPR
- [ ] B. Nada: con PHS el restablecimiento en la nube se escribe en AD automáticamente
- [ ] C. Un controlador de Entra Domain Services para ese dominio
- [ ] D. La reescritura de atributos de Exchange híbrido, que cubre contraseñas

**5.** *(Una respuesta)* Invitas por B2B a 10 colaboradores que usan cuentas de Gmail y **no tienen cuenta Microsoft ni Entra ID**. ¿Cómo se autentican al canjear la invitación, sin crearles credenciales nuevas?

- [ ] A. No pueden: deben crear primero una cuenta Microsoft
- [ ] B. B2B direct connect les da acceso directo con su cuenta de Google
- [ ] C. Con el **código de acceso de un solo uso por correo (one-time passcode)**: reciben un código en su Gmail para autenticarse
- [ ] D. Con la federación de Google configurada en el tenant

**6.** *(Una respuesta)* Una científica de datos tiene el rol **Contributor** sobre una cuenta de almacenamiento. Ejecuta `az storage blob list` autenticándose con su cuenta de Entra (sin claves) y recibe `AuthorizationPermissionMismatch`. ¿Cómo lo resuelves con **menor privilegio**?

- [ ] A. Invitándola como B2B del mismo tenant de la cuenta
- [ ] B. Contributor solo concede acceso al **plano de control**: para leer datos hay que asignarle un rol de datos como **Storage Blob Data Reader**
- [ ] C. Añadiéndole Reader en la suscripción
- [ ] D. Dándole un SAS de cuenta firmado con key1

**7.** *(Serie Sí/No — 3 ítems)* Sobre Azure Policy:

| #   | Afirmación                                                                                                                            | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | Las exenciones de directiva (exemptions) se clasifican por categoría (p. ej. *Waiver* o *Mitigated*) y pueden tener fecha de expiración | [ ] | [ ] |
| b   | Una directiva con efecto Modify necesita una identidad administrada para poder remediarse                                                | [ ] | [ ] |
| c   | Una tarea de remediación corrige también los recursos que entren en no conformidad en el futuro, sin necesidad de tareas nuevas           | [ ] | [ ] |

## Almacenamiento

**8.** *(Una respuesta — exhibit)* La cuenta tiene esta directiva de administración del ciclo de vida:

```json
{
  "rules": [{
    "name": "docs",
    "enabled": true,
    "definition": {
      "filters": { "blobTypes": ["blockBlob"], "prefixMatch": ["docs/"] },
      "actions": {
        "baseBlob": {
          "tierToCool":    { "daysAfterModificationGreaterThan": 30 },
          "tierToArchive": { "daysAfterModificationGreaterThan": 180 },
          "delete":        { "daysAfterModificationGreaterThan": 365 }
        }
      }
    }
  }]
}
```

El blob `docs/informe-2024.pdf` lleva **200 días sin modificarse**. ¿En qué nivel está?

- [ ] A. Hot: las reglas no se aplican a blobs que ya existían
- [ ] B. Cool: pasó los 30 días, pero la regla de archivo aún no le aplica
- [ ] C. **Archive**: superó los 180 días sin modificación y las acciones se evalúan en cascada
- [ ] D. Eliminado: superó los 90 días de retención

**9.** *(Una respuesta)* Concediste a un partner un SAS de servicio de **6 meses** sobre el contenedor `partners`. La app legacy no tolera la **rotación de claves de la cuenta**. Hay un incidente de seguridad y debes **revocar el acceso de inmediato**. ¿Qué habrías debido usar y cómo lo revocas?

- [ ] A. Un SAS ad-hoc de servicio: se revoca desde el portal con la opción *Revocar SAS*
- [ ] B. Un SAS de delegación de usuario: se revoca rotando la clave de la cuenta
- [ ] C. Un SAS de cuenta: se revoca deshabilitando el acceso público del contenedor
- [ ] D. Un SAS **asociado a una directiva de acceso almacenada (stored access policy)**: se revoca quitando la política (o adelantando su expiración) sin tocar las claves

**10.** *(Elige tres)* Vas a configurar la **replicación de objetos** entre `storigen` y `stdestino`. ¿Qué tres prerrequisitos aplican?

- [ ] A. Versionado de blobs **habilitado en la cuenta de origen**
- [ ] B. Versionado de blobs **habilitado en la cuenta de destino**
- [ ] C. Change feed **habilitado en la cuenta de destino**
- [ ] D. Change feed **habilitado en la cuenta de origen**

**11.** *(Una respuesta)* Una app de informes lee de la secundaria de una cuenta RA-GRS. Un auditor pide conocer en cada momento la **ventana máxima de pérdida de datos** (desfase entre primaria y secundaria). ¿Qué consultas?

- [ ] A. La propiedad **Last Sync Time** (hora de última sincronización) de la cuenta: marca el punto hasta el que la secundaria garantiza coherencia
- [ ] B. La métrica de latencia del servidor de la secundaria
- [ ] C. La fecha del último blob creado en la secundaria
- [ ] D. Nada: RA-GRS garantiza RPO cero

**12.** *(Una respuesta)* Necesitas un share **NFS 4.1** de Azure Files para una granja de render Linux. ¿Qué afirmación es cierta?

- [ ] A. NFS se activa en cualquier cuenta StorageV2 estándar cambiando el protocolo del share
- [ ] B. NFS soporta autenticación con Entra ID igual que SMB
- [ ] C. NFS requiere una cuenta **FileStorage (Premium)**, el acceso es **solo desde la VNet** (sin endpoint público) y la autenticación es AUTH_SYS, no Entra ID
- [ ] D. Un mismo share puede servir SMB y NFS simultáneamente sobre los mismos datos

**13.** *(Ordenar)* Las apps usan la **clave key1** de la cuenta de almacenamiento. Debes rotar las claves **sin cortar el servicio**. Ordena los pasos:

- A. Actualizar todas las apps/cadenas de conexión para usar key2
- B. Regenerar key2 (la clave que ninguna app usa)
- C. Verificar que ya no queda nadie usando key1 y regenerarla
- D. Confirmar qué clave usan las apps (key1)

Secuencia (letras):

**14.** *(Serie Sí/No — 3 ítems)* Sobre Blob Storage:

| #   | Afirmación                                                                                                    | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | Las directivas de administración del ciclo de vida solo aplican a blobs en bloques                             | [ ] | [ ] |
| b   | Al borrar un blob base, sus snapshots se borran siempre automáticamente junto a él                              | [ ] | [ ] |
| c   | Un blob en nivel Archive puede leerse directamente con una petición GET normal, sin rehidratarlo               | [ ] | [ ] |

## Procesos

**15.** *(Una respuesta)* Evaluas migrar tu conjunto de escalado de orquestación **Uniform** a **Flexible**. ¿Qué te da Flexible frente a Uniform?

- [ ] A. Actualizaciones Rolling con lotes configurables, igual que Uniform
- [ ] B. Instancias tratadas como **VMs individuales**, dispersas entre dominios de error y zonas — sin directiva de actualización Rolling (las actualizaciones van por instancia)
- [ ] C. La garantía de que todas las instancias comparten el mismo modelo
- [ ] D. El escalado automático exclusivo de Flexible

**16.** *(Una respuesta — exhibit)* Tu VMSS `vmss-web` tiene esta configuración de red y las instancias **no reciben tráfico** del Load Balancer (el pool aparece sin destinos):

```json
"networkProfile": {
  "networkInterfaceConfigurations": [{
    "name": "nic-web",
    "properties": {
      "ipConfigurations": [{
        "name": "ipconfig1",
        "properties": {
          "subnet": { "id": ".../virtualNetworks/vnet-hub/subnets/snet-web" },
          "primary": true
        }
      }],
      "createOption": "create"
    }
  }]
}
```

¿Qué falta?

- [ ] A. En cada `ipConfigurations`, la referencia a **`loadBalancerBackendAddressPools`** con el pool del LB; después, actualizar las instancias al nuevo modelo
- [ ] B. Una IP pública por instancia
- [ ] C. Un NAT gateway en la subred
- [ ] D. Asociar un NSG al perfil de red del VMSS

**17.** *(Una respuesta)* Un VMSS **Spot** ejecuta trabajos de análisis tolerantes a interrupciones. Quieres que, al ser desalojadas, las instancias **conserven los discos** para reanudar el trabajo cuando vuelva la capacidad (pagando solo los discos mientras tanto). ¿Qué política de desalojo eliges?

- [ ] A. Delete — la única soportada en VMSS
- [ ] B. Stop
- [ ] C. **Deallocate** — desasigna la instancia conservando los discos administrados
- [ ] D. Reallocate

**18.** *(Una respuesta)* Debes crear 20 VMs nuevas unidas al dominio a partir de una VM plantilla que ya está unida al dominio, **sin ejecutar Sysprep** (una app legacy lo rompe). ¿Qué generas en Azure Compute Gallery?

- [ ] A. Una versión de imagen con `osState: Generalized`, que admite VMs unidas al dominio
- [ ] B. Un VHD del disco del SO copiado a un contenedor de blobs en páginas
- [ ] C. Un snapshot del disco y compartirlo por Azure Compute Gallery
- [ ] D. Una versión de imagen con **`osState: Specialized`**: conserva la identidad de la máquina y la unión al dominio; las VMs se crean sin aprovisionamiento

**19.** *(Una respuesta)* Tu pipeline CI/CD despliega en el slot **staging** y quieres que, al terminar el despliegue, el cambio pase a producción **sin arranque en frío**. ¿Qué configuras?

- [ ] A. El swap manual tras el pipeline: siempre calienta la app antes de conmutar
- [ ] B. **Swap automático (auto-swap)** en el slot de staging: al terminar el despliegue, Azure calienta la app en producción y hace el swap
- [ ] C. Always On, que precalienta staging después de cada swap manual
- [ ] D. La opción *warm-up* del plan, disponible en cualquier tarifa

**20.** *(Una respuesta)* Despliegas un grupo de contenedores de ACI **inyectado en tu red virtual** y el despliegue falla con *«subred no vacía»*. ¿Qué exige la inyección de ACI en una VNet?

- [ ] A. Una subred **vacía** (sin otros recursos) **delegada** en `Microsoft.ContainerInstance/containerGroups`
- [ ] B. Una subred con un NSG que permita el puerto 443
- [ ] C. Cualquier subred: ACI crea sus interfaces sin requisitos previos
- [ ] D. Una subred de una VNet emparejada

**21.** *(Una respuesta)* Despliegas ACI en tres regiones y quieres que tiren de imágenes del **mismo registro** con latencia mínima de *pull*, bajo un único endpoint `fabrikam.azurecr.io`. ¿Qué haces?

- [ ] A. Tres registros Basic y sincronizarlos con AzCopy
- [ ] B. Un registro Standard con *import* de imágenes por región
- [ ] C. Un registro **Premium con geo-replicación**: réplicas del registro en cada región tras el mismo endpoint
- [ ] D. No es posible: un registro es un recurso regional

**22.** *(Serie Sí/No — 3 ítems)* Sobre App Service:

| #   | Afirmación                                                                                                                       | Sí  | No  |
| --- | -------------------------------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | Un entorno de App Service (ASE) con ILB expone las apps en una IP privada dentro de tu VNet                                        | [ ] | [ ] |
| b   | Los slots de implementación requieren plan Standard o superior (Free/Shared/Basic no los soportan)                                 | [ ] | [ ] |
| c   | Puedes mover una app existente a un plan de App Service de otra región directamente desde el portal                                | [ ] | [ ] |

## Redes

**23.** *(Una respuesta)* On-premises debe alcanzar las VNets **spoke** a través de la **puerta de enlace VPN del hub**; los spokes no tienen puerta de enlace propia. ¿Cómo configuras el peering hub-spoke?

- [ ] A. UDR en cada spoke apuntando 0.0.0.0/0 a la puerta de enlace
- [ ] B. Puertas de enlace redundantes en cada spoke
- [ ] C. BGP entre la puerta de enlace del hub y cada spoke
- [ ] D. En el peering **hub→spoke**, activar *Permitir tránsito de puerta de enlace (Allow gateway transit)*; en el **spoke→hub**, *Usar puertas de enlace remotas (Use remote gateways)*

**24.** *(Una respuesta)* Usas el grupo de seguridad de aplicaciones (ASG) `asg-web` como **origen** de una regla NSG que permite SQL. Quieres añadir al ASG NICs de VMs de la **VNet emparejada** `spoke-b`. ¿Qué ocurre?

- [ ] A. Se puede: los ASG funcionan entre VNets emparejadas
- [ ] B. No se puede: un ASG **solo admite interfaces de la misma VNet**; necesitas otro ASG en `spoke-b` o reglas por service tag/IP
- [ ] C. Se puede si el peering es global
- [ ] D. Se puede etiquetando las VMs con el mismo valor de tag

**25.** *(Una respuesta)* VMs tras un Load Balancer estándar sufren **agotamiento de puertos SNAT** en las conexiones salientes, y un partner exige una **IP de salida fija** para su allowlist. ¿Qué despliegas?

- [ ] A. Un **NAT gateway** con IP pública estática asociado a la subred: SNAT a gran escala con IP de salida predecible
- [ ] B. Una IP pública por VM
- [ ] C. Un Load Balancer básico, que da SNAT gratis
- [ ] D. Una regla de salida en el LB con frontend dinámico

**26.** *(Una respuesta — exhibit)* Tu Application Gateway v2 tiene esta regla:

```json
{
  "properties": {
    "ruleType": "PathBasedRouting",
    "priority": 100,
    "httpListener": { "id": "listener-443" },
    "urlPathMap": {
      "pathRules": [
        { "paths": ["/api/*"],  "backendAddressPool": { "id": "pool-api" } },
        { "paths": ["/img/*"], "backendAddressPool": { "id": "pool-estaticos" } }
      ],
      "defaultBackendAddressPool": { "id": "pool-web" }
    }
  }
}
```

¿A qué pool backend va la petición `GET https://app.contoso.com/index.html`?

- [ ] A. `pool-api`
- [ ] B. `pool-estaticos`
- [ ] C. A ninguna: la petición devuelve 404 porque no hay regla para `/`
- [ ] D. **`pool-web`** — el pool por defecto del *url path map* cubre las rutas sin regla específica

**27.** *(Una respuesta)* El SOC pide **registros de flujo continuos** del tráfico que entra y sale de varias VMs. Descubres que los NSG flow logs clásicos se retiran (sin creación nueva desde el 30/6/2025 y retirada total el 30/9/2027). ¿Qué usas?

- [ ] A. Los NSG flow logs: siguen creándose hasta 2030
- [ ] B. **VNet flow logs** de Network Watcher, con destino a Log Analytics o cuenta de almacenamiento
- [ ] C. Capturas de paquetes programadas cada hora
- [ ] D. IP flow verify programado

**28.** *(Una respuesta — exhibit)* `az network nic show-effective-route-table` en `vm-app` (subred 10.10.2.0/24) devuelve:

```text
Source   AddressPrefix    NextHopType      NextHopIpAddress
Default  10.10.0.0/16     VnetLocal
Default  10.11.0.0/16     VNetPeering
Default  0.0.0.0/0        Internet
User     0.0.0.0/0        VirtualAppliance 10.10.1.4
User     10.20.0.0/16     None
```

`vm-app` abre una conexión a **10.20.3.7**. ¿Qué ocurre?

- [ ] A. El tráfico se **descarta**: la UDR 10.20.0.0/16 —más específica que 0.0.0.0/0— tiene próximo salto None
- [ ] B. Va al NVA 10.10.1.4 por la UDR 0.0.0.0/0
- [ ] C. Sale a internet por la ruta por defecto
- [ ] D. Va por VNetPeering hacia su destino

**29.** *(Serie Sí/No — 3 ítems)* Sobre redes virtuales:

| #   | Afirmación                                                                                                                            | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | El emparejamiento global de VNets conecta VNets de regiones distintas sin puerta de enlace                                               | [ ] | [ ] |
| b   | Un NAT gateway asociado a una subred da salida a internet también a las subredes de las VNets emparejadas con la suya                     | [ ] | [ ] |
| c   | Puedes usar el service tag `Storage.NorthEurope` en una regla NSG para permitir solo el tráfico de Storage de esa región                 | [ ] | [ ] |

## Supervisión y mantenimiento

**30.** *(Una respuesta)* Debes vigilar **de forma continua y con alertas** la conectividad y latencia HTTP entre una VM on-premises y un front-end en Azure. ¿Qué herramienta usas?

- [ ] A. Connection troubleshoot (solucionador de problemas de conexión)
- [ ] B. IP flow verify
- [ ] C. **Connection Monitor** de Network Watcher: monitorización continua con métricas y alertas configurables
- [ ] D. La topología de Network Watcher

**31.** *(Una respuesta)* Auditoría exige conservar **1 año** de eventos del plano de control (quién creó/borró qué recurso). ¿Qué haces?

- [ ] A. Nada: el registro de actividad ya guarda 365 días
- [ ] B. El registro de actividad solo se conserva **90 días**: configura su exportación (configuración de diagnóstico) a un workspace de Log Analytics o a una cuenta de almacenamiento para el año completo
- [ ] C. Crea una alerta de registro de actividad por cada operación
- [ ] D. Usa Azure Monitor Metrics, que retiene 730 días

**32.** *(Una respuesta)* Necesitas la tendencia de CPU de una VM de los **últimos 12 meses**, y Metrics Explorer no muestra datos tan antiguos. ¿Por qué y cómo lo resuelves?

- [ ] A. Las métricas de plataforma solo se retienen **93 días**; para más historial hay que exportarlas a un workspace de Log Analytics con una configuración de diagnóstico y consultarlas con KQL
- [ ] B. Metrics Explorer limita la vista a 30 días y no hay alternativa
- [ ] C. Las métricas se retienen 365 días si la VM es Premium
- [ ] D. La CPU requiere el agente AMA, y entonces sí se guardan 12 meses

**33.** *(Una respuesta — exhibit)* ¿Qué devuelve esta consulta KQL?

```kusto
Perf
| where TimeGenerated > ago(1h)
| where ObjectName == "LogicalDisk" and CounterName == "% Free Space"
| summarize arg_max(TimeGenerated, *) by Computer
| where CounterValue < 10
```

- [ ] A. El máximo porcentaje de espacio libre alcanzado por cada equipo en la última hora
- [ ] B. La media de espacio libre por hora y equipo
- [ ] C. Los 10 equipos con menos espacio libre
- [ ] D. Para cada equipo, su **última medición** de espacio libre —`arg_max` elige la fila más reciente de cada grupo— y de ellas solo las que están por debajo del 10 %

**34.** *(Una respuesta)* Un Recovery Services vault configurado como **GRS** ya protege 40 VMs. Para recortar coste quieres pasarlo a LRS. ¿Qué ocurre?

- [ ] A. Se cambia en el portal en caliente, sin efecto en las copias
- [ ] B. Solo se puede con un ticket de soporte
- [ ] C. **No se puede modificar la redundancia del almacén cuando ya hay elementos protegidos**: habría que quitar la protección (reteniendo o borrando los datos) antes de cambiarla
- [ ] D. Se puede si primero deshabilitas el soft delete

**35.** *(Una respuesta)* Un administrador **borra por error los datos de copia** de una VM (detener protección y eliminar datos). ¿Se pueden recuperar?

- [ ] A. No: el borrado es inmediato e irrecuperable
- [ ] B. **Sí**: el soft delete de Azure Backup retiene los datos de copia eliminados durante **14 días** y se puede deshacer la eliminación en ese plazo
- [ ] C. Sí, durante 90 días
- [ ] D. Solo si el almacén usa GRS

**36.** *(Una respuesta)* Con Azure Backup para VMs, ¿cuánto tiempo se retienen los **snapshots locales de restauración instantánea** (instant restore) en el grupo `AzureBackupRG_*` junto a la VM?

- [ ] A. **Entre 1 y 5 días** (configurable en la directiva; por defecto 2) — permiten restauraciones muy rápidas
- [ ] B. Lo mismo que la retención diaria del vault
- [ ] C. 7 días fijos
- [ ] D. 24 horas

---

## Caso práctico — Fabrikam, Ltd.

*Lee el caso entero antes de responder las preguntas 37–42. Puedes consultarlo durante todo el caso.*

### Fondo

Fabrikam, Ltd. es una empresa logística con:

- **Suscripciones:** `sub-prod` y `sub-no-prod`, ambas bajo el grupo de administración `mg-fabrikam`.
- **Red:** VNet hub `10.0.0.0/16` con la puerta de enlace VPN (S2S con dos datacenters), spokes `spoke-app` (10.1.0.0/16, con el conjunto de escalado `vmss-api` que sirve la API pública) y `spoke-files` (10.2.0.0/16). Jump hosts Windows en `spoke-app`.
- **Identidad:** Entra ID híbrido con Entra Connect y sincronización de hash de contraseñas. Las licencias Entra ID P1 se asignan por grupos a los departamentos **Finanzas** e **IT**.
- **Datos:** cuenta `stfabrikam01` con el share de Azure Files `ventas`, consumido por las 12 ramas por SMB.
- **Operaciones:** 25 developers externos con portátiles Windows y macOS; área de trabajo de Log Analytics `fabrikam-law`.

### Requisitos

- **R1.** Los developers remotos deben alcanzar por RDP los jump hosts de `spoke-app` **con sus cuentas de Fabrikam (Entra ID)**, desde un cliente VPN, sin exponer puertos y sin pasar por el portal de Azure.
- **R2.** Un analista pertenece a los grupos de Finanzas y de IT, ambos con la licencia Entra ID P1 asignada; debe consumir exactamente **una** licencia.
- **R3.** Las ramas borran por error ficheros del share `ventas`: hay que poder restaurar **ficheros individuales**, con backups diarios de 7 días y **sin instalar agentes** en las ramas.
- **R4.** `vmss-api` sufre picos de CPU a las 9:00 y el escalado reacciona tarde; se quiere que las instancias estén listas **antes** del pico, manteniendo el desencadenador por CPU.
- **R5.** Los recursos solo pueden crearse en **North Europe y West Europe**, y todos los existentes deben llevar la etiqueta `dept` (los que no la tengan deben recibirla automáticamente).
- **R6.** Avisar por correo a operaciones cuando cualquier VM de `spoke-app` quede con menos del 10 % de espacio libre en disco.

### Preguntas del caso

**37.** *(R2 — una respuesta)* ¿Qué ocurre con la licencia del analista que está en los grupos de Finanzas e IT, ambos con P1?

- [ ] A. Recibe un error de licencia en conflicto y no se le asigna ninguna
- [ ] B. Consume dos licencias P1, una por grupo
- [ ] C. Debe asignársela manualmente un administrador para resolver el conflicto
- [ ] D. Consume **una sola licencia**: la misma SKU heredada de varios grupos se asigna una vez; los conflictos solo surgen con SKUs distintas que habilitan planes de servicio incompatibles

**38.** *(R3 — una respuesta)* ¿Qué solución de copia de seguridad implementas?

- [ ] A. **Copia de seguridad del recurso compartido de archivos de Azure** en un Recovery Services vault: snapshots diarias con retención de 7 días y restauración a nivel de **fichero o carpeta** (además de share completo), sin agentes
- [ ] B. El agente MARS en cada rama
- [ ] C. Un AzCopy nocturno del share a un contenedor de blobs
- [ ] D. Azure File Sync en las 12 ramas

**39.** *(R4 — una respuesta)* ¿Qué configuras en `vmss-api`?

- [ ] A. Umbral de escalado más bajo (p. ej. del 75 % al 50 % de CPU)
- [ ] B. Un perfil de escalado programado a las 8:30 fijo, independiente de la carga real
- [ ] C. El **escalado automático predictivo** del conjunto de escalado: aprende el patrón de CPU, predice el pico y escala **por adelantado**, manteniendo el desencadenador por CPU
- [ ] D. Más instancias fijas en el *capacity* del conjunto

**40.** *(R1 — una respuesta)* ¿Qué despliegas?

- [ ] A. VPN de punto a sitio con autenticación de certificados
- [ ] B. **VPN gateway de punto a sitio con autenticación de Entra ID**, que requiere el protocolo **OpenVPN** y el cliente Azure VPN Client (disponible para Windows y macOS)
- [ ] C. SSTP con autenticación de Entra ID
- [ ] D. Azure Bastion

**41.** *(R6 — una respuesta)* El espacio libre en disco no es una métrica de plataforma. ¿Qué montas?

- [ ] A. **Azure Monitor Agent + regla de recopilación de datos** (contadores de disco del SO invitado) al workspace `fabrikam-law`, y una **alerta de registro** con KQL sobre `Perf` (umbral 10 %) con un grupo de acciones de correo
- [ ] B. Una alerta de métrica sobre las métricas de disco de plataforma de la VM
- [ ] C. VM insights y sus alertas integradas de disco
- [ ] D. El diagnóstico de arranque de cada VM

**42.** *(R5 — elige dos)* ¿Qué **dos** directivas de Azure Policy preparas para cubrir R5?

- [ ] A. **Ubicaciones permitidas** (efecto **Deny**) con `allowedValues` [northeurope, westeurope]
- [ ] B. **Etiqueta requerida** `dept` con efecto **Modify** + identidad administrada, más una tarea de remediación para los recursos existentes
- [ ] C. Ubicaciones permitidas con efecto Audit
- [ ] D. Herencia de la etiqueta del grupo de recursos con efecto Append

---

*Fin del simulacro 5. Corrige ahora en [examen-5-soluciones.md](examen-5-soluciones.md) — o pide «corrige el examen 5».*
