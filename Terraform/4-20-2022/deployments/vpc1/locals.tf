locals {
  region = "us-east-1"
  cidr = "10.15.0.0/16"
  vpc_name = "vpc1"
  private_subnet_cidr = "10.15.0.0/24"
  private_subnet_name = "private_subnet"
  public_subnet_cidr = "10.15.1.0/24"
  public_subnet_name = "public_subnet"
  igw_name = "igw"
}