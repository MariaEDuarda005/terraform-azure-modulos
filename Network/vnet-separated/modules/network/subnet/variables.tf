variable "name_subnet" {
  description = "The name of the subnet."
  type        = string
  validation {
    condition     = length(var.name_subnet) > 0
    error_message = "The subnet name cannot be empty."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The Resource Group name cannot be empty."
  }
}

variable "name_virtual_network" {
  description = "The name of the virtual network."
  type        = string
  validation {
    condition     = length(var.name_virtual_network) > 0
    error_message = "The virtual network name cannot be empty."
  }
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
  validation {
    condition     = length(var.address_prefixes) > 0
    error_message = "The address prefixes for the subnet cannot be empty."
  }
}

variable "tags" {
  description = "Tags to be used for the subnet."
  type        = map(string)
  default     = {}
}
