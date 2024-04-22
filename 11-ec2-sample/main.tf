# data block to get the ami id.
data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

# resource block to create the ec2 instance.
resource "aws_instance" "sample" {
  count         = 1
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"

  tags = {
    Name = "sample"
  }
}