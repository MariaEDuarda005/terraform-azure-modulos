locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-vnet-separated-${local.environment_prefix}"
  resource_group_location = "East US"
  tags = {
    Project      = "terraform-${local.environment_prefix}" #⚠️#
    Owner        = "Maria_Ferreira"                        #⚠️#
    CreationDate = formatdate("DD/MM/YYYY", timestamp())   #⚠️ Current date, formatted #
    Environment  = local.environment_prefix                #⚠️#
  }
}

module "azurerg" {
  source = "./modules/azurerg"

  resource_group_name     = local.resource_group_name
  resource_group_location = local.resource_group_location
  tags                    = local.tags
}

module "virtual_network" {
  source = "./modules/network/virtual_network"

  name_virtual_network    = "terraform-dev-network" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  address_space           = ["10.0.0.0/16"]          #⚠️#
  dns_servers             = ["10.0.0.4", "10.0.0.5"] #⚠️#

  depends_on = [ module.azurerg ]
}

module "subnet" {
  source = "./modules/network/subnet"

  name_subnet          = "internal-dev" #⚠️#
  resource_group_name  = module.azurerg.resource_group_name
  name_virtual_network = module.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"] #⚠️#

  depends_on = [ module.azurerg, module.virtual_network ]
}