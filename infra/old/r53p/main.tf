resource "aws_route53_record" "pr53" {
  name    = "devtb.in.net"
  type    = "A"
  ttl     = 30
  records = [var.public_ip]
  zone_id = "Z02331073VKZYZLSD9FII"
}

variable "public_ip" {}