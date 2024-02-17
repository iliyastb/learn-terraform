resource "aws_spot_instance_request" "prom" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]
  wait_for_fulfillment = true
}

resource "aws_ec2_tag" "tag" {
  resource_id = aws_spot_instance_request.prom.spot_instance_id
  key         = "Name"
  value       = "PROM"
}

#ami-072aa986009d7d8af myami