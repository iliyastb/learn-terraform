# This is the testing of the tf code
resource "null_resource" "null" {
}

variable "sample" {
  default = {
    fruits = {
      apple   = 5
      oranges = 5
    }
  }
}

output "sample5" {
  value = var.sample.value[fruits]
}