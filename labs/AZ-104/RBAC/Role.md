# Enumera el acceso utilizando Azure RBAC y el Azure portal

En First Up Consultants, se le ha concedido acceso a un grupo de recursos del equipo de marketing. Quiere familiarizarse con Azure Portal y ver qué roles están asignados actualmente.

Para completar los ejercicios, necesita una suscripción de Azure. Si no tiene ninguna, cree una [cuenta gratuita](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn_85426952-9aa4-8d8b-a1df-c9b99f0fd326) y agregue una suscripción antes de empezar. Si es alumno, puede aprovechar la oferta [Azure for Students](https://azure.microsoft.com/free/students/?cid=msft_learn_85426952-9aa4-8d8b-a1df-c9b99f0fd326).


## Enumeración de las asignaciones de roles para el usuario

Siga estos pasos para ver los roles que tiene asignados actualmente.

1. Inicie sesión en [Azure Portal](https://portal.azure.com/).
    
2. En el menú **Perfil**, seleccione los puntos suspensivos (**...**) para ver más vínculos.

![[4-my-permissions-menu.png]]

3. Seleccione **Mis permisos** para abrir el panel **Mis permisos**.

![[4-my-permissions-pane.png]]

## Lista de las asignaciones de roles de un grupo de recursos

Siga estos pasos para ver qué roles se asignan en el ámbito del grupo de recursos.

1. En la barra de búsqueda superior, busque y seleccione **Grupo de recursos**.

![[4-resource-groups.png]]

2. En la lista de grupos de recursos, seleccione un grupo de recursos.
    
    En estos pasos, se usa un grupo de recursos denominado **example-group**, pero el nombre del suyo será distinto.
    
3. En el panel del menú de la izquierda, seleccione **Control de acceso (IAM)**.

 ![[4-resource-group-access-control.png]]

4. Seleccione la pestaña **Asignaciones de roles**.

En esta pestaña se muestra quién tiene acceso al grupo de recursos. Observe que el ámbito de algunos roles es **Este recurso**, mientras que el de otros es **(Heredado)** de un ámbito principal.

![[4-resource-group-role-assignment.png]]

## Lista de roles

Como ha aprendido en la unidad anterior, un rol es una colección de permisos. Azure tiene más de 70 roles integrados que puede usar en las asignaciones de roles. Para enumerar los roles:

- En la barra de menús de la parte superior del panel, seleccione la pestaña **Roles** para enumerar todos los roles integrados y personalizados.
    
    Seleccione el vínculo **Vista** de un rol en la columna **Detalles**, después seleccione la pestaña **Asignaciones** para ver el número de usuarios y grupos asignados a ese rol.

![[4-roles-list.png]]

En esta unidad, ha aprendido a enumerar las asignaciones de rol para usted mismo en el portal de Azure. Además, aprendiste a enumerar las asignaciones de funciones de un grupo de recursos.

# Concesión de acceso mediante Azure RBAC y Azure Portal.

Un compañero de trabajo llamado Alain en First Up Consultants necesita permiso para crear y administrar máquinas virtuales para un proyecto en el que trabajan. El administrador le ha pedido que controle esta solicitud. Siguiendo las mejores prácticas para otorgar a los usuarios los privilegios mínimos necesarios para realizar su trabajo, decide asignar a Alain el rol de Colaborador de Máquina Virtual en un grupo de recursos.

## Conceder acceso.

Siga este procedimiento para asignar el rol Colaborador de máquina virtual a un usuario en el ámbito del grupo de recursos.

1. Inicie sesión en [Azure Portal](https://portal.azure.com/) como administrador que tenga permisos para asignar roles, como [Administrador de acceso de](https://learn.microsoft.com/es-es/azure/role-based-access-control/built-in-roles#user-access-administrator) usuario o [Propietario](https://learn.microsoft.com/es-es/azure/role-based-access-control/built-in-roles#owner).
    
2. En el cuadro Buscar de la parte superior, busque **Grupos de recursos**.
    
    ![Screenshot of the Azure portal that shows how to search for resource groups.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-resource-groups.png)
    
2. En la lista de grupos de recursos, seleccione un grupo de recursos.
    
    En estos pasos, se usa un grupo de recursos denominado **example-group**, pero el nombre del suyo será distinto.
    
3. En el panel del menú de la izquierda, seleccione **Control de acceso (IAM)**.
    
4. Seleccione la pestaña **Asignaciones** de roles para mostrar la lista actual de asignaciones de roles en este ámbito.
    
    ![Screenshot showing Role assignments tab for the selected resource group.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-resource-group-role-assignment.png)
    
5. Seleccione **Agregar**>**Agregar asignación de rol**.

Si no tiene permisos para asignar roles, se deshabilitará la opción **Agregar asignación de roles**.
    ![[Pasted image 20260929130632.png]]

6. Se abre la página **Agregar asignación de roles**.
    
7. En la pestaña **Rol** , busque y seleccione **Colaborador de máquina virtual**.
    
    ![Screenshot that shows Add role assignment and list of roles.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-select-role.png)


8. Seleccione **Siguiente**.
    
9. En la pestaña **Miembros**, elija **Seleccionar miembros**.
    
10. Busque y seleccione un usuario.
![[Pasted image 20260929130811.png]]

11. Seleccione **Seleccionar** para agregar el usuario a la lista Miembros.
    
12. Seleccione **Siguiente**.
    
13. En la pestaña **Revisar y asignar** , revise la configuración de asignación de roles.
    
14. Seleccione **Revisar + asignar** para asignar el rol.
    
    Después de unos instantes, al usuario se le asigna el rol Colaborador de máquina virtual en el ámbito del grupo de recursos. El usuario ahora puede crear y administrar máquinas virtuales justo dentro de este grupo de recursos.

![[Pasted image 20260929130849.png]]

## Eliminar acceso

En RBAC de Azure, puede quitar una asignación de un rol para eliminar el acceso.

1. En la lista de asignaciones de roles, seleccione **Ver asignaciones**.
    
2. Busque y active la casilla para el usuario con el rol Colaborador de máquina virtual.
    
3. Seleccione **Eliminar**.
    
    ![Captura de pantalla que muestra el mensaje Quitar asignación de roles.](https://learn.microsoft.com/es-es/training/modules/secure-azure-resources-with-rbac/media/5-remove-role-assignment.png)
    
4. En el mensaje **Quitar asignaciones de roles** que aparece, seleccione **Sí**.
    

En esta unidad, ha aprendido a conceder a un usuario acceso para crear y administrar máquinas virtuales en un grupo de recursos mediante Azure Portal.

# Visualización de los registros de actividad de cambios de Azure RBAC.

First Up Consultants revisa los cambios trimestrales de Azure RBAC con fines de auditoría y solución de problemas. Sabe que los cambios se registran en el [registro de actividad de Azure](https://learn.microsoft.com/es-es/azure/azure-monitor/essentials/activity-log). El administrador le ha preguntado si puede generar un informe de los cambios de asignación de roles y roles personalizados del último mes.

## Visualización de registros de actividad

La manera más fácil de empezar a trabajar es ver los registros de actividad con Azure Portal.

1. Seleccione **Todos los servicios** y busque **Registro de actividad**. **Activity Log.**
    
    ![Captura de pantalla de Azure Portal que muestra la ubicación de la opción Registros de actividad.](https://learn.microsoft.com/es-es/training/modules/secure-azure-resources-with-rbac/media/6-all-services-activity-log.png)
    
2. Seleccione **Registro de** actividad para abrir el registro de actividad.
    
    ![Captura de pantalla de Azure Portal en la que se muestran los registros de actividad.](https://learn.microsoft.com/es-es/training/modules/secure-azure-resources-with-rbac/media/6-activity-log-portal.png)
    
3. Establezca el filtro **Intervalo de tiempo** en **Último mes**.
    
4. Agregue un filtro **Operación** y escriba **función** para filtrar la lista.
    
5. Seleccione las siguientes operaciones de RBAC de Azure:
    
    - Crear una asignación de rol (roleAssignments)
    - Eliminar asignación de roles (roleAssignments)
    - Crear o actualizar la definición de roles personalizados (roleDefinitions)
    - Eliminar definición de roles personalizados (roleDefinitions)
    
    ![Captura de pantalla que muestra una lista del filtro Operación con los cuatro filtros seleccionados.](https://learn.microsoft.com/es-es/training/modules/secure-azure-resources-with-rbac/media/6-operation-filter.png)
    
    Después de un momento, obtendrá una lista de todas las operaciones de asignación de roles y definición de roles del último mes. También hay un botón en la parte superior de la pantalla para descargar el registro de actividad como un archivo CSV.
    
6. Seleccione una de las operaciones para obtener los detalles del registro de actividad.
    
    ![Captura de pantalla que muestra los detalles de un registro de actividad.](https://learn.microsoft.com/es-es/training/modules/secure-azure-resources-with-rbac/media/6-activity-log-details.png)
    

En esta unidad, ha aprendido a usar el registro de actividad de Azure para enumerar los cambios de RBAC de Azure en el portal y generar un informe sencillo.