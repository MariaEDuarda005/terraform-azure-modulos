variable "name_server_postgresql" {
  description = "The name of the PostgreSQL Flexible Server."
  type        = string
  validation {
    condition     = length(var.name_server_postgresql) > 0
    error_message = "The PostgreSQL server name cannot be empty."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "The geographical location where the resource group will be created."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The resource group location cannot be empty."
  }
}

variable "admin_login" {
  description = "The admin username for the PostgreSQL server."
  type        = string
  validation {
    condition     = length(var.admin_login) > 0
    error_message = "The admin login cannot be empty."
  }
}

variable "admin_password" {
  description = "The password for the PostgreSQL admin user."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.admin_password) >= 12
    error_message = "The admin password must be at least 12 characters long."
  }
}

variable "version_server" {
  description = "The PostgreSQL version to use."
  type        = string
  validation {
    condition     = length(var.version_server) > 0
    error_message = "PostgreSQL version cannot be empty."
  }
}

variable "zone" {
  description = "The availability zone to use for the server."
  type        = string
  validation {
    condition     = length(var.zone) > 0
    error_message = "The availability zone cannot be empty."
  }
}

variable "sku_name" {
  description = "The SKU name for the PostgreSQL server (e.g., Standard_B1ms)."
  type        = string
  validation {
    condition     = length(var.sku_name) > 0
    error_message = "The SKU name cannot be empty."
  }
}

variable "storage_mb" {
  description = "The amount of storage in MB."
  type        = number
  validation {
    condition     = var.storage_mb > 0
    error_message = "The storage size must be greater than 0."
  }
}

variable "backup_retention_days" {
  description = "Number of days to retain backups."
  type        = number
  validation {
    condition     = var.backup_retention_days > 0
    error_message = "Backup retention days must be greater than 0."
  }
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backups."
  type        = bool
}

variable "public_network_access_enabled" {
  description = "Enable or disable public network access."
  type        = bool
}

variable "active_directory_auth_enabled" {
  description = "Enable or disable Active Directory authentication."
  type        = bool
}

variable "password_auth_enabled" {
  description = "Enable or disable password authentication."
  type        = bool
}

variable "auto_grow_enabled" {
  description = "Enable or disable auto-grow for storage."
  type        = bool
}

variable "storage_tier" {
  description = "Storage performance tier (e.g., P4, P6)."
  type        = string
  validation {
    condition     = length(var.storage_tier) > 0
    error_message = "The storage tier cannot be empty."
  }
}

variable "tags" {
  description = "Tags to associate with the server."
  type        = map(string)
  default     = {}
}
