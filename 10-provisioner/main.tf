# ami data block
data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["860050401100"]
}

# resource creation with provisioner
resource "aws_instance" "test" {
  ami = data.aws_ami.ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [sg-0f1959ab92bc12167]

  tags = {
    Name = "sample"
  }

  # this is sub block of resource block
  provisioner "remote-exec" {

    connection {
      host = "self.public_ip"
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "echo iliyas"
    ]
  }
}