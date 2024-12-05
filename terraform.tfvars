resource_group_name = "dev-rg"
location            = "canadacentral"

vnet_name     = "dev-vnet"
address_space = ["10.0.0.0/16"]

aks_subnet_name                          = "dev-aks-subnet"
aks_subnet_address_prefixes              = ["10.0.1.0/24"]
azurerm_firewall_subnet_address_prefixes = ["10.0.2.0/24"]
dev_vnet_firewall_subnet_name            = "AzureFirewallSubnet"

dev_vnet_firewall_ip_name         = "dev-azure-firewall-ip-name"
dev_firewall_ip_allocation_method = "Static"
dev_firewall_ip_sku               = "Standard"

dev_azurerm_firewall_name                  = "dev-azure-firewall-name"
dev_azurerm_firewall_sku_name              = "AZFW_VNet"
dev_azurerm_firewall_sku_tier              = "Standard"
dev_azurerm_firewall_ip_configuration_name = "ipconfiguration"
dev_azurerm_firewall_policy_name           = "vnet-firewall-policy"



