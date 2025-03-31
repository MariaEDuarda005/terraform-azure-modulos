resource "azurerm_network_security_group" "security" {
  name                = var.name_network_security
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = var.name_rule 
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.security.name
  priority                    = var.priority 
  direction                   = var.direction 
  access                      = var.access 
  protocol                    = var.protocol
  source_port_range           = var.source_port_range 
  destination_port_range      = var.destination_port_range 
  source_address_prefix       = var.source_address_prefix 
  destination_address_prefix  = var.destination_address_prefix 
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = var.network_interface_id
  network_security_group_id = azurerm_network_security_group.security.id
}