variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for the resources"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The CIDR address space for the virtual network"
  type        = list(string)
}

variable "aks_subnet_name" {
  description = "The AKS Subnet name"
  type        = string

}

variable "aks_subnet_address_prefixes" {
  description = "The CIDR address space for the AKS sub network"
  type        = list(string)
}
variable "azurerm_firewall_subnet_address_prefixes" {
  description = "The CIDR address space for the Azurerm Firewall sub network"
  type        = list(string)
}

variable "dev_vnet_firewall_subnet_name" {
  description = "The Azure Firewall Subnet name"
  type        = string

}

variable "dev_vnet_firewall_ip_name" {
  description = "The Azure Firewall IP name"
  type        = string

}
variable "dev_firewall_ip_allocation_method" {
  description = "The Azure Firewall IP Allocation Method"
  type        = string

}
variable "dev_firewall_ip_sku" {
  description = "The Azure Firewall IP SKU"
  type        = string

}

variable "dev_azurerm_firewall_name" {
  description = "The Azure Firewall Name"
  type        = string

}

variable "dev_azurerm_firewall_sku_name" {
  description = "The Azure Firewall SKU Name"
  type        = string

}
variable "dev_azurerm_firewall_sku_tier" {
  description = "The Azure Firewall SKU Tier"
  type        = string

}
variable "dev_azurerm_firewall_ip_configuration_name" {
  description = "The Azure Firewall IP Configuration Name"
  type        = string

}

variable "dev_azurerm_firewall_policy_name" {
  description = "The Azure Firewall Policy Name"
  type        = string

}










