data "aws_vpc" "vpc_test" {
  tags = {
      Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.vpc_test.id

  tags = {
    Name = var.igw_name
  }
}