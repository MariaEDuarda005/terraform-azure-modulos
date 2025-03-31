resource "azurerm_public_ip" "public_ip" {
  name                = var.name_public_ip
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.allocation_method

  tags = var.tags
}