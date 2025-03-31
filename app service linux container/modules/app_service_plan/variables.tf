variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "name_service_plan" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "os_type" {
  description = "The operating system type for the App Service Plan. Should be 'Linux' or 'Windows'."
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The pricing tier for the App Service Plan. Examples: B1, S1, P1v2."
  type        = string
}