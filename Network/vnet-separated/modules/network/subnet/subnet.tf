resource "azurerm_subnet" "internal" {
  name                 = var.name_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.name_virtual_network
  address_prefixes     = var.address_prefixes
}