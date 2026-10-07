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

> [!success] Corrección — 07/10/2026: **42/50 (84 %)** · aprobado (corte 35)
> Fallos: 5, 13, 14b, 16, 18, 20, 30 (sin responder), 34 (sin responder).
>
> Por dominio — Identidades y gobernanza **10/11** · Almacenamiento **8/10** · Procesos **8/11** ⚠ · Redes **10/10** ✓ · Supervisión **6/8**.

---

## Identidades y gobernanza

**1.** *(Una respuesta)* El administrador global de Microsoft Entra ID abre el portal de Azure y **no ve ninguna suscripción** de la empresa. ¿Por qué y cómo lo resuelve?

- [ ] A. Un administrador global siempre tiene Owner sobre todas las suscripciones: si no las ve es caché del portal
- [ ] B. Se asigna el rol User Access Administrator en cada suscripción desde el panel IAM de cada una
- [x] C. El rol de administrador global **no otorga acceso a Azure por defecto**: debe elevar el acceso (*elevate access*) en las propiedades de Entra ID, lo que le da User Access Administrator en el ámbito raíz `/`

> [!success] Correcta — C
> RBAC (suscripciones) y los roles de directorio (Entra ID) son **planos distintos**: ser administrador global no hereda acceso a las suscripciones. *Elevar el acceso* le concede **User Access Administrator en el ámbito raíz `/`** para autoasignarse el rol que necesite. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).
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
- [x] B. Puede leer todos los recursos, crear/redimensionar/reiniciar VMs y **no puede borrarlas con este rol**: NotActions resta de Actions dentro del rol, no es una denegación absoluta

> [!success] Correcta — B
> El permiso efectivo del rol es `Actions` **menos** `NotActions`: la resta ocurre **dentro del rol** (no es un deny absoluto). Por eso puede leer todo (`*/read`), gestionar VMs salvo borrarlas *con este rol* — si otro rol le concediera `delete`, sí podría borrar (C es la trampa). Ver [RBAC](../../../knowledge/az104-azure-rbac.md).
- [ ] C. No podrá borrar VMs ni aunque otro rol que tenga lo permita, porque NotActions tiene prioridad sobre cualquier asignación
- [ ] D. Sí puede borrarlas: el comodín `virtualMachines/*` incluye `delete` y NotActions se ignora

**3.** *(Una respuesta)* Tras una fusión, la empresa **transfiere una suscripción de Azure al directorio (tenant) de Entra ID** de la matriz. ¿Qué ocurre con las asignaciones de roles RBAC de esa suscripción?

- [ ] A. Se conservan: RBAC es independiente del directorio y los usuarios siguen autenticando contra el tenant antiguo
- [ ] B. Se migran automáticamente: los usuarios se replican al nuevo tenant con sus mismos roles
- [ ] C. Solo se pierden las asignaciones de Owner; el resto se mantiene
- [x] D. **Se eliminan**: usuarios, grupos, entidades de servicio e identidades administradas del tenant antiguo pierden su acceso; hay que reasignar los roles con identidades del nuevo tenant

> [!success] Correcta — D
> Al mover la suscripción a otro directorio, los principales del tenant antiguo **dejan de resolverse** en el nuevo, así que las asignaciones RBAC quedan huérfanas y se pierden (incluidas las de identidades administradas). Hay que reasignar roles con identidades del tenant destino. Gotcha clásico. Ver [RBAC](../../../knowledge/az104-azure-rbac.md).

**4.** *(Una respuesta)* Los usuarios se sincronizan desde AD DS on-premises con **sincronización de hash de contraseñas (PHS)**. Deben poder restablecer su contraseña desde el portal de autoservicio de Entra ID y que el cambio **se replique también en el AD local**. ¿Qué habilitas?

- [x] A. El **reescritura de contraseñas (password writeback)** en Entra Connect (requiere PHS o PTA y licencia de pago, p. ej. P1) junto con SSPR

> [!success] Correcta — A
> PHS sincroniza los hashes **hacia la nube**, pero no escribe hacia AD: para que un cambio hecho en SSPR **se replique al AD local** hace falta el **password writeback** de Entra Connect (con PHS/PTA y licencia P1). Sin writeback, el cambio queda solo en Entra ID (B es la trampa). Ver [SSPR](../../../knowledge/az104-sspr.md).
- [ ] B. Nada: con PHS el restablecimiento en la nube se escribe en AD automáticamente
- [ ] C. Un controlador de Entra Domain Services para ese dominio
- [ ] D. La reescritura de atributos de Exchange híbrido, que cubre contraseñas

**5.** *(Una respuesta)* Invitas por B2B a 10 colaboradores que usan cuentas de Gmail y **no tienen cuenta Microsoft ni Entra ID**. ¿Cómo se autentican al canjear la invitación, sin crearles credenciales nuevas?

- [ ] A. No pueden: deben crear primero una cuenta Microsoft
- [x] B. B2B direct connect les da acceso directo con su cuenta de Google

