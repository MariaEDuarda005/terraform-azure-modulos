resource "azurerm_service_plan" "tf-sp-linux" {
  name                = var.name_app_service_plan
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}