locals {
  log_analytics_workspace_name = "${var.name}-la-ws"
}

data "azurerm_monitor_diagnostic_categories" "options" {
  resource_id = var.resource_id
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_settings" {
  name                           = var.name
  target_resource_id             = var.resource_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.use_resource_specific_table ? "Dedicated" : null

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.options.logs

    content {
      category = log.value

      retention_policy {
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.options.metrics

    content {
      category = metric.value

      retention_policy {
        enabled = false
      }
    }
  }
}
