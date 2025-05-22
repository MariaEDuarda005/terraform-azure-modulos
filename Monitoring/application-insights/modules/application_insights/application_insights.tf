resource "azurerm_application_insights" "appinsights" {
  name                = "tf-test-appinsights"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  workspace_id        = var.log_analytics_workspace_id
  application_type    = var.application_type
}

