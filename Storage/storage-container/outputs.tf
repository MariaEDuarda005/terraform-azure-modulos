# Resource Group
output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.azurerg.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group."
  value       = module.azurerg.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = module.azurerg.resource_group_id
}

# Storage container
output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = module.storage_account.storage_account_id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = module.storage_account.storage_account_name
}

output "storage_container_primary_endpoint" {
  description = "The primary endpoint for the Storage Account."
  value       = module.storage_account.storage_container_primary_endpoint
}

output "container_id" {
  description = "The ID of the Storage Container"
  value       = module.storage_account.container_id
}