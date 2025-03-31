resource "azurerm_public_ip" "terraform_pip_dev" {
  name                = var.public_ip_name # "terraform-pip-dev"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.allocation_method # "Dynamic" Ou "Static" para IP fixoconnection 
  sku = var.sku_ip

  tags = var.tags
}