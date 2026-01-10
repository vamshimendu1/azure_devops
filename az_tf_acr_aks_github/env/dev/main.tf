resource "azurerm_resource_group" "rg" {
  name     = "rg-dev"
  location = "East US"
}

module "acr" {
  source              = "../../modules/acr"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}

module "aks" {
  source              = "../../modules/aks"
  acr_name            = var.acr_name
  aks_name            = var.aks_name
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_id              = module.acr.acr_id
}