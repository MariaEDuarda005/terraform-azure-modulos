output "id" {
  description = "The ID of the virtual machine"
  value       = azurerm_windows_virtual_machine.main.id
}

output "name" {
  description = "The name of the virtual machine"
  value       = azurerm_windows_virtual_machine.main.name
}