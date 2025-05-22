variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name must not be empty."
  }
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string

  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The location group must not be empty."
  }
}

variable "nsg_name" {
  description = "The name of the network security group."
  type        = string

  validation {
    condition     = length(var.nsg_name) > 0
    error_message = "The network security group name must not be empty."
  }
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}

variable "network_interface_id" {
  description = "The ID of the network interface."
  type        = string

  validation {
    condition     = can(regex("^/subscriptions/.+/resourceGroups/.+/providers/Microsoft.Network/networkInterfaces/.+$", var.network_interface_id))
    error_message = "The network interface ID must follow the Azure resource ID format."
  }
}

variable "subnet_ids" {
  description = "The ID of the subnet"
  type        = string
  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "The Id of the subnet cannot be empty."
  }
}

