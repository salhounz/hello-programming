variable "message" {
  type    = string
  default = "Hello, World!"
}

output "greeting" {
  value = var.message
}
