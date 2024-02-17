resource "aws_spot_instance_request" "node1" {
  ami           = "ami-072aa986009d7d8af"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]
  wait_for_fulfillment = true
  tags = {
    Name = "prom-server"
  }
}
resource "aws_spot_instance_request" "node2" {
  ami           = "ami-072aa986009d7d8af"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0f1959ab92bc12167"]
  wait_for_fulfillment = true
  tags = {
    Name = "prom-node"
  }
}

resource "aws_ec2_tag" "tag1" {
  resource_id = aws_spot_instance_request.node1
  key         = "Name"
  value       = "prom-server"
}
resource "aws_ec2_tag" "tag2" {
  resource_id = aws_spot_instance_request.node2
  key         = "Name"
  value       = "prom-server"
}