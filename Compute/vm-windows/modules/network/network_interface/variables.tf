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

variable "subnet_id" {
  description = "The id of the subnet."
  type        = string
  validation {
    condition     = length(var.subnet_id) > 0
    error_message = "The subnet ID cannot be empty."
  }
}

variable "name_nic" {
  description = "The name of the network interface."
  type        = string
  default     = "terraform-nic"
  validation {
    condition     = length(var.name_nic) > 0
    error_message = "The network interface name cannot be empty."
  }
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration."
  type        = string
  default     = "internal"
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the private IP address."
  type        = string
  default     = "Dynamic"
}
