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

variable "name_log_analytics" {
  description = "The name of the log analytics"
  type = string
  validation {
    condition = length(var.name_log_analytics) > 0
    error_message = "The name of the log analytics cannot be empty"
  }
}

variable "sku" {
  description = "The SKU of the Log Analytics Workspace (e.g., 'PerGB2018')."
  type        = string
  validation {
    condition     = length(var.sku) > 0
    error_message = "The SKU for the Log Analytics Workspace cannot be empty."
  }
}

variable "retention_in_days" {
  description = "The retention period (in days) for the Log Analytics Workspace data."
  type        = number
  validation {
    condition     = var.retention_in_days >= 0
    error_message = "Retention period must be a non-negative number."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to be used."
  default     = {}
}