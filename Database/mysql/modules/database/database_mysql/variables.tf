variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name cannot be empty."
  }
}

variable "database_name" {
  description = "The name of the database"
  type        = string
  validation {
    condition     = length(var.database_name) > 0
    error_message = "The database name cannot be empty"
  }
}

variable "server_name_mysql" {
  description = "The name of the MySQL server."
  type        = string
  validation {
    condition     = length(var.server_name_mysql) > 0
    error_message = "The name of the MySQL server cannot be empty."
  }
}

variable "charset" {
  description = "The character set for the database."
  type        = string
  validation {
    condition     = length(var.charset) > 0
    error_message = "The charset cannot be empty."
  }
}

variable "collation" {
  description = "The collation for the database."
  type        = string
  validation {
    condition     = length(var.collation) > 0
    error_message = "The collation cannot be empty."
  }
}