# PostgreSQL Flexible Server  
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)  
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)  
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=postgresql&logoColor=white)

---

## **Overview**

This Terraform module provisions an Azure PostgreSQL Flexible Server along with configuration options for backup, high availability, networking, storage, and authentication. It also includes optional resources for creating a database within the server and setting up firewall rules to allow public access.

---

## **Stack**

- **Supported Stack:** PostgreSQL (Flexible Server)  
- **Infrastructure Manager:** Terraform  
- **Provider:** azurerm (Azure Provider)  
- **Monitoring Integration:** Log Analytics (optional)  

---

## **Tiers Definition**

### Server Configuration

- **sku_name**  
    - **Definition:** Defines the compute and pricing tier of the PostgreSQL server.  
    - **Used:** `B_Standard_B1ms`  
    - **Available Options:**  
        1. **Burstable (B_Standard_B1ms, B2ms):**  
            - Cost-effective, suitable for dev/test or apps with bursty workloads.  
        2. **General Purpose (GP_Standard_D2s_v3, D4s_v3):**  
            - Balanced compute/memory, good for most production apps.  
        3. **Memory Optimized (MO_Standard_E2s_v3, E4s_v3):**  
            - High memory-to-vCPU ratio, great for large datasets and memory-heavy apps.  

---

## **Settings**

### **Database**

- **1. charset**
    - **Definition:** Sets how character data is encoded and stored.  
    - **Used:** `UTF8`  
    - **Available:**  
        - `UTF8`: Recommended for supporting most languages.

- **2. collation**
    - **Definition:** Defines rules for string comparison and sorting.  
    - **Used:** `en_US.utf8`  
    - **Available:**  
        - `en_US.utf8`: U.S. English (Unicode)
        - `pt_BR.utf8`: Brazilian Portuguese
        - `C`: Binary collation (fast, not locale-aware)
---

### **Server**

- **1. storage_mb**
    - **Definition:** Total allocated storage size for the PostgreSQL server (in MB).  
    - **Used:** `32768` (32 GB)  
    - **Available Examples:**  
        - `5120`: Minimum for small workloads (5 GB)  
        - `32768`: Standard for small-to-medium workloads (32 GB)  
        - `131072`: Larger workloads (128 GB)  

- **2. administrator_login**
    - **Definition:** Admin username with full DB privileges.  
    - **Used:** `adminUser`  
    - **Recommended Format:** `admin`, `psqladmin`, etc.  

- **3. administrator_password**
    - **Definition:** Password for the admin user.  
    - **Used:** Variable-based (`var.admin_password`)  
    - **Recommended Format:** Strong password with mix of upper/lowercase, numbers, and special characters (e.g. `P@ssw0rd123!`)  

- **4. version**
  - **Definition:** Specifies the PostgreSQL engine version used by the server.
  - **Used:** `16`
  - **Available:** `11`, `12`, `13`, `14`, `15`, `16`
  - **Note:** Use the latest version when possible for security and feature improvements.

- **5. auto_grow_enabled**
  - **Definition:** Enables automatic storage expansion when usage approaches capacity.
  - **Used:** `false`
  - **Available Options:**
    * `true`: Automatically scales storage
    * `false`: Fixed storage size
  - **Note:** Recommended to enable in production to avoid interruptions.

- **6. geo_redundant_backup_enabled**
  - **Definition:** Enables geo-redundant storage for backups.
  - **Used:** `false`
  - **Available Options:**
    - `true`: Backups are stored in a paired Azure region
    - `false`: Backups are stored in the same region
  - **Note:** Increases resiliency and availability in disaster scenarios.

- **7. zone**
  - **Definition:** Specifies the availability zone the server is deployed in.
  - **Used:** `"1"`
  - **Available:** `"1"`, `"2"`, `"3"` (based on region support)
  - **Note:** Useful for improving availability and aligning with zone-redundant services.

- **8. password_auth_enabled**
  - **Definition:** Enables password authentication to connect to the server.
  - **Used:** `true`
  - **Available Options:**
    - `true`: Password login enabled
    - `false`: Only Azure AD authentication enabled

- **9. active_directory_auth_enabled**
  - **Definition:** Enables Azure Active Directory authentication for PostgreSQL.
  - **Used:** `false`
  - **Available Options:**
    - `true`: Use Azure AD for login
    - `false`: Use traditional username/password only
  - **Note:** Requires additional Azure AD configuration.

---

### **Networking & Security**

- **public_network_access_enabled**
    - Enables or disables access from the public internet.
    - `true`: Accepts connections from public IPs (e.g., dev environments).
    - `false`: Requires private access (via Private Endpoint).

- **firewall_rule**
    - Creates a rule to allow traffic from specific IP ranges.
    - Example: `0.0.0.0` to `255.255.255.255` allows all (⚠️ use with caution).

---

### **Maintenance & Backup**

- **backup_retention_days**
    - **Definition:** Number of days backups are retained.  
    - **Used:** `7`  
    - **Available:** From 7 to 35 days.  

- **maintenance_window**
    - **Definition:** Custom window for automatic maintenance tasks.  
    - **Used:** `Sunday at 00:00 (UTC)`  

---

## **Requirements**

- **Terraform version:** >= 1.0.0  
- **Provider version:** `azurerm` >= 3.75.0  
- **Azure CLI:** Logged in with `az login`  
- **Azure Subscription:** Sufficient permissions to create PostgreSQL servers  
- **PostgreSQL Admin Credentials:** `administrator_login` and `administrator_password` must be defined securely