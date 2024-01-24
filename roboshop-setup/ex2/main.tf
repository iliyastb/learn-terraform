data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

resource "aws_instance" "frontend" {
  count                  = length(var.instances)
  ami                    = data.aws_ami.ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]

  tags = {
    Name = var.instances[count.index]
  }
}

variable "instances" {
  default = ["frontend", "catalogue"]
}

output "ip" {
  value = aws_instance.frontend.*.public_ip
}