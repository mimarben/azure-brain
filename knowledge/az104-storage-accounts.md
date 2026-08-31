---
title: AZ-104 — Configuración de cuentas de almacenamiento
aliases: ["Configuración de cuentas de almacenamiento (AZ-104)"]
tags: [associate, storage]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/
---

# AZ-104 — Configuración de cuentas de almacenamiento

Módulo 09 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) · Ruta 2 — Implementación y administración del almacenamiento · Área: Implementación y administración del almacenamiento (15–20%).

## Concepto

Configuración de cuentas de almacenamiento, incluida la replicación (redundancia) y los puntos de conexión (endpoints).

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Creación y configuración de cuentas de almacenamiento
> - Configuración de la redundancia de Azure Storage (LRS/ZRS/GRS/GZRS y failover)
> - Configuración de la replicación de objetos
> - Configuración del cifrado de una cuenta de almacenamiento
> - Administración de datos mediante Explorador de Azure Storage y AzCopy

## Enlaces relacionados

**Módulo de Learn**: [Configuración de cuentas de almacenamiento](https://learn.microsoft.com/en-us/training/modules/configure-storage-accounts/)

**Savill**: buscar "storage" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Servicios de almacenamiento de Azure (AZ-900)]]

**Laboratorio**: Lab 07 (storage accounts) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Servicios de almacenamiento de Azure (AZ-900)]]


# Implement Azure Storage.

[Azure Storage](https://learn.microsoft.com/en-us/azure/storage/common/storage-introduction) is Microsoft's cloud storage solution for modern data storage scenarios. Azure Storage offers a massively scalable object store for data objects. It provides a file system service for the cloud, a messaging store for reliable messaging, and a NoSQL store.

### Things to know about Azure Storage

You can think of Azure Storage as supporting three categories of data: structured data, unstructured data, and virtual machine data. Review the following categories and think about which types of storage are used in your organization.

![[storage-types.png]]


|Category|Description|Storage examples|
|---|---|---|
|**Virtual machine data**|Virtual machine data storage includes disks and files. Disks are persistent block storage for Azure IaaS virtual machines. Files are fully managed file shares in the cloud.|Storage for virtual machine data is provided through Azure managed disks. Data disks are used by virtual machines to store data like database files, website static content, or custom application code. The number of data disks you can add depends on the virtual machine size.|
|**Unstructured data**|Unstructured data is the least organized. The format of unstructured data is referred to as _nonrelational_.|Unstructured data can be stored by using Azure Blob Storage and Azure Data Lake Storage. Blob Storage is a highly scalable, REST-based cloud object store. Azure Data Lake Storage is the Hadoop Distributed File System (HDFS) as a service.|
|**Structured data**|Structured data is stored in a relational format that has a shared schema. Structured data is often contained in a database table with rows, columns, and keys. Tables are an autoscaling NoSQL store.|Structured data can be stored by using Azure Table Storage, Azure Cosmos DB, and Azure SQL Database. Azure Cosmos DB is a globally distributed database service. Azure SQL Database is a fully managed database-as-a-service built on SQL.|
### Things to consider when using Azure Storage

As you think about your configuration plan for Azure Storage, consider these prominent features.

- **Consider durability and availability**. Azure Storage is durable and highly available. Redundancy ensures your data is safe during transient hardware failures. You replicate data across datacenters or geographical regions for protection from local catastrophe or natural disaster. Replicated data remains highly available during an unexpected outage.
    
- **Consider secure access**. Azure Storage encrypts all data. Azure Storage provides you with fine-grained control over who has access to your data.
    
- **Consider scalability**. Azure Storage is designed to be massively scalable to meet the data storage and performance needs of modern applications.
    
- **Consider manageability**. Microsoft Azure handles hardware maintenance, updates, and critical issues for you.
    
- **Consider data accessibility**. Data in Azure Storage is accessible from anywhere in the world over HTTP or HTTPS. Microsoft provides SDKs for Azure Storage in various languages. You can use .NET, Java, Node.js, Python, PHP, Ruby, Go, and the REST API. Azure Storage supports scripting in Azure PowerShell or the Azure CLI. The Azure portal and Azure Storage Explorer offer easy visual solutions for working with your data.
    
- **Consider SFTP support**. Blob Storage can use SFTP (SSH File Transfer Protocol), so you can keep using existing SFTP tools to move files directly to and from blobs. To use SFTP, enable hierarchical namespace (HNS). You can turn it on when you create the storage account (Advanced tab) or later under Settings → Configuration.
    
- **Consider NFSv3 protocol support**. Blob Storage can also be accessed using NFSv3, which lets Linux clients mount a container like an NFS share. NFSv3 can simplify migrations from Linux file workloads to Azure.
    
- **Consider default authorization preferences**. In the Azure portal, you can enable **Default to Microsoft Entra authorization**. This authentication makes role-based access control (RBAC) the default instead of shared access keys, which can improve security.