# This is the testing of the sample code
resource "null_resource" "null" {}

data "aws_instance" "ip" {
  filter {
    name   = "tag:Name"
    values = ["frontend"]
  }
}

output "ip" {
  value = data.aws_instance.ip.public_ip
}