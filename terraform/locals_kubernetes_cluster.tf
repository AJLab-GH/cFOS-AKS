locals {
  kubernetes_clusters = {
    for region in var.regions :
    "${var.prefix}-aks-${region}" => {
      name                = "${var.prefix}-aks-${region}"
      location            = azurerm_resource_group.resource_group["${var.prefix}-${region}-aks-rg"].location
      resource_group_name = azurerm_resource_group.resource_group["${var.prefix}-${region}-aks-rg"].name
      dns_prefix          = "${var.prefix}-aks-${region}"

      default_node_pool = {
        name       = "default"
        node_count = 3
        vm_size    = "Standard_F16s_v2"
      }

      identity = {
        type = "SystemAssigned"
      }
    }
  }
}
