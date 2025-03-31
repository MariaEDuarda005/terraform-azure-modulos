variable "container_registry_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Container Registry (Basic, Standard, Premium)."
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Enable admin user on the Azure Container Registry."
  type        = bool
  default     = false
}
