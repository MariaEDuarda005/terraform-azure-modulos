variable "resource_group_name" {
  description = "The Resource Group name."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The Resource Group name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "The Resource Group location."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The Resource Group location cannot be empty."
  }
}

variable "container_registry_name" {
  description = "The Container Registry name."
  type        = string
  validation {
    condition     = length(var.container_registry_name) >= 5 && length(var.container_registry_name) <= 50
    error_message = "Container Registry name must be between 5 and 50 characters."
  }
}

variable "sku" {
  description = "The Container Registry sku."
  type        = string
  default     = "Basic"
  validation {
    condition     = length(var.sku) > 0
    error_message = "The Container Registry sku cannot be empty."
  }
}

variable "admin_enabled" {
  description = "The admin enabled of the container registry"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}
