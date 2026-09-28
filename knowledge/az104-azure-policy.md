---
title: AZ-104 — Iniciativas de Azure Policy
aliases: ["Iniciativas de Azure Policy (AZ-104)"]
tags: [associate, governance]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/sovereignty-policy-initiatives/
---
![[steps-for-cloud-governance.svg]]
# AZ-104 — Iniciativas de Azure Policy

Módulo 06 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) ([ES](https://learn.microsoft.com/es-es/training/courses/az-104t00)) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Uso de iniciativas de Azure Policy para aplicar estándares de la organización, evaluar el cumplimiento a escala y administrar los recursos de Azure de forma eficaz.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Implementación y administración de Azure Policy
> - Del mismo área (cubrir con labs/docs): bloqueos de recursos, etiquetas, grupos de administración

## Enlaces relacionados

**Módulo de Learn**: [Iniciativas de Azure Policy](https://learn.microsoft.com/en-us/training/modules/sovereignty-policy-initiatives/) ([ES](https://learn.microsoft.com/es-es/training/modules/sovereignty-policy-initiatives/))

**Savill**: buscar "Policy" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Gobernanza y cumplimiento en Azure (AZ-900)]] · [[Azure RBAC]]

**Laboratorio**: Lab 02b (gobernanza con Azure Policy) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Azure RBAC]]

# Cloud Adoption Framework for Azure.

The Microsoft Cloud Adoption Framework for Azure offers comprehensive technical guidance for Microsoft Azure. This end-to-end framework helps cloud architects, IT experts, and business leaders reach their cloud adoption objectives.

![[microsoft-caf-for-azure.png]]

Cloud governance refers to the management of cloud usage in your organization. The Cloud Adoption Framework - Govern methodology offers a systematic framework for setting up and improving cloud governance in Azure. This guidance applies to organizations across various industries and it addresses crucial areas, such as regulatory compliance, security, operations, cost management, data, resource management, and AI. It's essential for defining and maintaining efficient cloud use.

## Steps for cloud governance.

Cloud governance is a continuous process. It requires ongoing monitoring, evaluation, and adjustments to adapt to evolving technologies, risks, and compliance requirements. The Cloud Adoption Framework - Govern methodology divides cloud governance into five steps.


![[steps-for-cloud-governance.svg]]

1. **Build a governance team** - Establish a dedicated cloud governance team that's responsible for defining, maintaining, and reporting on the progress of cloud governance policies.
2. **Assess cloud risks** - Conduct a thorough risk assessment that's unique to your organization, addressing all risk categories, including regulatory compliance, security, operations, costs, data management, resource management, and AI-related risks.
3. **Document cloud governance policies** - Clearly document cloud governance policies that dictate acceptable cloud usage and outline the rules and guidelines that mitigate identified risks.
4. **Enforce cloud governance policies** - Implement a systematic approach to ensure compliance with cloud governance policies. Use automated tools alongside manual oversight to enforce compliance. These tools help set guardrails, monitor configurations, and ensure adherence to policies.
5. **Monitor cloud governance** - Regularly monitor cloud usage and the governance teams to ensure ongoing compliance with the established cloud governance policies.

## Considerations for defining a cloud governance policy.

The key considerations when defining a corporate cloud governance policy are as follows:

- **Business risk** – You must document the evolving business risks and the business's tolerance for risk based on data classification and application criticality.
- **Policy and compliance** – You must convert risk decisions into policy statements to establish cloud adoption boundaries efficiently.
- **Process** – You must establish processes to monitor violations and adherence to corporate policies.

![[cloud-governance.png]]

The five core disciplines of cloud governance are as follows:

- **Cost management** – Evaluates and monitors costs, including controlling IT expenditures to establish well-defined cost management. It also includes adjusting resources according to demand. It's crucial to exercise control over cloud expenditure to derive greater value from your investments.
- **Security baseline** – Ensures compliance with IT security requirements by applying a security baseline to all adoption efforts.
- **Resource consistency** – Ensures consistency in resource configuration and enforcing practices for onboarding, recovery, and discoverability.
- **Identity baseline** – Ensures that the baseline for identity and access is enforced by consistently applying role definitions and assignments.
- **Deployment acceleration** – Accelerates the deployment of policies through centralization, consistency, and standardization across deployment templates.
## Cloud governance with Azure Policy

