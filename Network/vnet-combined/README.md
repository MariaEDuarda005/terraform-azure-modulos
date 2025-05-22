# **Virtual Network**

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge\&logo=azure-devops\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge\&logo=apachemaven\&logoColor=white)

## **Overview**
This module provisions an **Azure Virtual Network (VNet)** with support for custom address spaces, DNS settings, and multiple subnets. It enables private and secure communication between Azure resources, forming the core of a cloud-based network topology.

> The **Virtual Network** service in Azure allows you to define and control your private network in the cloud, similar to a traditional on-premises network, with full IP address control, DNS integration, and subnet configuration.

---

## **Stack**
- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm` (Azure Provider)
- **Network Type:** IPv4 private address space with optional custom DNS
- **Subnet Support:** Multiple subnet blocks

---

## **Settings**

### **Virtual Network**

- **address_space**

    - **Definition:** The address space allocated to the virtual network in CIDR notation.
    - **Used:** ["10.0.0.0/16"]
    - **Available:** One or more IPv4 ranges, e.g., `["10.0.0.0/16"]`. Must not overlap with other VNets in the same region or peered networks.

- **dns_servers**

    - **Definition:** Custom DNS server IP addresses to be used by resources in the VNet.
    - **Used:** ["8.8.8.8", "8.8.4.4"]
    - **Available:** A list of valid IPv4 addresses. If omitted, Azure’s default DNS is used.

### **Subnets**

Each subnet within the VNet is defined with a name and its corresponding address prefix.

- **subnets**

    - **Definition:** A list of subnet objects, each specifying a `name` and an array of `address_prefixes`.
    - **Used:**
        * `frontend` → ["10.0.1.0/24"]
        * `backend` → ["10.0.2.0/24"]
    - **Available:** Any valid IPv4 subnet range within the parent `address_space`. Must not overlap between subnets.

---

## **Requirements**

- **Terraform version:** >= 1.10.5. Ensure Terraform is installed and up to date.
- **Terraform Provider:** azurerm version 4.19.0
- **Azure CLI version:** Ensure Azure CLI is installed and authenticated (`az login`).
- **Azure Subscription:** Appropriate permissions are required to create and manage virtual networks.