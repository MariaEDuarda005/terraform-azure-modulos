resource "azurerm_mysql_flexible_server" "server" {
  name                   = var.name_server_mysql
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  sku_name               = var.sku_name_server
  version                = var.version_mysql

  storage {
    size_gb           = 40
    auto_grow_enabled = true
  }
}