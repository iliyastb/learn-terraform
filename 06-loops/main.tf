# count
variable "loop1" {
  default = 3
}

resource "null_resource" "nothing1" {
  count = var.loop1
}

# list, length
variable "loop2" {
  default = ["orange", "banana"]
}

resource "null_resource" "nothing2" {
  count = length(var.loop2)
}

# map, for_each
variable "loop3" {
  default = {
    apple = {
      name = "iliyas"
      count = 2
    }
    banana = {
      name = "purna"
      count = 2
    }
  }
}

resource "null_resource" "loop3" {
  for_each = var.loop3
}