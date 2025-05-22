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

# Storage account
output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = module.storage_account.storage_account_id
}
