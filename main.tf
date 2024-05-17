module "vpc" {
  source = "git::https://github.com/sandeepreddymunagala/tf-module-vpc.git"

  for_each = var.vpc
  cidr_block =each.value["cidr_block"]
  subnets = each.value["subnets"]

  env =var.env
  tags =var.tags
  default_vpc_id = var.default_vpc_id
  default_vpc_rt = var.default_vpc_rt
}

module "app" {
  source = "git::https://github.com/sandeepreddymunagala/tf-module-vpc.git"

  env =var.env
  tags =var.tags
  component ="test"

  subnet_id = lookup(lookup(lookup(lookup(module.vpc,"main",null),"subnet_ids",null),"app",null),"subnet_id",null)[0]
  vpc_id = lookup(lookup(module.vpc, "main", null), "vpc_id", null)


}

output "subnet" {
  value = module.vpc
}
