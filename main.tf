module "vpc" {
  source = "git::https://github.com/sandeepreddymunagala/tf-module-vpc.git"

  for_each = each.vpc
  cidr_block =each.value["cidr_block"]
}