variable "loop1" {
  default = loop
}

resource "null_resource" "nothing" {
  count = var.loop1
}

