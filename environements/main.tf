module "azurerm_resource_group" {
    source="../modules/resource-group"
    rg=var.dev-rg
}

module "azurerm_virtual_network"{
    source="../modules/virtual-network"
    depends_on = [ module.azurerm_resource_group ]
    vnet=var.dev-vnet
}

module "azurerm_subnet" {
    source="../modules/subnet"
    depends_on= [ module.azurerm_virtual_network ]
    subnet=var.dev-subnet
}
 module "azurerm_network_interface"{
    source="../modules/network-interface"
    nic=var.dev-nic
    depends_on = [module.azurerm_subnet]
 }

 module "azurerm_virtual_machine" {
    source = "../modules/virtual-machine"
    vm=var.dev-vm
    depends_on = [ module.azurerm_network_interface ]
 }

 module "azurerm_public_ip" {
    source="../modules/pip"
    depends_on = [ module.azurerm_resource_group ]
    pip=var.dev-pip
 }

 module "azurerm_bastion_host"{
    source="../modules/bastion"
    bastion = var.dev-bastion-host
    depends_on = [ module.azurerm_subnet, module.azurerm_public_ip ]
    
 }

 module "azurerm_network_security_group"{
   source="../modules/network_security_group"
   depends_on = [ module.azurerm_resource_group ]
   nsg=var.nsgs
 }