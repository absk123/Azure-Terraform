resource "azurerm_network_security_group" "TFNSG" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg

dynamic "security_rule" {
  for_each = var.rules
  content {
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = security_rule.value.access
    protocol                   = security_rule.value.protocol
    source_port_range          = security_rule.value.sourcePort
    destination_port_range     = security_rule.value.destinationPort
    source_address_prefix      = security_rule.value.sourcePrefix
    destination_address_prefix = security_rule.value.destinationPrefix
    }
  }
}
