output "resource_group_name" {
  description = "Resource group name"
  value       = module.azurerg.resource_group_name
}

output "virtual_network_id" {
  description = "ID da Virtual Network"
  value       = module.virtual_network.vnet_id
}

output "subnet_ids" {
  description = "IDs das Subnets"
  value       = module.virtual_network.subnet_ids
}

output "network_security_group_id" {
  description = "ID do Network Security Group"
  value       = module.network_security.nsg_id
}

output "public_ip_address" {
  description = "Endereço IP Público"
  value       = module.public_ip.id
}

output "network_interface_id" {
  description = "ID da Network Interface"
  value       = module.network_interface.network_interface_id
}

output "virtual_machine_id" {
  description = "ID da Virtual Machine"
  value       = module.virtual_machine.id
}
