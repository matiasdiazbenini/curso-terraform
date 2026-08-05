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
resource "azurerm_resource_group" "resource_group" {
  name     = "azure-functions-test-rg"
  location = "northcentralus"
}
module "azurefunctions" {
  source  = "matiasdiazbenini/azurefunctions/azurerm"
  version = "1.1.0"
  rg_name                   = azurerm_resource_group.resource_group.name
  rg_location               = azurerm_resource_group.resource_group.location
  storage_account_name      = "functionsapptest189"
  app_service_name          = "azure-functions-test-service-plan"
  function_name             = "curso-terraform-azure-functions189"
  storage_account_tier      = "Standard"
  storage_replication_type  = "LRS"
  app_service_plan_sku_tier = "Basic"
  app_service_plan_sku_size = "B2"
}