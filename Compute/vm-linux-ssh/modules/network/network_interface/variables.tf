variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The Resource Group name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The Resource Group location cannot be empty."
  }
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
  validation {
    condition     = length(var.subnet_id) > 0
    error_message = "The Id of the subnet cannot be empty."
  }
}

variable "network_interface_name" {
  description = "The name of the network interface."
  type        = string
  default     = "example-nic"
  validation {
    condition     = length(var.network_interface_name) > 0
    error_message = "The Name of the network interface cannot be empty"
  }
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration."
  type        = string
  default     = "internal"
  validation {
    condition     = length(var.ip_configuration_name) > 0
    error_message = "The IP configuration name cannot be empty"
  }
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the private IP address."
  type        = string
  default     = "Dynamic"
  validation {
    condition     = length(var.private_ip_address_allocation) > 0
    error_message = "The allocation method for the private IP address cannot be empty"
  }
}
