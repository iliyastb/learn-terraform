# default variable
variable "sample" {
  default = "default variable"
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
output "cli" {
  value = "var.cli"
}