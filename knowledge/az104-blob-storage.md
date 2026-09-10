---
title: AZ-104 — Configuración de Azure Blob Storage
aliases: ["Configuración de Azure Blob Storage (AZ-104)"]
tags: [associate, storage]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/
---
![[blob-lifecycle-2854d812.png]]![[blob-storage-94fb52b8.png]]
# AZ-104 — Configuración de Azure Blob Storage

Módulo 10 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) · Ruta 2 — Implementación y administración del almacenamiento · Área: Implementación y administración del almacenamiento (15–20%).

## Concepto

Configuración de Azure Blob Storage, incluidos los niveles de acceso (tiers) y la replicación de objetos.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación y configuración de un contenedor en Azure Blob Storage
> - Configuración de las capas de almacenamiento (hot/cool/cold/archive)
> - Configuración de la eliminación suave para blobs y contenedores
> - Configuración de la administración del ciclo de vida de los blobs
> - Configuración del control de versiones de blobs

## Enlaces relacionados

**Módulo de Learn**: [Configuración de Azure Blob Storage](https://learn.microsoft.com/en-us/training/modules/configure-blob-storage/)

**Savill**: buscar "blob" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Servicios de almacenamiento de Azure (AZ-900)]]

**Laboratorio**: Lab 07 (Manage Azure Storage) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Servicios de almacenamiento de Azure (AZ-900)]]
# Implement Azure Blob Storage.

![[blob-storage-94fb52b8.png]]


- Blob Storage can store any type of text or binary data. Some examples are text documents, images, video files, and application installers.
    
- Blob Storage uses three resources to store and manage your data:
    - An Azure storage account
    - Containers in an Azure storage account
    - Blobs in a container
    
- To implement Blob Storage, you configure several settings:    
    - Blob container options.
    - Blob types and upload options.
    - Blob Storage access tiers.
    - Blob lifecycle rules.
    - Blob object replication options.
### Things to consider when implementing Azure Blob Storage

There are many common uses for Blob Storage. Consider the following scenarios and think about your own data needs:

- **Consider browser uploads**. Use Blob Storage to serve images or documents directly to a browser.
    
- **Consider distributed access**. Blob Storage can store files for distributed access, such as during an installation process.
    
- **Consider streaming data**. Stream video and audio by using Blob Storage.
    
- **Consider archiving and recovery**. Blob Storage is a great solution for storing data for backup and restore, disaster recovery, and archiving.
    
- **Consider application access**. You can store data in Blob Storage for analysis by an on-premises or Azure-hosted service.

# Create blob containers.

Azure Blob Storage uses a container resource to group a set of blobs. A blob can't exist by itself in Blob Storage. A blob must be stored in a container resource.

### Things to know about containers and blobs

Let's look at the configuration characteristics of containers and blobs.

- All blobs must be in a container.
    
- Containers organize your blob storage.
    
- A container can store an unlimited number of blobs.
    
- An Azure storage account can contain an unlimited number of containers.
    
- You must create a storage container before you can begin to upload data.

### Configure a container.

In the Azure portal, you configure settings to create a container for an Azure storage account. As you review these details, consider how you might organize containers in your storage account.

![[blob-containers-a243a2b9.png]]


> [!NOTE] Important
> The Blob and Container access levels have no effect unless the storage account's **Allow Blob anonymous access** setting is enabled. When disabled, all containers remain private regardless of their individual access level settings. Microsoft recommends keeping anonymous access disabled at the account level unless serving public content scenarios.

  

# Assign blob access tiers.

Azure Storage supports several [access tiers](https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview) for blob data. These tiers include Hot, Cool, Cold, and Archive. Each access tier is optimized to support a particular pattern of data usage.

#### Hot tier

The Hot tier is optimized for frequent reads and writes of objects in the Azure storage account. A good usage case is data that is actively being processed. The hot tier has the highest storage costs, but the lowest access costs.

#### Cool tier

The Cool tier is optimized for storing large amounts of infrequently accessed data. This tier is intended for data that remains in the Cool tier for at least 30 days. A usage case for the Cool tier is short-term backup and disaster recovery datasets and older media content. This content shouldn't be viewed frequently, but it needs to be immediately available. Storing data in the Cool tier is more cost-effective. The cool tier has lower storage costs and higher access costs compared to the hot tier.

#### Cold tier

The Cold tier is also optimized for storing large amounts of infrequently accessed data. This tier is intended for data that can remain in the tier for at least 90 days. The cold tier has lower storage costs and higher access costs compared to the cool tier.

#### Archive tier

