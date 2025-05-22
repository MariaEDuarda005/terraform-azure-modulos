output "id_app_service" {
  description = "The ID of the app service."
  value       = azurerm_linux_web_app.tf-webapp.id
}

output "default_hostname_app_service" {
  description = "The default hostname of the app service."
  value = azurerm_linux_web_app.tf-webapp.default_hostname
}