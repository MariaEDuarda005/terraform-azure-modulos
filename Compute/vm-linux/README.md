# **Linux Virtual Machine**

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge\&logo=azure-devops\&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-000000?style=for-the-badge\&logo=linux\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge\&logo=apachemaven\&logoColor=white)

## **Overview**
This module provisions a **Linux Virtual Machine** in Azure, including its associated network infrastructure: Virtual Network, Subnet, Public IP, Network Interface, and Network Security Group. It supports secure password authentication, automatic IP assignment, and uses Ubuntu Server as the base image.

> This VM setup is ideal for development, testing, or small production workloads that require SSH access and public connectivity with defined security policies.

---

## **Stack**

- **OS:** Ubuntu 22.04 LTS
- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm`
- **Access:** Password and username

## **Tiers Definition Definition**

- **size**
    - **Definition:** Specifies the VM SKU, which determines the number of vCPUs, RAM, and network performance.
    - **Used:** `Standard_F2`
    - **Available:** All [Azure VM Sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes) (e.g., B-series, D-series, F-series)

- **storage_account_type**
    - **Definition:** Specifies the type of disk storage used.
    - **Used:** `Standard_LRS`
    - **Available:**
        1. **Standard\_LRS:** Cost-effective, general-purpose disk
        2. **Premium\_LRS:** High-performance SSD
        3. **StandardSSD\_LRS:** Balanced SSD performance

---

## **Settings**

- **admin_username**
    - **Used:** `adminuser`
    - Must comply with Linux username rules

- **admin_password**
    - Provided via `var.admin_password`
    - Should meet Azure password complexity requirements

- **password_authentication**
    - **Used:** `false`
    - **Note:** Even though password is defined, this flag disables password login. Set to `true` to enable login via password.

- **publisher / offer / sku / version_image**
    - **OS Image:** Ubuntu Server 22.04 LTS
    - **Publisher:** `Canonical`
    - **Offer:** `0001-com-ubuntu-server-jammy`
    - **Sku:** `22_04-lts`
    - **Version:** `latest`

---

## **Network Resources Created**

- **Virtual Network:** `virtual_network_dev`
- **Subnets:** `subnet-dev-1`, `subnet-dev-2`
- **Public IP:** `terraform-public-ip`
- **Network Interface:** `terraform-ni-dev`
- **NSG:** `terraform-security-dev` (applied to NIC and subnet)

---

## **Requirements**

- **Terraform version:** >= 1.10.5
- **Terraform Provider:** azurerm >= 4.19.0
- **Azure CLI:** Must be authenticated (`az login`)
- **Admin Password:** Pass `admin_password` as a secure variable or from a secret store
- **NSG Rules:** Ensure SSH (port 22) is open if remote access is required