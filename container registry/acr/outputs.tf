output "name" {
  description = "The name of the Azure Container Registry."
  value       = module.container_registry.name
}

output "id" {
  description = "The ID of the Azure Container Registry"
  value       = module.container_registry.id
}
