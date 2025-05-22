locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-container-registry-${local.environment_prefix}"
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

module "container_registry" {
  source = "./modules/devops/container_registry"

  container_registry_name = "containerRegistryAzure1" #⚠️#
  resource_group_location = module.azurerg.resource_group_location
  resource_group_name     = module.azurerg.resource_group_name
  container_registry_sku  = "Basic" #⚠️#
  admin_enabled           = true    #⚠️#
  resource_group_tags     = local.tags

  depends_on = [ module.azurerg ]
}