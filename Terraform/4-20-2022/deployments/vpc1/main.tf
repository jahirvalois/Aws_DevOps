module "vpc" {
  source = "../../Modules/vpc"
  cidr = locals.cidr
  region = locals.region
  vpc_name = locals.vpc_name
}