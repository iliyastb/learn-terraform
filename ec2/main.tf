# data block to get the ami id
data "aws_ami" "ami" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["973714476881"]
}
# resource block to create the ec2 instance
resource "aws_instance" "sample" {
  ami = data.aws_ami.ami.id
  instance_type = "t2.micro"
  count = 1
  tags = {
    Name = "sample"
  }
}