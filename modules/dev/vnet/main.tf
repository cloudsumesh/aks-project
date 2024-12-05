# Virtual Network
resource "azurerm_virtual_network" "dev_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

}

# AKS subnet

resource "azurerm_subnet" "dev_aks_subnet" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  address_prefixes     = var.aks_subnet_address_prefixes

}


# AzureFirewall Subnet

resource "azurerm_subnet" "dev_azurefirewall_subnet" {
  name                 = var.dev_vnet_firewall_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.dev_vnet.name
  address_prefixes     = var.azurerm_firewall_subnet_address_prefixes

}
# Azure firewall IP
resource "azurerm_public_ip" "af_ip" {
  name                = var.dev_vnet_firewall_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.dev_firewall_ip_allocation_method
  sku                 = var.dev_firewall_ip_sku
}

#Azure Firewall
resource "azurerm_firewall" "azure_firewall" {
  name                = var.dev_azurerm_firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.dev_azurerm_firewall_sku_name
  sku_tier            = var.dev_azurerm_firewall_sku_tier

  ip_configuration {
    name                 = var.dev_azurerm_firewall_ip_configuration_name
    subnet_id            = azurerm_subnet.dev_azurefirewall_subnet.id
    public_ip_address_id = azurerm_public_ip.af_ip.id
  }
  firewall_policy_id = azurerm_firewall_policy.firewall-policy.id
}

resource "azurerm_firewall_policy" "firewall-policy" {
  name                = var.dev_azurerm_firewall_policy_name
  resource_group_name = var.resource_group_name
  location            = var.location

}


# Create Azure network security group for aks_subnet

resource "azurerm_network_security_group" "dev_aks_subnet_nsg" {
  name                = "dev_aks_subnet_nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "dev_nsg_aks_rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate Network Security Group with Subnet
resource "azurerm_subnet_network_security_group_association" "dev_aks_subnet_nsg_asso" {
  subnet_id                 = azurerm_subnet.dev_aks_subnet.id
  network_security_group_id = azurerm_network_security_group.dev_aks_subnet_nsg.id
}