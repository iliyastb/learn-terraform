# This is the testing of the sample tf code
#resource "null_resource" "null" {
#}

data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = [860050401100]
}

resource "aws_instance" "sample" {
  ami = data.aws_ami.ami.image_id
  instance_type = "t2.micro"

  tags = {
    name = "sample"
  }
}