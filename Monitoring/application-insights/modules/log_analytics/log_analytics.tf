resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.name_log_workspace
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.log_sku
  retention_in_days   = var.retention_in_days
}
