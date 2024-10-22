resource "aws_route53_record" "r53" {
  name    = "${var.component}.devtb.in.net"
  type    = "A"
  ttl     = 30
  records = [var.private_ip]
  zone_id = "Z02331073VKZYZLSD9FII"
}

variable "component" {}
variable "private_ip" {}

resource "null_resource" "provisioner" {
  depends_on = [aws_route53_record.r53]

  provisioner "remote-exec" {

    connection {
      host = var.host
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "ansible-pull -i localhost, -U https://github.com/iliyastb/roboshop-ansible.git roboshop.yml -e role_name=${var.component}"
    ]
  }
}

variable "host" {}