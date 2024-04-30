module "test" {
  for_each = var.component
  source = "git::https://github.com/sandeepreddymunagala/tf-module-app.git"
  component = each.key
  env = var.env

}