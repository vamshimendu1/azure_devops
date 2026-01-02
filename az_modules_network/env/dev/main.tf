resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = var.environment
    rg_name     = var.resource_group_name
  }
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vnet_name     = var.vnet_name
  address_space = var.address_space

  subnet_name   = var.subnet_name
  subnet_prefix = var.subnet_prefix
}