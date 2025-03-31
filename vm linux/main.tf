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

module "virtual_network" {
  source = "./modules/network/virtual_network"

  # name_security           = "terraform-security-dev"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  name_virtual_network = "virtual_network_dev"
  address_space        = ["10.0.0.0/16"]
  dns_servers          = ["8.8.8.8", "8.8.4.4"]

  subnets = [
    {
      name             = "subnet-dev-1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet-dev-2"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]

  tags = {
    "Environment" = "Dev"
    "Project"     = "Network Setup"
  }
}

module "network_security" {
  source = "./modules/network/network_security"

  nsg_name                = "terraform-security-dev"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  tags = local.tags

  network_interface_id      = module.network_interface.network_interface_id
  network_security_group_id = module.network_security.nsg_id
}

module "public_ip" {
  source = "./modules/network/public_ip"

  resource_group_name     = local.resource_group_name
  resource_group_location = local.resource_group_location
  public_ip_name          = "terraform-pip-dev"
  allocation_method       = "Static" #⚠️#
  sku_ip                  = "Basic"

  tags = local.tags
}

module "network_interface" {
  source = "./modules/network/network_interface"

  name_network_interface  = "terraform-ni-dev"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  subnet_id            = module.virtual_network.subnet_ids[0] # Referencia a primeira subnet
  name_ip_config       = "ip-config-example"
  private_ip_address   = "Dynamic" #⚠️#
  public_ip_address_id = module.public_ip.id
}

module "virtual_machine" {
  source = "./modules/compute/virtual_machine"

  virtual_machine_name    = "terraform-dev"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  size           = "Standard_B1s"
  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_id = module.network_interface.network_interface_id

  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"
  publisher            = "Canonical"
  offer                = "UbuntuServer"
  sku                  = "18.04-LTS"
  version_image        = "latest"

  password_authentication = false

  tags = local.tags
}