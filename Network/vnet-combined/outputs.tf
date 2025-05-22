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

# Virtual Network
output "subnet_ids" {
  description = "The IDs of the subnets in the virtual network."
  value       = module.virtual_network.subnet_ids
}

output "vnet_id" {
  description = "The ID of the virtual network."
  value       = module.virtual_network.vnet_id
}