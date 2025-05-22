variable "allow_public_ip_name" {
  description = "The name of the public ip"
  type = string
  validation {
    condition     = length(var.allow_public_ip_name) > 0
    error_message = "The name of the public ip cannot be empty."
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

variable "start_ip_address" {
  description = "The starting IP address for the firewall rule."
  type        = string
  default     = "0.0.0.0"
  validation {
    condition     = length(var.start_ip_address) > 0
    error_message = "The starting IP address cannot be empty."
  }
}

variable "end_ip_address" {
  description = "The ending IP address for the firewall rule."
  type        = string
  default     = "255.255.255.255"
  validation {
    condition     = length(var.end_ip_address) > 0
    error_message = "The ending IP address cannot be empty."
  }
}