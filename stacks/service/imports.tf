locals {
  import_rg     = local.nett.resource_group_id
  import_subnet = "${local.nett.vnet_id}/subnets/snet-${var.tjeneste}"
  import_nsg    = "${local.import_rg}/providers/Microsoft.Network/networkSecurityGroups/nsg-${var.tjeneste}"
}

import {
  to = module.subnet.azurerm_subnet.this
  id = local.import_subnet
}

import {
  to = module.subnet.azurerm_network_security_group.this
  id = local.import_nsg
}

import {
  to = module.subnet.azurerm_network_security_rule.http
  id = "${local.import_nsg}/securityRules/allow-http"
}

import {
  to = module.subnet.azurerm_subnet_network_security_group_association.this
  id = local.import_subnet
}

import {
  to = module.storage.azurerm_storage_account.this
  id = "${local.import_rg}/providers/Microsoft.Storage/storageAccounts/st${var.kortnavn}${var.tjeneste}${var.miljo}"
}

import {
  to = module.keyvault.azurerm_key_vault.this
  id = "${local.import_rg}/providers/Microsoft.KeyVault/vaults/kv-${var.kortnavn}-${var.tjeneste}-${var.miljo}"
}

import {
  for_each = local.vm
  to       = module.vm[each.key].azurerm_public_ip.this
  id       = "${local.import_rg}/providers/Microsoft.Network/publicIPAddresses/pip-${each.key}"
}

import {
  for_each = local.vm
  to       = module.vm[each.key].azurerm_network_interface.this
  id       = "${local.import_rg}/providers/Microsoft.Network/networkInterfaces/nic-${each.key}"
}

import {
  for_each = local.vm
  to       = module.vm[each.key].azurerm_linux_virtual_machine.this
  id       = "${local.import_rg}/providers/Microsoft.Compute/virtualMachines/vm-${each.key}"
}

import {
  for_each = local.webapp
  to       = module.webapp[each.key].azurerm_service_plan.this
  id       = "${local.import_rg}/providers/Microsoft.Web/serverFarms/asp-${each.key}"
}

import {
  for_each = local.webapp
  to       = module.webapp[each.key].azurerm_linux_web_app.this
  id       = "${local.import_rg}/providers/Microsoft.Web/sites/app-${var.kortnavn}-${each.key}-${var.miljo}"
}
