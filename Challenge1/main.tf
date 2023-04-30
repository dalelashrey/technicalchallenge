provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "challenge-resource-group"
  location = "westus2"
}

