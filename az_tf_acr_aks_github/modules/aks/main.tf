resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = "vamshiaks"

  default_node_pool {
    name       = "nodepool1"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [
    var.acr_id
  ]

}

# Attach AKS to ACR (so AKS can pull images)
/*
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}
*/
# Since above block didn't work, I manually ran this command
# az aks update   --resource-group rg-dev   --name vamshiaks001   --attach-acr vamshiacr001