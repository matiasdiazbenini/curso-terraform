terraform {
  backend "azurerm" {
    resource_group_name  = "EstadosTerraform"
    storage_account_name = "estadosterraformmatidb"
    container_name       = "githubactionstate"
    key                  = "estados.tfstate"
    use_azuread_auth     = true
  }
}