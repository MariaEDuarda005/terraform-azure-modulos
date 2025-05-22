locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-${local.environment_prefix}"
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

  container_registry_name = "terraformcr1093" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  sku                     = "Basic" #⚠️#
  admin_enabled           = true    #⚠️#
  tags                    = local.tags

  depends_on = [module.azurerg]
}

module "app_service_plan" {
  source = "./modules/compute/app_service_plan_linux"

  name_app_service_plan   = "terraform-dev-serviceplan" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  os_type                 = "Linux" #⚠️#
  sku_name                = "B1"    #⚠️#
  tags                    = local.tags

  depends_on = [module.azurerg, module.container_registry]
}

module "app_service" {
  source = "./modules/compute/app_service_linux"

  name_web_app            = "terraform-dev-webapp67801" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  service_plan_id         = module.app_service_plan.id_app_service_plan
  tags                    = local.tags
  always_on               = true
  ftps_state              = "AllAllowed"                        #⚠️#
  docker_image_name       = "hello-world:latest"                #⚠️#
  docker_registry_url     = "https://mcr.microsoft.com/v2/mcr/" #⚠️#
  file_system_level       = "Verbose"                           #⚠️#
  detailed_error_messages = true
  retention_in_days       = 7  #⚠️#
  retention_in_mb         = 35 #⚠️#

  depends_on = [module.azurerg, module.container_registry, module.app_service_plan]
}