resource "aws_vpc" "VPC" {
  cidr_block = var.cidr

  tags = {
    Name = var.vpc_name
  }

}