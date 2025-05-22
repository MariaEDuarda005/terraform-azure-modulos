# Resource group
output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.azurerg.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group."
  value       = module.azurerg.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = module.azurerg.resource_group_id
}

# Server
output "postgresql_server_name" {
  description = "The name of the PostgreSQL Flexible Server."
  value       = module.server.postgresql_server_name
}

output "postgresql_server_version" {
  description = "The version of the PostgreSQL Flexible Server."
  value       = module.server.postgresql_server_version
}

output "postgresql_server_administrator_login" {
  description = "The administrator login for the PostgreSQL server."
  value       = module.server.postgresql_server_administrator_login
}

output "postgresql_server_administrator_password" {
  description = "The administrator passoword for the PostgreSQL server."
  value       = module.server.postgresql_server_administrator_password
  sensitive   = true
}

# Database
output "postgresql_database_name" {
  description = "The name of the PostgreSQL database."
  value       = module.database.postgresql_database_name
}

output "postgresql_database_charset" {
  description = "The charset used by the PostgreSQL database."
  value       = module.database.postgresql_database_charset
}

output "postgresql_database_collation" {
  description = "The collation used by the PostgreSQL database."
  value       = module.database.postgresql_database_collation
}

# firewall
output "firewall_rule_name" {
  description = "The name of the PostgreSQL firewall rule."
  value       = module.firewall.firewall_rule_name
}

output "firewall_rule_id" {
  description = "The ID of the PostgreSQL server."
  value       = module.firewall.firewall_rule_id
}

output "firewall_rule_start_ip" {
  description = "The start IP address of the PostgreSQL firewall rule."
  value       = module.firewall.firewall_rule_start_ip
}

output "firewall_rule_end_ip" {
  description = "The end IP address of the PostgreSQL firewall rule."
  value       = module.firewall.firewall_rule_end_ip
}