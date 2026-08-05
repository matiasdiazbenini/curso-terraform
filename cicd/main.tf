provider "azurerm" {
  features {}
  subscription_id = "d36f499a-c545-4ff2-9ed5-457395f021c0"
}

resource "azurerm_resource_group" "rg" {
  name     = "cicd-group"
  location = "northcentralus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "continousdeployment"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container_cordoba" {
  name                  = "platzicordoba"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "container"
}

resource "azurerm_storage_container" "container_ruben" {
  name                  = "ruben123"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "container"
}