> [!failure] Incorrecta — la correcta es la C
> Marcaste B, pero **B2B direct connect es una relación mutua entre dos tenants de Entra ID** (para canales compartidos de Teams): un usuario de Gmail no pertenece a ningún tenant, así que no aplica. La característica integrada (activada por defecto) para invitados **sin** cuenta Microsoft ni Entra es el **código de acceso de un solo uso (one-time passcode)**: reciben un código en su correo para canjear la invitación. Ver [identidades](../../../knowledge/az104-identities.md).
- [ ] C. Con el **código de acceso de un solo uso por correo (one-time passcode)**: reciben un código en su Gmail para autenticarse
- [ ] D. Con la federación de Google configurada en el tenant

**6.** *(Una respuesta)* Una científica de datos tiene el rol **Contributor** sobre una cuenta de almacenamiento. Ejecuta `az storage blob list` autenticándose con su cuenta de Entra (sin claves) y recibe `AuthorizationPermissionMismatch`. ¿Cómo lo resuelves con **menor privilegio**?

- [ ] A. Invitándola como B2B del mismo tenant de la cuenta
- [x] B. Contributor solo concede acceso al **plano de control**: para leer datos hay que asignarle un rol de datos como **Storage Blob Data Reader**

> [!success] Correcta — B
> **Plano de control ≠ plano de datos**: Contributor gestiona el recurso (crear/configurar la cuenta) pero **no autoriza operaciones sobre los datos** — de ahí el `AuthorizationPermissionMismatch`. Para datos hacen falta roles `Storage Blob Data *`, y el de menor privilegio para leer es **Storage Blob Data Reader**. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).
- [ ] C. Añadiéndole Reader en la suscripción
- [ ] D. Dándole un SAS de cuenta firmado con key1

**7.** *(Serie Sí/No — 3 ítems)* Sobre Azure Policy:

| #   | Afirmación                                                                                                                              | Sí  | No  |
| --- | --------------------------------------------------------------------------------------------------------------------------------------- | --- | --- |
| a   | Las exenciones de directiva (exemptions) se clasifican por categoría (p. ej. *Waiver* o *Mitigated*) y pueden tener fecha de expiración | [X] | [ ] |
| b   | Una directiva con efecto Modify necesita una identidad administrada para poder remediarse                                               | [X] | [ ] |
| c   | Una tarea de remediación corrige también los recursos que entren en no conformidad en el futuro, sin necesidad de tareas nuevas         | [ ] | [X] |

> [!success] 7a — correcta (Sí)
> Las exenciones (exemptions) se clasifican en **Waiver** (renuncia) o **Mitigated** (mitigada) y admiten **fecha de expiración** — útiles para eximir un recurso durante una ventana temporal.

> [!success] 7b — correcta (Sí)
> **Modify** edita propiedades de recursos existentes durante la evaluación: para tocar recursos necesita una **identidad administrada** (con permisos sobre ellos) asignada a la definición.

> [!success] 7c — correcta (No)
> La tarea de remediación es **puntual**: corrige los recursos no conformes que existen cuando se crea. Los que entren en no conformidad después requieren tareas nuevas (o DeployIfNotExists, que remedia en el propio despliegue).

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
- [x] C. **Archive**: superó los 180 días sin modificación y las acciones se evalúan en cascada

> [!success] Correcta — C
> Los umbrales `daysAfterModificationGreaterThan` se miden **desde la última modificación del blob**, no desde que entró en cada nivel: con 200 días cumple 30 (Cool) y 180 (**Archive**) pero aún no 365, así que la política lo acaba llevando a Archive en ejecuciones sucesivas (la política corre una vez al día). Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).
- [ ] D. Eliminado: superó los 90 días de retención

**9.** *(Una respuesta)* Concediste a un partner un SAS de servicio de **6 meses** sobre el contenedor `partners`. La app legacy no tolera la **rotación de claves de la cuenta**. Hay un incidente de seguridad y debes **revocar el acceso de inmediato**. ¿Qué habrías debido usar y cómo lo revocas?

- [ ] A. Un SAS ad-hoc de servicio: se revoca desde el portal con la opción *Revocar SAS*
- [ ] B. Un SAS de delegación de usuario: se revoca rotando la clave de la cuenta
- [ ] C. Un SAS de cuenta: se revoca deshabilitando el acceso público del contenedor
- [x] D. Un SAS **asociado a una directiva de acceso almacenada (stored access policy)**: se revoca quitando la política (o adelantando su expiración) sin tocar las claves

> [!success] Correcta — D
> Es el único SAS revocable de forma quirúrgica: la **directiva de acceso almacenada** controla permisos y expiración de todos los SAS que la referencian, y basta **quitarla o adelantar su expiración** para cortar el acceso — sin rotar claves (requisito del enunciado). Los SAS ad-hoc (A) no tienen opción de revocación; el de delegación de usuario (B) no se revoca rotando claves porque no las usa. Ver [seguridad de Storage](../../../knowledge/az104-storage-security.md).

