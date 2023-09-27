# data block to get the ami id
data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

# resource block to create the ec2 instance with condition
resource "aws_instance" "sample" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type

  tags = {
    Name = "sample"
  }
}

variable "instance_type" {}

# resource block to create the ec2 instance with condition with boolean
resource "aws_instance" "sample1" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type

  count = tobool(var.instance_type) ? 1 : 0

  tags = {
    Name = "sample1"
  }
}