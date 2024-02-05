locals {
  dbname_lists = [for n in azurerm_mssql_database.this : n.name]
}

data "azurerm_monitor_diagnostic_categories" "this" {
  for_each = var.enable_diagnostic_setting ? { for db in azurerm_mssql_database.this : db.name => db.id } : {}

  resource_id = each.value
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  for_each = var.enable_diagnostic_setting ? { for db in azurerm_mssql_database.this : db.name => db.id } : {}

  name                           = "ds-${each.key}"
  target_resource_id             = each.value
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.destination_type

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[each.key].log_category_types
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[each.key].metrics
    content {
      category = metric.value
    }
  }

  lifecycle {
    ignore_changes = [log_analytics_destination_type] # TODO remove when issue is fixed: https://github.com/Azure/azure-rest-api-specs/issues/9281
  }
}
