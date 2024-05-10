 #module "instance" {
  # for_each  = var.components
  # source    = "git::https://github.com/sandeepreddymunagala/tf-module-app.git"
  # component = each.key
  # env       = var.env
  # tags       = merge(var.tags,each.value["tags"])
 #}

 module "vpc" {
    source = "git::https://github.com/sandeepreddymunagala/tf-module-vpc.git"
    for_each   = var.vpc
    cidr_block = each.value["cidr_block"]
    env = var.env
    tags = var.tags
    web_subnet_cider_block = each.value["web_subnet_cider_block"]
 }