The Archive tier is an offline tier that's optimized for data that can tolerate several hours of retrieval latency. Data must remain in the Archive tier for at least 180 days or be subject to an early deletion charge. Data for the Archive tier includes secondary backups, original raw data, and legally required compliance information. This tier is the most cost-effective option for storing data. Accessing data is more expensive in the Archive tier than accessing data in the other tiers.

To access the blob's content, you can rehydrate it to the hot, cool, or cold tier using two methods: **Copy Blob** (recommended - creates a new blob in an online tier) or **Set Blob Tier** (changes tier in place). Both methods support Standard priority (up to 15 hours) or High priority (within 1 hour for objects under 10 GB, at higher cost). Use High priority for urgent data retrieval in disaster recovery scenarios.

|Comparison|Hot access tier|Cool access tier|Cold access tier|Archive access tier|
|---|---|---|---|---|
|**Availability**|99.9%|99%|99%|99%|
|**Availability (RA-GRS reads)**|99.99%|99.9%|99.9%|99.9%|
|**Latency (time to first byte)**|milliseconds|milliseconds|milliseconds|hours|
|**Minimum storage duration**|N/A|30 days|90 days|180 days|
# Add blob lifecycle management rules.

Every data set has a unique lifecycle. Early in the lifecycle, users tend to access some of the data in the set, but not all of the data. As the data set ages, access to all of the data in the set tends to dramatically reduce. Some data set stays idle in the cloud and is rarely accessed. Some data expires within a few days or months after creation. Other data is actively read and modified throughout the data set lifetime.

Azure Blob Storage supports [lifecycle management](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-policy-configure) for data sets. It offers a rich rule-based policy for GPv2 accounts and Premium block blob accounts. Legacy Blob Storage accounts are also supported, but GPv2 is recommended for new deployments. You can use lifecycle policy rules to transition your data to the appropriate access tiers, and set expiration times for the end of a data set's lifecycle.


### Things to know about lifecycle management

You can use Azure Blob Storage lifecycle management policy rules to accomplish several tasks.

- Transition blobs to a cooler storage tier (Hot to Cool, Hot to Cold, Hot to Archive, Cool to Cold, Cool to Archive, Cold to Archive) to optimize for performance and cost.
    
- Delete current versions of a blob, previous versions of a blob, or blob snapshots at the end of their lifecycles.
    
- Automatically transition blobs from Cool back to Hot when accessed. This setting optimizes for unpredictable access patterns without early deletion charges.
    
- Apply rules to an entire storage account, to select containers, or to a subset of blobs using name prefixes or blob index tags as filters.

#### Business scenario

Consider a scenario where data is frequently accessed in the early stages of the lifecycle, but only occasionally after two weeks. After the first month, the data set is rarely accessed. In this scenario, the Hot tier of Blob Storage is best during the early stages. Cool tier storage is most appropriate for occasional access. Archive tier storage is the best option after the data ages over a month. To achieve this transition, lifecycle management policy rules are available to move aging data to cooler tiers.

### Configure lifecycle management policy rules.

In the Azure portal, you create lifecycle management policy rules for your Azure storage account by specifying several settings. For each rule, you create **If - Then** block conditions to transition or expire data based on your specifications. As you review these details, consider how you can set up lifecycle management policy rules for your data sets.
![[blob-lifecycle-2854d812.png]]


- **If**: The **If** clause sets the evaluation clause for the policy rule. When the **If** clause evaluates to true, the **Then** clause is executed. Use the **If** clause to set the time period to apply to the blob data. The lifecycle management feature checks if the data is accessed or modified according to the specified time.    
    - **More than (days ago)**: The number of days to use in the evaluation condition.
    
- **Then**: The **Then** clause sets the action clause for the policy rule. When the **If** clause evaluates to true, the **Then** clause is executed. Use the **Then** clause to set the transition action for the blob data. The lifecycle management feature transitions the data based on the setting.
    - **Move to cool storage**: The blob data is transitioned to Cool tier storage.
    - **Move to cold storage**: The blob data is transitioned to Cold tier storage.
    - **Move to archive storage**: The blob data is transitioned to Archive tier storage.
    - **Delete the blob**: The blob data is deleted.

