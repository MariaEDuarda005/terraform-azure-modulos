variable "name_app_service_plan" {
  description = "The name of the Azure App Service Plan."
  type        = string
  validation {
    condition     = length(var.name_app_service_plan) > 0
    error_message = "App Service Plan name cannot be empty."
  }
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the App Service Plan will be created."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource Group name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "The location for the Resource Group and App Service Plan."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "Resource Group location cannot be empty."
  }
}

variable "os_type" {
  description = "The operating system type for the App Service Plan. Can be either 'Linux' or 'Windows'."
  type        = string
  default     = "Linux"
  validation {
    condition     = length(var.os_type) > 0
    error_message = "The os_type cannot be empty and must be either 'Linux' or 'Windows'."
  }
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., 'B1', 'P1v2')."
  type        = string
  validation {
    condition     = length(var.sku_name) > 0
    error_message = "SKU name cannot be empty."
  }
}

variable "tags" {
  description = "Tags to be applied to the App Service Plan."
  type        = map(string)
  default     = {}
}