**10.** *(Elige tres)* Vas a configurar la **replicación de objetos** entre `storigen` y `stdestino`. ¿Qué tres prerrequisitos aplican?

- [x] A. Versionado de blobs **habilitado en la cuenta de origen**
- [x] B. Versionado de blobs **habilitado en la cuenta de destino**
- [ ] C. Change feed **habilitado en la cuenta de destino**
- [x] D. Change feed **habilitado en la cuenta de origen**

> [!success] Correcta — A + B + D
> La replicación de objetos exige **versionado de blobs en ambas cuentas** (origen y destino) y **change feed solo en la de origen** — es quien registra los cambios que se replican. El destino no necesita change feed (C es el señuelo). Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).

**11.** *(Una respuesta)* Una app de informes lee de la secundaria de una cuenta RA-GRS. Un auditor pide conocer en cada momento la **ventana máxima de pérdida de datos** (desfase entre primaria y secundaria). ¿Qué consultas?

- [x] A. La propiedad **Last Sync Time** (hora de última sincronización) de la cuenta: marca el punto hasta el que la secundaria garantiza coherencia

> [!success] Correcta — A
> La replicación geográfica es **asíncrona**: *Last Sync Time* es el instante hasta el cual la secundaria está garantizada coherente con la primaria — exactamente la ventana máxima de pérdida (RPO) que pide el auditor. RA-GRS **no** garantiza RPO cero (D). Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).
- [ ] B. La métrica de latencia del servidor de la secundaria
- [ ] C. La fecha del último blob creado en la secundaria
- [ ] D. Nada: RA-GRS garantiza RPO cero

**12.** *(Una respuesta)* Necesitas un share **NFS 4.1** de Azure Files para una granja de render Linux. ¿Qué afirmación es cierta?

- [ ] A. NFS se activa en cualquier cuenta StorageV2 estándar cambiando el protocolo del share
- [ ] B. NFS soporta autenticación con Entra ID igual que SMB
- [x] C. NFS requiere una cuenta **FileStorage (Premium)**, el acceso es **solo desde la VNet** (sin endpoint público) y la autenticación es AUTH_SYS, no Entra ID

> [!success] Correcta — C
> Tres requisitos-juntos clásicos de NFS 4.1: cuenta **FileStorage (Premium)** exclusiva para archivos, acceso **solo por VNet** (endpoint privado/redes permitidas, sin endpoint público para NFS) y autenticación **AUTH_SYS** a nivel de sistema de archivos — sin Entra ID ni ACLs de SMB. Un mismo share es SMB **o** NFS, nunca ambos. Ver [Azure Files](../../../knowledge/az104-azure-files.md).
- [ ] D. Un mismo share puede servir SMB y NFS simultáneamente sobre los mismos datos

**13.** *(Ordenar)* Las apps usan la **clave key1** de la cuenta de almacenamiento. Debes rotar las claves **sin cortar el servicio**. Ordena los pasos:

- A. Actualizar todas las apps/cadenas de conexión para usar key2
- B. Regenerar key2 (la clave que ninguna app usa)
- C. Verificar que ya no queda nadie usando key1 y regenerarla
- D. Confirmar qué clave usan las apps (key1)

Secuencia (letras): D -> B -> C -> A

> [!failure] Incorrecta — la correcta es D → B → A → C
> Tu secuencia regenera key1 (C) **mientras las apps aún la usan** → corte del servicio justo antes de migrarlas (A). La regla de oro de la rotación: confirmar la clave en uso (D) → regenerar la clave **libre** (B, sin impacto) → **migrar todas las apps a la clave nueva (A)** → solo cuando nadie usa key1, regenerarla (C). Ver [cuentas de almacenamiento](../../../knowledge/az104-storage-accounts.md).

**14.** *(Serie Sí/No — 3 ítems)* Sobre Blob Storage:

| #   | Afirmación                                                                                       | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------ | --- | --- |
| a   | Las directivas de administración del ciclo de vida solo aplican a blobs en bloques               | [X] | [ ] |
| b   | Al borrar un blob base, sus snapshots se borran siempre automáticamente junto a él               | [X] | [ ] |
| c   | Un blob en nivel Archive puede leerse directamente con una petición GET normal, sin rehidratarlo | [ ] | [X] |

> [!success] 14a — correcta (Sí)
> El ciclo de vida aplica a **blobs en bloques** (no de páginas). *Matiz:* la documentación vigente también admite **append blobs** para reglas de solo borrado; el material clásico AZ-104 (y esta clave) mantiene "solo blobs en bloques".

> [!failure] 14b — incorrecta: marcaste Sí; la correcta es No
> El borrado de un blob con snapshots **no es automático e incondicional**: la operación exige tratarlas explícitamente (`x-ms-delete-snapshots: include/only` en la API, o el aviso del portal), y con soft delete habilitado quedan retenidas. El "siempre automáticamente" del enunciado es la trampa.

