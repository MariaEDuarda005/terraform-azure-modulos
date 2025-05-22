resource "azurerm_postgresql_flexible_server" "server_postgresql" {
  name                          = var.name_server_postgresql
  location                      = var.resource_group_location
  resource_group_name           = var.resource_group_name
  administrator_login           = var.admin_login
  administrator_password        = var.admin_password
  version                       = var.version_server
  zone                          = var.zone
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled  = var.geo_redundant_backup_enabled
  public_network_access_enabled = var.public_network_access_enabled

  authentication {
    active_directory_auth_enabled = var.active_directory_auth_enabled
    password_auth_enabled         = var.password_auth_enabled
  }

  auto_grow_enabled = var.auto_grow_enabled
  storage_tier      = var.storage_tier

  tags = var.tags
}