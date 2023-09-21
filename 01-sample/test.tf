# This is the testing of the tf code
resource "null_resource" "null" {
}

variable "sample5" {
  default = {
    fruits = {
      apple   = 5
      oranges = 5
    }
  }
}

output "sample5" {
  value = var.sample5.value.fruits[0]
}