## Resource Group
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

# Log Workspace
output "id_log_workspace" {
  description = "The ID of the log workspace."
  value       = module.log_workspace.id_log_workspace
}

output "log_analytics_workspace_primary_shared_key" {
  description = "Primary key of the Log Analytics Workspace"
  value       = module.log_workspace.log_analytics_workspace_primary_shared_key
  sensitive   = true
}

# Container App
output "id_container_app" {
  description = "The ID of the container app"
  value       = module.container_app.id_container_app
}

output "id_container_app_environmente" {
  description = "The ID of the container app environmente"
  value       = module.container_app.id_container_app_environmente
}

output "container_app_url" {
  description = "Access URL to Azure Container App"
  value       = module.container_app.container_app_url
}

output "container_app_revision" {
  description = "Last revision of Azure Container App"
  value       = module.container_app.container_app_revision
}