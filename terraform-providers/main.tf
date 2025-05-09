terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

resource "null_resource" "resource" {
  provisioner "local-exec-2" {
    command = "echo $ENV"
    environment = {
      ENV = "Hello World2!"
    }
  }
}
