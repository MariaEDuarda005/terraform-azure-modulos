resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_public_ip" {
  name                = var.allow_public_ip_name
  server_id           = var.server_id
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}