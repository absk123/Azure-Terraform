resource "azurerm_express_route_port" "TFEXPRESSRPORT" {
  name                = "port1"
  resource_group_name = "RG1"
  location            = "eastus"
  peering_location    = "Pune-BSNL"
  bandwidth_in_gbps   = 10
  encapsulation       = "Dot1Q"
}