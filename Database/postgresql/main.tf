locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-${local.environment_prefix}"
  resource_group_location = "East US"
  tags = {
    Project      = "terraform-${local.environment_prefix}" #⚠️#
    Owner        = "Maria_Ferreira"                        #⚠️#
    CreationDate = formatdate("DD/MM/YYYY", timestamp())   #⚠️ Current, formatted data #
    Environment  = local.environment_prefix                #⚠️#
  }
}

module "azurerg" {
  source = "./modules/azurerg"

  resource_group_name     = local.resource_group_name
  resource_group_location = local.resource_group_location
  tags                    = local.tags
}

module "server" {
  source = "./modules/database/server"

  name_server_postgresql        = "data-db-server-postgresql" #⚠️#
  resource_group_name           = module.azurerg.resource_group_name
  resource_group_location       = module.azurerg.resource_group_location
  admin_login                   = "userAdmin"       #⚠️#
  admin_password                = var.password      #⚠️#
  password_auth_enabled         = true              #⚠️#
  active_directory_auth_enabled = false             #⚠️#
  public_network_access_enabled = true              #⚠️#
  version_server                = "16"              #⚠️#
  sku_name                      = "B_Standard_B1ms" #⚠️#
  storage_mb                    = 32768             #⚠️#
  storage_tier                  = "P4"              #⚠️#
  backup_retention_days         = 7                 #⚠️#
  geo_redundant_backup_enabled  = false             #⚠️#
  zone                          = "1"               #⚠️#
  auto_grow_enabled             = false             #⚠️#
  tags                          = local.tags

  depends_on = [ module.azurerg ]
}

module "database" {
  source = "./modules/database/postgresql_database"

  name_postgresql_database = "database_postgresql"
  server_id                = module.server.postgresql_server_id
  charset                  = "utf8"
  collation_database       = "en_US.utf8"

  depends_on = [ module.server ]
}

module "firewall" {
  source = "./modules/network/firewall"

  allow_public_ip_name = "allow-public-ip"
  server_id            = module.server.postgresql_server_id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"

  depends_on = [ module.server ]
}