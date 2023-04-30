resource "azurerm_mysql_server" "mysql" {
  name                = "mysql"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  sku_name            = "GP_Gen5_2"
  storage_profile {
    storage_mb                  = 51200
    backup_retention_days       = 7
    geo_redundant_backup_enabled = false
  }
  administrator_login          = var.mysql_admin_username
  administrator_login_password = var.mysql_admin_password
  version                      = "5.7"
}

resource "azurerm_mysql_database" "mysql_db" {
  name                = "mysql-db"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}

resource "azurerm_mysql_firewall_rule" "mysql_firewall_rule" {
  name                = "AllowAllWindowsAzureIps"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = azurerm_mysql_server.mysql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mysql_virtual_network_rule" "mysql_vnet_rule" {
  name                = "vnet-rule"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = azurerm_mysql_server.mysql.name
  subnet_id           = "${azurerm_subnet.mysql.id}"
}

resource "azurerm_subnet_service_endpoint_storage_policy" "mysql_subnet_service_endpoint_storage_policy" {
  name                    = "mysql-subnet-service-endpoint-storage-policy"
  resource_group_name     = "${azurerm_resource_group.rg.name}"
  subnet_id               = "${azurerm_subnet.mysql.id}"
  service_endpoint_policy = ["Microsoft.Storage"]
}

output "mysql_server_fqdn" {
  value = azurerm_mysql_server.mysql.fqdn
}
