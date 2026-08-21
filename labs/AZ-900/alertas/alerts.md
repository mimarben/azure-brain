# Supervisión de Azure con alertas del registro de actividad y estado del servicio.

[Link](https://learn.microsoft.com/en-us/training/modules/guided-project-monitor-service-health-activity-alerts/)



Azure Monitor proporciona varios tipos de alertas que le notifican sobre problemas sin necesidad de recursos de cómputo de pago. Las alertas de Service Health monitorean los incidentes a nivel de plataforma y el mantenimiento planeado. Las alertas del registro de actividad se activan cuando se producen operaciones de administración, como la eliminación de recursos. Los grupos de acciones definen quién recibe notificaciones y cómo.

![[health-service.png]]


## Task 1: Prepare the environment

Set up your Azure environment before you begin. You create a resource group to organize the monitoring resources for this project together.

1. Sign in to the [Azure portal](https://portal.azure.com/) with an account that has permissions to create monitoring resources.
2. In the portal search bar, search for **Resource groups** and select **Resource groups**.
3. Select **+ Create**. Name the resource group **rg-gp-monitoring-alerts**, choose your preferred region, and select **Review + create** then **Create**.
4. Note the email address you want to use for alert notifications.

## Task 2: Create the action group

Create an action group that defines who gets notified and how. Action groups are reusable notification channels that you attach to alert rules, so the same team can be notified by multiple different alerts.

1. In the portal search bar, search for **Monitor** and select **Monitor**.
2. In the left menu, select **Alerts**.
3. Select **Action groups** from the top menu bar.
4. Select **+ Create**.
5. On the Basics tab, select **rg-gp-monitoring-alerts** as the resource group.
6. For **Action group name**, enter **ag-gp-ops-email**.
7. For **Display name**, enter **OpsEmail**.
8. Select the **Notifications** tab.
9. For **Notification type**, select **Email/SMS message/Push/Voice**.
10. For **Name**, enter **ops-team-email**.
11. In the panel that opens, check **Email** and enter your email address. Select **OK**.
12. Select **Review + create** and then select **Create**.
## Task 3: Test the action group

Send a test notification to verify the action group delivers email successfully. In production environments, you should always test notification channels before relying on them for incident response.

1. After the action group is created, select **ag-gp-ops-email** from the action groups list to open it.
2. In the top menu bar, select **Test action group**.
3. For **Select sample type**, choose **Service Health**.
4. Make sure the **ops-team-email** notification is checked.
5. Select **Test**.
6. Wait for the test results to appear. Confirm the **Status** column shows **Success**.
7. Check your email inbox for the test notification from Azure. Open the email and review its content—this is the same format you would receive during a real incident.

# Exercise - Create a Service Health alert

## Task 1: Navigate to Service Health

Open Azure Service Health, which tracks the status of Azure services across the regions you use. Service Health alerts notify you automatically when Azure platform issues might affect your resources.

1. In the portal search bar, search for **Service Health** and select **Service Health**.
2. Select **Service issues** in the left menu. Review whether any active incidents are listed for your subscription. If none are active, that means all services are healthy in your regions.
3. Select **Planned maintenance** and note any upcoming maintenance windows. These are the types of events your alert will notify you about.
4. Select **Health advisories** to see any non-critical recommendations from Azure.
5. Select **Health history** to view past incidents and their resolution timelines. This gives context for why proactive alerting matters.
6. Select **Health alerts** in the left menu.

## Task 2: Create the alert rule

Configure an alert that watches for service incidents and planned maintenance events in the regions you use. This is a free alert that requires no running compute resources.

1. Select **+ Create service health alert**.
2. For **Subscription**, select your subscription.
3. For **Service(s)**, leave the default to monitor all services, or select specific services you use.
4. For **Region(s)**, select the region you used for the resource group (and any other regions you use).
5. For **Event types**, check both **Service issue** and **Planned maintenance**.
6. Select the **Actions** tab.
7. Select **Select action groups** and choose **ag-gp-ops-email**.
8. Select the **Details** tab.
9. For **Resource group**, select **rg-gp-monitoring-alerts**.
10. For **Alert rule name**, enter **ar-gp-service-health**.
11. Make sure **Enable alert rule upon creation** is checked.
12. Select **Create**.
# Exercise - Create an Activity Log alert
## Task 1: Open the alert creation page

Activity Log alerts monitor Azure management operations such as resource creation, modification, and deletion. Unlike metric alerts, they don't require a running resource to monitor, which makes them free and immediately useful.

1. In the portal search bar, search for **Monitor** and select **Monitor**.
2. In the left menu, select **Alerts**.
3. Select **+ Create** and then select **Alert rule**.

## Task 2: Configure the alert condition

Set up the alert to fire when a resource deletion event occurs in your resource group. This gives the operations team visibility into unexpected changes.

1. For **Scope**, select **Select scope**.
2. Filter by resource type **Resource groups** and select **rg-gp-monitoring-alerts**. Select **Apply**.
3. Select the **Condition** tab.
4. For **Signal name**, search for and select **Delete resource group** from the Activity Log signals.
5. Leave the default settings for the signal configuration.
## Task 3: Attach the action group and create

Link the alert to your action group and finalize the rule. When a matching Activity Log event occurs, the email notification will fire automatically.

1. Select the **Actions** tab.
2. Select **Select action groups** and choose **ag-gp-ops-email**.
3. Select the **Details** tab.
4. For **Resource group**, select **rg-gp-monitoring-alerts**.
5. For **Alert rule name**, enter **ar-gp-activity-delete**.
6. For **Severity**, select **Sev 2 - Warning**.
7. Make sure **Enable alert rule upon creation** is checked.
8. Select **Review + create** and then select **Create**.
9. Return to **Monitor** > **Alerts** > **Alert rules** and confirm both alert rules appear in the list.

## Task 4: Review alert rule details

Examine the alert rules you created to understand how Azure displays their configuration. In a real operations environment, you would regularly review alert rules to confirm they cover the right signals and notify the right teams.

1. In the alert rules list, select **ar-gp-service-health** to open its details.
2. Review the **Condition** section to confirm it monitors **Service issue** and **Planned maintenance** events.
3. Review the **Actions** section to confirm it uses the **ag-gp-ops-email** action group.
4. Select **Back** to return to the alert rules list.
5. Select **ar-gp-activity-delete** and review its condition and action group.
6. Note the **Severity** level (Sev 2 - Warning) and confirm the rule is **Enabled**.
7. Select **Back** to return to the alert rules list.

## Delete the alert rules

1. In the portal search bar, search for **Monitor** and select **Monitor**.
2. In the left menu, select **Alerts**.
3. Select **Alert rules** from the top menu bar.
4. Find **ar-gp-activity-delete** in the list, select the checkbox next to it, and select **Delete**. Confirm the deletion.
5. Find **ar-gp-service-health** in the list, select the checkbox next to it, and select **Delete**. Confirm the deletion.

## Delete the action group

1. In **Monitor** > **Alerts**, select **Action groups** from the top menu bar.
2. Find **ag-gp-ops-email** in the list, select the checkbox next to it, and select **Delete**. Confirm the deletion.

## Delete the resource group

1. In the portal search bar, search for **Resource groups** and select **Resource groups**.
2. Select **rg-gp-monitoring-alerts** from the list.
3. Select **Delete resource group** from the top menu bar.
4. In the confirmation field, type **rg-gp-monitoring-alerts** and select **Delete**.
5. In the confirmation dialog that appears, select **Delete** again to confirm.
6. Wait for the notification that confirms the resource group is deleted.

## Verify cleanup

1. In the portal search bar, search for **Resource groups** and confirm **rg-gp-monitoring-alerts** no longer appears in the list.
2. In **Monitor** > **Alerts** > **Alert rules**, confirm neither alert rule appears.
3. In **Monitor** > **Alerts** > **Action groups**, confirm **ag-gp-ops-email** no longer appears.