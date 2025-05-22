variable "password" {
  description = "The administrator password for the MySQL server."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.password) > 0
    error_message = "The administrator password cannot be empty."
  }
}