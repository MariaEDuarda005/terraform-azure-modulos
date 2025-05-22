variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "The geographical location where the resource group will be created."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The resource group location cannot be empty."
  }
}

variable "name_mongodb" {
  description = "The name of the MongoDB cluster."
  type        = string
  validation {
    condition     = length(var.name_mongodb) > 0
    error_message = "MongoDB cluster name cannot be empty."
  }
}

variable "username" {
  description = "Administrator username for the MongoDB cluster."
  type        = string
  validation {
    condition     = length(var.username) > 0
    error_message = "Administrator username cannot be empty."
  }
}

variable "password" {
  description = "Administrator password for the MongoDB cluster."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.password) > 0
    error_message = "Administrator password cannot be empty."
  }
}

variable "shard_count" {
  description = "Number of shards in the MongoDB cluster."
  type        = number
  validation {
    condition     = var.shard_count > 0
    error_message = "Shard count must be greater than 0."
  }
}

variable "compute_tier" {
  description = "Compute tier (SKU) for the MongoDB cluster (e.g., M25, M30)."
  type        = string
  validation {
    condition     = length(var.compute_tier) > 0
    error_message = "Compute tier must be a valid SKU: M20, M25, M30, M40, M50, M60, M80."
  }
}

variable "high_availability_mode" {
  description = "High availability mode: Disabled, SameZone, or ZoneRedundantPreferred."
  type        = string
  validation {
    condition     = length(var.high_availability_mode) > 0
    error_message = "High availability mode must be one of: Disabled, SameZone, ZoneRedundantPreferred."
  }
}

variable "storage_size_in_gb" {
  description = "Storage size in GB for each MongoDB node."
  type        = number
  validation {
    condition     = var.storage_size_in_gb >= 32
    error_message = "Storage size must be at least 32 GB."
  }
}

variable "version_mongodb" {
  description = "MongoDB server version (e.g., 6.0, 7.0)."
  type        = string
  validation {
    condition     = length(var.version_mongodb) > 0
    error_message = "Version must be either 6.0 or 7.0."
  }
}

variable "public_network_access" {
  description = "Allow public access from azure services and resorces within azure to this cluster"
  type        = string
  validation {
    condition = length(var.public_network_access) > 0
    error_message = "Public Network Access must be either Disabled or Enabled."
  }
}

variable "tags" {
  description = "A map of tags to assign to the MongoDB cluster."
  type        = map(string)
  default     = {}
}