variable "loop1" {
  default=10
}

resource "null_resource" "nothing" {
  count=var.loop1
}