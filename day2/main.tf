terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

variable "filename" {
  description = "Name of the file"
  type        = string
}

variable "message" {
  description = "Content of the file"
  type        = string
}

resource "local_file" "file" {
  filename = "${path.module}/${var.filename}"
  content  = var.message
}

output "file_path" {
  value = local_file.file.filename
}
