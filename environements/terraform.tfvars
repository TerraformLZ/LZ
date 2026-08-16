dev-rg= {
    rg1={
    name="rg-dev-eastjapan"
    location="japaneast2"
    }
    resource_groups = {

  rg1 = {

    name = "humana-rg"

    location = "East US"

  }

}
}
dev-vnet={
    vnet1={
    name="dev-vnet-eastjapan"
    location="japaneast"
    resource_group_name="rg-dev-eastjapan"
    address_space=["10.0.0.0/16"]
}
}

dev-subnet={
    subnet1={
         name="dev1-subnet-eastjapan"
         resource_group_name="rg-dev-eastjapan"
         virtual_network_name="dev-vnet-eastjapan"
         address_prefixes=["10.0.1.0/24"]
    }
    subnet2={
        name="dev2_subnet-eastjapan"
        resource_group_name="rg-dev-eastjapan"
        virtual_network_name="dev-vnet-eastjapan"
        address_prefixes=["10.0.2.0/24"]
    }
    subnet3={
        name="AzureBastionSubnet"
         resource_group_name="rg-dev-eastjapan"
         virtual_network_name="dev-vnet-eastjapan"
         address_prefixes=["10.0.3.0/24"]
    }
   
}
dev-nic={
    nic1={
    name="dev-nic-eastjapan"
    location="japaneast"
    resource_group_name="rg-dev-eastjapan"
    subnet_name="dev1-subnet-eastjapan"
    vnet_name="dev-vnet-eastjapan"
    ip_config_name= "dev-nic_ip_config"  
}
    nic2={
        name="dev2-nic-eastjapan"
        location="japaneast"
        resource_group_name="rg-dev-eastjapan"
        subnet_name="dev2_subnet-eastjapan"
        vnet_name="dev-vnet-eastjapan"
        ip_config_name="dev-nic_ip_config"
    }
}

dev-vm = {
    vm1={
        name="frontend-vm"
        location="japaneast"
        resource_group_name="rg-dev-eastjapan"
        vm_size="Standard_D2s_v3"
        admin_username = "sumanta"
        admin_password = "sumanta@123453"
        nic_name="dev-nic-eastjapan"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        publisher = "Canonical"
        offer     = "ubuntu-24_04-lts"
        sku       = "server"
        version   = "latest"
        
    }
    vm2={
        name="backned-vm"
        location="japaneast"
        resource_group_name="rg-dev-eastjapan"
        vm_size="Standard_D2s_v3"
        admin_username = "sumanta"
        admin_password = "sumanta@123453"
        nic_name="dev2-nic-eastjapan"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        publisher = "Canonical"
        offer     = "ubuntu-24_04-lts"
        sku       = "server"
        version   = "latest"
    }
}

dev-bastion-host = {
    bastion1={
    name= "dev-bastion"
    location="japaneast"
    resource_group_name="rg-dev-eastjapan"
    ip_config_name="bastion-config"
    subnet_name="AzureBastionSubnet"
    public_ip_name="dev-public_ip"
    vnet_name = "dev-vnet-eastjapan"
}
}

dev-pip = {
    pip1={
    name= "dev-public_ip"
    resource_group_name="rg-dev-eastjapan"
    location="japaneast"
    allocation_method   = "Static"
}
}

nsgs = {
        nsg1={
        name                = "acceptanceTestSecurityGroup1"
        location            = "japaneast"
        resource_group_name = "rg-dev-eastjapan"
        security_rulename  = "test123"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    }
    
    stgs={
        stg1={
            name="dev-stg"
            location="japaneast"
            resource_group_name="rg-dev-eastjapan"
            account_tier="Standard"
            account_replication_type="LRS"
            tags = {
            Environment = "Dev"
            Owner       = "Sumanta"
            Project     = "LandingZone"
        }
    }
        stg2={
            name="dev-stg2"
            location="japaneast"
            resource_group_name="rg-dev-eastjapan"
            account_tier="Standard"
            account_replication_type="LRS"
            tags = {
            Environment = "Dev"
            Owner       = "Sumanta"
            Project     = "LandingZone"
        }            
    }
}
    
