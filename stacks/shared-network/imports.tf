data "azurerm_resource_group" "import" {
  name = local.resource_group_name
}

import {
  to = azurerm_resource_group.this
  id = data.azurerm_resource_group.import.id
}

import {
  to = module.vnet.azurerm_virtual_network.this
  id = "${data.azurerm_resource_group.import.id}/providers/Microsoft.Network/virtualNetworks/${local.vnet_name}"
}
