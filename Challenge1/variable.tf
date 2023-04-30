# Variables for RG
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}


# Variables for VNet configuration
variable "vnet_cidr" {
  type = string
}

variable "gateway_subnet_cidr" {
  type = list(string)
}

variable "app_subnet_cidr" {
  type = string
}

variable "business_vm_subnet_cidr" {
  type = string
}

variable "mysql_subnet_cidr" {
  type = string
}


# Variables for Application Gateway configuration
variable "appgw_sku" {
  type = string
}

# Variables for VM configuration
variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

# Variables for MySQL PaaS configuration
variable "mysql_admin_username" {
  type = string
}

variable "mysql_admin_password" {
  type = string
}

# Variables for service endpoints
variable "business_vm_subnet_id" {
  type = string
}

variable "mysql_server_subnet_id" {
  type = string
}



