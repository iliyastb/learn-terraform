#data "aws_ami" "ami" {
#  most_recent = true
#  name_regex  = "centos8-ansible"
#  owners      = ["self"]
#}

#data "aws_instance" "ip" {
#  filter {
#    name   = "tag:Name"
#    values = ["frontend"]
#  }
#}