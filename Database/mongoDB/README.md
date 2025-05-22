# MongoDB on Azure

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D7?style=for-the-badge\&logo=microsoftazure\&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-47A248?style=for-the-badge\&logo=mongodb\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge\&logo=apachemaven\&logoColor=white)

---

## **Overview**

This module provisions a **MongoDB Database** on Azure using **Azure Cosmos DB API for MongoDB**. It includes the setup of a resource group, virtual network, public IP, network interface, and MongoDB instance. This is ideal for hosting MongoDB databases with high scalability and flexibility, and it is designed to be easily deployed with Terraform.

> Ideal for environments that require MongoDB for development, testing, or production workloads with high availability.

---

## **Stack**

* **Database Service:** Azure Cosmos DB API for MongoDB
* **Authentication Method:** Username & Password
* **Infrastructure Manager:** Terraform
* **Provider:** `azurerm` (Azure Provider)

---

## **Tiers Definition**

### MongoDB (Cosmos DB with MongoDB API)

- **compute_tier:**
  - **Definition:** Defines the performance level and resources allocated to the MongoDB instance.
  - **Used:** `M25`
  - **Available:**
    1. **M10:** Entry-level performance for development and testing.
    2. **M20:** Suitable for small production environments with moderate resources.
    3. **M25:** Balanced performance for small to medium production workloads.
    4. **M30:** Medium-performance for medium-scale applications.
    5. **M40:** Suitable for larger applications with increased resource needs.
    6. **M50:** High-performance applications with large-scale data handling.
    7. **M60:** High-performance and highly scalable tier for large enterprise workloads.
    8. **M70:** Enterprise-grade with maximum performance for critical workloads.
    9. **M80:** Suitable for mission-critical, large-scale applications.
    10. **M90:** Ultra-high-performance tier for top-tier enterprise workloads.

---

## **Settings**

### MongoDB

- **username:**
  - **Definition:** The username used for authentication to the MongoDB instance.
  - **Used:** `userAdmin`
  - **Available:** Any valid MongoDB username string.

- **password:**
  - **Definition:** The password used for authentication with the MongoDB instance.
  - **Used:** Provided securely via a variable.
  - **Available:** A secure password string that meets Azure password complexity requirements:
    * Minimum 12 characters
    * At least one uppercase letter, one lowercase letter, one digit, and one special character.

- **version_mongodb:**
  - **Definition:** The version of MongoDB to be deployed.
  - **Used:** `6.0`
  - **Available:** Other versions may be used, such as `5.0`, `4.4`, etc.

- **storage_size_in_gb:**
  - **Definition:** The amount of storage allocated to the MongoDB database.
  - **Used:** `128 GB`
  - **Available:** Different storage sizes available depending on the compute tier selected.

- **public_network_access:**
  - **Definition:** Controls whether the MongoDB instance can be accessed from the public network.
  - **Used:** `Enabled`
  - **Available:**
    1. **Enabled:** Allows public internet access.
    2. **Disabled:** Restricts access to private networks.

- **high_availability_mode:**
  - **Definition:** Determines if high availability (HA) is enabled for MongoDB replication across regions.
  - **Used:** `Disabled`
  - **Available:**
    1. **Enabled:** Multi-region replication for high availability.
    2. **Disabled:** Single-region setup for less redundancy.

---

## **Requirements**

* **Terraform version:** >= 1.0.0
* **AzureRM Provider version:** >= 3.0
* **Azure CLI:** Must be installed and authenticated (`az login`)
* **MongoDB Password:** Must be securely provided through the `terraform.tfvars` file or environment variables
