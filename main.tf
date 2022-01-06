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
