# Resource Group
output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.azurerg.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group."
  value       = module.azurerg.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = module.azurerg.resource_group_id
}

# Container Registry
output "container_registry_id" {
  description = "The Azure Container Registry ID."
  value       = module.container_registry.container_registry_id
}

output "container_registry_name" {
  description = "The Azure Container Registry name."
  value       = module.container_registry.container_registry_name
}

output "container_registry_login_server_url" {
  description = "The Azure Container Registry Login server URL."
  value       = module.container_registry.container_registry_login_server_url
}