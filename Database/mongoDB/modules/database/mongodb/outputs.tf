output "mongo_cluster_name" {
  value       = azurerm_mongo_cluster.sentinela.name
  description = "The name of the MongoDB cluster."
}

output "mongo_cluster_id" {
  value       = azurerm_mongo_cluster.sentinela.id
  description = "The resource ID of the MongoDB cluster."
}

output "mongo_cluster_location" {
  value       = azurerm_mongo_cluster.sentinela.location
  description = "The Azure region where the MongoDB cluster is deployed."
}

output "mongo_cluster_resource_group" {
  value       = azurerm_mongo_cluster.sentinela.resource_group_name
  description = "The name of the resource group containing the MongoDB cluster."
}

output "mongo_cluster_version" {
  value       = azurerm_mongo_cluster.sentinela.version
  description = "The MongoDB version running on the cluster."
}

output "mongo_cluster_high_availability_mode" {
  value       = azurerm_mongo_cluster.sentinela.high_availability_mode
  description = "The high availability mode configured for the MongoDB cluster."
}

output "mongo_cluster_storage_size_in_gb" {
  value       = azurerm_mongo_cluster.sentinela.storage_size_in_gb
  description = "The amount of storage (in GB) allocated to the MongoDB cluster."
}
