# **Virtual Machine (Linux SSH)**

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D7?style=for-the-badge\&logo=microsoftazure\&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-000000?style=for-the-badge\&logo=linux\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

## **Overview**

This module provisions a **Linux Virtual Machine** on Azure using **SSH key authentication**. It is fully integrated into a virtual network setup and supports secure, passwordless access through a public key infrastructure.

> Ideal for production and development environments that require secure, automated SSH access without exposing password authentication.

---

## **Stack**

- **Operating System:** Ubuntu Server 22.04 LTS (Canonical)
- **Authentication Method:** SSH Public Key
- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm` (Azure Provider)
- **Network Resources:** VNet, Subnet, NSG, Public IP

---

## Tiers Definition Definition

* **size**
  * `Standard_F2` – 2 vCPUs, 4 GB RAM
  * Other options available via [Azure VM sizes documentation](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes)

- **storage_account_type**
  - **Used:** `Standard_LRS`
  - **Available:** `Standard_LRS` `Premium_LRS`, `StandardSSD_LRS` `StandardSSD_ZRS` `Premium_ZRS`.
  - **Definition:** Type of managed disk storage.

---

## Settings

### Virtual Machine

- **size**
  - **Used:** `Standard_F2`
  - **Available:** Any valid Azure VM size (`Standard_B1s`, `Standard_DS1_v2`, etc.)
  - **Definition:** Determines the number of vCPUs and memory allocated.

- **caching**
  - **Used:** `ReadWrite`
  - **Available:** `None`, `ReadOnly`, `ReadWrite`
  - **Definition:** Sets the disk caching mode for the OS disk.

- **password_authentication**
  - **Used:** `false`
  - **Definition:** Disables password-based login for security.

### SSH Authentication

- **admin_username**
  - **Used:** `adminuser`
  - **Definition:** Administrative username created on the VM.

- **username_ssh**
  - **Used:** `adminuser`
  - **Definition:** The username used for SSH login (matches `admin_username`).

- **public_key**
  - **Used:** Public key from `~/.ssh/id_rsa.pub`
  - **Definition:** The SSH public key to allow key-based login.
  - **Example (to generate):**

    ```bash
    ssh-keygen -t rsa -b 2048
    ```

> ⚠️ Ensure that the SSH key is in OpenSSH format. Keys generated with PuTTYgen must be converted before use.

### OS Image

- **publisher / offer / sku / version\_image**
  - **OS:** Ubuntu Server 22.04 LTS
  - **Publisher:** `Canonical`
  - **Offer:** `0001-com-ubuntu-server-jammy`
  - **Sku:** `22_04-lts`
  - **Version:** `latest`

---

## Requirements

* **Terraform version:** >= 1.0.0
* **AzureRM Provider version:** >= 3.0
* **Azure CLI:** Must be installed and authenticated (`az login`)
* **SSH Key Pair:** Required and must be valid.
* **Azure Subscription:** Sufficient permissions to provision network and compute resources.
