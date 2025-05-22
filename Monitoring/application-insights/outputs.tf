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

# Application Insights
output "instrumentation_key" {
  description = "The instrumentation key of the Application Insights resource. Used to connect the application to the Application Insights monitoring resource."
  value       = module.application_insights.instrumentation_key
  sensitive   = true
}

output "app_id" {
  description = "The ID of the Application Insights resource."
  value       = module.application_insights.app_id
}

# Log Analytics
output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  value       = module.log_analytics.log_analytics_workspace_id
}