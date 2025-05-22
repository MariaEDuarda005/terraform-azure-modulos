locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-application-insights-${local.environment_prefix}"
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

module "log_analytics" {
  source = "./modules/log_analytics"

  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  log_sku                 = "PerGB2018" #⚠️#
  retention_in_days       = 30          #⚠️#

  depends_on = [ module.azurerg ]
}

module "application_insights" {
  source = "./modules/application_insights"

  resource_group_name        = module.azurerg.resource_group_name
  resource_group_location    = module.azurerg.resource_group_location
  log_analytics_workspace_id = module.log_analytics.log_analytics_workspace_id
  application_type           = "web" #⚠️# 

  depends_on = [ module.azurerg, module.log_analytics ]
}