data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

resource "aws_instance" "frontend" {
  for_each               = var.instances
  ami                    = data.aws_ami.ami.id
  instance_type          = each.value["type"]
  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]

  tags = {
    Name = each.value["name"]
  }
}

variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t2.micro"
    }
    user = {
      name = "user"
      type = "t2.micro"
    }
  }
}

output "ip" {
  value = [for k, v in aws_instance.frontend : "${k} - ${v.public_ip}"]
}