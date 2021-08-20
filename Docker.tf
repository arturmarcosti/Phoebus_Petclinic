terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock."
}

module "module" {
  source  = "alinefr/module/docker"
  version = "4.0.1"
  image = "arey/springboot-petclinic:latest"
  container_name = "springboot-petclinic"
  restart_policy = "always"

}
