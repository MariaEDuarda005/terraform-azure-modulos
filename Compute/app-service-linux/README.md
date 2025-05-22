# App Service (Linux)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

## **Overview**

This module provisions an **App Service** resource in the **Compute** category, using the Linux operating system with support for custom **Docker containers**.

> The App Service is configured to run on a Linux hosting plan (App Service Plan), with a Docker image defined via a variable. This resource is useful for hosting web applications based on containers in Azure.

---

## **Stack**

- **Operating System:** Linux
- **Supported Stack:** Docker (custom image)
- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm` (Azure Provider)

---

## **Tiers Definition**

### Container Registry

- **sku:**  
  - **Definition:** Defines the pricing tier for the container registry, balancing cost and performance.  
  - **Used:** Basic  
  - **Available:**  
    1. **Basic:** For testing and development, with limited resources and low cost.  
    2. **Standard:** For production use, offering a balance between cost and performance.  
    3. **Premium:** For enterprise environments, offering high performance and advanced features.


### App Service Plan Linux

- **sku:**
  - **Definition:** Refers to the pricing tier and allocated resources for the App Service Plan.  
  - **Used:** Basic - B1  
  - **Available:**  
      1. `Basic`: For low to medium traffic websites, with affordable pricing.
          - B1: 1 vCPU, 1.75 GB RAM
          - B2: 2 vCPUs, 3.5 GB RAM
          - B3: 4 vCPUs, 7 GB RAM
      2. `Standard`: For applications with more traffic and scalability resources.
          - S1: 1 vCPU, 1.75 GB RAM
          - S2: 2 vCPUs, 3.5 GB RAM
          - S3: 4 vCPUs, 7 GB RAM
      3. `Premium`: For high performance needs and advanced features.
          - P1v2: 1 vCPU, 3.5 GB RAM
          - P2v2: 2 vCPUs, 7 GB RAM
          - P3v2: 4 vCPUs, 14 GB RAM
      4. `Isolated`: For highly secure and isolated environments.
          - Variable resources, with up to 16 vCPUs and 32+ GB RAM (depending on the selected instance, like I1, I2, I3).

---

## **Settings**

### App Service Linux

- **os_type:**  
  - **Definition:** Defines the operating system for the App Service Plan.  
  - **Used:** Linux  
  - **Available:**  
    1. **Linux**  
    2. **Windows**

- **docker_image_name:**
  - **Definition:** Specifies the Docker image (name:tag) to deploy.
  - **Used:** `hello-world:latest`

- **docker_registry_url:**
  - **Definition:** The URL of the Docker image registry.
  - **Used:** https://mcr.microsoft.com/v2/mcr/

- **ftps_state**:
  - **Definition**: Controls the FTPS (FTP Secure) state for the App Service.
  - **Used**: `AllAllowed`
  - **Available**: 
    1. `AllAllowed`: Allows FTPS connections from all sources.
    2. `FtpsOnly`: Allows only FTPS connections.
    3. `Disabled`: Disables FTPS.

- **file_system_level**:
  - **Definition**: Defines the level of detail for the file system logs of the App Service.
  - **Used**: `Verbose`
  - **Available**: 
    1. `None`: No logs.
    2. `Verbose`: Detailed logs.
    3. `Error`: Only errors.

- **Retention_in_days:** Specifies the number of days to retain detailed error logs.
  - **Used:** 7 days
  - **Available:** The retention period can range from 1 day to 365 days depending on your requirements.  
  
- **Retention_in_mb**: Specifies the maximum amount of space (in MB) for error log retention.
  - **Used:** 35 MB
  - **Available:** The maximum value can go up to 1000 MB (1 GB), depending on the plan and available resources.

- **always_on**:
  - **Definition**: Ensures that the app is always on, even during periods of inactivity (helps with quick wake-up times for applications).
  - **Used**: `true`
  - **Available**: `true` or `false`

- **detailed_error_messages**:
  - **Definition**: Enables detailed error messages for easier debugging.
  - **Used**: `true`
  - **Available**: `true` or `false`

### Container Registry

- **admin_enabled:**  
  - **Definition:** Enables or disables the admin user for the container registry.  
  - **Used:** `true`  
  - **Available:**  
    1. **true:** The admin user is enabled and can manage the registry.  
    2. **false:** The admin user is disabled (default setting).

---

## **Requirements**

- **Terraform version**: `>= 1.10.5`
- **Terraform Provider**: `azurerm` version `4.19.0`
- **Azure CLI version**: Ensure Azure CLI is installed and authenticated with the correct subscription.
- **App Registration**: Ensure you have an App Registration with the required permissions to operate resources within the Azure subscription. This is essential for managing resources via Terraform.
- **Authenticated Azure CLI**: Ensure that the Azure CLI is authenticated and linked to the correct subscription.
- **Docker image**: Available in an accessible Container Registry (such as Azure Container Registry).
- **Azure Subscription**: Ensure your Azure Subscription has the necessary permissions to create and manage resources.