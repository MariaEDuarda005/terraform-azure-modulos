output "postgresql_database_name" {
  description = "The name of the PostgreSQL database."
  value       = azurerm_postgresql_flexible_server_database.postgresql_database.name
}

output "postgresql_database_charset" {
  description = "The charset used by the PostgreSQL database."
  value       = azurerm_postgresql_flexible_server_database.postgresql_database.charset
}

output "postgresql_database_collation" {
  description = "The collation used by the PostgreSQL database."
  value       = azurerm_postgresql_flexible_server_database.postgresql_database.collation
}
