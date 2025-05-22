variable "name_log_workspace" {
  description = "The name of the Log Analytics workspace."
  type        = string
  default     = "dev-laworkspace"
  validation {
    condition     = length(var.name_log_workspace) > 0
    error_message = "The Log Analytics workspace name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The resource group location cannot be empty."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name cannot be empty"
  }
}

variable "log_sku" {
  description = "The SKU of the Log Analytics workspace."
  type        = string
  validation {
    condition     = length(var.log_sku) > 0
    error_message = "The Log Analytics SKU cannot be empty."
  }
}

variable "retention_in_days" {
  description = "The retention in days of the Log Analytics."
  type        = number
  default     = 30
  validation {
    condition     = var.retention_in_days > 0
    error_message = "The retention in days cannot be null"
  }
}