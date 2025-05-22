# Application Insights
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

## **Overview**
This module provisions **Azure Application Insights** along with its associated **Log Analytics Workspace** and the **Azure Resource Group**. Application Insights is an Azure service for monitoring and diagnosing application performance issues, providing deep insights into your applications, enabling easy integration with various programming languages and platforms.

> The **Application Insights** service is ideal for tracking the health and performance of your web and mobile applications, allowing real-time telemetry and debugging in a production environment.

---

## **Stack**

- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm` (Azure Provider)
- **Application Type:** Web, Mobile, or other specified types

---

## **Tiers Definition**

### **Log Analytics Workspace**
#### **log_sku**

- **Definition:** The SKU of the Log Analytics workspace. Defines the tier and features of the workspace.
- **Used:** PerGB2018
- **Available:**
  1. **PerGB2018:** Pay-as-you-go model based on the data volume ingested.
  2. **PerNode:** For nodes-based billing.
  3. **Premium, Standard, Standalone, Unlimited, CapacityReservation, LACluster:** Various other Tiers Definition for different scaling and performance needs.

### **Application Insights**
#### **application_type**

- **Definition:** Defines the type of application being monitored by Application Insights.
- **Used:** web
- **Available:**
  1. **web**: For web applications (default).
  2. **ios**: For iOS mobile applications.
  3. **java**: For Java-based applications.
  4. **MobileCenter**: For apps using Mobile Center.
  5. **Node.JS**: For Node.js applications.
  6. **other**: For other application types.
  7. **phone**: For mobile phone applications.
  8. **store**: For store-based apps.

## **Settings**

### **Log Analytics Workspace**
#### **retention_in_days**

- **Definition:** Defines the retention period for logs in the Log Analytics workspace.
- **Used:** 30
- **Available:** Between **30 and 730 days**, depending on the desired log retention.

## **Requirements**

- **Terraform version:** >= 1.10.5. Ensure Terraform is installed and at the required version.
- **Terraform Provider:** azurerm version 4.19.0. Use the azurerm provider for Azure resources.
- **Azure CLI version:** Ensure Azure CLI is installed and authenticated with the correct subscription. Authenticate with `az login`.
- **Azure Subscription:** Ensure your Azure subscription has sufficient permissions to create and manage resources.
- **Log Analytics Workspace:** Automatically created as part of the provisioning process.