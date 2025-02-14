terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.18.0"
    }
  }
}

provider "azurerm" {
  
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
    name = "canaravm-RG"
    location = var.location
  
}

resource "azurerm_virtual_network" "vnet" {
    name = "canaraVnet"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["10.0.0.0/16"]
    depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "snet" {
    name = "subnet01"
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name = azurerm_resource_group.rg.name
    address_prefixes = ["10.0.1.0/24"]
    depends_on = [ azurerm_resource_group.rg, azurerm_virtual_network.vnet ]
  
}

resource "azurerm_public_ip" "publicIP" {
    name = "publicIP"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_virtual_network.vnet.location
    allocation_method = "Static"
  
}

resource "azurerm_network_security_group" "nsg01" {
    name = "nsg01"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    security_rule {
        name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_network_interface" "nic01" {
    name = "nic01"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    ip_configuration {
      name = "nic_conf"
      subnet_id = azurerm_subnet.snet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.publicIP.id
    }
    

}

resource "azurerm_network_interface_security_group_association" "nsg-nic-01" {
    network_interface_id = azurerm_network_interface.nic01.id
    network_security_group_id = azurerm_network_security_group.nsg01.id
}

resource "tls_private_key" "azureuser_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "azurerm_linux_virtual_machine" "vm" {
    name = "canaraVM"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    network_interface_ids = [azurerm_network_interface.nic01.id]
    size = "Standard_D2s_v3"
    os_disk {
      name = "terra-osdisk"
      caching = "ReadWrite"
      storage_account_type = "Premium_LRS"      
    }
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    }
    admin_username = "azureuser"
    admin_ssh_key {
        username = var.username
        public_key = tls_private_key.azureuser_ssh.public_key_openssh
    }

  
depends_on = [ tls_private_key.azureuser_ssh, azurerm_public_ip.publicIP,azurerm_network_interface.nic01, azurerm_virtual_network.vnet, azurerm_resource_group.rg]
  
}
