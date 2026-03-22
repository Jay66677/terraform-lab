terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

variable "container_config" {
  type = list(object({
    name = string
    port = number
  }))
}

module "nginx_containers" {
  source = "../day4/modules/nginx_container"

  for_each = {
    for container in var.container_config :
    container.name => container
  }

  container_name = each.value.name
  container_port = each.value.port
  image_name     = "nginx:latest"
}

output "container_urls" {
  value = [
    for c in var.container_config :
    "http://localhost:${c.port}"
  ]
}
