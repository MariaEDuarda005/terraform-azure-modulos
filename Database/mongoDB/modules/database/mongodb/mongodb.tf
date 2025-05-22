resource "azurerm_mongo_cluster" "sentinela" {
  name                   = var.name_mongodb
  resource_group_name    = var.resource_group_name
  location               = var.resource_group_location
  administrator_username = var.username
  administrator_password = var.password
  shard_count            = var.shard_count
  compute_tier           = var.compute_tier
  high_availability_mode = var.high_availability_mode
  storage_size_in_gb     = var.storage_size_in_gb
  version                = var.version_mongodb
  public_network_access  = var.public_network_access
  tags                   = var.tags
}