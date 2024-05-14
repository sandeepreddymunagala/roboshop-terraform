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
  default_vpc_rt = var.default_vpc_rt

  env = var.env
  tags = var.tags
}

module "app_server" {
  source = "git::https://github.com/sandeepreddymunagala/tf-module-app.git"

  env = var.env
  tags =var.tags
  component = "test"

  subnet_id = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnet_ids", null), "app", null), "subnet_ids",
  null)[0]
  vpc_id = lookup (lookup (module.vpc, "main", null), "vpc_id", null)
}


module "rabbitmq" {
  source = "git::https://github.com/sandeepreddymunagala/tf-module-rabbitmq.git"

  for_each      = var.rabbitmq
  component     = each.value["component"]
  instance_type = each.value["instance_type"]

  sg_subnet_cidr = lookup(lookup(lookup(lookup(var.vpc, "main", null), "subnets", null), "app", null), "cidr_block", null)
  vpc_id         = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
  subnet_id      = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnet_ids", null), "db", null), "subnet_ids", null)[0]

  env            = var.env
  tags           = var.tags
  allow-ssh_cidr = var.allow_ssh_cidr

}


