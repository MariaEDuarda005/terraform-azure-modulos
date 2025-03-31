# código de inicialização do terraform
terraform {
  required_version = ">=1.10.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false # Desabilitar a verificação se exste algum recurso dentro o grupo de recursos
    }
  }
}

locals {
  environment_prefix      = "dev"
  resource_group_name     = "terraform-${local.environment_prefix}"
  resource_group_location = "East US"
  tags = {
    Project      = "terraform-${local.environment_prefix}" #⚠️#
    Owner        = "maria_ferreira"                        #⚠️#
    CreationDate = formatdate("DD/MM/YYYY", timestamp())   # Data atual, formatada #
    Environment  = local.environment_prefix                #⚠️#
  }
}

module "azurerg" {
  source = "./modules/azurerg"

  resource_group_name     = local.resource_group_name
  resource_group_location = local.resource_group_location
  tags                    = local.tags
}

module "app_service_plan" {
  source = "./modules/app_service_plan"

  name_service_plan       = "terraform-dev-serviceplan"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  os_type                 = "Linux"
  sku_name                = "B1"
}

module "app_service" {
  source = "./modules/app_service"

  name_web_app            = "terraform-dev-webapp67801"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  service_plan_id         = module.app_service_plan.id

  always_on  = true
  ftps_state = "AllAllowed"

  docker_image_name = "mcr.microsoft.com/k8se/quickstart:latest"

  file_system_level = "Verbose"
}

module "container_registry" {
  source = "./modules/container_registry"

  container_registry_name = "terraformdevacr"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  sku                     = "Basic"
  admin_enabled           = true 
}