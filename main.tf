terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "jenkins" {
  name         = "jenkins/jenkins:lts-jdk11"
  keep_locally = true
}

resource "docker_container" "jenkins" {
  image = docker_image.jenkins.latest
  name  = "test"
  ports {
    internal = 8080
    external = 8080
  }
}

# resource "docker_image" "nginx" {
#   name         = "nginx:latest"
#   keep_locally = true
# }

# resource "docker_container" "nginx" {
#   image = docker_image.nginx.latest
#   name  = "tutorial"
#   ports {
#     internal = 80
#     external = 8001
#   }
# }

# resource "docker_container" "nginx2" {
#   image = docker_image.nginx.latest
#   name  = "tutorial22"
#   ports {
#     internal = 80
#     external = 8002
#   }
# }
