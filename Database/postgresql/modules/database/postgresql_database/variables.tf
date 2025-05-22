variable "name_postgresql_database" {
  description = "The name of the database"
  type        = string
  validation {
    condition     = length(var.name_postgresql_database) > 0
    error_message = "The database name cannot be empty"
  }
}

variable "server_id" {
  description = "The id of the PostgreSQL server."
  type        = string
  validation {
    condition     = length(var.server_id) > 0
    error_message = "The id of the PostgreSQL server cannot be empty."
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

variable "collation_database" {
  description = "The collation for the database."
  type        = string
  validation {
    condition     = length(var.collation_database) > 0
    error_message = "The collation cannot be empty."
  }
}