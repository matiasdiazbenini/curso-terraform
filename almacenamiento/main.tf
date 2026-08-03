terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "d36f499a-c545-4ff2-9ed5-457395f021c0"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_nombre
  location = "Mexico Central"
}

resource "azurerm_storage_account" "storage_account" {
  name                          = "matiasdbtestplatzi"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}

output "cadena_conexion" {
  value     = azurerm_storage_account.storage_account.primary_connection_string
  sensitive = true
}