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