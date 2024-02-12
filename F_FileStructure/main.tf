resource "azurerm_subnet" "TFSUBNET" {
  name                 = var.name
  resource_group_name  = var.RG
  virtual_network_name = var.vnet
  address_prefixes     = var.ipadd
  
    }