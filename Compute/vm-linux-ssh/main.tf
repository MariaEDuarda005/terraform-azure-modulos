locals {
  environment_prefix      = "Dev"
  resource_group_name     = "terraform-vm-linux-ssh-${local.environment_prefix}"
  resource_group_location = "East US"
  tags = {
    Project      = "terraform-vm-linux-ssh-${local.environment_prefix}" #⚠️#
    Owner        = "Maria_Ferreira"                                     #⚠️#
    CreationDate = "21/02/2025"                                         #⚠️#
    Environment  = local.environment_prefix                             #⚠️#
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

  depends_on = [ module.azurerg ]
}

module "public_ip" {
  source = "./modules/network/public_ip"

  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  name_public_ip       = "terraform-public-ip" #⚠️# 
  allocation_method_id = "Static"              #⚠️# 
  sku                  = "Standard"            #⚠️# 

  tags = local.tags

  depends_on = [ module.azurerg ]
}

module "network_interface" {
  source = "./modules/network/network_interface"

  network_interface_name  = "terraform-ni-dev" #⚠️# 
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  subnet_id                     = module.virtual_network.subnet_ids[0]
  ip_configuration_name         = "ip-config-internal" #⚠️# 
  private_ip_address_allocation = "Dynamic"            #⚠️#

  depends_on = [ module.azurerg, module.virtual_network ]
}

module "network_security" {
  source = "./modules/network/network_security"

  nsg_name                = "terraform-security-dev" #⚠️# 
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location

  tags = local.tags

  network_interface_id      = module.network_interface.network_interface_id
  network_security_group_id = module.network_security.nsg_id
  subnet_ids                = module.virtual_network.subnet_ids[0]

  depends_on = [ module.azurerg, module.virtual_network, module.network_interface ]
}

module "virtual_machine" {
  source = "./modules/compute/virtual_machine"

  virtual_machine_name    = "terraform-machine" #⚠️#
  resource_group_name     = module.azurerg.resource_group_name
  resource_group_location = module.azurerg.resource_group_location
  size                    = "Standard_F2" #⚠️# 
  admin_username          = "adminuser"   #⚠️#
  network_interface_id    = module.network_interface.network_interface_id
  username_ssh            = "adminuser"                    #⚠️#
  public_key              = file(var.public_key)           #⚠️ ssh-keygen -t rsa -b 2048 #
  caching                 = "ReadWrite"                    #⚠️# 
  storage_account_type    = "Standard_LRS"                 #⚠️# 
  publisher               = "Canonical"                    #⚠️# 
  offer                   = "0001-com-ubuntu-server-jammy" #⚠️# 
  sku                     = "22_04-lts"                    #⚠️# 
  version_image           = "latest"                       #⚠️# 

  depends_on = [ module.azurerg, module.network_interface ]
}