Azure's primary governance tool is [Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/overview) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/overview)). Azure Policy facilitates the governance of all resources, including current and forthcoming resources. It helps to enforce organizational standards and to assess compliance at scale by establishing guardrails across various resources.

# Azure Policy design principles

Governance provides mechanisms and processes to maintain control over your applications and resources in Azure. It involves planning your policy in Azure Policy and setting strategic priorities. While designing your policy, you must organize your cloud-based resources to secure, manage, and track costs that are related to your workloads.

## Hierarchy for governance

Azure provides four levels of management to establish proper governance: Management groups, Subscriptions, Resource groups, and Resources. You can build a flexible structure of management groups and subscriptions to organize your resources into a hierarchy for unified policy and access management. The following diagram shows an example of creating a hierarchy for governance by using management groups.![[azure-governance-hierarchy.png]]


|Concept|Description|
|---|---|
|**Resource**|A resource is the basic building block of Azure, and it includes instances of services that you create, provision, deploy, and so on. Virtual machines (VMs), virtual networks, databases, AI services, and so on, are considered resources in Azure.|
|**Resource groups**|Resource groups are groupings of resources. When you create a resource, you must place it into a resource group. While a resource group can contain many resources, a single resource can only be in one resource group at a time.  <br>  <br>When you apply an action to a resource group, that action applies to all resources in the resource group. If you delete a resource group, all resources are deleted. If you grant or deny access to a resource group, all resources in the resource group are also granted or denied access.|
|**Subscriptions**|In Azure, subscriptions are a unit of management, billing, and scale. Similar to how resource groups are a way of logically organizing resources, subscriptions allow you to logically organize your resource groups and facilitate billing. Each subscription has limits or quotas on the number of resources that you can create and use. Organizations can use subscriptions to manage costs and the resources that users, teams, and projects create.  <br>  <br>Using Azure requires an Azure subscription. An Azure subscription provides you with authenticated and authorized access to Azure products and services. It also allows you to provision resources. An Azure subscription links to an Azure account, which is an identity in Microsoft Entra ID or in a directory that Microsoft Entra ID trusts.|
|**Management groups**|Azure management groups provide a level of scope above subscriptions. If you have many subscriptions, you might need a way to efficiently manage access, policies, and compliance for those subscriptions. You organize subscriptions into containers called management groups and then apply governance conditions to the management groups.  <br>  <br>Management groups give you enterprise-grade management at a large scale, no matter what type of subscriptions you might have. Management groups can be nested.|

## Introduction to Azure Resource Manager

Azure Resource Manager is the deployment and management service for Azure. It provides a management layer that allows you to create, update, and delete resources in your Azure account.

Azure operations are classified into two main types: control plane and data plane. The control plane helps you manage resources in your subscription, while the data plane allows you to access the capabilities provided by instances of specific resource types.

### Control plane

Azure Policy operates in the control plane to enforce rules and compliance on your resources. Azure Resource Manager manages all control plane operations in Azure and includes the different components that are centralized between the different services. Azure Policy is integrated with Azure Resource Manager.

![[azure-policy-and-resource-manager.png]]

Azure Resource Manager manages essential functions, such as template-based deployments, role-based access control (RBAC), auditing, monitoring, and tagging, which provides a unified management experience for Azure resources after deployment. For example, consider a scenario where you have a storage account. With Azure Resource Manager, you can create the storage account and enforce a policy that mandates encryption for all storage accounts.

### Data plane

The data plane is where the actual data operations occur, and Azure Policy ensures that the resources you interact with in the data plane are compliant with your policies. Data plane operations involve direct interaction with the data stored in a resource. Continuing with the previous example, you engage with the storage account to upload or download files. This interaction is handled directly by the data plane of the storage account rather than being managed by Azure Resource Manager.

Azure Policy allows individual Azure services to implement an Azure Policy extension, enhancing policy behavior and integration with specific resource providers. Azure Policy currently supports data plane operations through the following resource provider modes:

