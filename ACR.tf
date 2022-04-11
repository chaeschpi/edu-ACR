
resource "random_integer" "rgindex" {
  min = 1
  max = 9
}

resource "random_integer" "uniqpath" {
  min = 1000
  max = 9999
}

resource "azurerm_resource_group" "ContainerRegistry" {
  name     = "rg-acr-${random_integer.rgindex.result}-${var.locationShort}"
  location = var.location
  tags = {
    "demo"       = true
    "lab"        = true
    "persistent" = false
  }
}

resource "azurerm_container_registry" "containerRegistry" {
  location            = var.location
  admin_enabled       = true
  name                = "acrdemo${var.locationShort}${random_integer.uniqpath.result}"
  sku                 = "Basic"
  resource_group_name = azurerm_resource_group.ContainerRegistry.name
  tags = {
    "demo" = true
    "lab"  = true
  }
}
