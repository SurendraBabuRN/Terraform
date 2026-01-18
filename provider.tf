terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
    features {}
client_id = "0b3f3012-6176-423d-a268-2e65e72686bc"
client_secret = "x4R8Q~-VITiaVcG8WgvmUXb9Jc4ZBxC7WT_qtaN8"
tenant_id = "9c1e50f3-2148-40bc-b941-0f3e5c9ceeb6"
subscription_id = "6a6991ac-13fa-4cad-8cb4-87d94302dd32"
}
