output "id_app_service_plan" {
  description = "The ID of the app service plan"
  value       = azurerm_service_plan.tf-sp-linux.id
}

output "name_app_service_plan" {
  description = "The name of the app service plan"
  value = azurerm_service_plan.tf-sp-linux.name
}