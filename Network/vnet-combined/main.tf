locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-vnet-combined-${local.environment_prefix}"
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

  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  name_virtual_network = "virtual_network_dev"  #⚠️#
  address_space        = ["10.0.0.0/16"]        #⚠️#
  dns_servers          = ["8.8.8.8", "8.8.4.4"] #⚠️#

  subnets = [ #⚠️#
    {
      name             = "frontend"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "backend"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]

  tags = local.tags

  depends_on = [ module.azurerg ]
}