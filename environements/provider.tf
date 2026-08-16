terraform{
    required_providers{
        azurerm={
            source= "hashicorp/azurerm"
            version="4.80.0"
        }
    }
    backend "azurerm"{
        resource_group_name = "alpha"
        storage_account_name="alpha1993"
        container_name="javed1993"
        key="remote_backend.tfstate"
    }

}

provider "azurerm"{
    features { }
}
