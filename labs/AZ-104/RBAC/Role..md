# Exercise - List access using Azure RBAC and the Azure portal.

At First Up Consultants, you've been granted access to a resource group for the marketing team. You want to familiarize yourself with the Azure portal and see what roles are currently assigned.
## List role assignments for yourself.

Follow these steps to see what roles are currently assigned to you.

1. Sign in to the [Azure portal](https://portal.azure.com/).   
2. On the **Profile** menu, select the ellipsis (**...**) to see more links.
![[4-my-permissions-menu.png]]

3. Select **My permissions** to open the **My permissions** pane.

![[4-my-permissions-pane.png]]

## List role assignments for a resource group

Follow these steps to see what roles are assigned at the resource group scope.

1. In the Search box at the top, search for and select **Resource groups**.
![[4-resource-groups.png]]

2. In the list of resource groups, select a resource group.
These steps use a resource group named **example-group**, but your resource group's name will be different.
3. On the left menu pane, select **Access control (IAM)**.
 ![[4-resource-group-access-control.png]]

4. Select the **Role assignments** tab.

This tab shows who has access to the resource group. Notice that some roles are scoped to **This resource**, while others are **(Inherited)** from a parent scope.

![[4-resource-group-role-assignment.png]]

## List roles

As you learned in the previous unit, a role is a collection of permissions. Azure has more than 70 built-in roles that you can use in your role assignments. To list the roles:
- In the menu bar at the top of the pane, select the **Roles** tab to list of all the built-in and custom roles.   
	Select a role's **View** link in the **Details** column, then select the **Assignments** tab to display the number of users and groups assigned to that role.

![[4-roles-list.png]]


## Grant access

Follow this procedure to assign the Virtual Machine Contributor role to a user at the resource group scope.

1. Sign in to the [Azure portal](https://portal.azure.com/) as an administrator that has permissions to assign roles, such as [User Access Administrator](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#user-access-administrator) ([ES](https://learn.microsoft.com/es-es/azure/role-based-access-control/built-in-roles#user-access-administrator)) or [Owner](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#owner) ([ES](https://learn.microsoft.com/es-es/azure/role-based-access-control/built-in-roles#owner)).
    
2. In the Search box at the top, search for **Resource groups**.
    
    ![Screenshot of the Azure portal that shows how to search for resource groups.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-resource-groups.png)
    
3. In the list of resource groups, select a resource group.
    
    These steps use a resource group named **example-group**, but your resource group's name will be different.
    
4. On the left menu pane, select **Access control (IAM)**.
    
5. Select the **Role assignments** tab to display the current list of role assignments at this scope.
    
    ![Screenshot showing Role assignments tab for the selected resource group.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-resource-group-role-assignment.png)
    
6. Select **Add** > **Add role assignment**.
    
    If you don't have permissions to assign roles, the **Add role assignment** option will be disabled.
    
    ![Screenshot that shows Add role assignment menu.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-resource-group-add-role-assignment.png)
    
    The **Add role assignment** page opens.
    
7. On the **Role** tab, search for and select **Virtual Machine Contributor**.
    
    ![Screenshot that shows Add role assignment and list of roles.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-select-role.png)
    
8. Select **Next**.
    
9. On the **Members** tab, select **Select members**.
    
10. Search for and select a user.
    
    ![Screenshot of the add role assignment page that shows the select members option.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-select-members-option.png)
    
1. Select **Select** to add the user to the Members list.
2. Select **Next**.
3. On the **Review + assign** tab, review the role assignment settings.
4. Select **Review + assign** to assign the role.
    After a few moments, the user is assigned the Virtual Machine Contributor role at the resource group scope. The user can now create and manage virtual machines just within this resource group.
    
    ![Screenshot that shows the Virtual Machine Contributor role assigned to a user.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-vm-contributor-assignment.png)
    

## Remove access

In Azure RBAC, you can remove a role assignment to remove access.

1. In the list of role assignments, select **View Assignments**.
    
2. Search for and check the box for the user with the Virtual Machine Contributor role.
    
3. Select **Delete**.
    
    ![Screenshot that shows the Remove role assignment message.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/5-remove-role-assignment.png)
    
4. In the **Remove role assignments** message that appears, select **Yes**.
    

In this unit, you learned how to grant a user access to create and manage virtual machines in a resource group using the Azure portal.

## View activity logs

The easiest way to get started is to view the activity logs with the Azure portal.

1. Select **All services**, then search for **Activity log**.
    
    ![Screenshot of the Azure portal showing the location of Activity logs option.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-all-services-activity-log.png)
    
2. Select **Activity log** to open the activity log.
    
    ![Screenshot of the Azure portal showing the Activity logs.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-activity-log-portal.png)
    
3. Set the **Timespan** filter to **Last month**.
    
4. Add an **Operation** filter and type **role** to filter the list.
    
5. Select the following Azure RBAC operations:
    - Create role assignment (roleAssignments)
    - Delete role assignment (roleAssignments)
    - Create or update custom role definition (roleDefinitions)
    - Delete custom role definition (roleDefinitions)
    
    ![Screenshot showing a list of Operation filter with the four filters selected.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-operation-filter.png)
    
    After a moment, you'll get a list of all the role assignment and role definition operations for the last month. There's also a button at the top of the screen to download the activity log as a CSV file.
    
6. Select one of the operations to get the activity log details.
    
    ![Screenshot showing the details for an activity log.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/6-activity-log-details.png)
    

In this unit, you learned how to use Azure Activity Log to list Azure RBAC changes in the portal and generate a simple report.

