terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}

provider "azurerm" {
 features {}
}

resource "azurerm_resource_group" "TFRG" {
  name     = "ResourceGroup"
  location = "eastus"
}