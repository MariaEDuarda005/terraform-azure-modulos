resource "azurerm_container_app_environment" "environment" {
  name                       = var.name_container_app_environment
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags = var.tags

  workload_profile {
    workload_profile_type = var.workload_profile_type
    name                  = var.name_workload_profile
  }
}

resource "azurerm_container_app" "container_app" {
  name                         = var.name_container_app
  container_app_environment_id = azurerm_container_app_environment.environment.id
  resource_group_name          = var.resource_group_name
  revision_mode                = var.revision_mode
  tags = var.tags

  template {
    container {
      name   = var.name_container
      image  = var.image_container
      cpu    = var.cpu
      memory = var.memory

      liveness_probe {
        port      = var.port
        transport = var.transport
      }
    }

    min_replicas = var.min_replicas
    max_replicas = var.max_replicas
  }

  ingress {
    external_enabled = var.external_enabled
    target_port      = var.target_port
    transport        = var.ingress_transport
    allow_insecure_connections = true

    ip_security_restriction {
      action           = var.container_ip_restriction_action
      ip_address_range = var.container_ip_restriction_range
      name             = var.container_ip_restriction_name
    }

    traffic_weight {
      percentage      = var.percentage
      revision_suffix = var.revision_suffix 
      latest_revision = var.latest_revision
    }
  }
}