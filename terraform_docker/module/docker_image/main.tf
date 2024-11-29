terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# provider "docker" {
#   host = "tcp://localhost:2375"
# }

resource "docker_image" "nginx" {
  name = "nginx"
  build {
    context = "${path.module}/Docker/"
    dockerfile = "Dockerfile"
 }
}

resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8080
  }
}