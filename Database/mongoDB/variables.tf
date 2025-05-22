variable "password_mongodb" {
  description = "The administrator password."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.password_mongodb) > 0
    error_message = "The administrator password cannot be empty."
  }
}