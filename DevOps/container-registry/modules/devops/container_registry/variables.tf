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

variable "resource_group_tags" {
  description = "The Resource Group tags."
  type        = map(string)
  validation {
    condition     = length(var.resource_group_tags) > 0
    error_message = "The Resource Group tags cannot be empty."
  }
}

variable "container_registry_name" {
  description = "The Container Registry name."
  type        = string
  validation {
    condition     = length(var.container_registry_name) > 0
    error_message = "The Container Registry name cannot be empty."
  }
}

variable "container_registry_sku" {
  description = "The Container Registry sku."
  type        = string
  default     = "Basic"
  validation {
    condition     = length(var.container_registry_sku) > 0
    error_message = "The Container Registry sku cannot be empty."
  }
}

variable "admin_enabled" {
  description = "The admin enabled of the container registry"
  type        = bool
}