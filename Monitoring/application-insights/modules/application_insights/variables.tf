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

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace."
  type        = string
  validation {
    condition     = length(var.log_analytics_workspace_id) > 0
    error_message = "The Log Analytics Workspace ID cannot be empty."
  }
}

variable "application_type" {
  description = "The type of application."
  type        = string
  validation {
    condition     = length(var.application_type) > 0
    error_message = "The application type cannot be empty."
  }
}