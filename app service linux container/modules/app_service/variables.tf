variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
}

variable "name_web_app" {
  description = "The name of the Linux Web App."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan."
  type        = string
}

##

# variable "linux_fx_version" {
#   description = "The Docker image for the Linux Web App. Use the format 'DOCKER|<image>:<tag>'."
#   type        = string
# }

variable "docker_image_name" {
  description = "The docker image name"
  type = string
}

variable "always_on" {
  description = "Keep the app always running. Requires a non-free App Service Plan."
  type        = bool
  default     = true
}

# variable "app_command_line" {
#   description = "Command to run when the container starts. Leave empty for default."
#   type        = string
#   default     = ""
# }

# variable "websites_port" {
#   description = "Set the port"
#   type = string
# }

variable "ftps_state" {
  description = "State of the FTPS (FTP over SSL/TLS) configuration. It can indicate whether it is enabled, disabled, or set to another value."
  type = string
}

variable "file_system_level" {
  description = "Defines the access level or configuration of the file system. This could relate to permission types or access restrictions."
  type = string
}