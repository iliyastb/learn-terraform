# This is the testing of the tf code
resource "null_resource" "null" {
}

variable "sample" {
  default = {
    fruits = {
      apple   = 5
      orange = 5
      banana = false
    }
  }
}

output "sample" {
  value = var.sample.fruits.banana
}