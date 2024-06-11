resource "azurerm_linux_virtual_machine" "TFVM" {
  for_each = var.linuxvm
  name                = each.value.name
  resource_group_name = each.value.rg
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.username
  admin_password = each.value.passs
  network_interface_ids = each.value.ni

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
