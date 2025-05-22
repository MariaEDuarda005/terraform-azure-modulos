output "mongo_cluster_name" {
  value       = module.mongodb.mongo_cluster_name
  description = "The name of the MongoDB cluster."
}

output "mongo_cluster_id" {
  value       = module.mongodb.mongo_cluster_id
  description = "The resource ID of the MongoDB cluster."
}

output "mongo_cluster_location" {
  value       = module.mongodb.mongo_cluster_location
  description = "The Azure region where the MongoDB cluster is deployed."
}

output "mongo_cluster_resource_group" {
  value       = module.mongodb.mongo_cluster_name
  description = "The name of the resource group containing the MongoDB cluster."
}

output "mongo_cluster_version" {
  value       = module.mongodb.mongo_cluster_version
  description = "The MongoDB version running on the cluster."
}

output "mongo_cluster_high_availability_mode" {
  value       = module.mongodb.mongo_cluster_high_availability_mode
  description = "The high availability mode configured for the MongoDB cluster."
}

output "mongo_cluster_storage_size_in_gb" {
  value       = module.mongodb.mongo_cluster_storage_size_in_gb
  description = "The amount of storage (in GB) allocated to the MongoDB cluster."
}
