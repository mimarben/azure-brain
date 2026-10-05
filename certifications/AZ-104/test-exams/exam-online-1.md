[Test](https://learn.microsoft.com/es-es/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21)

Tiene una suscripción de Azure vinculada a un tenant de Microsoft Entra denominado contoso.com.

Todos los usuarios de contoso.com actualmente pueden invitar a usuarios externos a la colaboración B2B.

Debe asegurarse de que solo los miembros de los roles Invitador de usuarios invitados, Administrador de usuarios y Administrador global pueden invitar a usuarios invitados.

¿Qué debe configurar?

Seleccione solo una respuesta.

Revisiones de acceso


Acceso condicional


Configuración del acceso entre inquilinos


Configuración de colaboración externa

> [!success] Brain — Respuesta: **Configuración de colaboración externa**
>
> Entra ID → External Identities → Configuración de colaboración externa → «Solo usuarios con roles administrativos específicos pueden invitar» (Invitador de usuarios invitados, Administrador de usuarios, Administrador global).
>
> 📄 En mi documentación: [az104-identities.md](../../../knowledge/az104-identities.md) — ⚠️ el ajuste concreto de colaboración externa no está desarrollado (gap).

--

Tiene una suscripción Azure que contiene los siguientes usuarios:

- User1: Miembro
- User2: Miembro
- User3: Invitado
- User4: Miembro

La suscripción contiene un grupo denominado Group1 con la siguiente configuración:

- Tipo de pertenencia: asignado
- Miembros: User1, User2, User3
- Propietarios: User4

Asigne una licencia de Microsoft 365 a Group1.

¿Cuántas licencias de Microsoft 365 se usarán?

Seleccione solo una respuesta.

0

1

3

**Esta respuesta es correcta.**

Cuando asigna licencias a un grupo de Microsoft Entra, las licencias son consumidas solo por los miembros del grupo, no por los propietarios del grupo. En este caso, Group1 tiene tres miembros: User1, User2 y User3. Aunque User3 es un usuario invitado, la asignación de una licencia a ellos sigue consume una licencia a menos que la organización haya configurado licencias de invitado restringidas. User4 es solo propietario, no miembro, por lo que no consumen una licencia de esta asignación. Por lo tanto, se usan un total de tres licencias de Microsoft 365.

[Administración de licencias](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/8-manage-licenses)  
[¿Qué es la licencia basada en grupos en Microsoft Entra ID?](https://learn.microsoft.com/en-us/entra/fundamentals/concept-group-based-licensing)  
[Comprender la licencia Microsoft 365 E3 y E5 Funciones adicionales](https://learn.microsoft.com/en-us/microsoft-365/commerce/licenses/e3-extra-features-licenses)

> [!success] Brain — Respuesta: **3**
>
> Consumen licencia los **miembros** (User1, User2, User3), no el propietario (User4); el invitado también consume licencia.
>
> 📄 En mi documentación: [az104-identities.md](../../../knowledge/az104-identities.md) · [az-104-identity-governance.md](../../../cheatsheets/az-104-identity-governance.md)

---

Tiene un tenant de Microsoft Entra denominado contoso.com que contiene un grupo denominado Group1. Group1 contiene los siguientes usuarios:

- User1 — Tipo: Miembro; Sincronización desde el entorno local: Sí
- User2 — Tipo: Miembro; Sincronización desde el entorno local: No
- User3 — Tipo: Invitado; Sincronización desde el entorno local: No

La escritura diferida de contraseñas está habilitada en Microsoft Entra Connect Sync.

Habilitas el autoservicio de restablecimiento de contraseñas (SSPR) para Group1.

Debe identificar qué usuarios pueden usar SSPR.

¿Qué usuarios deben identificar?

Seleccione solo una respuesta.

Solo User2

**Esta respuesta no es correcta.**

Solo para User1 y User2

**Esta respuesta es correcta.**

Solo User2 y User3

User1, User2 y User3

El registro de SSPR es necesario para los usuarios dentro del ámbito que son aptos para utilizar SSPR. En este escenario, Group1 está en el ámbito e incluye dos usuarios miembros (User1 y User2) y un usuario invitado (User3). Dado que la reversión de contraseñas está habilitada, el miembro sincronizado, User1, puede usar SSPR para escribir los cambios de nuevo en el AD local. Por otro lado, el miembro que opera únicamente en la nube, User2, puede restablecer su contraseña en Entra ID. Ambos usuarios deben registrarse. Los usuarios invitados (User3) no son compatibles con SSPR en el inquilino de recursos (administran contraseñas en su inquilino principal), por lo que no necesitan registrarse aquí.

[Introduction](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/1-introduction)  
[Administrar autoservicio de restablecimiento de contraseña en Microsoft Entra ID](https://learn.microsoft.com/en-us/training/modules/protect-identities-azure-acative-directory/6-manage-self-service-password-reset)  
[Ejercicio para configurar e implementar el autoservicio de restablecimiento de contraseña](https://learn.microsoft.com/en-us/training/modules/manage-user-authentication/5-exercise-configure-deploy-self-service-password-reset)  
[Tutorial: Active la escritura de vuelta de restablecimiento de contraseña de autoservicio de Microsoft Entra en un entorno local](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr-writeback)  
[¿Qué es la autenticación de Microsoft Entra?](https://learn.microsoft.com/en-us/training/modules/manage-security-controls-identity-access/16-what-microsoft-entra-authentication)

> [!success] Brain — Respuesta: **Solo User1 y User2**
>
> SSPR no aplica a invitados (su contraseña vive en su tenant de origen); con escritura diferida habilitada, el usuario sincronizado (User1) sí puede usar SSPR.
>
> 📄 En mi documentación: [az104-sspr.md](../../../knowledge/az104-sspr.md) — escritura diferida cubierta; ⚠️ la exclusión de invitados no está explícita.

---
Tiene un inquilino de Microsoft Entra llamado contoso.com. Todos los usuarios tienen cuentas solo en la nube.

Tiene previsto implementar Microsoft 365 para todos los usuarios.

Debe asegurarse de que las licencias de Microsoft 365 se asignen automáticamente a los usuarios cuando se añadan nuevos usuarios al cliente. La solución debe minimizar el esfuerzo administrativo.

¿Qué debe configurar?

Seleccione solo una respuesta.

un grupo dinámico

**Esta respuesta es correcta.**

la configuración del usuario

una revisión de acceso

la configuración General en Grupos

**Objetivo:**

1.1 Administrar usuarios y grupos de Microsoft Entra

**Qué prueba este elemento:**

Administración de propiedades de usuario y grupo

**Lectura adicional:**

[Crear, configurar y administrar grupos: entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/create-configure-manage-identities/5-groups)

Correcto: los grupos dinámicos incluyen automáticamente a los usuarios en función de las propiedades definidas y se pueden usar para licencias basadas en grupos, lo que garantiza que las licencias de Microsoft 365 se asignan sin intervención manual.  
Incorrecto: en la configuración de usuario puede configurar permisos de rol de usuario predeterminados, acceso de usuario invitado, configuración de administración y conexiones de cuenta de LinkedIn.  
Incorrecto: Las revisiones de acceso de Microsoft Entra son una característica de gobernanza de identidades que permite a las organizaciones revisar y certificar periódicamente el acceso de los usuarios a grupos, aplicaciones y roles.  
Incorrecto: la configuración general de grupos le permite configurar la administración de grupos de autoservicio.

> [!success] Brain — Respuesta: **un grupo dinámico**
>
> Pertenencia automática por atributos + licencias basadas en grupos → las licencias se asignan solas al dar de alta usuarios.
>
> 📄 En mi documentación: [az104-identities.md](../../../knowledge/az104-identities.md)

---
Tiene una suscripción de Azure que contiene varios usuarios y administradores.  

Va a crear un nuevo rol personalizado mediante el siguiente JSON.  

``

{ "Name": "Custom Role", "Id": null, "IsCustom": true, "Description": "Descripción del Rol Personalizado", "Actions": [ "Microsoft.Compute/*/read", "Microsoft.Compute/snapshots/write", "Microsoft.Compute/snapshots/read", ], "NotActions": [ "Microsoft.Compute/snapshots/delete" ], "AssignableScopes": [ "/subscriptions/00000000-0000-0000-0000-000000000000", "/subscriptions/11111111-1111-1111-1111-111111111111" ] }

¿Qué dos acciones puede realizar un usuario que tenga asignado el rol personalizado? Cada respuesta correcta presenta una solución completa.

Seleccione todas las respuestas que procedan.

Cree y elimine una instantánea.

Cree y lea una instantánea.

**Esta respuesta es correcta.**

Crear máquinas virtuales.

Lea toda la configuración de la máquina virtual.

**Esta respuesta es correcta.**

El rol puede leer todos los recursos de computación, contactar con el soporte técnico de Microsoft y permitir la creación y lectura de una instantánea.

[Azure roles personalizados: Azure RBAC | Microsoft Learn](https://learn.microsoft.com/azure/role-based-access-control/custom-roles)

[Protege los recursos de Azure con el control de acceso basado en roles de Azure (Azure RBAC)](https://learn.microsoft.com/training/modules/secure-azure-resources-with-rbac/)

> [!success] Brain — Respuesta: **«Cree y lea una instantánea» + «Lea toda la configuración de la máquina virtual»**
>
> `Microsoft.Compute/*/read` permite leer toda la configuración de cómputo; `snapshots/write` + `snapshots/read` crean y leen snapshots; `NotActions` resta el delete.
>
> 📄 En mi documentación: [az104-azure-rbac.md](../../../knowledge/az104-azure-rbac.md) — Actions/NotActions y roles personalizados.

---
Tiene una suscripción Azure.

Debes ejecutar el comando siguiente:

```
  Get-AzRoleDefinition | Format-Table -Property Name, Id
```

La salida del comando contiene datos que incluyen lo siguiente:

```
CustomRole1   111-222-333-444-555
Owner         8e3af657-a8ff-443c-a75c-2fe8c4bcb635
Contributor   b24988ac-6180-42a0-ab88-20f7382dd24c
Reader        acdd72a7-3385-48ef-bd42-f606fba81ae7
```

Tienes un script que administra el acceso a los recursos en el nivel de grupo de recursos. El proceso de asignación se automatiza ejecutando el siguiente script de PowerShell de forma nocturna.

```
$rg = "RG1"
$RoleName = "111-222-333-444-555"
$Role = Get-AzRoleDefinition -Name $RoleName
New-AzRoleAssignment -SignInName user1@contoso.com
    -RoleDefinitionName $Role.Name `
    -ResourceGroupName $rg
```

User1 no puede acceder al grupo de recursos RG1. Descubres que el script no se puede completar para User1.

Debes modificar el script para asegurarte de que no se produce un error.

¿Qué deberías cambiar en el script?

Seleccione solo una respuesta.

`$Role = Add-AzRoleDefinition -Name $RoleName`

`$Role = Get-AzRoleAssignment -Name $RoleName`

`$Role = Set-AzRoleAssignment -Name $RoleName`

`$RoleName = "CustomRole1"`

**Esta respuesta es correcta.**

Para que el script funcione tal como se ha escrito, la variable $RoleName debe hacer referencia al nombre en lugar del id.

[Assignar roles de Azure mediante Azure PowerShell: Azure RBAC | Microsoft Learn](https://learn.microsoft.com/azure/role-based-access-control/role-assignments-powershell)

[Proteja los recursos de Azure con el control de acceso basado en roles de Azure (Azure RBAC)](https://learn.microsoft.com/training/modules/secure-azure-resources-with-rbac/)

> [!success] Brain — Respuesta: **`$RoleName = "CustomRole1"`**
>
> `Get-AzRoleDefinition -Name` espera el **nombre** del rol, no su GUID: con el GUID no encuentra la definición y el script falla.
>
> 📄 En mi documentación: [az104-azure-rbac.md](../../../knowledge/az104-azure-rbac.md) — ⚠️ cmdlets PowerShell de asignación sin detalle (gap).

---
Tiene una suscripción Azure que contiene varias máquinas virtuales.  

Debe asegurarse de que un usuario llamado User1 pueda ver todos los recursos de un grupo de recursos denominado RG1. Debes usar el principio de privilegios mínimos.

¿Qué rol debe asignarle a User1?

Seleccione solo una respuesta.

Lector de facturación

Colaborador

**Esta respuesta no es correcta.**

Lector

**Esta respuesta es correcta.**

Colaborador de etiquetas

El rol Lector permite ver todos los recursos, pero no realizar ningún cambio. El rol Colaborador permite administrar todos los recursos, el rol Lector de facturación proporciona acceso de solo lectura a los datos de facturación y el rol Colaborador de etiquetas le permite administrar etiquetas de entidad sin proporcionar acceso a las entidades.

[Roles predefinidos de Azure - Azure RBAC | Microsoft Learn](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles)

[Protege tus recursos de Azure con el control de acceso basado en roles de Azure (Azure RBAC)](https://learn.microsoft.com/training/modules/secure-azure-resources-with-rbac/)

> [!success] Brain — Respuesta: **Lector**
>
> Ver todo sin cambios = mínimo privilegio. Colaborador modifica, Lector de facturación solo ve facturación, Colaborador de etiquetas solo gestiona etiquetas.
>
> 📄 En mi documentación: [az104-azure-rbac.md](../../../knowledge/az104-azure-rbac.md)

---
Tiene una suscripción Azure y un usuario denominado User1.

Debe asignar a User1 un rol que permita al usuario crear y administrar todos los tipos de recursos de la suscripción. La solución debe asegurarse de que User1 no puede asignar roles a otros usuarios.

¿Qué rol de Azure debe asignar a User1?

Seleccione solo una respuesta.

Colaborador de servicio de administración de API

Colaborador

**Esta respuesta es correcta.**

Propietario

Lector

Los usuarios con el rol Colaborador pueden crear y administrar todos los tipos de recursos, pero no pueden delegar el acceso nuevo a otros usuarios. Los usuarios con el rol Lector pueden ver los recursos de Azure existentes, pero no pueden realizar ninguna acción en ellos. Los usuarios con el rol de Colaborador de API Management solo pueden administrar servicios y API. Los usuarios con el rol Propietario tienen acceso total a todos los recursos, incluido el derecho a delegar el acceso a otros usuarios.

[Azure roles integrados: Azure RBAC | Microsoft Learn](https://learn.microsoft.com/azure/role-based-access-control/built-in-roles)

[Protege los recursos de Azure con el control de acceso basado en roles de Azure (Azure RBAC)](https://learn.microsoft.com/training/modules/secure-azure-resources-with-rbac/)

> [!success] Brain — Respuesta: **Colaborador**
>
> Crea y administra todos los recursos pero **no puede delegar acceso** — eso es Propietario, que incumpliría el requisito.
>
> 📄 En mi documentación: [az104-azure-rbac.md](../../../knowledge/az104-azure-rbac.md)

---
Tiene una suscripción de Azure que contiene cientos de máquinas virtuales que se migraron desde un centro de datos local.

Necesita identificar qué máquinas virtuales están infrautilizadas.

¿Qué Azure Advisor configuración debe usar?

Seleccione solo una respuesta.

Coste

**Esta respuesta es correcta.**

Alta disponibilidad

Excelencia operativa

Rendimiento

**Esta respuesta no es correcta.**

La hoja de Costos le permite optimizar y reducir el gasto general de Azure. Puede usarla para identificar las máquinas virtuales infrautilizadas. La hoja Rendimiento lo ayuda a mejorar la velocidad de las aplicaciones. La opción de alta disponibilidad no está habilitada a través de Azure Advisor. La Excelencia operativa ayuda a conseguir eficiencia en los procesos y flujos de trabajo, manejabilidad de los recursos y procedimientos recomendados para las implementaciones.

[Introducción a Azure Advisor - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/intro-to-azure-advisor/)

[](https://aka.ms/yourcaliforniaprivacychoices)

> [!success] Brain — Respuesta: **Coste**
>
> La hoja Coste de Advisor detecta VMs infrautilizadas (right-sizing). Rendimiento = velocidad de aplicaciones; Excelencia operativa = procesos y flujos.
>
> 📄 En mi documentación: [az900-monitoring-tools.md](../../../knowledge/az900-monitoring-tools.md) — Azure Advisor.

---
Tiene una suscripción Azure.

Tiene previsto crear una definición de Azure Policy denominada Policy1.

Debe incluir información de corrección en la política.

¿A qué sección de definición debe agregar información de corrección para Policy1?

Seleccione solo una respuesta.

metadatos

**Esta respuesta es correcta.**

modo

parámetros

regla de política

Debe usar el campo RemediationDescription en la sección de metadatos de las propiedades para especificar una recomendación personalizada. Las opciones restantes son directivas de Azure, pero no permiten información de remediación personalizada.

[Crear directivas de seguridad de Azure personalizadas en Microsoft Defender for Cloud | Microsoft Learn](https://learn.microsoft.com/azure/defender-for-cloud/custom-security-policies?pivots=azure-portal#enhance-your-custom-recommendations-with-detailed-information)

[Improvear la respuesta a incidentes con alertas sobre Azure - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/incident-response-with-alerting-on-azure/)

> [!success] Brain — Respuesta: **metadatos**
>
> El campo `RemediationDescription` vive en la sección `metadata` de la definición de directiva; ni mode, ni parameters, ni policy rule aceptan información de corrección.
>
> 📄 En mi documentación: [az104-azure-policy.md](../../../knowledge/az104-azure-policy.md) — estructura de la definición.

---
Tiene una suscripción Azure que contiene un grupo de recursos denominado RG1.

RG1 contiene 10 recursos.

Debe evitar que los recursos se eliminen accidentalmente. La solución debe asegurarse de que se puede eliminar RG1 si ya no contiene ningún recurso.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Desde Azure Cloud Shell, ejecute el cmdlet New-AzureRmResourceGroup.

Desde Azure Cloud Shell, ejecute el cmdlet Set-AzResourceGroup.

En el portal de Azure, agregue una etiqueta en RG1.

En el portal de Azure, agregue un bloqueo en RG1.

**Esta respuesta es correcta.**

La solución correcta consiste en configurar un bloqueo en RG1 desde el portal de Azure, ya que un bloqueo De eliminación impide la eliminación accidental de recursos dentro del grupo de recursos, a la vez que permite eliminar el propio grupo de recursos una vez que está vacío. La creación de un nuevo grupo de recursos con New-AzureRmResourceGroup es irrelevante y el uso de Set-AzResourceGroup cambia las propiedades, pero no aplica la protección de eliminación. La opción "controladores" no existe en la configuración del grupo de recursos de Azure. Los bloqueos son el mecanismo admitido para proteger los recursos frente a la eliminación accidental, a la vez que se mantiene la flexibilidad de quitar el grupo de recursos si es necesario.

[Bloquee los recursos de Azure para proteger la infraestructura](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources)

> [!success] Brain — Respuesta: **En el portal de Azure, agregue un bloqueo en RG1**
>
> Un bloqueo a nivel de grupo de recursos lo heredan los 10 recursos y evita el borrado accidental; el RG vacío sí puede eliminarse (tras quitar el bloqueo).
>
> 📄 En mi documentación: [az900-governance-compliance.md](../../../knowledge/az900-governance-compliance.md) · [az-104-identity-governance.md](../../../cheatsheets/az-104-identity-governance.md)

---
Tiene una suscripción Azure que contiene los siguientes recursos:

- Ocho redes virtuales
- 24 máquinas virtuales
- 16 cuentas de almacenamiento

Debe implementar una solución de supervisión que proporcione la capacidad de ver los datos de diagnóstico y telemetría generados por Azure recursos.

¿Qué deberías incluir en la solución?

Seleccione solo una respuesta.

un área de trabajo de Log Analytics

**Esta respuesta es correcta.**

un área de trabajo de Azure Machine Learning

registros de métricas

**Esta respuesta no es correcta.**

registros de recursos

Un área de trabajo de Log Analytics es un entorno único para los datos de registro de Azure Monitor y otros servicios de Azure, como Microsoft Sentinel y Microsoft Defender for Cloud. Cada área de trabajo tiene su propio repositorio de datos y configuración, y puede combinar datos de varios servicios.

Información general del área de trabajo [Log Analytics: Azure Monitor | Microsoft Docs](https://docs.microsoft.com/azure/azure-monitor/logs/log-analytics-workspace-overview)

[Analyze la infraestructura de Azure mediante registros de Azure Monitor](https://learn.microsoft.com/en-us/training/modules/analyze-infrastructure-with-azure-monitor-logs/)

> [!success] Brain — Respuesta: **un área de trabajo de Log Analytics**
>
> Azure Monitor envía diagnóstico/telemetría de cualquier recurso (VMs, VNets, storage) al workspace, donde se consulta con KQL.
>
> 📄 En mi documentación: [az104-vm-monitoring.md](../../../knowledge/az104-vm-monitoring.md) · [az900-monitoring-tools.md](../../../knowledge/az900-monitoring-tools.md)

___
Tiene una suscripción de Azure que contiene máquinas virtuales, redes virtuales, puertas de enlace de aplicaciones y equilibradores de carga.

Debe supervisar el estado de red de los recursos.

¿Qué Azure servicio debe usar?

Seleccione solo una respuesta.

Azure Monitor

Azure Network Watcher

**Esta respuesta es correcta.**

Azure Resource Manager

Grupos de seguridad de red (NSG)

Azure Network Watcher proporciona herramientas para supervisar, diagnosticar, ver métricas y habilitar o deshabilitar registros de recursos en una red virtual de Azure. Azure Resource Manager es el servicio de implementación y administración para Azure. Los grupos de seguridad de red (NSG) solo se usan para la seguridad, no para la supervisión. Azure Monitor se usa para la API del recopilador de datos HTTP para enviar datos de registro a Log Analytics.

[Azure Network Watcher | Microsoft Learn](https://learn.microsoft.com/azure/network-watcher/network-watcher-monitoring-overview)

[Introducción a Azure Network Watcher](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-network-watcher/)

> [!success] Brain — Respuesta: **Azure Network Watcher**
>
> Estado de **red** (topología, flujo de NSG, captura de paquetes, verificación de flujo IP) = Network Watcher; Azure Monitor es la plataforma general de monitorización.
>
> 📄 En mi documentación: [az104-network-watcher.md](../../../knowledge/az104-network-watcher.md)

___

Tiene una máquina virtual Azure que ejecuta Linux. La máquina virtual hospeda una aplicación personalizada que genera datos de registro en formato JSON.

Debe recomendar una solución para recopilar registros en el espacio de trabajo de Log Analytics.

¿Qué debería incluir en la recomendación?

Seleccione solo una respuesta.

la extensión VMAccess de Azure

la extensión de script personalizado versión 2

la extensión DSC para Linux

el agente de Azure Monitor para Linux

**Esta respuesta es correcta.**

Puede usar el agente de Log Analytics para Linux como parte de una solución para recopilar la salida JSON de las máquinas virtuales Linux.

La Extensión de Script Personalizado de Azure se usa para la configuración posterior a la implementación, la instalación de software o cualquier otra tarea de configuración o administración.

Desired State Configuration (DSC) es una plataforma de administración que puede usar para administrar una infraestructura de TI y desarrollo con configuración como código.

La extensión VMAccess de Azure actúa como un conmutador KVM que permite acceder a la consola para restablecer el acceso a Linux o realizar el mantenimiento de nivel de disco.

[Recopilación de fuentes de datos JSON personalizadas con el agente de Log Analytics para Linux en Azure Monitor - Azure Monitor | Microsoft Learn](https://learn.microsoft.com/azure/azure-monitor/agents/data-sources-json)

> [!success] Brain — Respuesta: **el agente de Azure Monitor para Linux**
>
> La extensión Log Analytics / Azure Monitor Agent recopila salidas JSON personalizadas de VMs Linux hacia el workspace. VMAccess es consola/KVM, Custom Script es post-deploy y DSC es configuración como código.
>
> 📄 En mi documentación: [az104-vm-monitoring.md](../../../knowledge/az104-vm-monitoring.md) — ⚠️ el origen de datos JSON no está detallado.

___

Tiene 100 máquinas virtuales implementadas en Azure. Tiene configuradas alertas de Azure Monitor para el consumo de CPU y memoria de las máquinas virtuales.

Usted abre las alertas de Azure Monitor y detecta 50 alertas cerradas para las máquinas virtuales.

¿Qué puede hacer que el estado de la alerta sea Cerrado?

Seleccione solo una respuesta.

Un administrador cambió manualmente el estado de las alertas.

**Esta respuesta es correcta.**

Las alertas tienen más de 60 días.

La regla de alerta contiene un grupo de acciones que corrige las condiciones de alerta.

Las condiciones que provocaron las alertas ya no están presentes.

**Esta respuesta no es correcta.**

El usuario establece manualmente el estado de la alerta y no tiene ninguna lógica automatizada detrás de ella. El estado de la alerta puede ser Nuevo, Confirmado o Cerrado.

[Administrar alertas de Azure Monitor: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-azure-alerts/2-manage-azure-monitor-alerts)

> [!success] Brain — Respuesta: **Un administrador cambió manualmente el estado**
>
> El estado de la alerta (Nuevo / Confirmado / Cerrado) es un campo **manual** de gestión; que la condición desaparezca resuelve la señal monitorizada, no cambia el estado del objeto de alerta.
>
> 📄 En mi documentación: [az104-vm-monitoring.md](../../../knowledge/az104-vm-monitoring.md) — ⚠️ estados de alerta sin detalle (gap).

___
Tiene una máquina virtual Azure denominada Server1 que ejecuta Windows Server.

Debe configurar Azure Backup para realizar copias de seguridad de archivos y carpetas.

¿Qué debe instalar en Servidor1?

Seleccione solo una respuesta.

Microsoft Azure Backup Server (MABS)

**Esta respuesta no es correcta.**

Proveedor de Microsoft Azure Site Recovery

el agente de Azure Connected Machine

el agente de Microsoft Azure Recovery Services (MARS)

**Esta respuesta es correcta.**

El agente de Microsoft Azure Recovery Service (MARS) debe estar instalado en los servidores. El agente de MARS es obligatorio para realizar servicios de copia de seguridad y recuperación para cualquier servidor.

[Administrar el agente de servicios de recuperación de Azure - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-file-folder-backups/6-manage-azure-recovery-services-agent?ns-enrollment-type=learningpath&ns-enrollment-id=learn.az-104-monitor-backup-resources)

> [!success] Brain — Respuesta: **el agente de Microsoft Azure Recovery Services (MARS)**
>
> Backup de archivos y carpetas en Windows = agente MARS. MABS es servidor de backup completo y Site Recovery es DR, no backup.
>
> 📄 En mi documentación: [az104-azure-backup.md](../../../knowledge/az104-azure-backup.md)

___
Tiene una máquina virtual Azure denominada VM1 protegida mediante Azure site recovery.

Realizas una conmutación por error de VM1 desde la región principal a la región secundaria.

Debe restaurar la protección de VM1 después de la conmutación por error para que VM1 se replique nuevamente a la región primaria.

¿Cuál es el estado de VM1 antes de la reprotección?

Seleccione solo una respuesta.

Ejecutando la conmutación por error

Conmutación por error confirmada

**Esta respuesta es correcta.**

Conmutación por error confirmada

Iniciando conmutación por error

Antes de comenzar, debe asegurarse de que el estado de la máquina virtual es "Conmutación por error confirmada". Esto garantizará la replicación en la región primaria.

[Tutorial para activar la conmutación de máquinas virtuales de Azure en una región secundaria para la recuperación ante desastres con Azure Site Recovery. - Azure Site Recovery | Microsoft Learn](https://learn.microsoft.com/azure/site-recovery/azure-to-azure-tutorial-failover-failback)

[Configurar copias de seguridad de archivos y carpetas: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-file-folder-backups/)

> [!success] Brain — Respuesta: **Conmutación por error confirmada**
>
> La reprotección (failback) exige que el failover esté **confirmado** para volver a replicar hacia la región primaria.
>
> 📄 En mi documentación: [az104-azure-backup.md](../../../knowledge/az104-azure-backup.md) — ⚠️ la reprotección no está detallada.

___
Tiene una máquina virtual Azure de la que realiza una copia de seguridad mediante Azure Backup.

El subtipo de directiva de copia de seguridad es Estándar y la directiva de copia de seguridad tiene las siguientes configuraciones:

- Frecuencia de programación de la copia de seguridad: Semanal
- Conservar las instantáneas de recuperación rápida durante: 5 días
- Retención del punto de copia de seguridad semanal: El domingo a las 8:00 h durante 12 semanas

Detecta que la restauración instantánea consume más almacenamiento de lo esperado.

Debe reducir la cantidad de almacenamiento consumido por la restauración instantánea.

¿Qué debe hacer primero?

Seleccione solo una respuesta.

Cambie la frecuencia de programación de copia de seguridad a Diario.

Cambie la retención de puntos de copia de seguridad semanales a 1 semana.

Modifique la directiva de copia de seguridad para reducir la retención de instantáneas de recuperación inmediata.

**Esta respuesta es correcta.**

Aprovisione un contenedor de Blob Storage adicional.

**Esta respuesta no es correcta.**

Correcto: la configuración "Conservar instantáneas de recuperación instantánea" determina directamente cuánto tiempo se almacenan localmente las instantáneas antes de transferirse al almacén de Recovery Services. Al reducir esto de 5 días a 2 días, se reduce el uso del almacenamiento de restauración instantánea.

[Funcionalidad de restauración instantánea de Azure: Azure Backup | Microsoft Learn](https://learn.microsoft.com/azure/backup/backup-instant-restore-capability)

[Configurar copias de seguridad de archivos y carpetas: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-file-folder-backups/)

> [!success] Brain — Respuesta: **reducir la retención de instantáneas de recuperación inmediata**
>
> Esas instantáneas se guardan localmente (cuenta de almacenamiento del cliente): menos días de retención = menos almacenamiento consumido.
>
> 📄 En mi documentación: [az104-azure-backup.md](../../../knowledge/az104-azure-backup.md) · [az104-vm-backup.md](../../../knowledge/az104-vm-backup.md)

___
Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1.

Debe proporcionar acceso a almacenamiento1 a una organización asociada. El acceso a Storage1 debe expirar automáticamente después de 24 horas.

¿Qué debe configurar?

Seleccione solo una respuesta.

firma de acceso compartido (SAS)

**Esta respuesta es correcta.**

clave de acceso

Azure Content Delivery Network (CDN)

administración del ciclo de vida

Una SAS proporciona acceso delegado a los recursos de la cuenta de almacenamiento. Con una SAS, tiene control granular sobre la forma en que un cliente puede tener acceso a los datos, incluidas las restricciones de tiempo.

Las claves de acceso y Azure CDN proporcionan acceso permanente a los recursos. Requerirán pasos manuales para quitar el acceso. No es necesaria la administración del ciclo de vida.

[Configurar la seguridad de Azure Storage - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-storage-security/)

[Grant limitó el acceso a los datos con firmas de acceso compartido (SAS): Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/common/storage-sas-overview)

> [!success] Brain — Respuesta: **firma de acceso compartido (SAS)**
>
> La SAS delega acceso con **expiración** (24 h). Las claves no expiran, CDN no es control de acceso y la administración del ciclo de vida es retención de datos.
>
> 📄 En mi documentación: [az104-storage-security.md](../../../knowledge/az104-storage-security.md)

___


Tiene una suscripción de Azure que contiene una cuenta de almacenamiento denominada storage1 y está vinculada a un inquilino de Microsoft Entra denominado contoso.com.

Tiene previsto proporcionar acceso basado en la identidad a storage1.

¿Qué servicio de datos storage1 se puede configurar para usar el acceso basado en identidades?

Seleccione solo una respuesta.

contenedores

**Esta respuesta no es correcta.**

compartición de archivos

**Esta respuesta es correcta.**

Colas

tablas

Los recursos compartidos de archivos se pueden configurar para usar Microsoft Entra Kerberos y así proporcionar acceso basado en identidad al almacenamiento de datos.

[Configurar cuentas de almacenamiento: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-storage-accounts/)

Comparar el almacenamiento para recursos compartidos de archivos y datos de blobs - Formación | Microsoft Learn

> [!success] Brain — Respuesta: **compartición de archivos**
>
> Azure Files se configura con Microsoft Entra Kerberos para acceso basado en identidad sobre SMB.
>
> 📄 En mi documentación: [az104-azure-files.md](../../../knowledge/az104-azure-files.md) — tabla «Autenticación basada en la identidad en SMB».

___
Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1.

Debe conceder acceso a una aplicación de terceros a Storage1 durante los próximos 30 días.

¿Qué debe usar?

Seleccione solo una respuesta.

una directiva de acceso condicional

**Esta respuesta no es correcta.**

una firma de acceso compartido

**Esta respuesta es correcta.**

clave de acceso

un rol de Azure

La solución correcta consiste en usar una firma de acceso compartido (SAS), ya que solo SAS puede especificar el acceso limitado de tiempo a Azure almacenamiento. Una clave de acceso proporciona acceso ilimitado a la cuenta de almacenamiento de Azure, un rol de Azure puede proporcionar acceso o administración del recurso de Azure, que no tiene límite de tiempo, y una directiva de acceso condicional actúa como un motor de directivas de confianza cero, "si-entonces", que evalúa señales como la identidad del usuario, el cumplimiento de dispositivos, la ubicación y el riesgo para tomar decisiones de acceso en tiempo real.

[Detección de firmas de acceso compartido](https://learn.microsoft.com/en-us/training/modules/implement-shared-access-signatures/2-shared-access-signatures-overview)  
[Descripción de las firmas de acceso compartido](https://learn.microsoft.com/en-us/training/modules/secure-azure-storage-account/4-shared-access-signatures)

> [!success] Brain — Respuesta: **una firma de acceso compartido**
>
> Único mecanismo de los listados con **límite temporal** (30 días) para un tercero: las claves dan acceso total permanente y los roles RBAC no expiran.
>
> 📄 En mi documentación: [az104-storage-security.md](../../../knowledge/az104-storage-security.md)

___
Tiene una suscripción Azure que contiene una cuenta de almacenamiento denominada storage1. storage1 contiene un recurso compartido de Azure Files denominado share1.

Debe asegurarse de que los usuarios pueden autenticarse en share1 mediante Microsoft Entra y acceder al recurso compartido de archivos mediante SMB.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Configurar el acceso basado en identidades.

**Esta respuesta es correcta.**

Genere una firma de acceso compartido (SAS) y una cadena de conexión.

**Esta respuesta no es correcta.**

Habilite el acceso a la red pública.

Vuelva a generar las claves de acceso.

**Objetivo:**

2.1 Configuración del acceso al almacenamiento

**Qué prueba este elemento:**

Configuración del acceso basado en identidades para Azure Files

**Lectura adicional:**

[Review Azure Storage security strategies - Training | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/configure-storage-security/2-review-strategies)

Correcto: el acceso basado en identidad para una cuenta de Azure Storage es un modelo de seguridad que usa Microsoft Entra ID o Active Directory para autorizar solicitudes a datos de almacenamiento, en lugar de confiar en una clave de cuenta de almacenamiento estática o SAS.  
Incorrecto: los tokens de SAS y las claves de acceso proporcionan acceso basado en claves, en lugar de acceso basado en identidades, y la habilitación del acceso a la red pública no configura la autenticación ni la autorización.

> [!success] Brain — Respuesta: **Configurar el acceso basado en identidades**
>
> Autenticación Entra sobre SMB (Entra Kerberos / AD DS local) en lugar de clave de cuenta o SAS.
>
> 📄 En mi documentación: [az104-azure-files.md](../../../knowledge/az104-azure-files.md) — tabla «Autenticación basada en la identidad en SMB».

___
Debe crear una cuenta de Azure Storage que cumpla los siguientes requisitos:

- Almacena datos en un mínimo de dos zonas de disponibilidad
- Proporciona alta disponibilidad

¿Qué tipo de redundancia de almacenamiento debe usar?

Seleccione solo una respuesta.

almacenamiento con redundancia geográfica (GRS)

**Esta respuesta no es correcta.**

almacenamiento con redundancia local (LRS)

almacenamiento con redundancia geográfica con acceso de lectura (RA-GRS)

almacenamiento con redundancia de zona (ZRS)

**Esta respuesta es correcta.**

El almacenamiento con redundancia de zona (ZRS) replica una cuenta de almacenamiento de forma sincrónica en tres zonas de disponibilidad Azure en la región primaria. Para garantizar la alta disponibilidad, Microsoft recomienda usar ZRS en la región primaria y también replicar en una región secundaria.

Redundancia de datos - Azure Storage | Microsoft Learn

[Determinar estrategias de replicación - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-storage-accounts/5-determine-replication-strategies)

> [!success] Brain — Respuesta: **almacenamiento con redundancia de zona (ZRS)**
>
> ZRS replica sincrónicamente en **tres zonas de disponibilidad** de la región primaria. LRS no cruza zonas; GRS/RA-GRS replican a otra región (no zonas).
>
> 📄 En mi documentación: [az104-storage-accounts.md](../../../knowledge/az104-storage-accounts.md) · [az-104-storage.md](../../../cheatsheets/az-104-storage.md)

___

Tiene una cuenta de Azure Storage denominada corpimages y una carpeta compartida local denominada \server1\images.

Debe migrar todo el contenido de \server1\images a corpimages.

¿Cuáles son los dos comandos que puede usar? Cada respuesta correcta presenta una solución completa.

Seleccione todas las respuestas que procedan.

`Azcopy copy \\server1\images https://corpimages.blob.core.windows.net/public -recursive`

**Esta respuesta es correcta.**

`Azcopy sync \\server1\images https://corpimages.blob.core.windows.net/public -recursive`

**Esta respuesta no es correcta.**

`Get-ChildItem -Path \\server1\images -Recurse | Set-AzStorageBlobContent -Container "corpimages"`

**Esta respuesta es correcta.**

`Set-AzStorageBlobContent -Container "ContosoUpload" -File "\\server1\images" -Blob "corporateimages "`

El comando AzCopy permite copiar todos los archivos en una cuenta de almacenamiento. A continuación, use `Get-ChildItem` con el parámetro`path`, recurse para seleccionar todo y, a continuación, use el cmdlet `Set-AzureStorageBlobContent`.

[Copy o mover datos a Azure Storage mediante AzCopy v10 | Microsoft Learn](https://learn.microsoft.com/azure/storage/common/storage-use-azcopy-v10#transfer-data)

[Set-AzureStorageBlobContent (Azure.Storage) | Microsoft Learn](https://learn.microsoft.com/powershell/module/azure.storage/set-azurestorageblobcontent?view=azurermps-6.13.0)

[Sube, descarga y gestiona datos con Explorador de Azure Storage - Capacitación | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/upload-download-and-manage-data-with-azure-storage-explorer/)

[](https://aka.ms/yourcaliforniaprivacychoices)

> [!success] Brain — Respuesta: **`AzCopy copy`** y **`Get-ChildItem | Set-AzStorageBlobContent`**
>
> `copy` hace la migración one-shot recursiva (`sync` mantiene sincronía continuada, no es este caso). En PowerShell: pipeline recursivo al cmdlet de blobs.
>
> 📄 En mi documentación: [az-104-storage.md](../../../cheatsheets/az-104-storage.md) · [az104-blob-storage.md](../../../knowledge/az104-blob-storage.md)

___

Tiene una cuenta de Azure Storage.

Debe copiar datos en la cuenta de almacenamiento mediante la herramienta AzCopy.

¿Qué dos tipos de almacenamiento de datos son compatibles con AzCopy? Cada respuesta correcta presenta una solución completa.

Seleccione todas las respuestas que procedan.

mancha

**Esta respuesta es correcta.**

archivo

**Esta respuesta es correcta.**

cola

tabla

**Esta respuesta no es correcta.**

Puede proporcionar credenciales de autorización mediante Microsoft Entra o mediante un token de firma de acceso compartido (SAS). Ambos tipos de almacenamiento, blob y archivo se admiten en AzCopy.

[Copy o mover datos a Azure Storage mediante AzCopy v10 | Microsoft Learn](https://learn.microsoft.com/azure/storage/common/storage-use-azcopy-v10)

[Sube, descarga y gestiona datos con Explorador de Azure Storage - Capacitación | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/upload-download-and-manage-data-with-azure-storage-explorer/)

[](https://aka.ms/yourcaliforniaprivacychoices)

> [!success] Brain — Respuesta: **blob** y **archivo**
>
> AzCopy v10 solo soporta **Blob Storage** y **Azure Files**; tabla y cola quedaron fuera desde v10.
>
> 📄 En mi documentación: [az-104-storage.md](../../../cheatsheets/az-104-storage.md) — ⚠️ los tipos soportados por AzCopy no están detallados.

___
Tiene una suscripción Azure.

Tiene planeado crear una cuenta de almacenamiento denominada storage1.

Debe asegurarse de que storage1 proporciona listas de control de acceso (ACL) compatibles con POSIX.

¿Qué opción debe configurar al crear storage1?

Seleccione solo una respuesta.

nivel de acceso

**Esta respuesta no es correcta.**

espacio de nombres jerárquico

**Esta respuesta es correcta.**

SFTP

compatibilidad con la inmutabilidad de nivel de versión

Para habilitar listas de control de acceso (ACL) compatibles con POSIX, se debe usar el espacio de nombres jerárquico. Las opciones restantes son válidas para una cuenta de almacenamiento, pero no proporcionan la característica compatible con POSIX.

espacio de nombres jerárquico [Azure Data Lake Storage Gen2 | Microsoft Learn](https://learn.microsoft.com/azure/storage/blobs/data-lake-storage-namespace)

[Configurar cuentas de almacenamiento: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-storage-accounts/)

> [!success] Brain — Respuesta: **espacio de nombres jerárquico**
>
> El espacio de nombres jerárquico (Azure Data Lake Storage Gen2) habilita las ACL compatibles con POSIX en Blob Storage.
>
> 📄 En mi documentación: [az104-blob-storage.md](../../../knowledge/az104-blob-storage.md) · [az104-storage-accounts.md](../../../knowledge/az104-storage-accounts.md)

___
Tiene una suscripción de Azure que contiene varias cuentas de almacenamiento.

Una cuenta de almacenamiento denominada storage1 tiene un recurso compartido de archivos denominado share1 que almacena vídeos de marketing. Los usuarios informaron de que el 99 % del almacenamiento asignado está en uso.

Debe asegurarse de que share1 puede admitir archivos grandes y almacenar hasta 100 TiB.

¿Cuáles son los dos comandos de PowerShell que debe ejecutar? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

`New-AzRmStorageShare -ResourceGroupName RG1 -Name -StorageAccountName storage1 -Name share1 -QuotaGiB 100GB`

**Esta respuesta no es correcta.**

`Set-AzStorageAccount -ResourceGroupName RG1 -Name storage1 -EnableLargeFileShare`

**Esta respuesta es correcta.**

`Set-AzStorageAccount -ResourceGroupName RG1 -Name storage1 -Type "Standard_RAGRS"`

`Update-AzRmStorageShare -ResourceGroupName RG1 -Name -StorageAccountName storage1 -Name share1 -QuotaGiB 102400`

**Esta respuesta es correcta.**

Debe habilitar la cuenta de almacenamiento para admitir archivos grandes y actualizar la cuota de la cuenta de almacenamiento a 102 400 GB. No es necesario cambiar el tipo de cuenta de almacenamiento y está actualizando la compartición existente.

Información general sobre la replicación de objetos - [Azure Storage | Microsoft Learn](https://learn.microsoft.com/azure/storage/blobs/object-replication-overview)

[Configure Azure Blob Storage - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-blob-storage/)

> [!success] Brain — Respuesta: **`Set-AzStorageAccount -EnableLargeFileShare`** + **`Update-AzRmStorageShare -QuotaGiB 102400`**
>
> Activar large file shares en la cuenta y subir la cuota del share **existente** a 100 TiB (102400 GiB); `New-AzRmStorageShare` crearía uno nuevo.
>
> 📄 En mi documentación: [az104-azure-files.md](../../../knowledge/az104-azure-files.md) — límite de 100 TiB documentado; ⚠️ cmdlets sin detalle.

___
Tiene una suscripción Azure que contiene un grupo de recursos denominado RG1. RG1 contiene una máquina virtual Azure denominada VM1.

Debe usar VM1 como plantilla para crear una nueva máquina virtual Azure.

¿Qué tres métodos puede usar para completar la tarea? Cada respuesta correcta presenta una solución completa.

Seleccione todas las respuestas que procedan.

Desde Azure Cloud Shell, ejecute los cmdlets `Get-AzVM` y `New-AzVM`.

Desde Azure Cloud Shell, ejecute los cmdlets `Save-AzDeploymentScriptLog` y `New-AzResourceGroupDeployment`.

Desde Azure Cloud Shell, ejecute `Save-AzDeploymentTemplate` y `New-AzResourceGroupDeployment`.

**Esta respuesta es correcta.**

En RG1, seleccione **Export template**, seleccione **Download** y, a continuación, desde Azure Cloud Shell, ejecute el cmdlet `New-AzResourceGroupDeployment`.

**Esta respuesta es correcta.**

En VM1, seleccione **Exportar plantilla** y, luego, seleccione **Implementar**.

**Esta respuesta es correcta.**

En RG1, al seleccionar la opción Descargar de la página Exportar plantilla se exporta la plantilla de Azure Resource Manager (ARM) de las propiedades del grupo de recursos. Puede implementar la plantilla de ARM ejecutando el cmdlet `New-AzResourceGroupDeployment`.

Mediante el cmdlet `Save-AzDeploymentTemplate`, puede guardar la plantilla ARM de recursos. Luego puede implementar la plantilla de ARM ejecutando el cmdlet `New-AzResourceGroupDeployment`.

En VM1, al seleccionar la opción Implementar en la página Exportar plantilla, puede implementar una nueva máquina virtual Azure y usar la configuración de VM1 como plantilla.

El cmdlet de `Save-AzDeploymentScriptLog` se usa para guardar el registro de la ejecución de un script de implementación.

El cmdlet `Get-AzVM` genera una lista de máquinas virtuales que se crean en la suscripción de Azure.

[Use Azure portal para exportar una plantilla: Entrenamiento | Microsoft Learn](https://learn.microsoft.com/azure/azure-resource-manager/templates/export-template-portal) 

[Exportar plantilla en Azure PowerShell: Azure Resource Manager | Microsoft Learn](https://learn.microsoft.com/azure/azure-resource-manager/templates/export-template-powershell)

> [!success] Brain — Respuesta: **`Save-AzDeploymentTemplate` + `New-AzResourceGroupDeployment`** · **Export template → Download → deploy** · **VM1 → Exportar plantilla → Implementar**
>
> Tres vías de clonar VM1: exportar la plantilla del RG (cmdlet o portal) y redesplegarla, o Deploy directo desde el portal.
>
> 📄 En mi documentación: [az104-arm-templates.md](../../../knowledge/az104-arm-templates.md)

___

Tiene una suscripción Azure que contiene un grupo de recursos denominado RG1.

Tiene una plantilla de Azure Resource Manager (ARM) para una máquina virtual de Azure.

Debe usar PowerShell para aprovisionar una máquina virtual en RG1 mediante la plantilla.

¿Qué cmdlet de PowerShell debe ejecutar?

Seleccione solo una respuesta.

`New-AzManagementGroupDeployment`

`New-AzResourceGroupDeployment`

**Esta respuesta es correcta.**

`New-AzSubscriptionDeployment`

`New-AzVM`

Las máquinas virtuales se implementan en grupos de recursos, por lo que debe ejecutar el cmdlet de `New-AzResourceGroupDeployment`. Puede implementar máquinas virtuales en suscripciones o grupos de administración directamente, por lo que no se pueden usar `New-AzManagementGroupDeployment` ni `New-AzSubscriptionDeployment`. `New-AzVM` se puede usar para aprovisionar una nueva máquina virtual, pero sin usar una plantilla.

[Implementación de recursos con PowerShell y plantilla: Azure Resource Manager | Microsoft Learn](https://learn.microsoft.com/azure/azure-resource-manager/templates/deploy-powershell)

[Implementar la infraestructura de Azure utilizando plantillas JSON de ARM - Formación | Microsoft Learn](https://learn.microsoft.com/training/modules/create-azure-resource-manager-template-vs-code/)

> [!success] Brain — Respuesta: **`New-AzResourceGroupDeployment`**
>
> La VM se despliega a un **grupo de recursos** → `-TemplateFile`. `New-AzVM` aprovisiona sin plantilla; los scopes de management group/subscription no aplican a una VM en RG1.
>
> 📄 En mi documentación: [az104-arm-templates.md](../../../knowledge/az104-arm-templates.md)

___

Tiene una plantilla de Azure Resource Manager (ARM) denominada Template1 que se usa para implementar las máquinas virtuales de Azure.

Template1 contiene el texto siguiente. 

"recursos": [  
  {  
    "type": "Microsoft. Compute/virtualMachines",  
    "apiVersion": "2025-04-01",  
    "name": "[parameters('vmName')]",  
    "location": "[resourceGroup().location]",  
    "propiedades": {  
      < texto eliminado>  
    }  
  }  
]

Debe implementar dos máquinas virtuales Azure mediante Template1.

¿Qué debe agregar a Template1?

Seleccione solo una respuesta.

un elemento de copia

**Esta respuesta es correcta.**

la versión de la API

el identificador de suscripción de Azure

**Esta respuesta no es correcta.**

la ubicación del grupo de recursos

La solución correcta consiste en agregar un elemento de copia, ya que las plantillas de ARM usan la propiedad copy para implementar varias instancias de un recurso, como dos máquinas virtuales, en una sola implementación. La versión de la API ya está especificada en la plantilla y no controla el número de recursos implementados. El identificador de suscripción nunca está codificado de forma dura en las plantillas de ARM, ya que las implementaciones tienen el ámbito de una suscripción y la ubicación del grupo de recursos ya se proporciona a través de "[resourceGroup().location]". Por lo tanto, solo el elemento copy permite a la plantilla crear dos máquinas virtuales a partir de una única definición de recurso.

[Agregar flexibilidad a la plantilla de Azure Resource Manager mediante funciones de plantilla](https://learn.microsoft.com/en-us/training/modules/modify-azure-resource-manager-template-reuse/2-azure-resource-manager-functions)  
[Examinar plantillas de Azure Resource Manager](https://learn.microsoft.com/en-us/training/modules/explore-azure-governance-manageability/3-examine-azure-resource-manager-templates)  
documentación de [Azure Resource Manager](https://learn.microsoft.com/en-us/training/modules/arm-template-whatif/2-deployment-modes)

> [!success] Brain — Respuesta: **un elemento de copia**
>
> La propiedad `copy` (`count: 2` + `copyIndex()` en el nombre) crea N instancias de un recurso desde una única definición.
>
> 📄 En mi documentación: [az104-arm-templates.md](../../../knowledge/az104-arm-templates.md)

___
Va a crear una máquina virtual de Azure que se ejecutará con Windows Server.

Debe asegurarse de que VM1 formará parte de un conjunto de escalado de máquinas virtuales.

¿Qué configuración debe definir durante la creación de la máquina virtual?

Seleccione solo una respuesta.

Opciones de disponibilidad

**Esta respuesta es correcta.**

instancia de spot de Azure

Administración

Región

Debe configurar el conjunto de escalado de máquinas virtuales a partir de las opciones de disponibilidad. Instancia de spot de Azure se usa para agregar máquinas virtuales con un precio descontado. La región no afectará a la configuración de las opciones de disponibilidad. La configuración de administración permite configurar las opciones de supervisión y administración de la máquina virtual.

[Opciones de disponibilidad para Azure Virtual Machines: Azure Virtual Machines | Microsoft Learn](https://learn.microsoft.com/azure/virtual-machines/availability)

[Configurar la disponibilidad de la máquina virtual: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-virtual-machine-availability/)

> [!success] Brain — Respuesta: **Opciones de disponibilidad**
>
> Al crear la VM, «Opciones de disponibilidad» es donde se elige zona / conjunto de disponibilidad / **conjunto de escalado de máquinas virtuales**.
>
> 📄 En mi documentación: [az104-vm-availability.md](../../../knowledge/az104-vm-availability.md) — VMSS.

___
Tiene dos Azure máquinas virtuales denominadas VM1 y VM2 que ejecutan Windows Server.

VM1 tiene un único disco de datos que almacena los archivos de copia de seguridad.  

Debe mover el disco de datos de VM1 a VM2 lo antes posible.

¿Qué debe hacer primero?

Seleccione solo una respuesta.

Desasocie el disco de datos de VM1.

**Esta respuesta es correcta.**

Reinicie VM1.

Detenga VM1.

**Esta respuesta no es correcta.**

Detenga VM2.

Puede desasociar un disco de una máquina virtual en ejecución (eliminación activa). No es necesario detener VM2 ni reiniciar VM1.

[Detach un disco de datos de una máquina virtual de Windows - Azure - Azure Virtual Machines | Microsoft Learn](https://learn.microsoft.com/azure/virtual-machines/windows/detach-disk)

[Introducción a Azure máquinas virtuales](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-virtual-machines/)

> [!success] Brain — Respuesta: **Desasocie el disco de datos de VM1**
>
> Desasociar (hot detach, sin apagar) y luego asociarlo a VM2; no hace falta reiniciar ni detener ninguna VM.
>
> 📄 En mi documentación: [az104-virtual-machines.md](../../../knowledge/az104-virtual-machines.md)

___
Pregunta 33 de 50

Tiene una máquina virtual Azure.

Recibirá una notificación de que la máquina virtual se verá afectada por una actividad de mantenimiento subyacente en la infraestructura física.

Debe mover la máquina virtual a otro host para evitar una interrupción del servicio.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Aplique una directiva de Azure.

**Esta respuesta no es correcta.**

Aplique una etiqueta Azure.

Mueva la máquina virtual a otra suscripción de Azure.

Volver a implementar la máquina virtual.

**Esta respuesta es correcta.**

Debe volver a implementar la máquina virtual, lo que puede permitir moverla a otro host. Azure apagará la máquina virtual y moverá la máquina virtual a un nuevo nodo dentro de la infraestructura de Azure.

[Redeploy Windows virtual machines en Azure: Virtual Machines | Microsoft Learn](https://learn.microsoft.com/troubleshoot/azure/virtual-machines/redeploy-to-new-node-windows)

[Introducción a Azure máquinas virtuales](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-virtual-machines/)

> [!success] Brain — Respuesta: **Volver a implementar la máquina virtual**
>
> Redeploy apaga la VM y la mueve a **otro nodo físico** de Azure (VM → Soporte + solución de problemas → Redistribuir).
>
> 📄 En mi documentación: [az104-virtual-machines.md](../../../knowledge/az104-virtual-machines.md) — ⚠️ el redespliegue no está detallado.

___

Su empresa tiene una suscripción Azure que está vinculada a un inquilino de Microsoft Entra.

Se le ha pedido que limite el acceso al servidor de API de Kubernetes.

¿Qué dos opciones debe elegir? Cada respuesta correcta presenta una solución completa.

Seleccione todas las respuestas que procedan.

Rangos de IP autorizados del servidor de API

**Esta respuesta es correcta.**

clúster público

clúster privado

**Esta respuesta es correcta.**

etiquetas de Azure

Puede usar intervalos de direcciones IP autorizadas del servidor de API si quiere mantener un punto de conexión público para el servidor de API, pero restringir el acceso a un conjunto de intervalos de direcciones IP de confianza. Puede usar un clúster privado si quiere limitar el servidor de API para que solo sea accesible desde dentro de la red virtual.

[Introducción a Kubernetes - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/configure-azure-kubernetes-service/)

> [!warning] Brain — Respuesta: **Rangos de IP autorizados del servidor de API** + **clúster privado** — no cubierto en mi documentación
>
> Clúster público con intervalos IP autorizados (restringe el endpoint público) o clúster privado (el API solo accesible desde la VNet).
>
> ⚠️ Gap: no existe ficha de AKS en `knowledge/` — el gap ya está anotado en [az104-container-instances.md](../../../knowledge/az104-container-instances.md).

___
iene una suscripción Azure que contiene una imagen de contenedor de Docker denominada container1.

Tiene previsto crear una nueva aplicación web Azure App Service denominada WebApp1.

Debe asegurarse de que puede usar container1 para WebApp1.

¿Qué configuración de WebApp1 deberías ajustar?

Seleccione solo una respuesta.

Despliegue continuo

Plan de precios

Publicar

**Esta respuesta es correcta.**

Pila en tiempo de ejecución

**Esta respuesta no es correcta.**

Si desea ejecutar un contenedor de Docker como un servicio web Azure, debe configurar la opción Publicar y seleccionar Contenedor de Docker.

La pila de ejecución especifica la pila que desea utilizar para la aplicación web. Si quiere desplegar un contenedor Docker en forma de aplicación web, la opción de entorno de ejecución no está disponible.

El plan de precios especifica la ubicación, las características y los costos de la aplicación web.

La implementación continua es una estrategia para las versiones de software. Esta opción no está disponible al publicar un contenedor de Docker como una aplicación web de Azure.

  [Overview: Azure App Service | Microsoft Learn](https://learn.microsoft.com/en-us/azure/app-service/overview)

  [Configure Azure Container Instances - Training | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/configure-azure-container-instances/)

> [!success] Brain — Respuesta: **Publicar**
>
> El campo **Publicar** = Código o **Contenedor de Docker**; al publicar contenedor no se configuran pila en tiempo de ejecución ni despliegue continuo.
>
> 📄 En mi documentación: [az104-app-service.md](../../../knowledge/az104-app-service.md) — «Publicar: código o contenedor de Docker».

___
Tiene una suscripción de Azure que contiene una aplicación de contenedor Azure denominada cont1.

Planea agregar reglas de escalado a cont1.

Debe asegurarse de que las réplicas de cont1 sean creadas en función de los mensajes recibidos en Azure Service Bus.

¿Qué activador de escala debe seleccionar?

Seleccione solo una respuesta.

Uso de CPU

controlado por eventos

**Esta respuesta es correcta.**

Tráfico HTTP

**Esta respuesta no es correcta.**

uso de memoria

Azure Container Apps permite que un conjunto de desencadenadores cree nuevas instancias, denominadas réplicas. Para Azure Service Bus, se puede usar un desencadenador controlado por eventos para ejecutar el método de escalación. Los desencadenadores de escala restantes no pueden usar una regla de escalado basada en mensajes de un bus de servicio de Azure.

[Escalado en Azure Container Apps | Microsoft Learn](https://learn.microsoft.com/azure/container-apps/scale-app#event-driven)

[Configure Azure Container Instances - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-azure-container-instances/)

[](https://aka.ms/yourcaliforniaprivacychoices)

> [!success] Brain — Respuesta: **controlado por eventos**
>
> Container Apps escala con **KEDA**; los mensajes de Azure Service Bus son un desencadenador event-driven (escala incluso a cero).
>
> 📄 En mi documentación: [az-104-compute.md](../../../cheatsheets/az-104-compute.md) — KEDA; ⚠️ Container Apps sin ficha propia (gap anotado en [az104-container-instances.md](../../../knowledge/az104-container-instances.md)).

___

Tiene una suscripción de Azure que contiene varios grupos de recursos y aplicaciones web de Azure App Service. Un grupo de recursos denominado RG1 hospeda una aplicación web denominada appservice1.

App Service usa un certificado SSL.

Cree un grupo de recursos con el nombre RG2.

Tiene previsto mover todos los recursos de RG1 a RG2.  

¿Qué dos acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

Cree un nuevo plan de App Service en RG2.

**Esta respuesta no es correcta.**

Cree una nueva aplicación web en RG2.

Elimine el certificado SSL de RG1 y cárguelo en RG2.

**Esta respuesta es correcta.**

Mueva todos los recursos de RG1 a RG2.

**Esta respuesta es correcta.**

El certificado SSL debe eliminarse. Tendrá que mover todos los demás recursos a RG2.

[Mueva recursos de Azure App Service entre grupos de recursos o suscripciones: Azure Resource Manager | Microsoft Learn](https://learn.microsoft.com/azure/azure-resource-manager/management/move-limitations/app-service-move-limitations)

[Configure Azure App Service - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-azure-app-services/)

> [!warning] Brain — Respuesta: **Eliminar el certificado SSL de RG1 y cargarlo en RG2** + **Mover todos los recursos de RG1 a RG2** — no cubierto en mi documentación
>
> Los certificados de App Service no se pueden mover entre grupos de recursos: eliminar del origen, mover el resto y volver a cargarlo en el destino.
>
> ⚠️ Gap: limitaciones de movimiento de recursos sin página; lo más cercano es [az104-app-service.md](../../../knowledge/az104-app-service.md).

___
iene una suscripción Azure que contiene una aplicación web Azure App Service denominada App1.

Tiene las siguientes configuraciones de registro de diagnóstico:

- Registro de la aplicación (FileSystem): Error
- Registro de Aplicación (Blob): Información
- Mensajes de error detallados: Advertencia
- Registro del servidor web: Verbose

Debe configurar el registro de diagnóstico para almacenar todas las advertencias o superiores.  

¿Qué tipos de registro de diagnóstico y qué nivel de severidad debería habilitar?

Seleccione todas las respuestas que procedan.

Registro de aplicaciones (Blob)

**Esta respuesta es correcta.**

Registro de aplicaciones (FileSystem)

**Esta respuesta es correcta.**

Mensaje de error detallado

**Esta respuesta no es correcta.**

Verboso

Advertencia

**Esta respuesta es correcta.**

Debe habilitar el diagnóstico de Application Logging (Blob), que se puede almacenar por más de una semana. También debe establecer el nivel de gravedad en advertencia, para almacenar mensajes de registro críticos, errores y advertencias.

Habilitar el registro de diagnóstico - Azure App Service | Microsoft Learn

[Configure Azure App Service - Training | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-azure-app-services/)

> [!success] Brain — Respuesta: **Registro de aplicaciones (Blob)** + **(FileSystem)** + nivel **Advertencia**
>
> Blob persiste los logs más de 7 días (FileSystem es corto plazo); el nivel Warning captura Warning + Error + Critical. «Mensajes de error detallados» y «Verboso» son otros tipos de log, no niveles.
>
> 📄 En mi documentación: [az104-app-service.md](../../../knowledge/az104-app-service.md) — ⚠️ logging de diagnóstico sin detalle (gap).

___

Debe crear una aplicación web Azure App Service que se ejecute en Windows. La aplicación web requiere realizar un escalado a cinco instancias, 45 GB de almacenamiento y un nombre de dominio personalizado. La solución debe minimizar los costos.

¿Qué plan de App Service debe usar?

Seleccione solo una respuesta.

Básico

Gratuito

De primera calidad

Estándar

**Esta respuesta es correcta.**

El plan de servicio Estándar puede hospedar aplicaciones web ilimitadas, hasta 50 GB de espacio en disco y hasta 10 instancias. El plan costará aproximadamente 0,10 USD/hora. El plan Gratis solo ofrece 1 GB de tamaño de disco y 0 instancias para hospedar la aplicación. El plan Premium ofrece 250 GB de espacio en disco y hasta 30 instancias y costará aproximadamente 0,20 USD por hora. El plan básico ofrece 10 GB de espacio en disco y hasta tres máquinas virtuales.

Precios de App Service | Microsoft Azure

[Configurar planes de servicio de aplicaciones de Azure - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-app-service-plans/)

> [!success] Brain — Respuesta: **Estándar**
>
> Estándar: hasta 10 instancias, 50 GB, dominio personalizado y autoescalado. Básico se queda en 3 instancias y Gratis no da dominio propio.
>
> 📄 En mi documentación: [az104-app-service-plans.md](../../../knowledge/az104-app-service-plans.md) · [az-104-compute.md](../../../cheatsheets/az-104-compute.md)

___

Tiene una suscripción Azure.

Tiene previsto implementar una aplicación web en un contenedor de Docker basado en Linux.

Necesita recomendar una solución para la implementación de la aplicación web que cumpla los requisitos siguientes:

- Admite un nombre de dominio personalizado
- Proporciona la capacidad de escalar horizontalmente de forma automática en función de la demanda.
- Minimiza el esfuerzo administrativo
- Minimiza los costos

¿Qué solución debe recomendar?

Seleccione solo una respuesta.

Azure App Service

**Esta respuesta es correcta.**

Azure Container Instances (Instancias de contenedores de Azure)

**Esta respuesta no es correcta.**

Azure Kubernetes Service (AKS)

Azure conjuntos de escalado de máquinas virtuales

Azure App Service cumple todos los requisitos indicados. Azure Virtual Machine Scale Sets, Azure Kubernetes Service (AKS) y Azure Container Instances son más difíciles de administrar y más costosos.

[Overview: Azure App Service | Microsoft Learn](https://learn.microsoft.com/azure/app-service/overview)

[Configurar planes de Azure App Service - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-app-service-plans/)

> [!success] Brain — Respuesta: **Azure App Service**
>
> Web App para contenedores cumple dominio personalizado + autoescalado con mínimo esfuerzo y coste frente a VMSS, AKS o ACI.
>
> 📄 En mi documentación: [az104-app-service.md](../../../knowledge/az104-app-service.md)

___
Tiene una suscripción Azure que contiene una red virtual denominada VNet1.

Tiene previsto implementar una máquina virtual denominada VM1 que se usará como dispositivo de inspección de red.

Asegúrese de que todo el tráfico de red pase a través de VM1.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Configure una ruta definida por el usuario.

**Esta respuesta es correcta.**

Cree una puerta de enlace de red virtual.

Modifique la ruta predeterminada.

Modifique la ruta del sistema.

Azure crea automáticamente una tabla de rutas para cada subred de una red virtual Azure y agrega rutas predeterminadas del sistema a la tabla. Puede invalidar algunas de las rutas del sistema de Azure con rutas personalizadas definidas por el usuario y agregar más rutas personalizadas a las tablas de rutas. Azure enruta el tráfico saliente desde una subred en función de las rutas de la tabla de rutas de una subred.

enrutamiento de tráfico de red virtual [Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/virtual-networks-udr-overview)

> [!success] Brain — Respuesta: **Configure una ruta definida por el usuario**
>
> Forzar todo el tráfico por el NVA = UDR (tabla de rutas 0.0.0.0/0 → IP del appliance) asociada a las subredes; las rutas del sistema no se editan directamente.
>
> 📄 En mi documentación: [az104-user-defined-routes.md](../../../knowledge/az104-user-defined-routes.md)

___

Tiene una suscripción de Azure que contiene una red virtual denominada VNet1 y una máquina virtual denominada VM1.

Solo se puede acceder a VM1 desde la red interna.

Un contratista externo necesita acceso a VM1. La solución debe minimizar el esfuerzo administrativo.

¿Qué debe configurar?

Seleccione solo una respuesta.

Una dirección IP pública

**Esta respuesta es correcta.**

una segunda dirección IP privada

una VPN de sitio a sitio (S2S)

Azure Firewall

**Esta respuesta no es correcta.**

Para compartir una máquina virtual con un usuario externo, debe agregar una dirección IP pública a la máquina virtual. En este caso, una dirección IP o una configuración de firewall adicionales no le ayudarán. La configuración de una VPN S2S no tiene un esfuerzo administrativo mínimo.

[Redes virtuales y máquinas virtuales en Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/network-overview)

[Quickstart: creación de una máquina virtual de Windows en el portal de Azure: Azure Virtual Machines | Microsoft Learn](https://learn.microsoft.com/azure/virtual-machines/windows/quick-create-portal)

[](https://aka.ms/yourcaliforniaprivacychoices)

> [!success] Brain — Respuesta: **Una dirección IP pública**
>
> Acceso para un contratista externo → IP pública en la VM (con NSG restrictivo). Una IP privada extra no da acceso externo y la S2S no es mínimo esfuerzo.
>
> 📄 En mi documentación: [az104-virtual-machines.md](../../../knowledge/az104-virtual-machines.md)

____
Tiene una suscripción Azure que contiene una red virtual denominada VNet1.

Tiene previsto habilitar la conectividad de VNet1 con recursos locales mediante una conexión cifrada.

¿Qué debe configurar para VNet1?

Seleccione solo una respuesta.

una conexión de extremo privado

**Esta respuesta no es correcta.**

Una dirección IP pública

una puerta de enlace de red virtual

**Esta respuesta es correcta.**

enrutamiento de Internet

Una puerta de enlace de VPN es un tipo de puerta de enlace de red virtual que envía tráfico cifrado entre una red virtual y una ubicación local a través de una conexión pública. También puede usar una puerta de enlace de VPN para enviar tráfico entre redes virtuales a través de la red troncal de Azure. Una conexión de puerta de enlace de VPN se basa en la configuración de varios recursos, cada uno de los cuales contiene valores configurables.

[Introducción a Azure VPN Gateway - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-vpn-gateway/)

> [!success] Brain — Respuesta: **una puerta de enlace de red virtual**
>
> Conectividad cifrada VNet ↔ on-prem = VPN Gateway (tipo de puerta de enlace de red virtual) con su GatewaySubnet dedicada.
>
> 📄 En mi documentación: [az104-virtual-networks.md](../../../knowledge/az104-virtual-networks.md) — subred de puerta de enlace.

___

Tiene una suscripción de Azure que contiene las siguientes redes virtuales:

- VNet1 tiene un intervalo de direcciones IP de 192.168.0.0/24.
- VNet2 tiene un intervalo de direcciones IP de 10.10.0.0/24.
- VNet3 tiene un intervalo de direcciones IP de 192.168.0.0/16.

Necesitas configurar el emparejamiento de red virtual.

¿Qué dos emparejamientos puede crear? Cada respuesta correcta presenta la solución completa.

Seleccione todas las respuestas que procedan.

VNet1 puede establecer un emparejamiento con VNet2.

**Esta respuesta es correcta.**

VNet1 se puede emparejar con VNet3.

VNet2 se puede emparejar con VNet3.

**Esta respuesta es correcta.**

VNet3 se puede emparejar con VNet1.

VNet1 y VNet2 tienen direcciones IP no superpuestas. En el caso del emparejamiento de red virtual, ambas redes virtuales deben tener direcciones IP que no se solapen.

emparejamiento de redes virtuales [Azure Virtual Network | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/virtual-network-peering-overview)

[Configuración del emparejamiento de red virtual: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-vnet-peering/)

> [!success] Brain — Respuesta: **VNet1↔VNet2** y **VNet2↔VNet3**
>
> El emparejamiento exige espacios **no solapados**: VNet1 (192.168.0.0/24) y VNet3 (192.168.0.0/16) se solapan entre sí; solo VNet2 (10.10.0.0/24) peeringa con ambas.
>
> 📄 En mi documentación: [az104-vnet-peering.md](../../../knowledge/az104-vnet-peering.md) — ⚠️ el requisito de no solapamiento no está explícito.

____
Tiene dos suscripciones Azure denominadas Sub1 y Sub2.

Sub1 contiene una red virtual denominada VNet1 y una puerta de enlace de VPN. Sub2 contiene una red virtual denominada VNet2.

Tiene un dispositivo local denominado Device1 que ejecuta Windows y tiene instalado un cliente VPN de punto a sitio (P2S).

Configuras el emparejamiento de redes entre VNet1 y VNet2.

Debe asegurarse de que Device1 puede acceder a VNet2 cuando se establece una conexión VPN.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Creación de un punto de conexión privado en Sub2.

**Esta respuesta no es correcta.**

Implemente Azure Front Door en Sub2.

Descargue y vuelva a instalar el cliente VPN P2S en Device1.

**Esta respuesta es correcta.**

Ejecute el `New-SelfSignedCertificate` cmdlet en Device1.

Para asegurarse de que se están descargando las nuevas rutas en el cliente, los clientes VPN de punto a sitio (P2S) deben descargarse e instalarse de nuevo después de que el emparejamiento de red virtual se haya configurado correctamente.

No se requiere un punto de conexión privado ni Azure Front Door para poder acceder a VNet2 desde VNet1.

Device1 ya tiene un certificado digital al instalar el cliente VPN P2S, por lo que no es necesario crear un certificado nuevo manualmente.

[Crear, cambiar o eliminar un emparejamiento de red virtual Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/virtual-network-manage-peering?tabs=peering-portal#requirements-and-constraints)

> [!success] Brain — Respuesta: **Descargue y vuelva a instalar el cliente VPN P2S en Device1**
>
> Tras configurar el emparejamiento, el cliente P2S debe reinstalarse para recibir las **rutas nuevas** hacia VNet2 vía el gateway de VNet1.
>
> 📄 En mi documentación: [az104-vnet-peering.md](../../../knowledge/az104-vnet-peering.md) — ⚠️ este detalle no está documentado (gap).

___
Tiene una máquina virtual denominada VM1 que se asigna a un grupo de seguridad de red (NSG) denominado NSG1.

NSG1 tiene las siguientes reglas de seguridad de entrada:

Regla1:

- Prioridad: 900
- Nombre: BlockInternet
- Puerto: 80
- Protocolo: TCP
- Origen: Any
- Destino: Cualquiera
- Acción: Bloquear

Rule2:

- Prioridad: 1000
- Nombre: AllowInternet
- Puerto: 80
- Protocolo: TCP
- Origen: Any
- Destino: Cualquiera
- Acción: Permitir

Debe asegurarse de que se permite el acceso a Internet a VM1 en el puerto 80.

¿Qué tiene que hacer?

Seleccione solo una respuesta.

Cambie la acción de Rule2.

Cambie el nombre de Rule1.

Cambie la prioridad de Rule2.

**Esta respuesta es correcta.**

Cambie el origen en Rule2.

Rule1 tiene mayor prioridad, por lo que la acción se bloqueará. Puede aumentar la prioridad de Rule2, reducir la prioridad de Rule1 o cambiar la acción de Rule1 para lograr el objetivo.

> [!success] Brain — Respuesta: **Cambie la prioridad de Rule2**
>
> Se procesa primero la regla de prioridad **más baja**: Rule1 (900, Block) gana a Rule2 (1000, Allow) → hay que darle a la permitidora prioridad menor que 900.
>
> 📄 En mi documentación: [az104-network-security-groups.md](../../../knowledge/az104-network-security-groups.md) — prioridad 100-4096, menor = antes.

Introducción a los grupos de seguridad de red de [Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/network-security-groups-overview)

[Configurar grupos de seguridad de red: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-network-security-groups/)

___

Puede crear varias máquinas virtuales Azure que ejecutan Windows Server.

Debe conectarse a las máquinas virtuales sin exponer los puertos RDP a través de Internet.

¿Qué Azure servicio debe implementar?

Seleccione solo una respuesta.

Azure Bastion

**Esta respuesta es correcta.**

Azure Front Door

Azure Network Watcher

Azure Virtual Desktop

**Esta respuesta no es correcta.**

Azure Bastion es un servicio que permite conectarse a una máquina virtual mediante un explorador, sin exponer los puertos RDP y SSH. Azure Monitor le ayuda a maximizar la disponibilidad y el rendimiento de las aplicaciones y los servicios. Azure Network Watcher proporciona herramientas para supervisar, diagnosticar, ver métricas y habilitar o deshabilitar registros de recursos en una red virtual de Azure. Escritorio remoto es una característica del sistema operativo, que expone el puerto RDP para conectarse a un servidor desde Internet.

[About Azure Bastion | Microsoft Learn](https://learn.microsoft.com/azure/bastion/bastion-overview)

[Configurar redes virtuales - Entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-virtual-networks/)

> [!success] Brain — Respuesta: **Azure Bastion**
>
> RDP/SSH desde el navegador vía TLS sin exponer puertos públicos en Internet.
>
> 📄 En mi documentación: [az104-network-security-groups.md](../../../knowledge/az104-network-security-groups.md) — mención; ⚠️ Bastion sin página propia (gap).

___
Su empresa planea migrar servidores de un entorno local a Azure. Habrá máquinas virtuales de desarrollo, pruebas y producción en una sola red virtual.

Debe restringir el tráfico entre las máquinas virtuales de desarrollo, pruebas y producción a puertos específicos.

¿Qué debe usar?

Seleccione solo una respuesta.

un grupo de seguridad de red (NSG)

**Esta respuesta es correcta.**

un firewall de Azure

**Esta respuesta no es correcta.**

un equilibrador de carga Azure

una red virtual Azure

Debe configurar reglas del grupo de seguridad de red (NSG) para permitir el tráfico TCP o ICMP para puertos específicos. Azure Firewall es un servicio administrado que protege los servicios de Azure en varias redes virtuales. Los equilibradores de carga se usan para distribuir el tráfico entrante entre los servidores back-end disponibles. Azure VPN se usa para tener un establecimiento de conexión entre el entorno local y Azure.

> [!success] Brain — Respuesta: **un grupo de seguridad de red (NSG)**
>
> Reglas de NSG (a subred o NIC) filtran por puerto/protocolo el tráfico entre VMs de la misma VNet; Azure Firewall es perímetro entre redes.
>
> 📄 En mi documentación: [az104-network-security-groups.md](../../../knowledge/az104-network-security-groups.md)

Introducción a los grupos de seguridad de red de [Azure | Microsoft Learn](https://learn.microsoft.com/azure/virtual-network/network-security-groups-overview)

[Configurar grupos de seguridad de red: entrenamiento | Microsoft Learn](https://learn.microsoft.com/training/modules/configure-network-security-groups/)

___
Tiene una suscripción Azure que contiene una aplicación ASP.NET. La aplicación se hospeda en cuatro máquinas virtuales Azure que ejecutan Windows Server.

Tiene un equilibrador de carga llamado LB1 que distribuye las solicitudes a las máquinas virtuales.

Debe asegurarse de que los usuarios del sitio se conectan al mismo servidor web para todas las solicitudes realizadas a la aplicación.

¿Qué dos acciones debe realizar? Cada respuesta correcta presenta parte de la solución.

Seleccione todas las respuestas que procedan.

Configure una regla NAT de entrada.

**Esta respuesta no es correcta.**

Establezca Persistencia de sesión en **IP del cliente**.

**Esta respuesta es correcta.**

Establezca Persistencia de sesión en **Ninguna**.

Establezca Persistencia de sesión en **Protocolo**.

**Esta respuesta es correcta.**

Al establecer la persistencia de sesión en IP y protocolo de cliente, asegúrese de que los usuarios del sitio se conectan al mismo servidor web para todas las solicitudes realizadas a la aplicación. Al establecer la persistencia de sesión en Ninguna, se deshabilitan las sesiones permanentes y se usa una regla NAT de entrada para reenviar el tráfico desde un front-end del equilibrador de carga a un grupo de back-end.

modos de distribución [Azure Load Balancer | Microsoft Learn](https://learn.microsoft.com/azure/load-balancer/distribution-mode-concepts)

[Introducción a Azure Load Balancer](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-load-balancer/)

> [!success] Brain — Respuesta: **Persistencia de sesión en IP del cliente** y **en Protocolo**
>
> Afinidad de 2 tuplas (IP cliente) o 3 tuplas (IP + protocolo): mismo cliente → mismo backend. «Ninguna» = hash de 5 tuplas sin afinidad.
>
> 📄 En mi documentación: [az104-load-balancer.md](../../../knowledge/az104-load-balancer.md) — «Persistencia de la sesión».

![[Pasted image 20261005110704.png]]