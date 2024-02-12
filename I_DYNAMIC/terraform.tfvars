nsg = {
  NSG1={
    name="SecurityGaurd"
    location= "centralindia"
    rg="RG5"
  }
}

rules = {
  RULE1={
    name="Rule1"
    priority="100"
    direction="Inbond"
    access="Allow"
    protocol="Tcp"
    sourcePort= "80"
    destinationPort= "80"
    sourcePrefix="10.0.0.1"
    destinationPrefix="*"
  }
}