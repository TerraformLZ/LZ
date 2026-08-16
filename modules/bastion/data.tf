data "azurerm_subnet" "subnets"{
    for_each=var.bastion
    name=each.value.subnet_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.vnet_name
}

data "azurerm_public_ip" "pips" {
for_each=var.bastion
name                = each.value.public_ip_name
resource_group_name = each.value.resource_group_name
}