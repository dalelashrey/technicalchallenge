resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet"
  address_space       = [var.vnet_cidr]
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

resource "azurerm_virtual_network" "vnet" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

resource "azurerm_subnet" "gateway" {
  name                 = "gateway"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}

resource "azurerm_subnet" "app" {
  name                 = "app"
  address_prefixes     = ["10.0.2.0/24"]
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}

resource "azurerm_subnet" "business" {
  name                 = "business"
  address_prefixes     = ["10.0.3.0/24"]
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}

resource "azurerm_subnet" "mysql" {
  name                 = "mysql"
  address_prefixes     = ["10.0.4.0/24"]
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}
}
