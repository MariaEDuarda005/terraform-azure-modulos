variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "name_network_security" {
  description = "The name of the network security group"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = string
}

# variable "network_security_group_id" {
#   description = "The ID of the network security group"
#   type        = string
# }

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}

variable "name_rule" {
  description = "The name of the network security rule"
  type        = string
}

variable "priority" {
  description = "The priority of the network security rule"
  type        = number
}

variable "direction" {
  description = "The direction of the network security rule (Inbound/Outbound)"
  type        = string
}

variable "access" {
  description = "The access type of the network security rule (Allow/Deny)"
  type        = string
}

variable "protocol" {
  description = "The protocol of the network security rule (e.g., Tcp, Udp)"
  type        = string
}

variable "source_port_range" {
  description = "The source port range for the network security rule"
  type        = string
}

variable "destination_port_range" {
  description = "The destination port range for the network security rule"
  type        = string
}

variable "source_address_prefix" {
  description = "The source address prefix for the network security rule"
  type        = string
}

variable "destination_address_prefix" {
  description = "The destination address prefix for the network security rule"
  type        = string
}
