terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.91.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "TFRG" {
  name     = "WindowsRG"
  location = "eastus"
}

resource "azurerm_virtual_network" "TFVNET" {
  name                = "WindowsVNET"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "WindowsRG"
}

resource "azurerm_subnet" "TFSUBNET" {
  name                 = "WindowsSUBNET"
  resource_group_name  = "WindowsRG"
  virtual_network_name = "WindowsVNET"
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "TFNIC" {
  name                = "WindowsNIC"
  location            = "eastus"
  resource_group_name = "WindowsRG"

  ip_configuration {
    name                          = "WindowsIP"
    subnet_id                     = "/subscriptions/{Subscription ID}/resourceGroups/MyResourceGroup/providers/Microsoft.Network/virtualNetworks/MyNet/subnets/MySubnet"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "TFVM" {
  name                = "WindowsVM"
  resource_group_name = "WindowsRG"
  location            = "eastus"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = ["/subscriptions/ea42f556-5106-4743-99b0-c129bfa71a47/resourceGroups/test_containerservice/providers/Microsoft.Network/networkInterfaces/k8s-agent-C02B7042-nic-0"]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}