> [!NOTE] Tip
> Expand your knowledge in the [Manage the Azure Blob storage lifecycle](https://learn.microsoft.com/en-us/training/modules/manage-azure-blob-storage-lifecycle/) training module.

# Determine blob object replication.

![[blob-object-replication-21fd3c07.png]]

### Things to know about blob object replication

There are several considerations to keep in mind when planning your configuration for blob object replication.

- Object replication requires that [Blob versioning](https://learn.microsoft.com/en-us/azure/storage/blobs/versioning-overview) is enabled on both the source and destination accounts. When blob versioning is enabled, you can access earlier versions of a blob. This access lets you recover your modified or deleted data.
    
- Object replication doesn't support blob snapshots. Any snapshots on a blob in the source account aren't replicated to the destination account.
    
- Object replication is supported when the source and destination accounts are in the Hot, Cool, or Cold tier. The source and destination accounts can be in different tiers.
    
- When you configure object replication, you create a replication policy that specifies the source Azure storage account and the destination storage account.
    
- A replication policy includes one or more rules that specify a source container and a destination container. The policy identifies the blobs in the source container to replicate.
    

### Things to consider when configuring blob object replication

There are many benefits to using blob object replication. Consider the following scenarios and think about how replication can be a part of your Blob Storage strategy.

- **Consider latency reductions**. Minimize latency with blob object replication. You can reduce latency for read requests by enabling clients to consume data from a region that's in closer physical proximity.
    
- **Consider efficiency for compute workloads**. Improve efficiency for compute workloads by using blob object replication. With object replication, compute workloads can process the same sets of blobs in different regions.
    
- **Consider data distribution**. Optimize your configuration for data distribution. You can process or analyze data in a single location and then replicate only the results to other regions.
    
- **Consider costs benefits**. Manage your configuration and optimize your storage policies. After your data is replicated, you can reduce costs by moving the data to the Archive tier by using lifecycle management policies.


# Manage blobs.

### Things to know about blob types

Let's take a closer look at the characteristics of blob types.

- **Block blobs**. A block blob consists of blocks of data that are assembled to make a blob. Most Blob Storage scenarios use block blobs. Block blobs are ideal for storing text and binary data in the cloud, like files, images, and videos. The block blob type is the default type for a new blob. When you're creating a new blob, if you don't choose a specific type, the new blob is created as a block blob.
    
- **Append blobs**. An append blob is similar to a block blob because the append blob also consists of blocks of data. The blocks of data in an append blob are optimized for _append_ operations. Append blobs are useful for logging scenarios, where the amount of data can increase as the logging operation continues.
    
- **Page blobs**. A page blob can be up to 8 TB in size. Page blobs are more efficient for frequent read/write operations. Azure Virtual Machines uses page blobs for operating system disks and data disks.


### Things to consider when managing blob storage

You can use the portal to upload and manage blobs. This option is good for a few files. After you identify the files to upload, you choose the blob type and block size, and the container folder. You also set the access tier and the encryption scope.
![[upload-blobs-7ad73d30.png]]


For larger numbers of files, it's best to use a tool. Review the following options and consider which tools would suit your configuration needs.

- [**Azure Storage Explorer**](https://learn.microsoft.com/en-us/azure/storage/storage-explorer/vs-azure-tools-storage-manage-with-storage-explorer). Upload, download, and manage blobs, files, queues, and tables, as well as Azure Data Lake Storage entities and managed disks. You can also view, edit, and manage resources, preview data, and configure storage permissions and access controls.
# Determine Blob Storage pricing

Understanding your access patterns and correlating them with your durability and availability needs helps you to best manage your Azure Blob Storage costs. The primary tool for estimating these costs is the Azure pricing calculator. The pricing tool can calculate migration, monthly estimates, and future pricing estimates based on the workload-driven input that you specify. In general, the cost of block blob storage depends on:

- Volume of data stored per month.
- Quantity and types of operations performed, along with any data transfer costs.
- Data redundancy option selected.

You can use the Azure Pricing Calculator to estimate your storage costs.

![[blob-pricing.png]]

### Things to know about pricing for Blob Storage

Review the following billing considerations for an Azure storage account and Blob Storage.

- **Performance tiers**. The Blob Storage tier determines the amount of data stored and the cost for storing that data. As the performance tier gets cooler, the per-gigabyte cost decreases.
    
- **Data access costs**. Data access charges increase as the tier gets cooler. For data in the Cool, Cold, and Archive tiers, you're billed a per-gigabyte data access charge for read actions.
    
- **Transaction costs**. There's a per-transaction charge for all tiers. The charge increases as the tier gets cooler.
    
- **Geo-replication data transfer costs**. This charge only applies to accounts that have geo-replication configured. Geo-replication data transfer incurs a per-gigabyte charge.
    
- **Outbound data transfer costs**. Outbound data transfers incur billing for bandwidth usage on a per-gigabyte basis. This billing is consistent with general-purpose Azure storage accounts.
    
- **Changes to the storage tier**. If you change the account storage tier from Cool to Hot, you incur a charge equal to reading all the data existing in the storage account. Changing the account storage tier from Hot to Cool incurs a charge equal to writing all the data into the Cool tier (GPv2 accounts only).