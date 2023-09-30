# This is the testing of the sample tf code
resource "null_resource" "null" {}

variable "security_group_id" {}

data "aws_security_group" "selected" {
  id = var.security_group_id
}