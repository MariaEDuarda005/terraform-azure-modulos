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
    CreationDate = formatdate("DD/MM/YYYY", timestamp())   #⚠️ Data atual, formatada #
    Environment  = local.environment_prefix                #⚠️#
  }
}

module "azurerg" {
  source = "./modules/azurerg"

  resource_group_name     = local.resource_group_name
  resource_group_location = local.resource_group_location
  tags                    = local.tags
}

module "conatiner_registry" {
  source = "./modules/acr_with_webhook"

  name_acr                = "terraformdevacr"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  sku                     = "Basic"
  admin_enabled           = true

  name_webhook = "webappdevterraform"
  service_uri  = "https://terraform.dev/project"
  status       = "enabled"
  scope        = "project:*"
  actions      = ["push"]

  custom_headers = {
    "Content-Type" = "application/json"
  }

  tags = local.tags
}