- **Microsoft.Kubernetes.Data** - Used for managing Kubernetes clusters and components such as pods, containers, and ingresses.
- **Microsoft.KeyVault.Data** - Used for managing vaults and certificates in Azure Key Vault.
- **Microsoft.Network.Data** - Used for managing Microsoft Azure Virtual Network Manager custom membership policies by using Azure Policy.
- **Microsoft.ManagedHSM.Data** - Used for managing Azure Key Vault Managed HSM keys by using Azure Policy.
- **Microsoft.DataFactory.Data** - Used for using Azure Policy to deny Microsoft Azure Data Factory outbound traffic domain names.
- **Microsoft.MachineLearningServices.v2.Data** - Used for managing Microsoft Azure Machine Learning model deployments. This Resource Provider mode reports compliance for newly created and updated components.

## Operation flows of Azure Resource Manager

![[operation-flows.png]]

**Greenfield** refers to a scenario where an Azure Policy (policy-first) exists, and when you're creating or updating an Azure resource.

**Brownfield** is the scenario where the resources exist already (resource-first), and you're assigning a new Azure Policy to those resources.

# Azure Policy resources

Azure Policy enforces organizational standards and assesses compliance at scale. It evaluates Azure resources and actions by comparing their properties to business rules, providing an aggregated view of the environment's overall state. This policy allows for detailed analysis down to each resource and policy level with granularity. Six policy resources are available in Azure, and multiple different concepts apply to these Azure policy resources.

![[policy-resources.png]]

## Definitions

Azure Policy definitions describe resource compliance conditions and the effect to take if a condition is met. Several settings determine which resources are evaluated by any Azure Policy. You explore these settings in the next unit, **Azure Policy definitions**. The primary concept to which these settings can be applied is scope.

## Initiatives

Azure Policy initiatives, also known as a policy set, allow you to group several policy definitions to simplify assignments and management because you work with the initiatives as a single item. Initiatives offer a streamlined and automated approach to governance, allowing organizations to manage and monitor compliance at scale.

## Assignments

Policy assignments define which resources are evaluated by a policy definition or initiative. Policy assignments can be done in the portal, an API call, or through the command line interface.

Policies and initiatives are assigned to a specific scope (management group, subscription, or resource group). While doing so, you can define several optional aspects, including the resource scope and policy definition.

- Optional _resource selectors_ to allow gradual rollout based on resource location or type.
- Optional _overrides_ to change the effect of a policy definition without modifying the underlying definition.
- _enforcementMode_ can be disabled to support "what-if" scenarios without changing the definition, which is equivalent to changing the definition to an audit effect mode, but a way to do it at assignment level. For example, if the policy has _Deny_ effects, that denial isn't effective, but you can still view the result of the compliance evaluation of that policy.
- Optional _excluded scopes_ to exclude inner containers or resources from the assignment scope.
- _Noncompliance messages_ can be defined.
- _Parameters_ can be assigned values.
- If you have a policy with the _deployIfNotExists_ effect type, a _managed identity_ can be assigned (system-assigned or user-assigned) to turn on remediation actions. An assignment has several properties that set a scope. The use of these properties determines which resource for Azure Policy to evaluate and which resources count toward compliance. These properties map to the following concepts:
    - **Inclusion** - For more information, see [Azure Policy assignment structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/assignment-structure)).
    - **Exclusion** - For more information, see [Azure Policy assignment structure excluded scopes](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure#excluded-scopes) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/assignment-structure#excluded-scopes)).

## Exemptions

Use the Policy exemptions feature to _exempt_ a resource hierarchy or an individual resource from evaluation of initiatives or definitions. Resources that are _exempt_ count toward overall compliance but can't be evaluated or have a temporary waiver. They're created as a child object on the resource hierarchy, or the individual resource granted the exemption.

Policy exemptions aren't created during assignment time, but after, and the effect is still the same as an excluded scope. Two exemption categories exist and are used to group exemptions:

- **Mitigated** - The exemption is granted because the policy intent is met through another method.
- **Waiver** - The exemption is granted because the noncompliance state of the resource is temporarily accepted.

For more information about policy exemption, see [Azure Policy exemption structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/exemption-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/exemption-structure)).

