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

  name_vnet               = "terraform-${local.environment_prefix}-network"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  address_space           = ["10.0.0.0/16"]
  dns_servers             = ["10.0.0.4", "10.0.0.5"]
}

module "subnet" {
  source = "./modules/network/subnet"

  name_subnet          = "internal-${local.environment_prefix}"
  resource_group_name  = module.azurerg.resource_group_name
  name_virtual_network = module.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

module "public_ip" {
  source = "./modules/network/public_ip"

  name_public_ip          = "public-ip-${local.environment_prefix}"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  allocation_method       = "Static"

  tags = local.tags
}

module "network_interface" {
  source = "./modules/network/network_interface"

  name_nic                = "nic-${local.environment_prefix}"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  name_ip_config                = "nic-ipconfig-${local.environment_prefix}"
  subnet_id                     = module.subnet.id
  private_ip_address_allocation = "Dynamic"
}

module "network_security" {
  source = "./modules/network/network_security"

  name_network_security   = "security-${local.environment_prefix}"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  name_rule                  = "ssh"
  priority                   = 102
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"

  network_interface_id = module.network_interface.id
  # network_security_group_id = module.network_security.id
}

module "virtual_machine" {
  source = "./modules/compute/virtual_machine"

  name_virtual_machine    = "vm-${local.environment_prefix}"
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  size                    = "Standard_F2"
  admin_username          = var.admin_username
  admin_password          = var.admin_password

  network_interface_id = module.network_interface.id

  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"

  publisher     = "MicrosoftWindowsServer"
  offer         = "WindowsServer"
  sku           = "2016-Datacenter"
  version_image = "latest"
}