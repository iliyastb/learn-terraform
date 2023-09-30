# data block to get the ami id
data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

# resource block to create the ec2 instance with provisioner
resource "aws_instance" "test" {
  ami                    = data.aws_ami.ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]

  tags = {
    Name = "sample"
  }

  # this is sub block
  provisioner "remote-exec" {

    connection {
      host     = self.public_ip
      user     = "root"
      password = "DevOps321"
    }

    inline = [
      "echo hi"
    ]
  }
}