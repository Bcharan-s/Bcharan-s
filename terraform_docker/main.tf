# Local provider creates the docker file locally with in the path 
# specified with the content we have provided
provider "local"{

}
 resource "local_file" "Dockerfile"{
    content = <<EOF
        FROM nginx:latest
    EOF
    filename = "${path.module}/module/docker_image/Docker/Dockerfile"
 }

module "docker_container" {
  source = "./module/docker_image"
 
}
