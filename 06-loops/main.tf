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
      name = "apple"
      count = 2
    }
    banana = {
      name = "banana"
      count = 2
    }
  }
}

resource "null_resource" "nothing3" {
  for_each = var.loop3
}