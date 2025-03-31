output "subnet_ids" {
  description = "The IDs of the subnets in the virtual network."
  value       = [for s in azurerm_virtual_network.vnet.subnet : s.id]
}

# output "nsg_id" {
#   description = "The ID of the network security group."
#   value       = azurerm_network_security_group.nsg.id
# }

output "vnet_id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}