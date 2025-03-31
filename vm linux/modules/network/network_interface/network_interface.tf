resource "azurerm_network_interface" "example" {
  name                = var.name_network_interface
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = var.name_ip_config
    subnet_id                     = var.subnet_id # azurerm_virtual_network.vnet.subnet[0].id
    private_ip_address_allocation = var.private_ip_address
    public_ip_address_id          = var.public_ip_address_id
  }
}