> [!success] 14c — correcta (No)
> Un blob en **Archive está sin conexión**: no responde a un GET de datos — hay que **rehidratarlo** (copiarlo a Hot/Cool o cambiar su nivel) y esperar desde minutos hasta horas. Ver [Blob Storage](../../../knowledge/az104-blob-storage.md).

## Procesos

**15.** *(Una respuesta)* Evaluas migrar tu conjunto de escalado de orquestación **Uniform** a **Flexible**. ¿Qué te da Flexible frente a Uniform?

- [ ] A. Actualizaciones Rolling con lotes configurables, igual que Uniform
- [x] B. Instancias tratadas como **VMs individuales**, dispersas entre dominios de error y zonas — sin directiva de actualización Rolling (las actualizaciones van por instancia)

> [!success] Correcta — B
> Flexible orquesta **VMs individuales** (dominios de error/zonas, tamaños mixtos, arranque/parada por instancia) y **no tiene directiva de actualización Rolling** — esa es de Uniform; en Flexible orquestas tú las actualizaciones por instancia. El escalado automático existe en ambos modos (D). Ver [disponibilidad de VMs](../../../knowledge/az104-vm-availability.md).
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
- [x] D. Asociar un NSG al perfil de red del VMSS

> [!failure] Incorrecta — la correcta es la A
> Marcaste D, pero un NSG **filtra tráfico**: no hace que las instancias se registren en el pool. El síntoma "pool sin destinos" delata que falta **`loadBalancerBackendAddressPools` en la `ipConfigurations` del perfil de red del VMSS** — así cada instancia nueva nace ya dentro del pool (y después hay que actualizar las instancias al nuevo modelo). Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).

**17.** *(Una respuesta)* Un VMSS **Spot** ejecuta trabajos de análisis tolerantes a interrupciones. Quieres que, al ser desalojadas, las instancias **conserven los discos** para reanudar el trabajo cuando vuelva la capacidad (pagando solo los discos mientras tanto). ¿Qué política de desalojo eliges?

- [ ] A. Delete — la única soportada en VMSS
- [ ] B. Stop
- [x] C. **Deallocate** — desasigna la instancia conservando los discos administrados

> [!success] Correcta — C
> En VMSS Spot la política de desalojo solo puede ser `Delete` o **`Deallocate`**: desasignar **conserva los discos administrados** (se paga solo su almacenamiento) y la instancia retoma el trabajo cuando vuelve la capacidad — justo el requisito. "Stop" y "Reallocate" no existen como políticas de desalojo. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
- [ ] D. Reallocate

**18.** *(Una respuesta)* Debes crear 20 VMs nuevas unidas al dominio a partir de una VM plantilla que ya está unida al dominio, **sin ejecutar Sysprep** (una app legacy lo rompe). ¿Qué generas en Azure Compute Gallery?

- [ ] A. Una versión de imagen con `osState: Generalized`, que admite VMs unidas al dominio
- [ ] B. Un VHD del disco del SO copiado a un contenedor de blobs en páginas
- [x] C. Un snapshot del disco y compartirlo por Azure Compute Gallery

> [!failure] Incorrecta — la correcta es la D
> Marcaste C, pero **el snapshot no es un artefacto de Compute Gallery**: la galería almacena **definiciones y versiones de imagen** (y aplicaciones VM). Lo que pide el escenario es una versión de imagen con **`osState: Specialized`** — sin Sysprep la imagen conserva nombre de máquina, SID y **unión al dominio**, y las VMs creadas no se aprovisionan de nuevo. `Generalized` (A) exigiría Sysprep. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
- [ ] D. Una versión de imagen con **`osState: Specialized`**: conserva la identidad de la máquina y la unión al dominio; las VMs se crean sin aprovisionamiento

**19.** *(Una respuesta)* Tu pipeline CI/CD despliega en el slot **staging** y quieres que, al terminar el despliegue, el cambio pase a producción **sin arranque en frío**. ¿Qué configuras?

- [ ] A. El swap manual tras el pipeline: siempre calienta la app antes de conmutar
- [x] B. **Swap automático (auto-swap)** en el slot de staging: al terminar el despliegue, Azure calienta la app en producción y hace el swap

> [!success] Correcta — B
> El **auto-swap** se dispara cuando llega un despliegue nuevo al slot y Azure **calienta la app de destino antes de conmutar** — producción nunca atiende la primera petición en frío. Requiere plan Standard o superior. Always On (C) mantiene el proceso vivo pero no conmuta slots. Ver [App Service](../../../knowledge/az104-app-service.md).
- [ ] C. Always On, que precalienta staging después de cada swap manual
- [ ] D. La opción *warm-up* del plan, disponible en cualquier tarifa

**20.** *(Una respuesta)* Despliegas un grupo de contenedores de ACI **inyectado en tu red virtual** y el despliegue falla con *«subred no vacía»*. ¿Qué exige la inyección de ACI en una VNet?.

