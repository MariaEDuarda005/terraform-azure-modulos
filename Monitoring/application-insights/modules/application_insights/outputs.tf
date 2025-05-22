output "instrumentation_key" {
  description = "The instrumentation key of the Application Insights resource. Used to connect the application to the Application Insights monitoring resource."
  value       = azurerm_application_insights.appinsights.instrumentation_key
}

output "app_id" {
  description = "The ID of the Application Insights resource."
  value       = azurerm_application_insights.appinsights.id
}
