resource "azurerm_resource_group" "TFRG" {
  for_each = toset(var.name)
  name     = each.value
  location = "eastus"
}