data "azurerm_resource_group" "group" {
  count = var.deploy_temp_data_storage_account ? 1 : 0
  name  = var.backend_resource_group_name
}
