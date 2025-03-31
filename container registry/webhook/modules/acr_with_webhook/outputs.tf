output "id_acr" {
  description = "The ID of the container registry"
  value       = azurerm_container_registry.acr.id
}

output "id_webhook" {
  description = "The ID of the container registry web hook"
  value       = azurerm_container_registry_webhook.webhook.id
}