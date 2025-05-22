# Resource Group 
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.azurerg.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = module.azurerg.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.azurerg.resource_group_id
}

# Container Registry
output "id_acr" {
  description = "The ID of the container registry"
  value       = module.container_registry.id_acr
}

output "server_url_acr" {
  description = "The server url of the container registry."
  value       = module.container_registry.server_url_acr
}

# App Service Plan Linux
output "id_app_service_plan" {
  description = "The ID of the app service plan"
  value       = module.app_service_plan.id_app_service_plan
}

output "name_app_service_plan" {
  description = "The name of the app service plan"
  value       = module.app_service_plan.name_app_service_plan
}

# App Service Linux
output "id_app_service" {
  description = "The ID o fthe app service."
  value       = module.app_service.id_app_service
}

output "default_hostname_app_service" {
  description = "The default hostname of the app service."
  value       = module.app_service.default_hostname_app_service
}