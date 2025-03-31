variable "admin_username" {
  description = "The administrator name for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the virtual machine."
  type        = string
  sensitive   = true
}