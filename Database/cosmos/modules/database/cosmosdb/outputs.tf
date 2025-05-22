output "cosmosdb_account_name" {
  description = "The name of the CosmosDB account."
  value       = azurerm_cosmosdb_account.mongodb_dev.name
}

output "cosmosdb_account_id" {
  description = "The ID of the CosmosDB account."
  value       = azurerm_cosmosdb_account.mongodb_dev.id
}

output "cosmosdb_account_endpoint" {
  description = "The endpoint of the CosmosDB account."
  value       = azurerm_cosmosdb_account.mongodb_dev.endpoint
}

output "cosmosdb_primary_key" {
  description = "The primary key of the CosmosDB account."
  value       = azurerm_cosmosdb_account.mongodb_dev.primary_key
  sensitive   = true
}

output "cosmosdb_secondary_key" {
  description = "The secondary key of the CosmosDB account."
  value       = azurerm_cosmosdb_account.mongodb_dev.secondary_key
  sensitive   = true
}

output "cosmosdb_connection_sql" {
  description = "The connection strings of the CosmosDB account."
  value       = azurerm_cosmosdb_account.mongodb_dev.primary_sql_connection_string
  sensitive   = true
}
