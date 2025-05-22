variable "name_virtual_machine" {
  description = "The name of the virtual machine."
  type        = string
  validation {
    condition     = length(var.name_virtual_machine) > 0
    error_message = "The virtual machine name must not be empty."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name must not be empty."
  }
}

variable "resource_group_location" {
  description = "The location of the resource group."
  type        = string
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The resource group location must not be empty."
  }
}

variable "network_interface_id" {
  description = "The ID of the network interface to associate with the virtual machine."
  type        = string
  validation {
    condition     = length(var.network_interface_id) > 0
    error_message = "The network interface ID must not be empty."
  }
}

variable "size" {
  description = "The size of the virtual machine."
  type        = string
  validation {
    condition     = length(var.size) > 0
    error_message = "The virtual machine size must not be empty."
  }
}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
  validation {
    condition     = length(var.admin_username) > 0
    error_message = "The administrator username must not be empty."
  }
}

variable "admin_password" {
  description = "The administrator password for the virtual machine."
  type        = string
  validation {
    condition     = length(var.admin_password) > 0
    error_message = "The administrator password must not be empty."
  }
}

variable "caching" {
  description = "The caching behavior for the OS disk."
  type        = string
  default     = "ReadWrite"
  validation {
    condition     = contains(["ReadWrite", "None", "ReadOnly"], var.caching)
    error_message = "The caching value must be one of: ReadWrite, None, ReadOnly."
  }
}

variable "storage_account_type" {
  description = "The storage account type for the OS disk."
  type        = string
  default     = "Standard_LRS"
  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS"], var.storage_account_type)
    error_message = "The storage account type must be either Standard_LRS or Premium_LRS."
  }
}

variable "publisher" {
  description = "The publisher of the OS image."
  type        = string
  default     = "Canonical"
  validation {
    condition     = length(var.publisher) > 0
    error_message = "The publisher must not be empty."
  }
}

variable "offer" {
  description = "The offer of the OS image."
  type        = string
  validation {
    condition     = length(var.offer) > 0
    error_message = "The offer must not be empty."
  }
}

variable "sku" {
  description = "The SKU of the OS image."
  type        = string
  validation {
    condition     = length(var.sku) > 0
    error_message = "The SKU must not be empty."
  }
}

variable "version_image" {
  description = "The version of the OS image."
  type        = string
  validation {
    condition     = length(var.version_image) > 0
    error_message = "The image version must not be empty."
  }
}
