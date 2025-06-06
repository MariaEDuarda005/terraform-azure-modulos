output "server_id" {
  description = "The ID of the MySQL server."
  value       = azurerm_mysql_flexible_server.server.id
}

output "server_name" {
  description = "The name of the MySQL server."
  value       = azurerm_mysql_flexible_server.server.name
}