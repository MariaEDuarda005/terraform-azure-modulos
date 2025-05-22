# **Log Analytics Setup**

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge\&logo=azure-devops\&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge\&logo=apachemaven\&logoColor=white)

## **Overview**

This module provisions an **Azure Log Analytics Workspace** under the **Azure Monitor** service, which allows you to collect, analyze, and act on telemetry data from your Azure resources. Log Analytics provides powerful query capabilities for log data, helping you track resource health, diagnose issues, and gather insights for monitoring your cloud environment.

> **Log Analytics** enables detailed insights into the operation and performance of resources, integrated with other Azure services like **Application Insights** and **Azure Security Center** for a comprehensive monitoring solution.

---

## **Stack**

- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm` (Azure Provider)

---

## **Tiers Definition**

### **log_sku**

- **Definition:** The SKU of the Log Analytics workspace. Defines the tier and features of the workspace.
- **Used:** PerGB2018
- **Available:**
  1. **PerGB2018:** Pay-as-you-go model based on the data volume ingested.
  2. **PerNode:** For nodes-based billing.
  3. **Premium, Standard, Standalone, Unlimited, CapacityReservation, LACluster:** Various other Tiers Definition for different scaling and performance needs.


## **Settings**

### **retention_in_days**

- **Definition:** Defines the retention period for logs in the Log Analytics workspace.
- **Used:** 30
- **Available:** Between **30 and 730 days**, depending on the desired log retention.

---

## **Requirements**

- **Terraform version:** >= 1.10.5. Ensure Terraform is installed and at the required version.
- **Terraform Provider:** azurerm version 4.19.0. Use the azurerm provider for Azure resources.
- **Azure CLI version:** Ensure Azure CLI is installed and authenticated with the correct subscription. Authenticate with `az login`.
- **Azure Subscription:** Ensure your Azure subscription has sufficient permissions to create and manage resources.
- **Log Analytics Workspace:** Automatically created as part of the provisioning process.