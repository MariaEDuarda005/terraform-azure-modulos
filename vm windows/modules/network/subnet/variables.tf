variable "name_subnet" {
  description = "The name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "name_virtual_network" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes of the virtual network."
  type        = list(string)
}