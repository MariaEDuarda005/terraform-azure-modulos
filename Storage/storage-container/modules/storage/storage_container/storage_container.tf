resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  min_tls_version          = var.storage_account_min_tls_version

  blob_properties {
    versioning_enabled = true
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.storage_account_container_name
  container_access_type = var.storage_account_container_access_type
  storage_account_id    = azurerm_storage_account.main.id
}