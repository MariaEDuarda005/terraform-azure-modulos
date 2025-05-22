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

module "log_workspace" {
  source = "./modules/monitoring/log_analytics"

  name_log_analytics      = "workspaceterraform-01" #⚠️#
  resource_group_location = module.azurerg.resource_group_location
  resource_group_name     = module.azurerg.resource_group_name
  sku                     = "PerGB2018" #⚠️#
  retention_in_days       = 30          #⚠️#
  tags                    = local.tags

  depends_on = [ module.azurerg ]
}

module "container_app" {
  source = "./modules/compute/container_app"

  name_container_app_environment = "ManagedEnvironment" #⚠️#
  resource_group_location        = module.azurerg.resource_group_location
  resource_group_name            = module.azurerg.resource_group_name
  log_analytics_workspace_id     = module.log_workspace.id_log_workspace
  workload_profile_type          = "Consumption"                              #⚠️#
  name_workload_profile          = "Consumption"                              #⚠️#
  name_container                 = "terraform-app"                            #⚠️#
  revision_mode                  = "Single"                                   #⚠️#
  name_container_app             = "terraformcontainerapp433"                 #⚠️#
  image_container                = "mcr.microsoft.com/k8se/quickstart:latest" #⚠️#
  cpu                            = 1.25                                       #⚠️#
  memory                         = "2.5Gi"                                    #⚠️#
  port                           = "80"                                       #⚠️#
  transport                      = "HTTPS"                                    #⚠️#
  name_env                       = "Environment"                              #⚠️#
  external_enabled               = true                                       #⚠️#
  target_port                    = 80                                         #⚠️#
  ingress_transport              = "http"                                     #⚠️#

  min_replicas = 1 #⚠️#
  max_replicas = 2 #⚠️#

  container_ip_restriction_action = "Allow"           #⚠️#
  container_ip_restriction_name   = "AllowAllTraffic" #⚠️#
  container_ip_restriction_range  = "0.0.0.0/0"       #⚠️#

  percentage      = 100  #⚠️#
  revision_suffix = "v1" #⚠️#
  latest_revision = true #⚠️#

  tags = local.tags

  depends_on = [ module.azurerg, module.log_workspace ]
}