# MySQL Database
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Azure DevOps](https://img.shields.io/badge/Azure_DevOps-0078D7?style=for-the-badge&logo=azure-devops&logoColor=white)
![Verified](https://img.shields.io/badge/Verified-green?style=for-the-badge&logo=apachemaven&logoColor=white)

## **Overview**

This module includes the creation of a MySQL Flexible Server with specified configuration for server settings, storage, and credentials. It also provisions a MySQL database within that server with custom charset and collation.

---
 
## **Stack**

- **Supported Stack:** MySQL (Flexible Server)
- **Infrastructure Manager:** Terraform
- **Provider:** azurerm (Azure Provider)
- **Monitoring Integration:** Log Analytics (for monitoring and observability)

---

## **Tiers Definition**

### Server DataBase

- **sku**  
    - **Definition:** he SKU Name for the MySQL Flexible Server, should start with SKU tier B (Burstable), GP (General Purpose), MO (Memory Optimized) like B_Standard_B
    - **Used:** B_Standard_B1s  
    - **Available:**  
        1. **B - Burstable SKUs (Standard_B1s, B1ms, B2ms)** 
            - **Used:** Ideal for small to medium workloads, development environments, or testing applications that don't need consistent high performance.  
        2. **G - General Purpose SKUs (Standard_D2ds_v4, Standard_D4ds_v4)** 
            - **Used:** Best for production workloads such as web servers and application servers that require steady and reliable performance.
        3. **M - Memory Optimized SKUs (Standard_E2ds_v4, Standard_E4ds_v4)** 
            - **Used:** Suitable for memory-heavy applications, such as large databases, analytics, or caching workloads.
        4. **BC - Business Critical SKUs (Standard_F4s, Standard_F8s)**    
            - **Used:** Ideal for large-scale, high-performance, and business-critical workloads where availability and performance are essential.

---

## **Settings**

### **Database**

- **1. charset**
    - **Definition:** Defines the character set to be used for the database. It determines how characters are stored in the database.
    - **Used:** `"utf8"`
    - **Available:**  
        1. **utf8:** Standard character set for UTF-8 encoded characters, supporting a wide range of characters for most languages.  
        2. **utf8mb4:** A superset of `utf8` that supports 4-byte characters, useful for storing emojis or other extended Unicode characters.  
        3. **latin1:** Western European character set for single-byte characters, suitable for legacy applications.  
        4. **ascii:** Character set for basic English characters (without accents or special characters).

- **2. collation**
    - **Definition:** Defines the rules for sorting and comparing characters in the database. It is linked to the charset and specifies the language-specific rules.
    - **Used:** `"utf8_unicode_ci"`
    - **Available:**  
        1. **utf8_unicode_ci:** Case-insensitive collation for UTF-8 characters, supporting many languages with Unicode comparison rules.  
        2. **utf8_general_ci:** Case-insensitive collation with simpler rules than `utf8_unicode_ci`.  
        3. **utf8mb4_unicode_ci:** Unicode collation for `utf8mb4`, supporting a broader range of characters.  
        4. **utf8mb4_general_ci:** A simpler collation for `utf8mb4`, case-insensitive but with fewer language-specific rules.

---

### **Server**

- **1. storage_size**
    - **Definition:** Specifies the allocated storage size (in GB) for the MySQL Flexible Server. It determines how much disk space is available for the database files and data storage.
    - **Used:** `40`
    - **Available:**  
        1. **40 GB:** Standard storage size for smaller databases or testing environments.  
        2. **50 GB:** Suitable for medium-sized databases with moderate data volume.  
        3. **100 GB:** Recommended for larger databases with high data volume.  
        4. **200 GB:** For large-scale production environments with substantial storage requirements.

- **2. administrator_login**
    - **Definition:** Defines the login name of the administrator for the MySQL Flexible Server. This user has full privileges to manage the database server.
    - **Used:** `userAdmin` 
    - **Recommended Format:** `admin`, `psqladmin`, etc. 

- **3. administrator_password**
    - **Definition:** Defines the password for the administrator login. This password should be strong and secure to ensure the protection of the database server.
    - **Used:** `var.password` (the value is passed as a variable, which could be set dynamically)
    - **Recommended Format:** Strong password with mix of upper/lowercase, numbers, and special characters (e.g. `P@ssw0rd123!`)

## **Requirements**

- **Terraform version:** >= 1.10.5. Ensure Terraform is installed and at the required version.
- **Terraform Provider:** azurerm version 4.19.0. Use the azurerm provider for Azure resources.
- **Azure CLI version:** Ensure Azure CLI is installed and authenticated with the correct subscription. Authenticate with az login.
- **Azure Subscription:** Ensure your Azure subscription has sufficient permissions to create and manage resources.
- **MySQL Username & Password:** You must define a valid username (administrator_login) and a strong password (administrator_password) for the MySQL server's administrative access.