- [ ] A. Una subred **vacía** (sin otros recursos) **delegada** en `Microsoft.ContainerInstance/containerGroups`
- [ ] B. Una subred con un NSG que permita el puerto 443
- [ ] C. Cualquier subred: ACI crea sus interfaces sin requisitos previos
- [x] D. Una subred de una VNet emparejada

> [!failure] Incorrecta — la correcta es la A
> Marcaste D, pero la inyección en VNet exige una **subred vacía (sin otros recursos) delegada en `Microsoft.ContainerInstance/containerGroups`** dentro de la VNet donde inyectas — el error *«subred no vacía»* apunta literalmente a eso. La delegación es irrenunciable; una subred emparejada no la sustituye. Ver [ACI](../../../knowledge/az104-container-instances.md).

**21.** *(Una respuesta)* Despliegas ACI en tres regiones y quieres que tiren de imágenes del **mismo registro** con latencia mínima de *pull*, bajo un único endpoint `fabrikam.azurecr.io`. ¿Qué haces?

- [ ] A. Tres registros Basic y sincronizarlos con AzCopy
- [ ] B. Un registro Standard con *import* de imágenes por región
- [x] C. Un registro **Premium con geo-replicación**: réplicas del registro en cada región tras el mismo endpoint

> [!success] Correcta — C
> La **geo-replicación (exclusiva del SKU Premium)** crea réplicas del registro en cada región elegida, **tras el mismo endpoint** — el pull se sirve de la réplica más cercana con latencia mínima y un único nombre lógico. El *import* (B) implica varias copias gestionadas a mano. Ver [ACI](../../../knowledge/az104-container-instances.md).
- [ ] D. No es posible: un registro es un recurso regional

**22.** *(Serie Sí/No — 3 ítems)* Sobre App Service:

| #   | Afirmación                                                                                          | Sí  | No  |
| --- | --------------------------------------------------------------------------------------------------- | --- | --- |
| a   | Un entorno de App Service (ASE) con ILB expone las apps en una IP privada dentro de tu VNet         | [X] | [ ] |
| b   | Los slots de implementación requieren plan Standard o superior (Free/Shared/Basic no los soportan)  | [X] | [ ] |
| c   | Puedes mover una app existente a un plan de App Service de otra región directamente desde el portal | [ ] | [X] |

> [!success] 22a — correcta (Sí)
> El ASE **con ILB** publica las apps en una **IP privada dentro de tu VNet** (el ILB actúa de frontend interno) — nunca exponen endpoint público.

> [!success] 22b — correcta (Sí)
> Los slots de implementación requieren plan **Standard o superior**: Free/Shared/Basic no los soportan.

> [!success] 22c — correcta (No)
> Una app **no puede moverse a un plan de otra región**: app y plan deben compartir región (y sistema operativo). Para "cambiarla de región" hay que clonarla/redesplegarla. Ver [App Service](../../../knowledge/az104-app-service.md).

## Redes

**23.** *(Una respuesta)* On-premises debe alcanzar las VNets **spoke** a través de la **puerta de enlace VPN del hub**; los spokes no tienen puerta de enlace propia. ¿Cómo configuras el peering hub-spoke?

- [ ] A. UDR en cada spoke apuntando 0.0.0.0/0 a la puerta de enlace
- [ ] B. Puertas de enlace redundantes en cada spoke
- [ ] C. BGP entre la puerta de enlace del hub y cada spoke
- [x] D. En el peering **hub→spoke**, activar *Permitir tránsito de puerta de enlace (Allow gateway transit)*; en el **spoke→hub**, *Usar puertas de enlace remotas (Use remote gateways)*

> [!success] Correcta — D
> El patrón hub-spoke canónico con una sola puerta de enlace: *Allow gateway transit* (hub→spoke) **publica** la gateway del hub para los peers, y *Use remote gateways* (spoke→hub) hace que los spokes la **usen como propia** sin desplegar ninguna. Las UDR no sustituyen a este par de flags. Ver [peering](../../../knowledge/az104-vnet-peering.md).

**24.** *(Una respuesta)* Usas el grupo de seguridad de aplicaciones (ASG) `asg-web` como **origen** de una regla NSG que permite SQL. Quieres añadir al ASG NICs de VMs de la **VNet emparejada** `spoke-b`. ¿Qué ocurre?

- [ ] A. Se puede: los ASG funcionan entre VNets emparejadas
- [x] B. No se puede: un ASG **solo admite interfaces de la misma VNet**; necesitas otro ASG en `spoke-b` o reglas por service tag/IP

> [!success] Correcta — B
> Un grupo de seguridad de aplicaciones solo puede contener NICs de su **misma VNet** — no funciona a través de peering (ni global). Las alternativas son un ASG local en cada spoke o reglas por service tag/IP. Ver [NSGs](../../../knowledge/az104-network-security-groups.md).
- [ ] C. Se puede si el peering es global
- [ ] D. Se puede etiquetando las VMs con el mismo valor de tag

