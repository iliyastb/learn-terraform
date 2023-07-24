terraform {
  backend "s3" {
    bucket = "name"
    key    = "path"
    region = "region"
  }
}

resource "aws_instance" "ec2" {
  ami                    = "ami"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["group id"]
  tags = {
    Name = "demo"
  }
}