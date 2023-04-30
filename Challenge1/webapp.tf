resource "azurerm_app_service_plan" "webapp_plan" {
  name                = "webapp-plan"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "webapp1" {
  name                = "webapp1"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  app_service_plan_id = azurerm_app_service_plan.webapp_plan.id
  site_config {
    linux_fx_version = "DOCKER|${var.business_vm_docker_image}"
  }
  connection_string {
    name  = "MySQLDBConnectionString"
    type  = "MYSQL"
    value = "Server=${module.mysql_server.fqdn};Database=myDataBase;Uid=myUsername;Pwd=myPassword;"
  }
  depends_on = [
    azurerm_app_service_plan.webapp_plan
  ]
}

resource "azurerm_app_service" "webapp2" {
  name                = "webapp2"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  app_service_plan_id = azurerm_app_service_plan.webapp_plan.id
  site_config {
    linux_fx_version = "DOCKER|${var.business_vm_docker_image}"
  }
  connection_string {
    name  = "MySQLDBConnectionString"
    type  = "MYSQL"
    value = "Server=${module.mysql_server.fqdn};Database=myDataBase;Uid=myUsername;Pwd=myPassword;"
  }
  depends_on = [
    azurerm_app_service_plan.webapp_plan
  ]
}
