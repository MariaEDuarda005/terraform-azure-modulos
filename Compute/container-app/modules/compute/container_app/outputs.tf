output "id_container_app" {
  description = "The ID of the container app"
  value       = azurerm_container_app.container_app.id
}

output "id_container_app_environmente" {
  description = "The ID of the container app environmente"
  value       = azurerm_container_app_environment.environment.id
}

output "container_app_url" {
  description = "Access URL to Azure Container App"
  value       = azurerm_container_app.container_app.ingress[0].fqdn
}

output "container_app_revision" {
  description = "Last revision of Azure Container App"
  value       = azurerm_container_app.container_app.latest_revision_fqdn
}