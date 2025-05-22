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

variable "storage_account_name" {
  description = "The name of the storage account name."
  type        = string
  validation {
    condition     = length(var.storage_account_name) > 0
    error_message = "The storage account name cannot be empty."
  }
}

variable "storage_account_tier" {
  description = "The account tier of the storage account."
  type        = string
  validation {
    condition     = length(var.storage_account_tier) > 0
    error_message = "The storage account tier cannot be empty."
  }
}

variable "storage_account_replication_type" {
  description = "The account replication type of the storage account."
  type        = string
  validation {
    condition     = length(var.storage_account_replication_type) > 0
    error_message = "The storage account replication type cannot be empty."
  }
}

variable "storage_account_min_tls_version" {
  description = "The minimum TLS version required for the storage account."
  type        = string
  validation {
    condition     = length(var.storage_account_min_tls_version) > 0
    error_message = "The storage account minimum TLS version cannot be empty."
  }
}

variable "storage_account_container_name" {
  description = "The name of the first storage account container."
  type        = string
  validation {
    condition     = length(var.storage_account_container_name) > 0
    error_message = "The first storage account container name cannot be empty."
  }
}

variable "storage_account_container_access_type" {
  description = "The access type of the first storage account container."
  type        = string
  validation {
    condition     = length(var.storage_account_container_access_type) > 0
    error_message = "The first storage account container access type cannot be empty."
  }
}