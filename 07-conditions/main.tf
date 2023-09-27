# data block to get the ami id
data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

# resource block to create the ec2 instance, condition with string
resource "aws_instance" "sample" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type

  tags = {
    Name = "sample"
  }
}

variable "instance_type" {}

# resource block to create the ec2 instance, condition with boolean
resource "aws_instance" "sample1" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type == "" ? "t2.micro" : var.instance_type

  count = tobool(var.instance_count) ? 1 : 0

  tags = {
    Name = "sample1"
  }
}

variable "instance_count" {}