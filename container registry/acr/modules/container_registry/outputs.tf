output "name" {
  description = "The name of the Azure Container Registry."
  value = azurerm_container_registry.acr.name
}

output "id" {
  description = "The ID of the Azure Container Registry"
  value = azurerm_container_registry.acr.id
}

output "sku" {
  description = "The SKU of the Azure Container Registry"
  value = azurerm_container_registry.acr.sku
}

output "admin_enabled" {
  description = "Enable admin user on the Azure Container Registry."
  value = azurerm_container_registry.acr.admin_enabled
}