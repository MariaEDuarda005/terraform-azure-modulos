variable "public_key" {
  description = "The path to the SSH public key."
  type        = string
  sensitive   = true
}

# public_key = file("C:/Users/FMR8CA/.ssh/id_rsa.pub") 