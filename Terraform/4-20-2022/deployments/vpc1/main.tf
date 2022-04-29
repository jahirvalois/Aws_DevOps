module "vpc" {
  source = "../../Modules/vpc"
  cidr = local.cidr
  region = local.region
  vpc_name = local.vpc_name
}

module "private_subnet" {
  source = "../../Modules/subnet"
  region = local.region
  vpc_name = local.vpc_name
  subnet_cidr = local.private_subnet_cidr
  subnet_name = local.private_subnet_name
}

module "public_subnet" {
  source = "../../Modules/subnet"
  region = local.region
  vpc_name = local.vpc_name
  subnet_cidr = local.public_subnet_cidr
  subnet_name = local.public_subnet_name
}

module "igw" {
  source = "../../Modules/igw"
  region = local.region
  vpc_name = local.vpc_name
  igw_name = local.igw_name
}