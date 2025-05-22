resource "azurerm_cosmosdb_account" "mongodb_dev" {
  name                 = var.name_cosmosdb
  location             = var.resource_group_location
  resource_group_name  = var.resource_group_name
  offer_type           = var.offer_type
  kind                 = var.kind

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  geo_location {
    location          = var.geo_location
    failover_priority = var.failover_priority
    zone_redundant    = var.geo_location_zone_redundant
  }

  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled
  public_network_access_enabled     = var.public_network_access_enabled

  backup {
    type                = var.backup_type
    interval_in_minutes = var.backup_interval_in_minutes
    retention_in_hours  = var.backup_retention_in_hours
    storage_redundancy  = var.storage_redundancy 
    
  }

  analytical_storage_enabled            = var.analytical_storage_enabled
  minimal_tls_version                   = var.minimal_tls_version
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  partition_merge_enabled               = var.partition_merge_enabled
  tags                                  = var.tags
}
