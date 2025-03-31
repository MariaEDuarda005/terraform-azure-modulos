output "id" {
  description = "ID the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "public_ip" {
  description = "VM Public IP Address"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

