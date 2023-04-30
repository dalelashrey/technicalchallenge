resource "azurerm_public_ip" "frontend_ip" {
  name                = "appgw-frontend-ip"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "appgw" {
  name                = "my-appgw"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  sku                 = var.appgw_sku
  gateway_ip_configurations {
    name      = "appgw-ip-config"
    subnet_id = "${azurerm_subnet.gateway.id}"
  }
  frontend_port {
    name = "http"
    port = 80
  }
  frontend_port {
    name = "https"
    port = 443
  }
  frontend_ip_configuration {
    name                 = "appgw-frontend-ip-config"
    public_ip_address_id = azurerm_public_ip.frontend_ip.id
  }
  backend_address_pool {
    name = "appgw-backend-pool"
    backend_address {
      fqdn = "webapp1.azurewebsites.net"
    }
    backend_address {
      fqdn = "webapp2.azurewebsites.net"
    }
  }
  http_listener {
    name                           = "appgw-http-listener"
    frontend_ip_configuration_id  = azurerm_application_gateway.appgw.frontend_ip_configuration[0].id
    frontend_port_name             = "http"
    protocol                       = "Http"
  }
  http_listener {
    name                           = "appgw-https-listener"
    frontend_ip_configuration_id  = azurerm_application_gateway.appgw.frontend_ip_configuration[0].id
    frontend_port_name             = "https"
    protocol                       = "Https"
    ssl_certificate_name           = "my-ssl-cert"
    require_server_name_indication = true
  }
  request_routing_rule {
    name                       = "test-routing-rule"
    rule_type                  = "PathBasedRouting"
    http_listener_name         = "appgw-http-listener"
    backend_address_pool_name  = "appgw-backend-pool"
    path_based_rule {
      backend_http_settings_name = "appgw-http-settings"
      path                       = "/text/*"
    }
  }
  request_routing_rule {
    name                       = "image-routing-rule"
    rule_type                  = "PathBasedRouting"
    http_listener_name         = "appgw-https-listener"
    backend_address_pool_name  = "appgw-backend-pool"
    path_based_rule {
      backend_http_settings_name = "appgw-https-settings"
      path                       = "/image/*"
    }
  }
  backend_http_settings {
    name                  = "appgw-http-settings"
    port                  = 9001
  }
  backend_http_settings {
    name                  = "appgw-https-settings"
    port                  = 8081
  }
  probe {
    name                = "test-probe"
    protocol            = "Http"
    path                = "/"
    interval            = "15"
    timeout             = "60"
    unhealthy_threshold = "3"
    port                = 9001
  }
  probe {
    name                = "image-probe"
    protocol            = "Https"
    path                = "/health"
    interval            = "15"
    timeout             = "60"
    unhealthy_threshold = "3"
    port                = 8081
  }
}
