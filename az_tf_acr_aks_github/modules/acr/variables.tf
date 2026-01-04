variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = "SKU tier for ACR"
}

variable "admin_enabled" {
  type        = bool
  default     = false
  description = "Enable admin access"
}