# Resource Group
output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.azurerg.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group."
  value       = module.azurerg.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = module.azurerg.resource_group_id
}

# Virtual machine
output "id_virtual_machine" {
  description = "The ID of the virtual machine"
  value       = module.virtual_machine.id
}

output "name_virtual_machine" {
  description = "The name of the virtual machine"
  value       = module.virtual_machine.name
}

# Network Interface
output "id_network_interface" {
  description = "The ID of the network interface"
  value       = module.network_interface.id
}

# Network Security
output "id_network_security" {
  description = "The ID of the network security group"
  value       = module.network_security.id
}

# Public IP
output "id_public_ip" {
  description = "The ID of the public IP"
  value       = module.public_ip.id
}

# Virtual Network
output "name_vnet" {
  description = "The name of the virtual network"
  value       = module.virtual_network.name_vnet
}

output "subnet_ids" {
  description = "The IDs of the subnets in the virtual network."
  value       = module.virtual_network.subnet_ids
}

output "vnet_id" {
  description = "The ID of the virtual network."
  value       = module.virtual_network.vnet_id
}