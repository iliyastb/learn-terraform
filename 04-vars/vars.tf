# default variable
variable "sample" {
  default = 10
}
output "sample" {
  value = var.sample
}
# tfvars variable
variable "tfvars" {}
output "tfvars" {
  value = var.tfvars
}