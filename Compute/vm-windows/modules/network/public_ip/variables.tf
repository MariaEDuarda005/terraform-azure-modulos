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
  description = "The name of the public ip"
  type        = string
  validation {
    condition     = length(var.name_public_ip) > 0
    error_message = "The public IP name cannot be empty."
  }
}

variable "allocation_method" {
  description = "Public IP allocation method"
  type        = string
  validation {
    condition     = length(var.allocation_method) > 0
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

variable "domain_name_label" {
  description = "Label for the Domain Name"
  type = string
  validation {
    condition = length(var.domain_name_label) > 0
    error_message = "The label for the domain name cannot be empty"
  }
}

variable "domain_name_label_scope" {
  description = "Scope for the domain name label"
  type = string
  validation {
    condition = length(var.domain_name_label_scope) > 0
    error_message = "The scope for the domain name label cannot be empty and must be either 'NoReuse', 'ResourceGroupReuse', 'SubscriptionReuse' and 'TenantReuse'"
  }
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}