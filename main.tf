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

