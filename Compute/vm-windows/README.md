# Virtual Machine (Windows – Username/Password)

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D7?style=for-the-badge\&logo=microsoftazure\&logoColor=white)
![Windows](https://img.shields.io/badge/Windows%20Server-CE3B33?style=for-the-badge\&logo=windows\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

---

## **Overview**

This module provisions a **Windows Virtual Machine** on Azure using **username and password authentication**. It includes full networking setup with a dedicated virtual network, subnet, network interface, and public IP address.

> Ideal for environments that require RDP access to Windows-based servers or applications.

---

## **Stack**

* **Operating System:** Windows Server 2016 Datacenter
* **Authentication Method:** Username & Password
* **Infrastructure Manager:** Terraform
* **Provider:** `azurerm` (Azure Provider)
* **Network Resources:** VNet, Subnet, NSG, Public IP

---

## Tiers Definition Definition
### Virtual Machine - Windows

* **size:**

  * **Definition:** Defines the virtual machine size, including vCPUs and RAM.
  * **Used:** `Standard_F2`
  * **Available:**

    1. **Standard\_F1:** 1 vCPU, 2 GB RAM — Entry-level, basic workloads
    2. **Standard\_F2:** 2 vCPUs, 4 GB RAM — Balanced option for dev/test
    3. **Standard\_B2s:** 2 vCPUs, 4 GB RAM — Economical burstable VMs
    4. **Standard\_D2s\_v3:** 2 vCPUs, 8 GB RAM — General purpose with better IOPS

* **storage\_account\_type:**

  * **Definition:** Specifies the storage performance and redundancy level for the VM’s OS disk.
  * **Used:** `Standard_LRS`
  * **Available:**

    1. **Standard\_LRS:** HDD-based, locally redundant storage (cost-effective)
    2. **Premium\_LRS:** SSD-based, locally redundant storage (high performance)

---

## Settings

### Virtual Machine - Windows

- **admin_username:**
  - **Definition:** Administrator username for logging into the Windows VM.
  - **Used:** adminuser
  - **Available:** Any valid Windows username string (avoid reserved names like `admin`, `administrator`, `root`, etc.)

- **admin_password:**
  - **Definition:** Administrator password used for login.
  - **Used:** Provided securely via variable
  - **Available:** Must meet Azure password complexity requirements:
    - Minimum 12 characters
    - At least one uppercase letter, one lowercase letter, one digit, and one special character

- **publisher / offer / sku / version_image:**
  - **Definition:** Defines the image used to deploy the VM.
  - **Used:**
    1. **Publisher:** `MicrosoftWindowsServer`
    2. **Offer:** `WindowsServer`
    3. **Sku:** `2016-Datacenter`
    4. **Version:** `latest`
  - **Available:**
    - Various combinations available in Azure Marketplace.
    - Common options include `2016-Datacenter`, `2019-Datacenter`, `2022-Datacenter` under the same publisher/offer.

- **caching:**
  - **Definition:** Determines the caching mode of the OS disk.
  - **Used:** `ReadWrite`
  - **Available:**
    1. `None`
    2. `ReadOnly`
    3. `ReadWrite`

- **domain_name_label & allocation_method:**
  - **Definition:** Used to configure a DNS label for the public IP and how it's allocated.
  - **Used:**
    1. `domain_name_label`: Unique label based on VM name
    2. `allocation_method`: `Static`
  - **Available:**
    1. `Static` – Public IP remains constant
    2. `Dynamic` – Public IP may change when the VM is deallocated

---

## Requirements

* **Terraform version:** >= 1.0.0
* **AzureRM Provider version:** >= 3.0
* **Azure CLI:** Must be installed and authenticated (`az login`)
* **RDP Client:** Needed to access the VM