variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name cannot be empty."
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

variable "name_public_ip" {
  description = "The name of the public IP"
  type        = string
  validation {
    condition     = length(var.name_public_ip) > 0
    error_message = "The public IP name cannot be empty."
  }
}

variable "allocation_method_id" {
  description = "The allocation method for the public IP"
  type        = string
  validation {
    condition     = length(var.allocation_method_id) > 0
    error_message = "The allocation method must be either 'Static' or 'Dynamic'"
  }
}

variable "sku" {
  description = "The type of the sku"
  type        = string
  default     = "Standard"
  validation {
    condition     = length(var.sku) > 0
    error_message = "The sku must be either 'Standard' or 'Basic'"
  }
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}