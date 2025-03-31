variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public ip"
  type        = string
}

variable "allocation_method" {
  description = "Public IP allocation method"
  type        = string
}

variable "sku_ip" {
  description = "Public IP sku"
  type = string
}

variable "tags" {
  description = "Tags to be used."
  type        = map(string)
  default     = {}
}