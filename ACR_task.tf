

resource "azurerm_container_registry_task" "createDemoImage" {

  container_registry_id = azurerm_container_registry.containerRegistry.id
  name                  = "buildTaskDemoWebSite"
  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = "dockerfile"
    context_path         = "https://github.com/chaeschpi/webservercontainer#main"
    context_access_token = var.PAT
    image_names          = ["demowebsite:{{.Run.ID}}"]
  }
}