**25.** *(Una respuesta)* VMs tras un Load Balancer estándar sufren **agotamiento de puertos SNAT** en las conexiones salientes, y un partner exige una **IP de salida fija** para su allowlist. ¿Qué despliegas?

- [x] A. Un **NAT gateway** con IP pública estática asociado a la subred: SNAT a gran escala con IP de salida predecible

> [!success] Correcta — A
> **NAT Gateway** resuelve ambos problemas a la vez: simplifica el SNAT saliente (**64 000 puertos por IP pública**, ampliable con prefijos — adiós al agotamiento del LB) y da una **IP de salida estática y predecible** perfecta para la allowlist del partner. Una regla de salida (D) con frontend dinámico no fija la IP. Ver [Load Balancer](../../../knowledge/az104-load-balancer.md).
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
- [x] D. **`pool-web`** — el pool por defecto del *url path map* cubre las rutas sin regla específica

> [!success] Correcta — D
> `/index.html` no encaja en `/api/*` ni `/img/*`, así que aplica el **`defaultBackendAddressPool`** del path map — el pool por defecto existe precisamente para cubrir las rutas sin regla: no hay 404 (C es la trampa). Ver [Application Gateway](../../../knowledge/az104-application-gateway.md).

**27.** *(Una respuesta)* El SOC pide **registros de flujo continuos** del tráfico que entra y sale de varias VMs. Descubres que los NSG flow logs clásicos se retiran (sin creación nueva desde el 30/6/2025 y retirada total el 30/9/2027). ¿Qué usas?

- [ ] A. Los NSG flow logs: siguen creándose hasta 2030
- [x] B. **VNet flow logs** de Network Watcher, con destino a Log Analytics o cuenta de almacenamiento

> [!success] Correcta — B
> Los NSG flow logs clásicos **dejaron de poder crearse el 30/6/2025** y se retiran por completo el 30/9/2027: su sustituto son los **VNet flow logs** (nivel de VNet/plataforma, a Log Analytics o cuenta de almacenamiento). Las capturas de paquetes y IP flow verify son herramientas puntuales, no registro continuo. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).
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

- [x] A. El tráfico se **descarta**: la UDR 10.20.0.0/16 —más específica que 0.0.0.0/0— tiene próximo salto None

> [!success] Correcta — A
> El enrutamiento elige siempre el **prefijo más largo**: para 10.20.3.7 gana la UDR `10.20.0.0/16` (más específica que `0.0.0.0/0`) y su próximo salto es **None** → black hole. La UDR al NVA solo aplicaría a destinos sin una ruta más específica. Ver [rutas](../../../knowledge/az104-user-defined-routes.md).
- [ ] B. Va al NVA 10.10.1.4 por la UDR 0.0.0.0/0
- [ ] C. Sale a internet por la ruta por defecto
- [ ] D. Va por VNetPeering hacia su destino

**29.** *(Serie Sí/No — 3 ítems)* Sobre redes virtuales:

| #   | Afirmación                                                                                                               | Sí  | No  |
| --- | ------------------------------------------------------------------------------------------------------------------------ | --- | --- |
| a   | El emparejamiento global de VNets conecta VNets de regiones distintas sin puerta de enlace                               | [X] | [ ] |
| b   | Un NAT gateway asociado a una subred da salida a internet también a las subredes de las VNets emparejadas con la suya    | [ ] | [X] |
| c   | Puedes usar el service tag `Storage.NorthEurope` en una regla NSG para permitir solo el tráfico de Storage de esa región | [X] | [ ] |

> [!success] 29a — correcta (Sí)
> El **peering global** conecta VNets de regiones distintas directamente (tráfico por la red troncal de Microsoft), sin ninguna puerta de enlace.

> [!success] 29b — correcta (No)
> El NAT gateway da salida solo a las **subredes de su propia VNet** a las que está asociado: el tráfico que llega de VNets emparejadas **no** sale por él.

> [!success] 29c — correcta (Sí)
> Los **service tags regionales** (p. ej. `Storage.NorthEurope`) existen exactamente para filtrar por región en reglas NSG. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).

## Supervisión y mantenimiento

**30.** *(Una respuesta)* Debes vigilar **de forma continua y con alertas** la conectividad y latencia HTTP entre una VM on-premises y un front-end en Azure. ¿Qué herramienta usas?

- [ ] A. Connection troubleshoot (solucionador de problemas de conexión)
- [ ] B. IP flow verify
- [ ] C. **Connection Monitor** de Network Watcher: monitorización continua con métricas y alertas configurables
- [ ] D. La topología de Network Watcher

> [!failure] Sin responder — la correcta es la C
> **Connection Monitor** es la variante **continua** (agente en los extremos, métricas de disponibilidad/latencia y **alertas configurables**); Connection troubleshoot (A) es una comprobación puntual on-demand. La pareja "on-demand vs continua" es pregunta recurrente. Ver [Network Watcher](../../../knowledge/az104-network-watcher.md).

