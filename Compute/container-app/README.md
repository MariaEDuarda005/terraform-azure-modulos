# Container App
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

### **Overview**

This module provisions an **Azure Container App** resource under the **Compute** category, enabling the execution of containerized applications with automatic scaling, simplified management, and native Azure observability integration.

> The Container App runs in a managed Azure environment, ideal for microservices and applications that need to scale based on events, without the complexity of orchestrators like Kubernetes.

--- 

### **Stack**
- **Operating System:** Linux (container-based)
- **Supported Stack:** Docker (public or private image)
- **Infrastructure Manager:** Terraform
- **Provider:** `azurerm` (Azure Provider)
- **Monitoring Integration:** Log Analytics

---

## Tiers Definition

### Log Analytics Workspace

- **sku**  
    - **Definition:** Defines the pricing tier for the Log Analytics workspace. It determines how data is billed and processed.  
    - **Used:** PerGB2018  
    - **Available:**  
        1. **PerGB2018:** Pay-as-you-go model based on data volume ingested, most commonly used.  
        2. **Free:** Limited daily data ingestion (up to 500 MB/day), basic for testing or small-scale use.  
        3. **Standalone:** Legacy SKU, used in specific licensing agreements or dedicated capacity scenarios (less common).  


### Container App
- **workload_profile_type**  
    - **Definition:** Defines the type of workload profile for the container app, determining how resources are allocated and the scaling behavior.  
    - **Used:** Consumption  
    - **Available:**  
        1. **Consumption:** Serverless, scales automatically based on demand, and you're billed for actual consumption of resources (CPU, memory, etc.).
            - **CPU:** Scales dynamically with demand. You can set a minimum and maximum limit for CPU allocation (e.g., from 0.25 vCPU to 2.0 vCPU), but the exact allocation will be based on the workload.  
            - **Memory:** Similarly, memory is allocated dynamically, with possible values ranging from **0.5 Gi to 16 Gi**.  
            - **Billing:** Billed for actual consumption of resources (CPU and memory).    
        2. **Premium:** Offers dedicated resources, better control over scaling, and more predictable performance, suitable for larger or more consistent workloads.
            - **CPU:** Dedicated resources, with more control over the exact number of CPUs allocated. Possible values for CPU range from **0.25 vCPU to 4.0 vCPU**, with flexibility in setting the precise amount of CPU.  
            - **Memory:** Similarly, memory is allocated as **dedicated resources**, and possible values range from **0.5 Gi to 16 Gi** (or higher depending on the plan).  
            - **Billing:** Billed based on fixed, dedicated resources, regardless of usage.

---

## Settings

### Log Analytics Workspace

- **retention_in_days**  
    - **Definition:** Number of days that the collected logs and data are retained in the workspace before automatic deletion.  
    - **Used:** 30  
    - **Available:**  
        1. Ranges from **30 to 730 days** for `PerGB2018`.
        2. Fixed at **7 days**, non-configurable for `Free`.
        3. Custom depending on specific contract/legacy agreement for `Standalone`.

### Container App

- **revision_mode**  
    - **Definition:** Specifies how revisions of the app are managed.  
    - **Used:** Single  
    - **Available:**  
        1. **Single:** A single revision is in operation at any given time.
        2. **Multiple:** More than one revision can be active at a time and can be configured with load distribution via the traffic_weight block in the ingress configuration.

- **cpu**  
    - **Definition:** Specifies the amount of CPU allocated to the container.  
    - **Used:** 1.25 vCPU  
    - **Available:**  
        1. Possible values: 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, and 2.0.
        2. When a workload profile is specified, there is no such constraint on the CPU allocation.
        > NOTE: CPU and memory must be specified in compatible increments (e.g., 1.0 vCPU and 2.0 Gi memory, or 0.5 vCPU and 1.0 Gi memory).

- **memory**  
    - **Definition:** Specifies the memory allocated to the container.  
    - **Used:** 2.5 Gi  
    - **Available:**  
        1. Possible values: 0.5 Gi, 1.0 Gi, 1.5 Gi, 2.0 Gi, 2.5 Gi, 3.0 Gi, 3.5 Gi, 4.0 Gi, etc.
        > NOTE: Memory and CPU must be specified in compatible increments (e.g., 1.0 vCPU and 2.0 Gi memory, or 0.5 vCPU and 1.0 Gi memory).

- **port**  
    - **Definition:** The port on which the container listens for incoming traffic.  
    - **Used:** 80  
    - **Available:**  
        - Any valid port number **(1 to 65535)**, commonly used is 80 for HTTP traffic or 443 for HTTPS.

- **transport**  
    - **Definition:** The protocol used for container communication.  
    - **Used:** HTTPS  
    - **Available:**  
        1. **HTTP**  
        2. **HTTPS**
        3. **TCP**

- **min_replicas**  
    - **Definition:** The minimum number of container instances to maintain.  
    - **Used:** 1  
    - **Available:**  
        - **1 to 100 replicas**, depending on workload scaling requirements.

- **max_replicas**  
    - **Definition:** The maximum number of container replicas allowed for scaling.  
    - **Used:** 2  
    - **Available:**  
        - **1 to 100 replicas**, based on the maximum load expected and scaling settings.

- **container_ip_restriction_action**  
    - **Definition:** Specifies the action taken when an IP restriction is applied.  
    - **Used:** Allow  
    - **Available:**  
        1. **Allow:** Grants access to the specified IP range.  
        2. **Deny:** Denies access to the specified IP range.

- **container_ip_restriction_range**  
    - **Definition:** The IP range allowed or denied by the restriction.  
    - **Used:** 0.0.0.0/0  
    - **Available:**  
        1. Any valid **CIDR range** (e.g., **192.168.1.0/24**, **0.0.0.0/0** for global access).


---

## Requirements

- **Terraform version:** >= 1.10.5. Ensure Terraform is installed and at the required version.
- **Terraform Provider:** azurerm version 4.19.0. Use the azurerm provider for Azure resources.
- **Azure CLI version:** Ensure Azure CLI is installed and authenticated with the correct subscription. Authenticate with az login.
- **Azure Subscription:** Ensure your Azure subscription has sufficient permissions to create and manage resources.
- **Docker image:** Available in a public or private container registry (e.g., Azure Container Registry or Docker Hub).