## Attestations

Policy attestations are used by Azure Policy to set compliance states of resources or scopes targeted by [manual policies](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/effect-manual) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/effect-manual)). Each applicable resource requires one attestation for each manual policy assignment. For ease of management, manual policies should be designed to target the scope that defines the boundary of resources whose compliance state needs to be attested.

For more information, see [Azure Policy attestation structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/attestation-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/attestation-structure)).

## Remediations

The policy remediation task feature is used to bring resources into compliance based on a definition and assignment. Resources that are noncompliant to a _modify_ or _deployIfNotExists_ definition assignment can be brought into compliance by using a remediation task. Resources that are newly created or updated that are applicable to a _deployIfNotExists_ or _modify_ definition assignment are automatically remediated.

For more information, see [Azure Policy remediation task structure](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/remediation-structure) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/remediation-structure)).


# Azure Policy definitions

**Azure Policy definition** describes resource compliance conditions and the action or effects that take place if those conditions are met. The policy consists of two parts:

- A **condition** that compares a resource property field or a value, accessed by using aliases, to a required value.
- The **effect** determines what happens when the policy rule is evaluated to match the condition. For each new resource, an updated resource, or an existing resource, the effects behave differently.

## Anatomy of a policy definition

You use JSON to create a policy definition that contains the elements shown in the following table.

|Element|Description|Properties or values|
|---|---|---|
|_displayName (string, max 128 characters)_|Used to identify the policy definition.||
|_description (string, max 512 characters)_|Provides context for when the definition is used.||
|_policyType (read-only string)_|Indicates the origin of the policy definition. This property can't be set, but SDK returns three values which are visible in the portal.|● Built in: Provided and maintained by Microsoft.  <br>● Custom: Custom definitions created by the customer.  <br>● Static: Regulatory Compliance policy with Microsoft ownership.|
|_mode (string)_|Configured depending on the target of the policy: an Azure Resource Manager property or a Resource Provider property.|● Resource Manager Modes:  <br>    o On All: Evaluates resource groups, subscriptions, and all resource types.  <br>    o Indexed: Evaluates resource groups, subscriptions, and all resource types.  <br>● Resource Provider Modes (limited to Built in policies and fully supported):  <br>    o Microsoft.Kubernetes.Data  <br>    o Microsoft.KeyVault.Data  <br>    o Microsoft.Network.Data  <br>● Resource Provider Modes (limited to Built in policies and in preview mode):  <br>    o Microsoft.ManagedHSM.Data  <br>    o Microsoft.DataFactory.Data|
|_version (string, optional)_|Built-in policy definitions can host multiple versions with the same definitionID. If no version number is specified, all experiences show the latest version of the definition.||
|_metadata (object, optional, max 1,024 characters)_|Stores information about the policy definition.|Common properties (for Built-in policies):  <br>● _version (string)_: Tracks details about the version of the contents of a policy definition.  <br>● _category (string)_: Determines under which category in the Azure portal the policy definition is displayed.  <br>● _preview (Boolean)_: True or false flag that indicates if the policy definition is in preview.  <br>● _deprecated (Boolean)_: True or false flag that indicates if the policy definition is deprecated.  <br>● _portalReview (string)_: Determines if parameters require review in the portal.|
|_parameters (object, optional)_|Help simplify your policy management by reducing the number of policy definitions. By including parameters in a policy definition, you can reuse that policy for different scenarios by using different values.|Properties:  <br>● name  <br>● type (String, Array, Object, Boolean, Integer, Float, DateTime)  <br>● metadata (description, displayName, strongType, assignPermissions)  <br>● defaultValue  <br>● allowedValues  <br>● schema|
|_policyRule (object)_|The effect of a policy is defined in the _policyRule_. The policy rule consists of the _if and then_ blocks.  <br>● In the _if_ block, you define one or more conditions that specify when the policy applies.  <br>● In the _then_ block, you define the effect that happens when the _if_ conditions result true.||

