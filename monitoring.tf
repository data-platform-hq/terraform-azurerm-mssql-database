locals {
  dbname_lists = [for n in azurerm_mssql_database.this : n.name]
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  for_each = length(var.log_analytics_workspace_id) == 0 ? [] : toset(local.dbname_lists)

  name                           = "monitoring-${var.project}-${var.env}-${var.location}"
  target_resource_id             = azurerm_mssql_database.this[each.key].id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.destination_type

  dynamic "log" {
    for_each = var.log_category_list
    content {
      category = log.value
      enabled  = true

      retention_policy {
        days    = var.log_retention_days
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = var.category_list_metrics
    content {
      category = metric.value
      enabled  = true

      retention_policy {
        days    = var.metric_retention_days
        enabled = false
      }
    }
  }
  depends_on = [azurerm_mssql_database.this]
}
