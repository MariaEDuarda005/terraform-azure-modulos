resource "azurerm_windows_virtual_machine" "main" {
  name                = var.name_virtual_machine
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [
    var.network_interface_id,
  ]

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_image
  }

  os_disk {
    storage_account_type = var.storage_account_type
    caching              = var.caching
  }
}