resource "azurerm_linux_web_app" "tf-webapp" {
  name                = var.name_web_app
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = var.service_plan_id
  tags = var.tags

  site_config {
    always_on         = var.always_on
    ftps_state        = var.ftps_state
    health_check_path = "/health"
    health_check_eviction_time_in_min = 10

    application_stack {
      docker_image_name   = var.docker_image_name
      docker_registry_url = var.docker_registry_url 
    }
  }

  logs {

    detailed_error_messages = var.detailed_error_messages 

    application_logs {
      file_system_level = var.file_system_level
    }

    http_logs {
      file_system {
        retention_in_days = var.retention_in_days 
        retention_in_mb   = var.retention_in_mb 
      }
    }
  }

}