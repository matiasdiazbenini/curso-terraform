provider "azurerm" {
  features {}
  subscription_id = "d36f499a-c545-4ff2-9ed5-457395f021c0"
}

variable "rg_nombre" {
  type = string
}

locals {
  group_name = "matidb${var.rg_nombre}"
}

resource "azurerm_resource_group" "rg" {
  location = "northcentralus"
  name     = local.group_name
}