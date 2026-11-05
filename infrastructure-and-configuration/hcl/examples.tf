# Terraform 1.3+: local expressions only, with no providers or resources.
# All names differ from hello.tf; Terraform loads both files together.
variable "example_environment" {
  type    = string
  default = "development"

  validation {
    condition = contains(
      ["development", "production"], var.example_environment
    )
    error_message = "Choose development or production."
  }
}

variable "example_services" {
  type = list(object({
    name    = string
    enabled = bool
    ports   = list(number)
  }))
  default = [
    { name = "api", enabled = true, ports = [8080, 8443] },
    { name = "worker", enabled = true, ports = [] },
    { name = "preview", enabled = false, ports = [3000] }
  ]
}

locals {
  # Locals are named expressions, not mutable program variables.
  example_tags = {
    owner       = "learning"
    environment = var.example_environment
  }

  # A for expression transforms a collection; if filters its elements.
  example_active = {
    for service in var.example_services : service.name => service
    if service.enabled
  }

  # Conditional expressions choose values without imperative branches.
  example_policy = var.example_environment == "production" ? "strict" : "relaxed"
  example_labels = [
    for name in sort(keys(local.example_active)) :
    "${upper(name)}:${local.example_policy}"
  ]
  example_ports = distinct(flatten([
    for service in values(local.example_active) : service.ports
  ]))
}

output "example_summary" {
  description = "A computed report; applying creates no infrastructure."
  value = {
    tags   = local.example_tags
    labels = local.example_labels
    ports  = local.example_ports
  }
}
