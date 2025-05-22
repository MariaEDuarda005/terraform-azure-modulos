output "server_id" {
  description = "The ID of the MySQL server."
  value       = module.server.server_id
}

output "server_name" {
  description = "The name of the MySQL server."
  value       = module.server.server_name
}

output "database_name" {
  description = "The name of the MySQL database."
  value       = module.database.database_name
}

output "database_id" {
  description = "The ID of the MySQL database."
  value       = module.database.database_id
}