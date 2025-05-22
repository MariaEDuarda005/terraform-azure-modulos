resource "azurerm_postgresql_flexible_server_database" "postgresql_database" {
  name                = var.name_postgresql_database
  server_id           = var.server_id
  charset             = var.charset
  collation           = var.collation_database
}