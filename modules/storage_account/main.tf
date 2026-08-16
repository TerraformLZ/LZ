resource "azurerm_storage_account""stgs"{
    for_each=var.stg
    name=each.value.name
    resource_group_name=each.value.resource_group_name
    account_tier=each.value.account_tier
    account_replication_type=each.value.account_account_reolication_type
    location=each.value.location
}