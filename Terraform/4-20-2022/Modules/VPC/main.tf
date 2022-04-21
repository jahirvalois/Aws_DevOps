resource "aws" "VPC" {
  cidr_block = var.cidr

  tags = {
    Name = var.vpc_name
  }

}