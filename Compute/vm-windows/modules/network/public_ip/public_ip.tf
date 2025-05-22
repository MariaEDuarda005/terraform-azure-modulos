resource "azurerm_public_ip" "public_ip" {
  name                    = var.name_public_ip
  resource_group_name     = var.resource_group_name
  location                = var.resource_group_location
  allocation_method       = var.allocation_method
  sku                     = var.sku
  domain_name_label       = var.domain_name_label 
  domain_name_label_scope = var.domain_name_label_scope 

  tags = var.tags
}