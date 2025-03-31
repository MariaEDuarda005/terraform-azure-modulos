variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "name_vnet" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "The dns servers of the virtual network"
  type        = list(string)
}

variable "tags" {
  description = "Tags to be used"
  type        = map(string)
  default     = {}
}