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
# cli variable
variable "cli" {}
output "cli" {
  value = var.cli
}
# shell env variable, export TF_VAR_cli="hello"

variable "input" {}
output "input" {
  value = var.input
}