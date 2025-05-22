output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.main.name
}

output "storage_container_primary_endpoint" {
  description = "The primary endpoint for the Storage Account."
  value       = azurerm_storage_account.main.primary_blob_endpoint
}

output "container_id" {
  description = "The ID of the Storage Container"
  value       = azurerm_storage_container.example.id
}