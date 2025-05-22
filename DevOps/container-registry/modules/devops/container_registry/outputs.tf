output "container_registry_id" {
  description = "The Azure Container Registry ID."
  value       = azurerm_container_registry.container_registry.id
}

output "container_registry_name" {
  description = "The Azure Container Registry name."
  value       = azurerm_container_registry.container_registry.name
}

output "container_registry_login_server_url" {
  description = "The Azure Container Registry Login server URL."
  value       = azurerm_container_registry.container_registry.login_server
}