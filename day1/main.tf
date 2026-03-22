variable "message" {
  description = "Message to write into file"
  type        = string
  default     = "Hello from Terraform"
}

resource "local_file" "hello" {
  filename = "${path.module}/hello.txt"
  content  = var.message
}

output "file_path" {
  value = local_file.hello.filename
}
