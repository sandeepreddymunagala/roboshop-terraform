 #module "instance" {
  # for_each  = var.components
  # source    = "git::https://github.com/sandeepreddymunagala/tf-module-app.git"
  # component = each.key
  # env       = var.env
  # tags       = merge(var.tags,each.value["tags"])
 #}

module "vpc" {
  source = "git::https://github.com/sandeepreddymunagala/tf-module-vpc.git"

  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
  subnets = each.value["subnets"]
  default_vpc_id = var.default_vpc_id

  env = var.env
  tags = var.tags
}

 module "app_server" {
   source = "git::https://github.com/sandeepreddymunagala/tf-module-app.git"

   env = var.env
   tags =var.tags
   component = test
   subnet_id = lookup (lookup (lookup(lookup (module.vpc, "main", null), "subnet ids", null), "app", null), "subnet ids",
   null)[0]
   vpc_id = lookup (lookup (module.vpc, "main", null), "vpc id", null)
 }

