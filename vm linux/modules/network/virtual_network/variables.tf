variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

# variable "name_security" {
#   description = "The name of the network security group"
#   type        = string
# }

variable "name_virtual_network" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "List of DNS servers to use with the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnets to create within the virtual network."
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}