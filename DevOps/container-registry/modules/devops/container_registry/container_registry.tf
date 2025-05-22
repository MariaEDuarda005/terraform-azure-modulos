resource "azurerm_container_registry" "container_registry" {
  name                = var.container_registry_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.container_registry_sku
  admin_enabled       = var.admin_enabled
  tags                = var.resource_group_tags
}

