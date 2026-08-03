resource "azurecaf_name" "rg_name" {
  name          = "mati"
  resource_type = "azurerm_resource_group"
  prefixes      = ["platzi"]
  suffixes      = ["y", "z"]
  random_length = 3
  clean_input   = true
  separator     = "-"
}

resource "azurerm_resource_group" "rg" {
  name     = azurecaf_name.rg_name.result
  location = "Mexico Central"
}

resource "azurecaf_name" "storage_name" {
  name          = "mati"
  resource_type = "azurerm_storage_account"
  prefixes      = ["platzi"]
  random_length = 3
  clean_input   = true
  separator     = "-"
}

resource "azurerm_storage_account" "storage_account" {
  name                          = azurecaf_name.storage_name.result
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}
