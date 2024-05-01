module "test" {
  for_each = var.components
  source = "git::https://github.com/sandeepreddymunagala/tf-module-app.git"
  env = var.env
  component = each.key
}