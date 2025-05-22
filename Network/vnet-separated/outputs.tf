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

# Subnet
output "id_subnet" {
  description = "The ID of the subnet"
  value       = module.subnet.id
}

# Virtual Network
output "id_virtual_network" {
  description = "The ID of the virtual network"
  value       = module.virtual_network.id
}

output "name_virtual_network" {
  description = "The name of the virtual network"
  value       = module.virtual_network.name
}