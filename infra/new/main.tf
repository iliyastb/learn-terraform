#module "ec2" {
#  source        = "./ec2"
#  for_each      = var.instances
#  component     = each.value["name"]
#  instance_type = each.value["type"]
#  env           = var.env
#  monitor = try(each.value["monitor"], false)
#}