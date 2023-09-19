# default variable
variable "sample" {
  default = "testing variable"
}
output "sample" {
  value = var.sample
}
# tfvars variable
variable "tfvars" {}
output "tfvars" {
  value = var.tfvars
}
#cli variable
variable "cli" {}
output "cli_var" {
  value = "var.cli"
}