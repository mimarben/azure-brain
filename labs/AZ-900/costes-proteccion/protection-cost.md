
# Guided project: Set up cost guardrails in Azure

[Link](https://learn.microsoft.com/en-us/training/modules/guided-project-cost-guardrails/)


>[!NOTE]
>Azure provides several tools to help you control cloud spending. Tags let you categorize resources for cost reporting. Budgets send alerts when spending approaches a threshold. Azure Policy enforces organizational rules—like restricting which regions resources can be deployed to—automatically.

![[labs/AZ-900/costes-proteccion/cost.png]]


## Skilling areas

In this project, you practice skills in the following areas:

**Apply resource tags for cost tracking**

- Tag resource groups and resources with key-value pairs.
- Use tags to categorize resources by environment and owner.

**Configure budgets and alerts**

- Create a budget scoped to a resource group.
- Set alert thresholds at 80% and 100% of the budget.
- Configure email notifications for budget alerts.

**Assign and test Azure Policy**

- Find and assign a built-in policy definition.
- Test that the policy blocks noncompliant resource creation.
- Review the compliance dashboard.

# Exercise - Apply cost-tracking tags.

1. Sign in to the [Azure portal](https://portal.azure.com/) with an account that has permissions to create budgets and policy assignments.
2. In the portal search bar, search for **Resource groups** and select **Resource groups**.
3. Select **+ Create**.
4. For **Name**, enter **rg-gp-cost-guardrails**.
5. For **Region**, choose your preferred region.
6. Select **Review + create** and then select **Create**.
7. Note the email address you want to use for budget alert notifications.

## Task 2: Create a test storage account

Create a storage account inside the resource group. This gives you a resource to tag and a scope for policy testing.

1. In the portal search bar, search for **Storage accounts** and select **Storage accounts**.
2. Select **+ Create**.
3. On the **Basics** tab, select **rg-gp-cost-guardrails** as the resource group.
4. For **Storage account name**, enter a globally unique name (for example, **stgpcostguard** followed by your initials and a number).
5. For **Region**, use the same region as the resource group.
6. For **Preferred Storage Type**, select **Azure Blob Storage or Azure Data Lake Storage Gen 2**.
7. For **Performance**, select **Standard**.
8. For **Redundancy**, select **Locally-redundant storage (LRS)**.
9. Select **Review + create** and then select **Create**.
10. When deployment finishes, select **Go to resource**.

## Task 3: Tag the resource group

Apply organizational tags to your resource group. Tags are key-value pairs that help you categorize resources, track costs, and enforce policies at scale.

1. In the portal search bar, search for **Resource groups** and select **Resource groups**.
2. Select **rg-gp-cost-guardrails** from the list.
3. In the left menu, select **Tags**.
4. Add the tag **environment** with the value **pilot**.
5. Add the tag **owner** with the value **it-team**.
6. Select **Apply**.

## Task 4: Tag the storage account

Apply the same tags to your test resource. Resource-level tags ensure consistent tagging across all assets, enabling accurate cost allocation and governance reporting.

1. In the portal search bar, search for **Storage accounts** and select **Storage accounts**.
2. Select the storage account you created (for example, **stgpcostguard**).
3. In the left menu, select **Tags**.
4. Add the tag **environment** with the value **pilot**.
5. Add the tag **owner** with the value **it-team**.
6. Select **Apply**.

