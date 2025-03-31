resource "azurerm_service_plan" "tf-sp" {
  name                = var.name_service_plan
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  os_type             = var.os_type
  sku_name            = var.sku_name
}