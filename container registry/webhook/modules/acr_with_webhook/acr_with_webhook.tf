resource "azurerm_container_registry" "acr" {
  name                = var.name_acr
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}

resource "azurerm_container_registry_webhook" "webhook" {
  name                = var.name_webhook
  resource_group_name = var.resource_group_name
  registry_name       = azurerm_container_registry.acr.name
  location            = var.resource_group_location

  service_uri = var.service_uri
  status      = var.status
  scope       = var.scope
  actions     = var.actions

  custom_headers = var.custom_headers

  tags = var.tags
}