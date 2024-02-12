linuxvm = {
  VM1 = {
    name = "LinuxVM"
    rg= "RG2"
    location= "westeurope"
    size= "Standars_F2"
    username = "adminuser"
    passs= "2_#$E4Rqn-!"
    ni= ["/subscriptions/ea42f556-5106-4743-99b0-c129bfa71a47/resourceGroups/test_containerservice/providers/Microsoft.Network/networkInterfaces/k8s-agent-C02B7042-nic-0"]
    caching= "ReadWrite"
    type="Standard_LRS"
    publisher="Canonical"
    offer="0001-com-ubuntu-server-jammy"
    sku="22_04-lts"
    version="latest"
  }
}