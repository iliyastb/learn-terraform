#resource "aws_security_group" "sg" {
#  name        = "${var.component}-${var.env}-sg"
#  description = "Allow TLS inbound traffic"
#
#  ingress {
#    description      = "TLS from VPC"
#    from_port        = 0
#    to_port          = 0
#    protocol         = "-1"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port        = 0
#    to_port          = 0
#    protocol         = "-1"
#    cidr_blocks      = ["0.0.0.0/0"]
#    ipv6_cidr_blocks = ["::/0"]
#  }
#
#  tags = {
#    Name = "${var.component}-${var.env}-sg"
#  }
#}
#
#resource "aws_instance" "instances" {
#  ami                    = data.aws_ami.ami.id
#  instance_type          = var.instance_type
#  vpc_security_group_ids = [aws_security_group.sg.id]
#  iam_instance_profile = "${var.env}-${var.component}-role"
#
#  tags = {
#    Name = var.component
#    Monitor = var.monitor ? "yes" : "no"
#  }
#}
#
#resource "aws_route53_record" "r53" {
#  name    = "${var.env}-${var.component}.devtb.in.net"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.instances.private_ip]
#  zone_id = "Z02331073VKZYZLSD9FII"
#}
#
#resource "null_resource" "provisioner" {
#  depends_on = [aws_route53_record.r53]
#  provisioner "remote-exec" {
#
#    connection {
#      host = aws_instance.instances.public_ip
#      user = "root"
#      password = "DevOps321"
#    }
#
#    inline = [
#      "ansible-pull -i localhost, -U https://github.com/iliyastb/roboshop-ansible.git roboshop.yml -e role_name=${var.component} -e env=${var.env}"
#    ]
#  }
#}
#
#resource "aws_iam_policy" "ssm-policy" {
#  name        = "${var.env}-${var.component}-ssm"
#  path        = "/"
#  description = "${var.env}-${var.component}-ssm"
#
#  policy = jsonencode({
#    "Version": "2012-10-17",
#    "Statement": [
#      {
#        "Sid": "VisualEditor0",
#        "Effect": "Allow",
#        "Action": [
#          "ssm:GetParameterHistory",
#          "ssm:GetParametersByPath",
#          "ssm:GetParameters",
#          "ssm:GetParameter"
#        ],
#        "Resource": "arn:aws:ssm:us-east-1:860050401100:parameter/${var.env}.${var.component}*"
#      },
#      {
#        "Sid": "VisualEditor1",
#        "Effect": "Allow",
#        "Action": "ssm:DescribeParameters",
#        "Resource": "*"
#      }
#    ]
#  })
#}
#
#resource "aws_iam_role" "role" {
#  name = "${var.env}-${var.component}-role"
#
#  assume_role_policy = jsonencode({
#    "Version": "2012-10-17",
#    "Statement": [
#      {
#        "Effect": "Allow",
#        "Principal": {
#          "Service": "ec2.amazonaws.com"
#        },
#        "Action": "sts:AssumeRole"
#      }
#    ]
#  })
#}
#
#resource "aws_iam_instance_profile" "profile" {
#  name = "${var.env}-${var.component}-role"
#  role = aws_iam_role.role.name
#}
#
#resource "aws_iam_role_policy_attachment" "policy-attach" {
#  role       = aws_iam_role.role.name
#  policy_arn = aws_iam_policy.ssm-policy.arn
#}
