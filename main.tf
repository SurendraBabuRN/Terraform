resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.place
}

variable "rgname" {
  default = "rg_suriterraform"
  type    = string
}

variable "place" {
  default = "centralindia"
  type    = string
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.addspace
}

variable "addspace" {
  default = ["10.0.0.0/16"]   # must cover subnet ranges
  type    = list(string)
}

variable "vnet_name" {
  default = "vnet_suriterraform"
  type    = string
}

resource "azurerm_subnet" "subnet" {
  count = length(var.address_prefix)

  name                 = var.address_prefix[count.index].name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.address_prefix[count.index].address_prefixes
}

variable "address_prefix" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))

  default = [
    {
      name             = "tf_subnet"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "aaa"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]
}
