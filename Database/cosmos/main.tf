locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-tests"
  resource_group_location = "East US"
  tags = {
    Project      = "terraform-${local.environment_prefix}" #⚠️#
    Owner        = "Maria_Ferreira"                        #⚠️#
    CreationDate = formatdate("DD/MM/YYYY", timestamp())   #⚠️ Current, formatted data #
    Environment  = local.environment_prefix                #⚠️#
  }
}

data "azurerm_resource_group" "existing" {
  name = local.resource_group_name
}

module "cosmosdb" {
  depends_on = [data.azurerm_resource_group.existing]

  source = "./modules/database/cosmosdb"

  name_cosmosdb                         = "terraform-mongodb-dev" #⚠️#
  resource_group_location               = data.azurerm_resource_group.existing.location
  resource_group_name                   = data.azurerm_resource_group.existing.name
  offer_type                            = "Standard"         #⚠️#
  kind                                  = "GlobalDocumentDB" #⚠️#
  consistency_level                     = "Session"          #⚠️#
  backup_interval_in_minutes            = 240                #⚠️#
  backup_retention_in_hours             = 8                  #⚠️#
  max_interval_in_seconds               = 5                  #⚠️#
  max_staleness_prefix                  = 100                #⚠️#
  geo_location                          = "East US"          #⚠️#
  failover_priority                     = 0                  #⚠️#
  geo_location_zone_redundant           = true
  is_virtual_network_filter_enabled     = false
  public_network_access_enabled         = true
  backup_type                           = "Periodic"         #⚠️#
  analytical_storage_enabled            = false
  minimal_tls_version                   = "Tls12"            #⚠️#
  network_acl_bypass_for_azure_services = false
  partition_merge_enabled               = false
  storage_redundancy                    = "Local"            #⚠️#

  tags = local.tags
}