output "id_acr" {
  description = "The ID of the container registry"
  value       = azurerm_container_registry.acr.id
}

output "server_url_acr" {
  description = "The server url of the container registry"
  value = azurerm_container_registry.acr.login_server
}