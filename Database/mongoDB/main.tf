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

module "mongodb" {
  source = "./modules/database/mongodb"

  name_mongodb            = "sentinela-mongodb-teste" #⚠️#
  resource_group_name     = data.azurerm_resource_group.existing.name
  resource_group_location = data.azurerm_resource_group.existing.location
  username                = "userAdmin"          #⚠️#
  password                = var.password_mongodb #⚠️#
  shard_count             = 1                    #⚠️#
  compute_tier            = "M25"                #⚠️#
  high_availability_mode  = "Disabled"           #⚠️#
  storage_size_in_gb      = 128                  #⚠️#
  version_mongodb         = "6.0"                #⚠️#
  public_network_access   = "Enabled"            #⚠️#
  tags                    = local.tags
}