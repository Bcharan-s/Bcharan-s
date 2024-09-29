# Local provider creates the docker file locally with in the path 
# specified with the content we have provided
provider "local"{

}
 resource "local_file" "Dockerfile"{
    content = <<EOF
        FROM nginx:latest
    EOF
    filename = "${path.module}/Docker/Dockerfile"
 }

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