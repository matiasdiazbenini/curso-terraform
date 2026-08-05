terraform {
  backend "azurerm" {
    storage_account_name = "estadosterraformmatidb"
    container_name       = "states"
    key                  = "estados.tfstate"

    use_azuread_auth = true
  }
}