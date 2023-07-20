#default
variable "sample" {
  default = "hello world"
}
output "sample" {
  value = var.sample
}
#tfvars
variable "sample1" {}
output "sample1" {
  value = var.sample1
}
#cli
varible "cli" {}
output "cli" {
  value = var.cli
}
#shell env var
variable "input" {}

#var types
variable "sample2" {
  default = "Hello"
}
variable "sample3" {
  default =  [
    "Hello",
    1000,
    true,
    "World"
  ]
}
variable "sample4" {
  default =  {
    string = "Hello",
    number = 100,
    boolean = true
  }
}
output "types" {
  value = "Variable sample2 - ${var.sample2}, First value in list - ${var.sample3[0]}, Boolean Value of Map = ${var.sample4["boolean"]}"
}