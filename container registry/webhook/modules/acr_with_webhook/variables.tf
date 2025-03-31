variable "name_acr" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "name_webhook" {
  description = "The name of the Web Hook Azure Container Registry"
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

variable "service_uri" {
  description = "URI of the service being used, typically referring to the endpoint of a resource such as Azure Container Registry or another related service."
  type        = string
}

variable "status" {
  description = "Indicates the current status of a process or service, such as active, inactive, or another relevant value depending on the context."
  type        = string
}

variable "scope" {
  description = "Defines the scope of permissions or access, such as a specific resource group or an application."
  type        = string
}

variable "actions" {
  description = "A list of allowed or to-be-executed actions, such as read, write, or other service-specific operations."
  type        = list(string)
}

variable "custom_headers" {
  description = "Custom headers that can be added to an HTTP request, such as for authentication or additional information."
  type        = map(string)
}

variable "tags" {
  type        = map(string)
  description = "Tags to be used."
  default     = {}
}