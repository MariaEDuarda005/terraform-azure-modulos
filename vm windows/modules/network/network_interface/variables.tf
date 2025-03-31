variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "name_nic" {
  description = "The name of the network interface"
  type        = string
}

variable "name_ip_config" {
  description = "The name of the private ip configuration"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the network interface"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The type of the private ip address allocation"
  type        = string
}