provider "azurerm" {
  features {}
  subscription_id = "d36f499a-c545-4ff2-9ed5-457395f021c0"
}

import {
  to = azurerm_storage_account.mi_cuenta
  id = "/subscriptions/d36f499a-c545-4ff2-9ed5-457395f021c0/resourceGroups/logsGroup/providers/Microsoft.Storage/storageAccounts/logstorageaccount189"
}

resource "azurerm_storage_account" "mi_cuenta" {
  name                     = "logstorageaccount189"
  resource_group_name      = "logsGroup"
  location                 = "northcentralus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}