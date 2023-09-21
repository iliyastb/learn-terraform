# count
variable "loop1" {
  default = 3
}

resource "null_resource" "nothing" {
  count = var.loop1
}

#length
variable "loop2" {
  default = ["orange", "banana"]
}

resource "null_resource" "nothing" {
  count = length(var.loop2)
}