variable "name_container_app_environment" {
  description = "The name of the Container App Environment."
  type        = string
  validation {
    condition     = length(var.name_container_app_environment) > 0
    error_message = "The Container App Environment name cannot be empty."
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

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name cannot be empty."
  }
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace."
  type        = string
  validation {
    condition     = length(var.log_analytics_workspace_id) > 0
    error_message = "The Log Analytics Workspace ID cannot be empty."
  }
}

variable "workload_profile_type" {
  description = "Specifies the type of workload profile (e.g., 'Consumption', 'Dev', 'Production')."
  type        = string
  validation {
    condition     = length(var.workload_profile_type) > 0
    error_message = "workload_profile_type cannot be empty."
  }
}

variable "name_workload_profile" {
  description = "The name of the workload profile. Must not be empty."
  type        = string
  validation {
    condition     = length(var.name_workload_profile) > 0
    error_message = "name_workload_profile cannot be empty."
  }
}

variable "min_replicas" {
  description = "The minimum number of replicas for autoscaling."
  type        = number
  validation {
    condition     = var.min_replicas >= 0
    error_message = "min_replicas must be greater than or equal to 0."
  }
}

variable "max_replicas" {
  description = "The maximum number of replicas for autoscaling."
  type        = number
  validation {
    condition     = var.max_replicas > var.min_replicas
    error_message = "max_replicas must be greater than min_replicas."
  }
}

variable "name_container_app" {
  description = "The name of the Azure Container App."
  type        = string
  validation {
    condition     = length(var.name_container_app) > 0
    error_message = "The Container App name cannot be empty."
  }
}

variable "revision_mode" {
  description = "The revision mode for the Container App (e.g., 'Single' or 'Multiple')."
  type        = string
  default     = "Single"
  validation {
    condition     = length(var.revision_mode) > 0
    error_message = "Revision mode cannot be empty and must be either 'Single' or 'Multiple'."
  }
}

variable "name_container" {
  description = "The name of the container."
  type        = string
  validation {
    condition     = length(var.name_container) > 0
    error_message = "The container name cannot be empty."
  }
}

variable "image_container" {
  description = "The image of the container (e.g., nginx:latest)."
  type        = string
  validation {
    condition     = length(var.image_container) > 0
    error_message = "The container image cannot be empty."
  }
}

variable "cpu" {
  description = "Amount of CPU allocated to the container."
  type        = number
  validation {
    condition     = var.cpu > 0
    error_message = "CPU must be greater than 0."
  }
}

variable "memory" {
  description = "Amount of memory (in GiB) allocated to the container."
  type        = string
  validation {
    condition     = length(var.memory) > 0
    error_message = "Memory cannot be empty."
  }
}

variable "port" {
  description = "Port used by the liveness probe."
  type        = number
  validation {
    condition     = var.port > 0
    error_message = "Port must be a positive number."
  }
}

variable "transport" {
  description = "Transport protocol used by the liveness probe (e.g., HTTP, TCP)."
  type        = string
  validation {
    condition     = length(var.transport) > 0
    error_message = "Transport cannot be empty and must be either 'HTTP' or 'TCP'."
  }
}

variable "name_env" {
  description = "Environment variable name for the container."
  type        = string
  validation {
    condition     = length(var.name_env) > 0
    error_message = "Environment variable name cannot be empty."
  }
}

variable "external_enabled" {
  description = "Whether external ingress is enabled."
  type        = bool
}

variable "target_port" {
  description = "Port that ingress will target."
  type        = number
  validation {
    condition     = var.target_port > 0
    error_message = "Target port must be a positive number."
  }
}

variable "ingress_transport" {
  description = "Ingress transport method (e.g., 'auto', 'http')."
  type        = string
  validation {
    condition     = length(var.ingress_transport) > 0
    error_message = "Ingress transport cannot be empty and must be one of: 'auto', 'http', or 'http2'."
  }
}

variable "container_ip_restriction_action" {
  description = "The action to be applied to the IP restriction (e.g., 'Allow', 'Deny')."
  type        = string
  validation {
    condition     = length(var.container_ip_restriction_action) > 0
    error_message = "container_ip_restriction_action cannot be empty."
  }
}

variable "container_ip_restriction_range" {
  description = "The IP address range to apply the restriction (e.g., '192.168.1.0/24')."
  type        = string
  validation {
    condition     = length(var.container_ip_restriction_range) > 0
    error_message = "container_ip_restriction_range cannot be empty."
  }
}

variable "container_ip_restriction_name" {
  description = "The name of the IP restriction rule."
  type        = string
  validation {
    condition     = length(var.container_ip_restriction_name) > 0
    error_message = "container_ip_restriction_name cannot be empty."
  }
}

variable "percentage" {
  description = "The traffic weight percentage (e.g., 80)."
  type        = number
  validation {
    condition     = var.percentage >= 0 && var.percentage <= 100
    error_message = "percentage must be between 0 and 100."
  }
}

variable "revision_suffix" {
  description = "The suffix to be used for the revision (e.g., 'v1', 'v2')."
  type        = string
  validation {
    condition     = length(var.revision_suffix) > 0
    error_message = "revision_suffix cannot be empty."
  }
}

variable "latest_revision" {
  description = "Indicates if this is the latest revision (true/false)."
  type        = bool
}


variable "tags" {
  type        = map(string)
  description = "Tags to be used."
  default     = {}
}