**31.** *(Una respuesta)* Auditoría exige conservar **1 año** de eventos del plano de control (quién creó/borró qué recurso). ¿Qué haces?

- [ ] A. Nada: el registro de actividad ya guarda 365 días
- [x] B. El registro de actividad solo se conserva **90 días**: configura su exportación (configuración de diagnóstico) a un workspace de Log Analytics o a una cuenta de almacenamiento para el año completo

> [!success] Correcta — B
> El registro de actividad retiene **90 días** en Azure Monitor: para un año hay que **exportarlo** con una configuración de diagnóstico (a nivel de suscripción) a Log Analytics o a una cuenta de almacenamiento. No hay 365 días "gratis" (A). Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
- [ ] C. Crea una alerta de registro de actividad por cada operación
- [ ] D. Usa Azure Monitor Metrics, que retiene 730 días

**32.** *(Una respuesta)* Necesitas la tendencia de CPU de una VM de los **últimos 12 meses**, y Metrics Explorer no muestra datos tan antiguos. ¿Por qué y cómo lo resuelves?

- [x] A. Las métricas de plataforma solo se retienen **93 días**; para más historial hay que exportarlas a un workspace de Log Analytics con una configuración de diagnóstico y consultarlas con KQL

> [!success] Correcta — A
> Las métricas de plataforma se guardan **93 días**: 12 meses de historial exigen exportarlas (configuración de diagnóstico) a un workspace y consultarlas con KQL. Trampa espejo de la clásica "tendencia de 90 días", que sí cabe en Metrics Explorer. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
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
- [x] D. Para cada equipo, su **última medición** de espacio libre —`arg_max` elige la fila más reciente de cada grupo— y de ellas solo las que están por debajo del 10 %

> [!success] Correcta — D
> `arg_max(TimeGenerated, *)` devuelve, para cada grupo (`Computer`), la **fila completa más reciente** — la última medición, no el máximo del valor (A) ni una media (B) — y el `where` posterior filtra las que quedan por debajo del 10 %. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).

**34.** *(Una respuesta)* Un Recovery Services vault configurado como **GRS** ya protege 40 VMs. Para recortar coste quieres pasarlo a LRS. ¿Qué ocurre?

- [ ] A. Se cambia en el portal en caliente, sin efecto en las copias
- [ ] B. Solo se puede con un ticket de soporte
- [ ] C. **No se puede modificar la redundancia del almacén cuando ya hay elementos protegidos**: habría que quitar la protección (reteniendo o borrando los datos) antes de cambiarla
- [ ] D. Se puede si primero deshabilitas el soft delete

> [!failure] Sin responder — la correcta es la C
> La redundancia del Recovery Services vault (LRS/GRS) es inamovible **mientras tenga elementos protegidos**: con 40 VMs copiadas, primero hay que detener la protección (reteniendo o borrando datos) para poder cambiarla. No es cuestión de soporte ni del soft delete. Ver [Azure Backup](../../../knowledge/az104-azure-backup.md).

**35.** *(Una respuesta)* Un administrador **borra por error los datos de copia** de una VM (detener protección y eliminar datos). ¿Se pueden recuperar?

- [ ] A. No: el borrado es inmediato e irrecuperable
- [x] B. **Sí**: el soft delete de Azure Backup retiene los datos de copia eliminados durante **14 días** y se puede deshacer la eliminación en ese plazo

> [!success] Correcta — B
> El **soft delete de Azure Backup** (activado por defecto) retiene los datos de copia eliminados **14 días** en estado *soft deleted*: en ese plazo se puede **deshacer la eliminación** desde el vault y restaurar. Independiente de la redundancia (D). Ver [Azure Backup](../../../knowledge/az104-azure-backup.md).
- [ ] C. Sí, durante 90 días
- [ ] D. Solo si el almacén usa GRS

**36.** *(Una respuesta)* Con Azure Backup para VMs, ¿cuánto tiempo se retienen los **snapshots locales de restauración instantánea** (instant restore) en el grupo `AzureBackupRG_*` junto a la VM?

- [x] A. **Entre 1 y 5 días** (configurable en la directiva; por defecto 2) — permiten restauraciones muy rápidas

> [!success] Correcta — A
> Los snapshots de **restauración instantánea** (instant restore) se guardan junto a la VM en el grupo `AzureBackupRG_*` para restaurar en minutos: su retención es corta e independiente del vault — **1 a 5 días, 2 por defecto**. Ver [backup de VMs](../../../knowledge/az104-vm-backup.md).
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
- [x] D. Consume **una sola licencia**: la misma SKU heredada de varios grupos se asigna una vez; los conflictos solo surgen con SKUs distintas que habilitan planes de servicio incompatibles

> [!success] Correcta — D
> En licencias por grupo, heredar **la misma SKU de varios grupos consume una sola licencia**. El estado *Error* (conflicto) solo aparece con **SKUs distintas** que habilitan planes de servicio incompatibles. Ver [identidades](../../../knowledge/az104-identities.md).