```json
{
  "displayName": "Allowed locations",
  "description": "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region.",
  "policyType": "BuiltIn",
  "mode": "Indexed",
  "metadata": {
    "version": "1.0.0",
    "category": "General"
  },
  "parameters": {
    "listOfAllowedLocations": {
      "type": "Array",
      "metadata": {
        "description": "The list of locations that can be specified when deploying resources.",
        "strongType": "location",
        "displayName": "Allowed locations"
      }
    }
  },
    "policyRule": {
      "if": {
        "allOf": [
          {
            "field": "location",
            "notIn": "[parameters('listOfAllowedLocations')]"
          },
          {
            "field": "location",
            "notEquals": "global"
          },
          {
            "field": "type",
            "notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
```

In the given example, _b2cDirectories_ is excluded from the policy logic because its location field isn't a region (it can be "United States," "Europe," "Asia Pacific," or "Australia"). This logic can be enforced with a separate policy.

## Logical operators and conditions (_if_ blocks)

The first part of the _policyRule_ in an Azure Policy definition is the _if_ block. This block defines the conditions for which the policy evaluates the resources. A policy definition can contain several conditional statements. Depending on your evaluation requirements, you might or might not need each statement to be true, and you might only need some of them to be true.

### Logical operators supported in the _if_ block

In the _if_ condition, you can put different logical operators.

|Operator|Type|Description|
|---|---|---|
|_not_|{condition or operator}|The _not_ syntax inverts the result of the condition.|
|_allOf_|[{condition or operator}, {condition or operator}]|The _allOf_ syntax (like the logical _and_ operation) requires all conditions to be true.|
|_anyOf_|[{condition or operator}, {condition or operator}]|The _anyOf_ syntax (like the logical _or_ operation) requires one or more conditions to be true.|
```json
{
  "if": {
    "allOf": [
      {
        "field": "location",
        "notIn": "[parameters('listOfAllowedLocations')]"
      },
      {
        "field": "location",
        "notEquals": "global"
      },
      {
        "field": "type",
        "notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
      }
    ]
  },
  "then": {
    "effect": "deny"
  }
}
```
### Nested logical operations

Logical operations are optional and can be nested to create complex scenarios.

The following example shows a _not_ operation nested in an _allOf_ operation:
```json
"if": {
    "allOf": [
      {
        "not": {
          "field": "tags",
          "containsKey": "application"
        }
      },
      {
        "field": "type",
        "equals": "Microsoft.Storage/storageAccounts"
      }
    ]
  },
```


### Conditions

Properties like fields, values, or counts can be evaluated within a condition.

