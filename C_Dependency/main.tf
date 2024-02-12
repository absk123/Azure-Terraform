terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}

provider "azurerm" {
  features {  }
}

resource "azurerm_resource_group" "TFRG" {
  name     = "SARG"
  location = "eastus"
}

resource "azurerm_storage_account" "TFSA" {
  name                     = "storageaccount"
  resource_group_name      = azurerm_resource_group.TFRG.name
  location                 = azurerm_resource_group.TFRG.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}