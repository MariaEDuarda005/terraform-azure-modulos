output "database_name" {
  description = "The name of the MySQL database."
  value       = azurerm_mysql_flexible_database.database.name
}

output "database_id" {
  description = "The ID of the MySQL database."
  value       = azurerm_mysql_flexible_database.database.id
}