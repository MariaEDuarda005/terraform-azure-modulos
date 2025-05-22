output "postgresql_server_name" {
  description = "The name of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.server_postgresql.name
}

output "postgresql_server_id" {
  description = "The id of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.server_postgresql.id
}

output "postgresql_server_version" {
  description = "The version of the PostgreSQL Flexible Server."
  value       = azurerm_postgresql_flexible_server.server_postgresql.version
}

output "postgresql_server_administrator_login" {
  description = "The administrator login for the PostgreSQL server."
  value       = azurerm_postgresql_flexible_server.server_postgresql.administrator_login
}

output "postgresql_server_administrator_password" {
  description = "The administrator password fo the PostgreSQL server."
  value       = azurerm_postgresql_flexible_server.server_postgresql.administrator_password
}

output "postgresql_server_backup_retention_days" {
  description = "The number of days backups are retained."
  value       = azurerm_postgresql_flexible_server.server_postgresql.backup_retention_days
}

output "postgresql_server_public_network_access" {
  description = "Whether public network access is enabled."
  value       = azurerm_postgresql_flexible_server.server_postgresql.public_network_access_enabled
}

output "postgresql_server_storage_mb" {
  description = "The amount of storage allocated for the PostgreSQL server in MB."
  value       = azurerm_postgresql_flexible_server.server_postgresql.storage_mb
}

output "postgresql_server_zone" {
  description = "The availability zone where the server is located."
  value       = azurerm_postgresql_flexible_server.server_postgresql.zone
}
