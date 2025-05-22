# **Storage Container Setup**

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge\&logo=azure-devops\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge\&logo=apachemaven\&logoColor=white)

## **Overview**

This module provisions an **Azure Storage Account** and an associated **Blob Container**. The configuration supports setting redundancy, performance tier, minimum TLS version, and public access level. This is ideal for storing unstructured data like images, videos, documents, and backups.

> Azure Blob Containers are used to store and organize blobs (binary large objects) within a storage account. This module also handles the creation of the underlying storage account with customizable replication and security settings.

---

## **Stack**

- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm`
- **Storage Type:** Blob Storage
- **Public Access:** Configurable (Private, Blob, or Container)

---

## **Tiers Definition**

- **storage_account_tier**
    - **Definition:** Defines the performance tier of the storage account.
    - **Used:** Standard
    - **Available:**
        1. **Standard:** Cost-effective and suitable for most workloads.
        2. **Premium:** Higher performance, optimized for low-latency and high-throughput.

- **storage_account_replication_type**
    - **Definition:** Specifies the data redundancy model.
    - **Used:** LRS
    - **Available:**
        1. **LRS** – Locally-redundant storage
        2. **GRS** – Geo-redundant storage
        3. **RAGRS** – Read-access geo-redundant storage
        4. **ZRS** – Zone-redundant storage
        5. **GZRS** – Geo-zone-redundant storage
        6. **RAGZRS** – Read-access geo-zone-redundant storage

---

## **Settings**

- **storage_account_min_tls_version**
    - **Definition:** The minimum TLS version allowed for storage account traffic.
    - **Used:** TLS1_2
    - **Available:** TLS1_0, TLS1_1, TLS1_2 (recommended)

- **storage_account_container_access_type**

    - **Definition:** Defines the public access level for blobs in the container.
    - **Used:** blob
    - **Available:**
        1. **private** – No public read access
        2. **blob** – Public read access for blobs only
        3. **container** – Public read access for blobs and container metadata

---

## **Requirements**

* **Terraform version:** >= 1.10.5
* **Provider:** `azurerm` version 4.19.0
* **Azure CLI:** Logged in and authenticated (`az login`)
* **Storage Account Name:** Must be globally unique
* **Permissions:** Adequate permissions to create Storage Accounts and Blob Containers