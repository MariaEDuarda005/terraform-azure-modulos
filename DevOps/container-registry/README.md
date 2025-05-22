# Container Registry
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

## **Overview**
This module provisions an **Azure Container Registry (ACR)** under the **Container Registry** service, enabling storage and management of private Docker container images. The registry is integrated with Azure services for seamless deployments and image management in containerized applications.

> The **Container Registry** provides a secure and scalable way to store and manage container images for applications that run on Azure or in on-premises environments.

---

## **Stack**

* **Infrastructure Manager:** Terraform
* **Provider:** `azurerm` (Azure Provider)
* **Container Registry SKU:** Basic, Standard, or Premium
* **Monitoring Integration:** Azure Monitor (optional, can be added)

---

## **Tiers Definition**


- **sku:**  
  - **Definition:** Defines the pricing tier for the container registry, balancing cost and performance.  
  - **Used:** Basic  
  - **Available:**  
    1. **Basic:** For testing and development, with limited resources and low cost.  
    2. **Standard:** For production use, offering a balance between cost and performance.  
    3. **Premium:** For enterprise environments, offering high performance and advanced features.


---

## **Settings**

- **admin_enabled:**  
  - **Definition:** Enables or disables the admin user for the container registry.  
  - **Used:** true  
  - **Available:**  
    1. **true:** The admin user is enabled and can manage the registry.  
    2. **false:** The admin user is disabled (default setting).

---

## **Requirements**

* **Terraform version:** >= 1.10.5. Ensure Terraform is installed and at the required version.
* **Terraform Provider:** azurerm version 4.19.0. Use the azurerm provider for Azure resources.
* **Azure CLI version:** Ensure Azure CLI is installed and authenticated with the correct subscription. Authenticate with `az login`.
* **Azure Subscription:** Ensure your Azure subscription has sufficient permissions to create and manage resources.
* **Azure Container Registry:** No need for pre-existing registry, as it is created by Terraform.