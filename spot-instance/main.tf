#resource "aws_spot_instance_request" "instance" {
#  ami           = "ami-072aa986009d7d8af"
#  instance_type = "t3.small"
#  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]
#  wait_for_fulfillment = true
#
#  tags = {
#    Name = "JENKINS"
#  }
#}
#
#resource "aws_ec2_tag" "tag" {
#  resource_id = aws_spot_instance_request.instance.spot_instance_id
#  key         = "Name"
#  value       = "JENKINS"
#}

resource "aws_spot_instance_request" "instance" {
  ami           = "ami-072aa986009d7d8af"
  instance_type = "t3.medium"
  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]
  wait_for_fulfillment = true

  tags = {
    Name = "sonarqube"
  }
}

resource "aws_ec2_tag" "tag" {
  resource_id = aws_spot_instance_request.instance.spot_instance_id
  key         = "Name"
  value       = "sonarqube"
}