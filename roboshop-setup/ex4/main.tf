module "ec2" {
  source = "./ec2"
  for_each = var.instances
  instance_type = each.value["type"]
  component = each.value["name"]
  sg_id = module.sg.sg_id
}

module "sg" {
  source = "./sg"
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