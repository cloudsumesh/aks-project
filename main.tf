resource "local_file" "demo" {
  filename = "sample.txt"
  content = "This is for demo"
  
}

resource "azurerm_resource_group" "rg" {
  name     = "Demo"
  location = "canadacentral"

}