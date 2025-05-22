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

  name_server_mysql       = "mysql-flexible-server-1104" #⚠️#
  resource_group_location = module.azurerg.resource_group_location
  resource_group_name     = module.azurerg.resource_group_name
  administrator_login     = "userAdmin"      #⚠️#
  administrator_password  = var.password     #⚠️#
  sku_name_server         = "B_Standard_B1s" #⚠️#
  storage_size            = 40               #⚠️#

  depends_on = [ module.azurerg ]
}

module "database" {
  source = "./modules/database/database_mysql"

  database_name       = "terraformdb" #⚠️#
  resource_group_name = module.azurerg.resource_group_name
  server_name_mysql   = module.server.server_name
  charset             = "utf8"            #⚠️#
  collation           = "utf8_unicode_ci" #⚠️#

  depends_on = [ module.azurerg, module.server ]
}