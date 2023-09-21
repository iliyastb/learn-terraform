# count
variable "loop1" {
  default = 3
}

resource "null_resource" "nothing1" {
  count = var.loop1
}

#length
variable "loop2" {
  default = ["orange", "banana"]
}

resource "null_resource" "nothing2" {
  count = length(var.loop2)
}