|   |   |   |
|---|---|---|
|**Fields**|Conditions that evaluate whether the values of properties in the resource request payload meet certain criteria can be formed by using a field expression.|Name, fullName, kind, type, location, ID, identity.type, tags, tags['tagName'], property aliases|
|**Value**|Conditions that evaluate whether a value meets certain criteria can be formed by using a value expression.||
|**Count**|Conditions that count how many members of an array meet certain criteria can be formed by using a count expression.|● Field count, value count  <br>● The current () function returns the value of the array member that's being evaluated|
he condition in an Azure Policy assesses whether the evaluated values for the properties, such as Fields, Value, or Count, meets certain criteria. If the result of a function is an error, the policy results in a deny effect. This result can be avoided while testing by disabling _enforcementMode_ in the assignment. For more information, see [Enforcement Mode](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/assignment-structure#enforcement-mode) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/assignment-structure#enforcement-mode)).

|Evaluation criteria|Value type|
|---|---|
|_equals_|stringValue|
|_notEquals_|stringValue|
|_like_|stringValue|
|_notLike_|stringValue|
|_match_|stringValue|
|_notMatch_|stringValue|
|_matchInsensitively_|stringValue|
|_notMatchInsensitively_|stringValue|
|_contains_|stringValue|
|_notContains_|stringValue|
|_In_|["stringValue1", "stringValue2"]|
|_notIn_|["stringValue1", "stringValue2"]|
|_containsKey_|keyName|
|_notContainsKey_|keyName|
|_less_|dateValue|
|_less_|stringValue|
|_less_|intValue|
|_lessOrEquals_|dateValue|
|_lessOrEquals_|stringValue|
|_lessOrEquals_|intValue|
|_greater_|dateValue|
|_greater_|stringValue|
|_greater_|intValue|
|_greaterOrEquals_|dateValue|
|_greaterOrEquals_|stringValue|
|_greaterOrEquals_|intValue|
|_exists_|bool|
```json
{
  "if": {
    "allOf": [
      {
        "value": "[resourceGroup().name]",
        "like": "*netrq"
      },
      {
        "field": "type",
        "notLike": "Network/*"
      }
    ]
  },
  "then": {
    "effect": "deny",
    "details": {
      "count": {
        "field": "Microsoft.Network/virtualNetworks/addressSpace.addressPrefixes[*]",
        "where": {
          "value": "[ipRangeContains('10.0.0.0/24', current('Microsoft.Network/virtualNetworks/addressSpace.addressPrefixes[*]'))]",
          "equals": "greater"
        }
      }
    }
  }
}
```

### Policy functions

Functions can be used to introduce extra logic into a policy rule. They're resolved in the policy rule of a policy definition and in the parameter values that are assigned to the policy definitions in an initiative.

The Resource Manager template functions are available to use in a policy rule except a [few policy functions and user-defined functions](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-policy-rule#policy-functions) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/definition-structure-policy-rule#policy-functions)).

The _utcNow()_ function is available to use in a policy rule but differs from use in an Azure Resource Manager template (ARM template). Unlike an ARM template, this function can be used outside _defaultValue_. It returns a string set to the current date and time in Universal ISO 8601 DateTime format `yyyy-MM-ddTHH:mm:ss.fffffffZ`.

The following table describes the functions that are only available in policy rules.

|Function|Description|
|---|---|
|`addDays(dateTime, numberOfDaysToAdd)`|● `dateTime`: [Required] string - String in the Universal ISO 8601 DateTime format 'yyyy-MM-ddTHH:mm:ss.FFFFFFFZ'.  <br>● `numberOfDaysToAdd`: [Required] integer - Number of days to add.|
|`Field(fieldName)`|● `fieldName`: [Required] string - Name of the [field](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure-policy-rule#fields) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/definition-structure-policy-rule#fields)) to retrieve.  <br>● Returns the value of that field from the resource evaluated by the _If_ condition.  <br>● `field` is primarily used with `auditIfNotExists` and `deployIfNotExists` to reference fields on the resource that are being evaluated.|
|`requestContext().apiVersion`|Returns the API version of the request that triggered policy evaluation. This value is the API version that was used in the PUT/PATCH request for evaluations on resource creation/update. The latest API version is always used during compliance evaluation on existing resources.|
|`policy()`|Returns the following information about the policy that's being evaluated. Properties can be accessed from the returned object.  <br>`"assignmentId": ""`,  <br>`"definitionId": ""`,  <br>`"setDefinitionId": ""`,  <br>`"definitionReferenceId": ""`|
|`ipRangeContains(range, targetRange)`|● `range`: [Required] string - String specifying a range of IP addresses to check if the _targetRange_ is within range.  <br>● `targetRange`: [Required] string - String specifying a range of IP addresses to validate as included within the _range_.  <br>Returns a _boolean_ for whether the _range_ IP address range contains the _targetRange_ IP address range. Empty ranges or mixing between IP families isn't allowed and results in evaluation failure.|
|`current(indexName)`|Special function that can only be used inside count expressions.|
## Effect types (_then_ blocks)

The second part of the _policyRule_ in an Azure Policy definition is the _then_ block. This block defines the effect that takes place when the policy rule is evaluated to match the condition resources. More than one effect can be valid for a given policy definition. Parameters are often used to specify allowed effect values (_allowedValues_) in such cases so that a single definition can be more versatile during assignment. Resource properties and logic in the policy rule can determine whether a certain effect is considered valid to the policy definition.

|Effect|Description|Type|
|---|---|---|
|_disabled_|The _disabled_ effect is a way to deactivate the policy. If a policy definition has _Disabled_ as its effect, any assignments of that policy aren't active. This effect is checked first to determine if the policy rule should be evaluated. This flexibility makes it possible to deactivate a single assignment instead of deactivating all of that policy's assignments.|Synchronous evaluation|
|_append_|The _append_ effect is used to add more fields to the requested resource during creation or update. It's mostly obsolete because _Modify_ can also be used to add fields to the request.|Synchronous evaluation|
|_modify_|The _modify_ effect is used to add, update, or remove properties or tags on a subscription or resource during creation or update. It allows Azure Policy to modify requests to Azure Resource Manager by altering fields to ensure compliance.|Synchronous evaluation|
|_deny_|The _deny_ effect is used to prevent a resource request that doesn't match defined standards through a policy definition and fails the request.|Synchronous evaluation|
|_denyAction_|The _denyAction_ effect is used to block requests based on intended action to resources at scale. Currently, the only supported action is DELETE.|Synchronous evaluation|
|_audit_|The _audit_ effect is used to create a warning event in the activity log when you're evaluating a noncompliant resource, but it doesn't stop the request.|Asynchronous evaluation|
|_auditIfNotExists_|The _auditIfNotExists_ effect allows the auditing of resources that are related to the resource that matches the _if_ condition but doesn't have the properties specified in the details of the _then_ condition.|Asynchronous evaluation|
|_deployIfNotExists_|The _deployIfNotExists_ policy definition runs a template deployment when the condition is met. It can trigger deployment of a related resource based on the compliance state of the currently evaluated resource.|Asynchronous evaluation|
|_manual_|The _manual_ effect allows you to self-attest the compliance of resources or scopes. When a policy definition with _Manual_ effect is assigned, you can set the compliance states of targeted resources or scopes through custom attestations.|Manual attestation|
The following list provides general guidance around interchangeable effects:

- _audit_, _deny_, and either _modify_ or _append_ are often interchangeable.
- _auditIfNotExists_ and _deployIfNotExists_ are often interchangeable.
- _manual_ isn't interchangeable.
- _disabled_ is interchangeable with any effect.

Multiple policies can be assigned to a single resource at the same scope or at different scopes. Each policy mostly has a different effect defined. The condition and effect for each policy is independently evaluated. The net result of layering policy definitions is considered **cumulative most restrictive**.

# Evaluation of resources through Azure Policy.

A significant benefit of Azure Policy is the insight and controls that it provides over resources in a subscription or management group of subscriptions.
## Evaluation triggers.

Evaluations of assigned policies and initiatives happen as the result of various events:

- A policy or initiative is newly assigned to a scope
- A policy or initiative already assigned to a scope is updated
- A resource is deployed to or updated in a scope with an assignment through Azure Resource Manager, REST API, or a supported SDK
- A subscription (resource type Microsoft.Resources/subscriptions) is created or moved in a management group hierarchy with an assigned policy definition that targets the subscription resource type
- A policy exemption is created, updated, or deleted
- Standard compliance evaluation cycle
- The machine configuration resource provider is updated with compliance details by a managed resource
- On-demand scan
## Evaluation timing.
When you're working with policy assignments in Azure, you need to understand the behavior and timing of compliance scans, especially in Brownfield scenarios, where new policies are applied to existing resources. Compliance scans through Azure policies are triggered by various methods:

- **Automatic full scan** - A full compliance scan is triggered automatically every 24 hours.
- **Manual scan for Brownfield scenarios** - In cases where a new policy is applied to existing resources (Brownfield scenarios), you can manually trigger a compliance scan by running _az policy state trigger-scan_.

When you assign a new policy, a delay can occur in the policy taking effect, which can be up to 30 minutes. The Azure Resource Manager cache holds session data, and it can take time for the policy to propagate in the same session. To bypass the caching delay, you can sign out and sign back in to refresh the Azure Resource Manager cache, which ensures that the new policy is applied immediately to the defined scope.

After the scan starts, several factors influence how long it takes for a compliance scan to complete:

- **Policy definitions** - The size and complexity of the policy definitions can increase scan time.
- **Number of policies** - The more policies applied, the longer the scan might take.
- **Scope size** - The size of the resource scope assigned to the policy also plays a role.
- **System load** - Compliance scans are a low-priority operation, meaning that if the system is busy with more critical tasks, the scan might take longer. The system prioritizes interactive and high-importance operations, so scans might take several minutes, or tens of minutes, even in smaller environments.
- **Synchronous scan (Low-Priority Execution)** - Because compliance scans are synchronous and assigned a low priority in Azure's system, they're delayed if the system is busy. This scan can significantly extend the time it takes for the scan to complete, even for smaller scopes or policies.

This understanding of the compliance scan process and potential delays allows you to better manage the application and avoid unnecessary waiting, especially in environments with complex or extensive policy definitions.

## Resource compliance states

When initiative or policy definitions are assigned, Azure Policy determines which resources are applicable. Then, it evaluates those resources that aren't excluded or exempted. Evaluation provides one of the compliance states to each resource based on conditions in the policy rule and each resource's adherence to those requirements.

- **Non-compliant**
- **Compliant**
- **Error** (for template or evaluation error)
- **Conflicting** (two or more policy assignments in the same scope with contradicting rules, such as two policies appending the same tag with different values)
- **Protected** (resource covered under an assignment with a _denyAction_ effect)
- **Exempted Unknown** (default state for definitions with a _manual_ effect)

When multiple resources or policies have varying compliance states, the overall compliance state is assessed individually for each resource and for each policy assignment. Azure Policy ranks each compliance state so that one wins over another in this situation. The rank order of the states is as given in the previous list of compliance states.

The compliance percentage is determined by dividing **Compliant**, **Exempt**, and **Unknown** resources by total resources. Total resources include resources with **Compliant**, **Non-compliant**, **Unknown**, **Exempt**, **Conflicting**, and **Error** states.

For more information on when the policies return these states for any particular resource, see [Azure Policy compliance states](https://learn.microsoft.com/en-us/azure/governance/policy/concepts/compliance-states) ([ES](https://learn.microsoft.com/es-es/azure/governance/policy/concepts/compliance-states)).

## Enforcement Mode

_enforcementMode_ is a property of a policy assignment that lets you deactivate the enforcement of certain policy effects. This mode allows you to test the policy's outcome on existing resources without initiating the policy effect or triggering entries in the [Azure Activity log](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/platform-logs-overview) ([ES](https://learn.microsoft.com/es-es/azure/azure-monitor/essentials/platform-logs-overview)). The _enforcementMode_ can be changed to Enabled after the policy is thoroughly tested.

This scenario is commonly referred to as _What If_ and aligns to safe deployment practices. The _enforcementMode_ is different from the _disabled_ effect. The _disabled_ effect prevents resource evaluation from happening at all while _enforcementMode_ lets the evaluation happen without the effect taking place.

The following table describes this property's values.

|Mode|JSON value|Type|Remediate manually|Activity log entry|Description|
|---|---|---|---|---|---|
|Enabled|Default|string|Yes|Yes|The policy effect is enforced during resource creation or update.|
|Disabled|DoNotEnforce|string|Yes|No|The policy effect isn't enforced during resource creation or update.|
## Policy enforcement and safe deployment best practices

Without the appropriate knowledge of best practices and proper testing, applying a set of policy to an existing environment that's running production workloads can result in unintended behaviors of policy resources. Treating policy as code (keeping your policy definitions in source control, and whenever a change is made, testing and validating that change) allows you to automate testing and make sure that no manual error factor happens. The best practices framework focuses on minimizing the impact of policy changes while ensuring compliance, and it includes two aspects:

- **First aspect** - Start from Assignments of new policies with _enforcementMode_ Disabled. When assigning policies that include deny or modify actions, beginning with _enforcementMode_ Disabled allows you to view the compliance state and evaluate policy outcomes without triggering actions or denying operations. This "what-if" scenario minimizes impact and helps identify issues in the new policies or changes without disrupting the environment.
    
- **Second aspect** - Deploy policies in deployment rings. To control potential negative impacts, policies should be deployed gradually in smaller subsets and then in bigger sets. You can start with test and development environments and then move to production by applying the policy to a small subset first. This strategy helps in testing the policy thoroughly. Gradually expanding the scope (through deployment rings) can cover the full production environment.
![[safe-deployment.png]]

## Reacting to policy state changes.

![[reacting-to-policy-changes.png]]


