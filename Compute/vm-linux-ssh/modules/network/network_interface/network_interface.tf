resource "azurerm_network_interface" "ni-tf" {
  name                = var.network_interface_name # "example-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name # "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation # "Dynamic"
  }
}