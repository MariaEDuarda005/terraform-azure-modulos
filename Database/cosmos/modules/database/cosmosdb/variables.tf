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

variable "name_cosmosdb" {
  description = "The name of the CosmosDB account."
  type        = string
  validation {
    condition     = length(var.name_cosmosdb) > 0
    error_message = "The CosmosDB account name cannot be empty."
  }
}

variable "offer_type" {
  description = "The offer type for the CosmosDB account (e.g., Standard)."
  type        = string
  validation {
    condition     = length(var.offer_type) > 0
    error_message = "The offer type cannot be empty."
  }
}

variable "kind" {
  description = "The kind of CosmosDB account (e.g., GlobalDocumentDB, MongoDB)."
  type        = string
  validation {
    condition     = length(var.kind) > 0
    error_message = "The kind cannot be empty."
  }
}

variable "storage_redundancy" {
  description = "The backup storage redundancy option for the CosmosDB account."
  type        = string
  validation {
    condition     = length(var.storage_redundancy) > 0
    error_message = "The backup storage redundancy must be either 'Geo' or 'Local' and cannot be empty"
  }
}


variable "consistency_level" {
  description = "The consistency level for the CosmosDB account (e.g., Session, Strong, Eventual)."
  type        = string
  validation {
    condition     = length(var.consistency_level) > 0
    error_message = "The consistency level cannot be empty."
  }
}

variable "max_interval_in_seconds" {
  description = "The maximum interval in seconds for the consistency policy."
  type        = number
  validation {
    condition     = var.max_interval_in_seconds > 0
    error_message = "The max interval in seconds must be greater than 0."
  }
}

variable "max_staleness_prefix" {
  description = "The maximum staleness prefix for the consistency policy."
  type        = number
  validation {
    condition     = var.max_staleness_prefix > 0
    error_message = "The max staleness prefix must be greater than 0."
  }
}

variable "geo_location" {
  description = "The Azure region for the CosmosDB geo location."
  type        = string
  validation {
    condition     = length(var.geo_location) > 0
    error_message = "The geo location cannot be empty."
  }
}

variable "failover_priority" {
  description = "The failover priority for the geo location."
  type        = number
  validation {
    condition     = var.failover_priority >= 0
    error_message = "The failover priority must be greater than or equal to 0."
  }
}

variable "geo_location_zone_redundant" {
  description = "Whether zone redundancy is enabled for the geo location."
  type        = bool
}

variable "is_virtual_network_filter_enabled" {
  description = "Whether the virtual network filter is enabled for the CosmosDB account."
  type        = bool
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the CosmosDB account."
  type        = bool
}

variable "backup_type" {
  description = "The backup type for the CosmosDB account (Periodic or Continuous)."
  type        = string
  default     = "Periodic"
  validation {
    condition     = length(var.backup_type) > 0
    error_message = "The backup type must be either 'Periodic' or 'Continuous'."
  }
}

variable "analytical_storage_enabled" {
  description = "Whether analytical storage is enabled."
  type        = bool
  default     = false
}

variable "minimal_tls_version" {
  description = "The minimum TLS version allowed for the CosmosDB account."
  type        = string
  validation {
    condition     = length(var.minimal_tls_version) > 0
    error_message = "The minimal TLS version must be one of 'Tls10', 'Tls11', or 'Tls12'."
  }
}

variable "network_acl_bypass_for_azure_services" {
  description = "Whether Azure services can bypass the network ACL."
  type        = bool
  default     = false
}

variable "partition_merge_enabled" {
  description = "Whether partition merge is enabled for the CosmosDB account."
  type        = bool
  default     = false
}

# variable "ip_range_filter_cosmosdb" {
#   description = "A comma-separated list of IP ranges to allow access to the CosmosDB account."
#   type        = string
#   default     = ""
# }

variable "backup_interval_in_minutes" {
  description = "The backup interval in minutes (must be between 60 and 1440)."
  type        = number
  validation {
    condition     = var.backup_interval_in_minutes >= 60 && var.backup_interval_in_minutes <= 1440
    error_message = "Backup interval must be between 60 and 1440 minutes."
  }
}

variable "backup_retention_in_hours" {
  description = "The retention period for backups in hours."
  type        = number
  validation {
    condition     = var.backup_retention_in_hours > 0
    error_message = "Backup retention must be greater than 0."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to be used."
  default     = {}
}