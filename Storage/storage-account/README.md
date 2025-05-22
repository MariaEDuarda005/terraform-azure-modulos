# **Storage Account**
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

## **Overview**

This module provisions an **Azure Storage Account**, which provides scalable, secure, and durable cloud storage for a variety of data objects. The account is configurable for tier, redundancy type, and security settings, enabling you to support workloads such as data lakes, backup, file shares, static websites, and more.

> Azure Storage Accounts are the backbone of cloud data storage and enable multiple services under a single billing and security configuration, including blobs, tables, queues, and files.

---

## **Stack**

* **Infrastructure Manager:** Terraform
* **Provider:** `azurerm` (Azure Provider)
* **Services Enabled:** Blob Storage, File Storage, Table Storage, Queue Storage
* **Encryption:** Enabled by default, supports customer-managed keys
* **TLS Support:** Minimum TLS version configurable

---

## **Tiers Definition**

- **storage_account_tier**

    - **Definition:** Specifies the performance tier of the storage account.
    - **Used:** Standard
    - **Available:**
        1. **Standard:** Backed by magnetic drives, cost-effective for general-purpose storage.
        2. **Premium:** Backed by SSDs, optimized for low-latency and high-throughput workloads (e.g., premium file shares, unmanaged disks).

- **storage_account_replication_type**

    - **Definition:** Defines the replication strategy for ensuring data durability and high availability.
    - **Used:** LRS
    - **Available:**
        1. **LRS (Locally-redundant storage):** Replicates data within a single data center.
        2. **GRS (Geo-redundant storage):** Replicates data to a secondary region for disaster recovery.
        3. **RAGRS (Read-access geo-redundant storage):** GRS + read access to secondary region.
        4. **ZRS (Zone-redundant storage):** Replicates data across availability zones in a region.
        5. **GZRS (Geo-zone-redundant storage):** Combines GRS and ZRS.
        6. **RAGZRS:** GZRS + read access to secondary region.

---

## **Settings**

- **storage_account_min_tls_version**

    - **Definition:** Specifies the minimum TLS version permitted for incoming requests to the storage account.
    - **Used:** TLS1_2
    - **Available:**
        1. **TLS1_0** (legacy, not recommended)
        2. **TLS1_1**
        3. **TLS1_2** (recommended for secure communications)

---

## **Requirements**

- **Terraform version:** >= 1.10.5
- **Terraform Provider:** azurerm version 4.19.0
- **Azure CLI version:** Ensure `az login` has been run and is authenticated
- **Azure Subscription:** Must have appropriate permissions to provision storage resources
- **Storage Account Name:** Must be globally unique and DNS-compliant