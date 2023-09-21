# default variable
variable "sample" {
  default = "default variable"
}
output "sample" {
  value = var.sample
}

# tfvars - auto tfvars is the first priority
variable "tfvars" {}

output "tfvars" {
  value = var.tfvars
}

# variable declared with cli
variable "cli" {}

output "cli" {
  value = var.cli
}

# shell env variable, export TF_VAR_cli="hello"

# cli asks for variable input
variable "input" {}

output "input" {
  value = var.input
}