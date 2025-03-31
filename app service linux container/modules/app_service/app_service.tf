resource "azurerm_linux_web_app" "tf-webapp" {
  name                = var.name_web_app
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  service_plan_id     = var.service_plan_id
  

  site_config {
    always_on = var.always_on
    ftps_state = var.ftps_state

    application_stack {
      docker_image_name = var.docker_image_name
    }
  }

  logs {
    application_logs {
      file_system_level = var.file_system_level
    }
  }
}