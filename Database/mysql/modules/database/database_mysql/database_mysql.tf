resource "azurerm_mysql_flexible_database" "database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = var.server_name_mysql
  charset             = var.charset
  collation           = var.collation
}