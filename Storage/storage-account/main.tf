locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-storage-account-${local.environment_prefix}"
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

module "storage_account" {
  source = "./modules/storage/storage_account"

  resource_group_name              = local.resource_group_name
  resource_group_location          = local.resource_group_location
  storage_account_name             = "mariaterraformdevsa" #⚠️#
  storage_account_tier             = "Standard"            #⚠️#
  storage_account_replication_type = "LRS"                 #⚠️#
  storage_account_min_tls_version  = "TLS1_2"              #⚠️#

  depends_on = [module.azurerg]
}