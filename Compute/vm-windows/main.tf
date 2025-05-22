locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-vm-windows-${local.environment_prefix}"
  resource_group_location = "East US"
  tags = {
    Project      = "terraform-vm-windows-${local.environment_prefix}" #⚠️#
    Owner        = "Maria_Ferreira"                                   #⚠️#
    CreationDate = formatdate("DD/MM/YYYY", timestamp())              #⚠️ Current, formatted data #
    Environment  = local.environment_prefix                           #⚠️#
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
      name             = "subnet-dev-1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet-dev-2"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]

  tags = local.tags
}

module "public_ip" {
  source = "./modules/network/public_ip"

  name_public_ip          = "public-ip-dev" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  allocation_method       = "Static"                                   #⚠️#
  domain_name_label       = "terraform-${module.virtual_machine.name}" #⚠️#
  domain_name_label_scope = "NoReuse"                                  #⚠️#

  tags = local.tags
}

module "network_interface" {
  source = "./modules/network/network_interface"

  name_nic                = "nic-dev" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  ip_configuration_name         = "nic-ipconfig-dev"                   #⚠️#
  subnet_id                     = module.virtual_network.subnet_ids[0] #⚠️#
  private_ip_address_allocation = "Dynamic"                            #⚠️#

}

module "network_security" {
  source = "./modules/network/network_security"

  nsg_name                = "terraform-security-dev" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  tags = local.tags

  network_interface_id = module.network_interface.id
  subnet_ids           = module.virtual_network.subnet_ids[0] #⚠️#
}

module "virtual_machine" {
  source = "./modules/compute/virtual_machine"

  name_virtual_machine    = "vm-dev" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  size                    = "Standard_F2"      #⚠️#
  admin_username          = "adminuser"        #⚠️#
  admin_password          = var.admin_password #⚠️#
  network_interface_id    = module.network_interface.id
  caching                 = "ReadWrite"              #⚠️#
  storage_account_type    = "Standard_LRS"           #⚠️#
  publisher               = "MicrosoftWindowsServer" #⚠️#
  offer                   = "WindowsServer"          #⚠️#
  sku                     = "2016-Datacenter"        #⚠️#
  version_image           = "latest"                 #⚠️#
}