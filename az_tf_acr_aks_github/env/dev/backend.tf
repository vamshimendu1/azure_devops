terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-day04"
    storage_account_name = "day0424893"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}