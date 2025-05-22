output "id_log_workspace" {
  description = "The ID of the log workspace."
  value = azurerm_log_analytics_workspace.log_workspace.id
}

output "log_analytics_workspace_primary_shared_key" {
  description = "Primary key of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.log_workspace.primary_shared_key
  sensitive   = true
}