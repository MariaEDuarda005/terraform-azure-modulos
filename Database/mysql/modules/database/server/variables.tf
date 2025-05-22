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

variable "name_server_mysql" {
  description = "The name of the MySQL server."
  type        = string
  validation {
    condition     = length(var.name_server_mysql) > 0
    error_message = "The MySQL server name cannot be empty."
  }
}

variable "administrator_login" {
  description = "The administrator login for the MySQL server."
  type        = string
  validation {
    condition     = length(var.administrator_login) > 0
    error_message = "The administrator login cannot be empty."
  }
}

variable "administrator_password" {
  description = "The administrator password for the MySQL server."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.administrator_password) > 0
    error_message = "The administrator password cannot be empty."
  }
}

variable "sku_name_server" {
  description = "The SKU name for the MySQL server."
  type        = string
  validation {
    condition     = length(var.sku_name_server) > 0
    error_message = "The SKU name for the MySQL server cannot be empty."
  }
}

variable "version_mysql" {
  description = "The version of MySQL to use."
  type        = string
  default     = "8.0.21"
  validation {
    condition     = length(var.version_mysql) > 0
    error_message = "The MySQL version must be specified."
  }
}

variable "storage_size" {
  description = "The size of the storage in GB."
  type        = number
  default     = 40 # GB
  validation {
    condition     = var.storage_size > 0
    error_message = "The storage size must be greater than 0."
  }
}