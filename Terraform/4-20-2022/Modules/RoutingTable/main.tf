data "aws_vpc" "VPC" {
  id = var.vpc_name
  tags = {
      Name = var.vpc_name
  }
}

resource "aws_route_table" "example" {
  vpc_id = data.aws_vpc.VPC.id

  tags = {
    Name = var.RT
  }
}