**38.** *(R3 — una respuesta)* ¿Qué solución de copia de seguridad implementas?

- [x] A. **Copia de seguridad del recurso compartido de archivos de Azure** en un Recovery Services vault: snapshots diarias con retención de 7 días y restauración a nivel de **fichero o carpeta** (además de share completo), sin agentes

> [!success] Correcta — A
> Cumple R3 punto por punto: el backup de Azure Files es **sin agentes** (snapshots del share gestionadas desde el vault), con retención configurable (7 días) y **restauración a nivel de fichero/carpeta** — la operación va contra el propio share. MARS (B) exige agente; AzCopy (C) no restaura por ítem; File Sync (D) no es backup. Ver [Azure Files](../../../knowledge/az104-azure-files.md).
- [ ] B. El agente MARS en cada rama
- [ ] C. Un AzCopy nocturno del share a un contenedor de blobs
- [ ] D. Azure File Sync en las 12 ramas

**39.** *(R4 — una respuesta)* ¿Qué configuras en `vmss-api`?

- [ ] A. Umbral de escalado más bajo (p. ej. del 75 % al 50 % de CPU)
- [ ] B. Un perfil de escalado programado a las 8:30 fijo, independiente de la carga real
- [x] C. El **escalado automático predictivo** del conjunto de escalado: aprende el patrón de CPU, predice el pico y escala **por adelantado**, manteniendo el desencadenador por CPU

> [!success] Correcta — C
> El **autoscale predictivo** del VMSS modela el patrón histórico de CPU y **escala antes del pico previsto**, manteniendo la regla por CPU (el "y" de R4). El perfil programado (B) también anticiparía, pero escala a ciegas sin mirar la carga. Ver [VMs](../../../knowledge/az104-virtual-machines.md).
- [ ] D. Más instancias fijas en el *capacity* del conjunto

**40.** *(R1 — una respuesta)* ¿Qué despliegas?

- [ ] A. VPN de punto a sitio con autenticación de certificados
- [x] B. **VPN gateway de punto a sitio con autenticación de Entra ID**, que requiere el protocolo **OpenVPN** y el cliente Azure VPN Client (disponible para Windows y macOS)

> [!success] Correcta — B
> La autenticación P2S con Entra ID **exige el protocolo OpenVPN** y el cliente **Azure VPN Client** (Windows y macOS, como pide R1): los usuarios entran con sus cuentas de Fabrikam, sin puertos expuestos ni portal. SSTP no soporta auth de Entra (C); los certificados (A) contradicen "con sus cuentas de Fabrikam"; Bastion (D) obliga a pasar por el portal. Ver [redes virtuales](../../../knowledge/az104-virtual-networks.md).
- [ ] C. SSTP con autenticación de Entra ID
- [ ] D. Azure Bastion

**41.** *(R6 — una respuesta)* El espacio libre en disco no es una métrica de plataforma. ¿Qué montas?

- [x] A. **Azure Monitor Agent + regla de recopilación de datos** (contadores de disco del SO invitado) al workspace `fabrikam-law`, y una **alerta de registro** con KQL sobre `Perf` (umbral 10 %) con un grupo de acciones de correo

> [!success] Correcta — A
> El % de espacio libre **no es métrica de plataforma** (se ve desde el SO invitado): hace falta **AMA + regla de recopilación de datos** que suba los contadores al workspace y una **alerta de registro** (KQL sobre `Perf`) con grupo de acciones de correo. Trampa gemela de la 32. Ver [monitorización](../../../knowledge/az104-vm-monitoring.md).
- [ ] B. Una alerta de métrica sobre las métricas de disco de plataforma de la VM
- [ ] C. VM insights y sus alertas integradas de disco
- [ ] D. El diagnóstico de arranque de cada VM

**42.** *(R5 — elige dos)* ¿Qué **dos** directivas de Azure Policy preparas para cubrir R5?

- [x] A. **Ubicaciones permitidas** (efecto **Deny**) con `allowedValues` [northeurope, westeurope]
- [x] B. **Etiqueta requerida** `dept` con efecto **Modify** + identidad administrada, más una tarea de remediación para los recursos existentes

> [!success] Correcta — A + B
> *Ubicaciones permitidas* con **Deny** bloquea la creación fuera de las dos regiones (Audit solo avisaría), y la etiqueta requerida con **Modify + identidad administrada + tarea de remediación** añade `dept` tanto a los recursos existentes como a los futuros. Append (D) no remedia existentes. Ver [Azure Policy](../../../knowledge/az104-azure-policy.md).
- [ ] C. Ubicaciones permitidas con efecto Audit
- [ ] D. Herencia de la etiqueta del grupo de recursos con efecto Append

---

*Fin del simulacro 5. Corrige ahora en [examen-5-soluciones.md](examen-5-soluciones.md) — o pide «corrige el examen 5».*
