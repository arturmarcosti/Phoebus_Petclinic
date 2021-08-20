terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
}

# Pulls the image
resource "docker_image" "springboot-petclinic" {
  name = "arey/springboot-petclinic"
  keep_locally = true
}

# Create a container
resource "docker_container" "springboot-petclinic" {
  name  = "arey/springboot-petclinic"
  image = docker_image.arey/springboot-petclinic
  command = ["tail", "-f", "dev/null"]
  
  ports {
      internal = 80
      external = 8080
      protocol = "tcp"
  }
  
}
