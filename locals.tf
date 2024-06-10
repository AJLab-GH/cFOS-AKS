locals {

  resource_group_name = "${var.prefix}-rg"
  location            = "canadacentral"
  environment_tag     = "${var.prefix}-cFOS-Demo"

  resource_groups = {
    (local.resource_group_name) = {
      name     = local.resource_group_name
      location = local.location
      tags = {
        Environment = local.environment_tag
      }
    }
  }

  kubernetes_clusters = {
    "${var.prefix}-aks-01" = {
      name                = "${var.prefix}-aks-01"
      location            = azurerm_resource_group.resource_group[local.resource_group_name].location
      resource_group_name = azurerm_resource_group.resource_group[local.resource_group_name].name
      dns_prefix          = "${var.prefix}-aks-01"

      default_node_pool = {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_D2_v2"
      }

      identity = {
        type = "SystemAssigned"
      }
    }
  }
}
