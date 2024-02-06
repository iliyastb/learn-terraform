# This is the testing of the sample code
resource "null_resource" "null" {}

terraform {
  backend "s3" {
    bucket = "robo-st"
    key    = "01-sample/terraform.tfstate"
    region = "us-east-1"
  }
}