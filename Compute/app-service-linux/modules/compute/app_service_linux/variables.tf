variable "name_web_app" {
  description = "The name of the Linux Web App."
  type        = string
  validation {
    condition     = length(var.name_web_app) > 0
    error_message = "The name of the web app cannot be empty."
  }
}

variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The Resource Group name cannot be empty."
  }
}

variable "resource_group_location" {
  description = "Location for the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The Resource Group location cannot be empty."
  }
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan."
  type        = string
  validation {
    condition     = length(var.service_plan_id) > 0
    error_message = "The App Service Plan ID cannot be empty."
  }
}

variable "always_on" {
  description = "Enable Always On setting for the Web App."
  type        = bool
  default     = true
}

variable "ftps_state" {
  description = "The FTPS state of the web app. Allowed values: AllAllowed, FtpsOnly, Disabled."
  type        = string
  validation {
    condition     = length(var.ftps_state) > 0
    error_message = "The ftps_state cannot be empty "
  }
}

variable "docker_image_name" {
  description = "The name and tag of the Docker image (e.g., 'myrepo/myimage:latest')."
  type        = string
  validation {
    condition     = length(var.docker_image_name) > 0
    error_message = "Docker image name cannot be empty."
  }
}

variable "docker_registry_url" {
  description = "The name of the Docker URL."
  type        = string
  validation {
    condition     = length(var.docker_registry_url) > 0
    error_message = "Docker url cannot be empty."
  }
}

variable "file_system_level" {
  description = "The level of application logging. Options: Off, Error, Warning, Information, Verbose."
  type        = string
  default     = "Verbose"
  validation {
    condition     = length(var.file_system_level) > 0
    error_message = "Logging level cannot be empty."
  }
}

variable "detailed_error_messages" {
  description = "Detailed of the error messages"
  type = bool
  default = true
}

variable "retention_in_days" {
  description = "File system retention in days"
  type = number
  validation {
    condition = var.retention_in_days > 0
    error_message = "The retetion in days cannot be null"
  }
}

variable "retention_in_mb" {
  description = "File system retention in mb"
  type = number
  validation {
    condition = var.retention_in_mb > 0
    error_message = "The retetion in mb cannot be null"
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to be used."
  default     = {}
}