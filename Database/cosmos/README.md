# Cosmos DB on Azure

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D7?style=for-the-badge\&logo=microsoftazure\&logoColor=white)
![CosmosDB](https://img.shields.io/badge/CosmosDB-2F88B7?style=for-the-badge\&logo=microsoftazure\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge\&logo=apachemaven\&logoColor=white)

---

## **Overview**

This module provisions an **Azure Cosmos DB** instance with the **MongoDB API**. Cosmos DB is a globally distributed, multi-model database service designed for mission-critical applications. This configuration provides a fully managed database with multi-region replication, consistency levels, automatic backups, and other features essential for high-availability workloads.

> Ideal for applications that need low-latency access to data and require high availability and scalability across multiple regions.

---

## **Stack**

* **Database Service:** Azure Cosmos DB (MongoDB API)
* **Authentication Method:** Username & Password (provided during setup)
* **Infrastructure Manager:** Terraform
* **Provider:** `azurerm` (Azure Provider)

---

## **Tiers Definition**

### Cosmos DB

- **offer_type:**
  - **Definition:** Defines the pricing tier for Cosmos DB, balancing cost with performance.
  - **Used:** `Standard`
  - **Available:**
    1. **Standard:** A general-purpose, cost-effective tier for most applications.
    2. **Premium:** High-performance tier designed for critical applications with low-latency requirements.
---

## **Settings**

### Cosmos DB

- **kind:**
  - **Definition:** Specifies the API for the Cosmos DB instance.
  - **Used:** `GlobalDocumentDB` (for MongoDB API)
  - **Available:**
    1. `GlobalDocumentDB`: Used for general-purpose document storage.
    2. `MongoDB`: Specifically optimized for MongoDB workloads.
    3. `Parse`: Legacy support for Parse Server backend integration (no longer recommended).

- **consistency_level:**
  - **Definition:** Defines the consistency level for the database.
  - **Used:** `Session`
  - **Available:**
    1. `Strong`: Consistent across all regions.
    2. `BoundedStaleness`: Guarantees lag is within a time or version bound.
    3. `Session`: Consistency within a session (default).
    4. `Eventual`: Fastest but eventually consistent.
    5. `ConsistentPrefix`: Guarantees order, not immediacy.

- **backup_interval_in_minutes:**
  - **Definition:** Specifies how often backups are taken.
  - **Used:** `240`
  - **Available:** Customizable backup frequency (e.g., 120, 360 minutes, etc.).

- **backup_retention_in_hours:**
  - **Definition:** The number of hours backups are retained.
  - **Used:** `8 hours`
  - **Available:** Set retention period between 1 hour and several days.

- **max_interval_in_seconds:**
  - **Definition:** (Bounded Staleness only) Maximum time lag between replicas.
  - **Used:** `5`
  - **Available:** Relevant if using `BoundedStaleness` consistency.

- **max_staleness_prefix:**
  - **Definition:** (Bounded Staleness only) Max operations lag allowed between regions.
  - **Used:** `100`

- **backup_type:**
  - **Definition:** Defines the type of backup used for Cosmos DB.
  - **Used:** `Periodic`
  - **Available:**
    1. `Periodic`: Scheduled backups (configurable).
    2. `Continuous`: Point-in-time restore (requires specific configuration and pricing).

- **public_network_access_enabled:**
  - **Definition:** Enables or disables public access to the Cosmos DB instance.
  - **Used:** `true`
  - **Available:**
    1. `true`: Public network access is enabled.
    2. `false`: Only private network access is allowed.

- **analytical_storage_enabled:**
  - **Definition:** Enables or disables analytical storage for Cosmos DB.
  - **Used:** `false`
  - **Available:**
    1. `true`: Enables data analysis capabilities on the Cosmos DB.
    2. `false`: Disables analytical storage.

- **storage_redundancy:**
  - **Definition:** Specifies data redundancy within Azure Storage.
  - **Used:** `Local`
  - **Available:**
    1. `Local`
    2. `Zone`
    3. `Geo`

---

## **Requirements**

* **Terraform version:** >= 1.0.0
* **AzureRM Provider version:** >= 3.0
* **Azure CLI:** Must be installed and authenticated (`az login`)
* **MongoDB Password:** Must be securely provided through the `terraform.tfvars` file or environment variables
* **Cosmos DB Pricing:** Ensure that you understand the pricing associated with Cosmos DB, as it can vary based on your selected resources (e.g., throughput, regions, etc.).