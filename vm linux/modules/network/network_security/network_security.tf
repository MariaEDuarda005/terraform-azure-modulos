resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = var.network_interface_id
  network_security_group_id = var.network_security_group_id
}