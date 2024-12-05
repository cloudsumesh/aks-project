
# Resource Group

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

}
module "vnet" {
  source                                     = "./modules/dev/vnet"
  vnet_name                                  = var.vnet_name
  location                                   = azurerm_resource_group.rg.location
  resource_group_name                        = azurerm_resource_group.rg.name
  address_space                              = var.address_space
  aks_subnet_name                            = var.aks_subnet_name
  aks_subnet_address_prefixes                = var.aks_subnet_address_prefixes
  azurerm_firewall_subnet_address_prefixes   = var.azurerm_firewall_subnet_address_prefixes
  dev_vnet_firewall_subnet_name              = var.dev_vnet_firewall_subnet_name
  dev_vnet_firewall_ip_name                  = var.dev_vnet_firewall_ip_name
  dev_firewall_ip_allocation_method          = var.dev_firewall_ip_allocation_method
  dev_firewall_ip_sku                        = var.dev_firewall_ip_sku
  dev_azurerm_firewall_name                  = var.dev_azurerm_firewall_name
  dev_azurerm_firewall_sku_name              = var.dev_azurerm_firewall_sku_name
  dev_azurerm_firewall_sku_tier              = var.dev_azurerm_firewall_sku_tier
  dev_azurerm_firewall_ip_configuration_name = var.dev_azurerm_firewall_ip_configuration_name
  dev_azurerm_firewall_policy_name           = var.dev_azurerm_firewall_policy_name

}

