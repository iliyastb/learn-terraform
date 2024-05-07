terraform {
  backend "s3" {
    bucket = "devtb-state"
    key    = "05-s3-state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "test" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
  }
}