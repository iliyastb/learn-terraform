terraform {
  backend "s3" {
    bucket = "devtb"
    key    = "05-s3-state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "null_resource" "null" {}