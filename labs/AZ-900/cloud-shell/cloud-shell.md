# Manage Azure resources with Cloud Shell and the Azure CLI.

[Link](https://learn.microsoft.com/en-us/training/modules/guided-project-manage-resources-cloud-shell-cli/)

![[labs/AZ-900/cloud-shell/cloud-shell.png]]


# Open Cloud Shell and explore the environment.

## Task 1: Launch Cloud Shell

1. Sign in to the [Azure portal](https://portal.azure.com/) with an account that has permissions to create resources.
2. Select the **Cloud Shell** icon in the top menu bar (it looks like a terminal prompt **>_**).
3. If prompted to choose a shell type, select **Bash**.
4. If prompted to create storage, select **Create storage** and wait for Cloud Shell to initialize.
5. Confirm that the Cloud Shell terminal opens at the bottom of the portal with a **Bash** prompt.


## Task 2: Verify your account and subscription

Confirm that Cloud Shell is connected to the correct subscription. Every CLI command you run will target this subscription by default.
1. Run the following command to display your account details:
		`az account show --output table`
2. Review the output and confirm the **SubscriptionId** and **Name** match the subscription you want to use.
3. If you have multiple subscriptions and need to switch, run:
		`az account list --output table`
4. Note the subscription name and ID for the one you want to use.

## Task 3: Explore the CLI help system

Learn how to find commands and get help without leaving the terminal. The built-in help system is one of the most useful features for beginners learning the CLI.

1. Run the following command to see the top-level CLI command groups:

`az --help`

2. Scroll through the output and note the major groups such as **group**, **storage**, **monitor**, and **resource**.
    
3. Run the following command to see the subcommands available for managing resource groups:

```
az group --help
```

4. Note the available commands: **create**, **delete**, **list**, **show**, and others.
    
5. Run the following command to see the full parameter list for creating a resource group:
```
az group create --help
```
4. Note the required parameters: **--name** and **--location**.

## Task 4: List available regions

Before creating resources, check which Azure regions are available to your subscription. This is the CLI equivalent of the region dropdown you see in the portal.

1. Run the following command to list available regions:
```
    az account list-locations --output table
```
1. Find a region close to you and note its **Name** value (for example, **eastus**, **westeurope**, or **southeastasia**). You use this value in the next exercise.


# Create and list resources with CLI commands

## Task 1: Create a resource group

Create a resource group using a single CLI command. In the portal this takes multiple clicks across several screens—from the CLI, it takes one line.

1. In Cloud Shell, run the following command (replace **eastus** with your chosen region):
    
    Bash
    
    ```
    az group create --name rg-gp-cli-demo --location eastus
    ```
    
2. Review the JSON output. Confirm the **provisioningState** shows **Succeeded**.
    
3. Run the following command to verify the resource group exists:
    
    Bash
    
    ```
    az group show --name rg-gp-cli-demo --output table
    ```
    
4. Note the **Location** and **Name** columns in the table output.
    

 Note

**Validation step:** Confirm the **rg-gp-cli-demo** resource group is created and verified.

## Task 2: Create a storage account

Create a storage account inside the resource group. The CLI requires the same parameters you would fill in through the portal, but expressed as command-line flags.

1. Run the following command (replace **stgpclidemo** with a unique name—lowercase letters and numbers only, 3-24 characters):
```
    az storage account create \
      --name stgpclidemo01 \
      --resource-group rg-gp-cli-demo \
      --location eastus \
      --sku Standard_LRS
```
    
2. Wait for the command to complete (this takes a few seconds).
    
3. Review the JSON output and confirm the **provisioningState** shows **Succeeded**.
    

 Note

**Validation step:** Confirm the first storage account is created with **provisioningState: Succeeded**.

## Task 3: Create a second storage account

Create another storage account to demonstrate managing multiple resources. Having two resources makes the listing and tagging exercises more meaningful.

1. Run the following command (use a different unique name):
    
    Bash
    
    ```
    az storage account create \
      --name stgpclidemo02 \
      --resource-group rg-gp-cli-demo \
      --location eastus \
      --sku Standard_LRS
    ```
    
2. Wait for the command to complete and confirm the **provisioningState** shows **Succeeded**.
    

 Note

**Validation step:** Confirm the second storage account is created with **provisioningState: Succeeded**.

## Task 4: List and filter resources

Use CLI commands to list the resources you created and format the output. This demonstrates how the CLI makes it easy to quickly inventory what exists in a resource group.

Run the following command to list all resources in the resource group:
    
    Bash
    
    
    az resource list --resource-group rg-gp-cli-demo --output table

    
Confirm both storage accounts appear in the table.
    
Run the following command to list only storage accounts:
    
    Bash
    
    
    az resource list \
      --resource-group rg-gp-cli-demo \
      --resource-type Microsoft.Storage/storageAccounts \
      --output table

    
Confirm the output is filtered to show only the two storage accounts.
    

 Note

Validation step: Confirm the --resource-type filter isolated storage accounts from other resource types.

Run the following command to show details of a specific storage account (use your first storage account name):

    az storage account show \
      --name stgpclidemo01 \
      --resource-group rg-gp-cli-demo \
      --output table
    
Note the columns showing the account name, location, kind, and SKU.
# Tag, query, and clean up resources

## Task 1: Tag the resource group

Apply tags to the resource group using a single command. Tags assigned from the CLI follow the same key-value format you use in the portal but are faster to apply across multiple resources.

1. Run the following command to add tags to the resource group:
```
az group update \
--name rg-gp-cli-demo \
--tags environment=test department=it-ops
```
1. Confirm the JSON output includes the **tags** section with both key-value pairs.
2. Run the following command to verify the tags:
```
az group show --name rg-gp-cli-demo --query tags
```
3. Confirm the output shows **environment: test** and **department: it-ops**.

## Task 2: Tag individual resources

Apply tags to each storage account. In a real environment, consistent tagging across resources enables cost tracking and automated governance.

1. Run the following command to tag the first storage account (use your actual storage account name):
```
az resource tag \
--tags environment=test department=development \
--ids $(az storage account show --name stgpclidemo01 --resource-group rg-gp-cli-demo --query id --output tsv)
```
2. Run the following command to tag the second storage account with different values:
```
az resource tag \
--tags environment=test department=operations \
--ids $(az storage account show --name stgpclidemo02 --resource-group rg-gp-cli-demo --query id --output tsv)
```
3. Confirm both commands return JSON output with the expected tags.

## Task 3: Query resources with JMESPath filters

Use the **--query** parameter to extract specific fields from CLI output. JMESPath is a built-in query language that lets you filter and reshape JSON results without piping to external tools.

1. Run the following command to list resource names and their tags:
```
az resource list \
--resource-group rg-gp-cli-demo \
--query "[].{Name:name, Department:tags.department, Environment:tags.environment}" \
--output table
```

2. Confirm the table shows each resource with its **Department** and **Environment** tag values.
**Validation step:** Confirm the JMESPath query extracted and formatted tag values from CLI output.

3. Run the following command to list only resources tagged with **department=development**:
```
az resource list \
--resource-group rg-gp-cli-demo \
--query "[?tags.department=='development'].{Name:name, Type:type}" \
--output table
```
1. Confirm only the first storage account appears in the filtered output.
 
> [!NOTE] Title
> **Validation step:** Confirm the JMESPath filter shows only resources where **department** equals **development**.

1. Run the following command to count the resources in the resource group:
```
az resource list \
--resource-group rg-gp-cli-demo \
--query "length([])"
```
2. Confirm the output shows **2**.


> [!NOTE] Title
> **Validation step:** Confirm the resource count matches the expected number of resources.

## Task 4: Compare CLI output to the portal

Open the portal alongside Cloud Shell to confirm the CLI and portal show the same data. This reinforces that both tools manage the same underlying resources.

1. In the Azure portal (above the Cloud Shell pane), search for **Resource groups** in the portal search bar and select **Resource groups**.
2. Select **rg-gp-cli-demo** from the list.
3. Confirm the portal shows the same two storage accounts.
4. In the left menu, select **Tags**.
5. Confirm the **environment** and **department** tags match what you set from the CLI.
6. Return to the **rg-gp-cli-demo** resource group overview.
7. Select one of the storage accounts.
8. In the left menu, select **Tags**.
9. Confirm the resource-level tags match what you set from the CLI.

 Note

**Validation step:** Confirm the portal and CLI display identical resource tags and metadata.

## Task 5: Delete the resource group from the CLI

Clean up all resources with a single command. Deleting a resource group removes everything inside it, which is why organizing resources into groups is a best practice.

1. Run the following command to delete the resource group and all resources inside it:
```
az group delete --name rg-gp-cli-demo --yes --no-wait
```
    
2. The **--yes** flag skips the confirmation prompt. The **--no-wait** flag returns control immediately while deletion continues in the background.
    
3. Run the following command to check the deletion status:
```
az group show --name rg-gp-cli-demo --output table
```
1. If the group still exists, the output shows it. If it's been deleted, you receive a "not found" error, which confirms successful removal.
    
2. Wait a minute and run the command again to confirm the resource group is fully deleted.