output "id_security" {
  description = "The ID of the network security group"
  value       = module.network_security.id
}

output "id_public_ip" {
  description = "The ID of the public IP"
  value       = module.public_ip.id
}

output "id_subnet" {
  description = "The ID of the subnet"
  value       = module.subnet.id
}

output "id_vnet" {
  description = "The ID of the virtual network"
  value       = module.virtual_network.id
}

output "name_vnet" {
  description = "The name of the virtual network"
  value       = module.virtual_network.name
}

output "id_vm" {
  description = "The ID of the virtual machine"
  value       = module.virtual_machine.id
}

output "name_vm" {
  description = "The name of the virtual machine"
  value       = module.virtual_machine.name
}