resource "azurerm_availability_set" "tier1-AvailabilitySet" {
  name                         = "WebAvailSet-${var.app_env}"
  location                     = "${azurerm_resource_group.ResourceGrps.location}"
  resource_group_name          = "${azurerm_resource_group.ResourceGrps.name}"
  platform_update_domain_count = "5"
  platform_fault_domain_count  = "3"

  tags = var.default_tags
}

resource "azurerm_linux_virtual_machine" "business_vm" {
  name                  = "business-vm"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  network_interface_ids = [azurerm_network_interface.business_vm_nic.id]
  availability_set_id              = "${azurerm_availability_set.tier1-AvailabilitySet.id}"
  size                  = "Standard_B2ms"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  os_disk {
    name              = "business-vm-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

}

resource "azurerm_network_interface" "business_vm_nic" {
  name                      = "business-vm-nic"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  enable_accelerated_networking = true
  ip_configuration {
    name                          = "business-vm-ipconfig"
    subnet_id                     = "${azurerm_subnet.business.id}"
    private_ip_address_allocation = "Dynamic"
  }

}
