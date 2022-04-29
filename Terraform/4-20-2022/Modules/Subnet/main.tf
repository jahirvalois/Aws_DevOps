data "aws_vpc" "vpc" {
  tags = {
      Name = var.vpc_name
  }
}

resource "aws_subnet" "main" {
  vpc_id     = data.aws_vpc.vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.subnet_name
  }
}