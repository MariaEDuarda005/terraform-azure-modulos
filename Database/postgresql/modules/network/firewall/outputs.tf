output "firewall_rule_name" {
  description = "The name of the PostgreSQL firewall rule."
  value       = azurerm_postgresql_flexible_server_firewall_rule.allow_public_ip.name
}

output "firewall_rule_id" {
  description = "The ID of the PostgreSQL server."
  value       = azurerm_postgresql_flexible_server_firewall_rule.allow_public_ip.id
}

output "firewall_rule_start_ip" {
  description = "The start IP address of the PostgreSQL firewall rule."
  value       = azurerm_postgresql_flexible_server_firewall_rule.allow_public_ip.start_ip_address
}

output "firewall_rule_end_ip" {
  description = "The end IP address of the PostgreSQL firewall rule."
  value       = azurerm_postgresql_flexible_server_firewall_rule.allow_public_ip.end_ip_address
}