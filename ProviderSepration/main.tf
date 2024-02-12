resource "azurerm_virtual_network" "TFVNET" {
  name                = "FSVNET"
  location            = "eastus"
  resource_group_name = "RGVNET"
  address_space       = ["10.0.0.0/16"]
  
  }