data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["973714476881"]
}

resource "aws_instance" "sample" {
  ami = data.aws_ami.ami.id
  instance_type = "t2.micro"
  count = 2
  tags = {
    Name = "sample"
  }
}