data "aws_vpc" "VPC" {
  id = var.vpc_name
  tags = {
      Name = var.vpc_name
  }
}

resource "aws_subnet" "main" {
  vpc_id     = data.aws_vpc.VPC.id
  cidr_block = var.cidr

  tags = {
    Name = var.subnet_name
  }
}