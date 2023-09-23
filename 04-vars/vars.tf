## default variable
#variable "sample" {
#  default = "default variable"
#}
#output "sample" {
#  value = var.sample
#}
#
## tfvars - auto tfvars is the first priority
#variable "tfvars" {}
#
#output "tfvars" {
#  value = var.tfvars
#}
#
## we give the variable input with command
#variable "cli" {}
#
#output "cli" {
#  value = var.cli
#}

# shell env variable, export TF_VAR_clitf="hello"
variable "clitf" {}

output "clitf" {
  value = var.clitf
}

## cli asks for variable input
#variable "input" {}
#
#output "input" {
#  value = var.input
#}