data "aws_route_table" "RT" {
  tags = {
      Name = var.RT_name
  }
}

data "aws_nat_gateway" "AwsNAT" {
  count = var.NatGW_name == "" ? 0 : 1

  tags ={
    Name = var.NatGW_name
  }
}

data "aws_internet_gateway" "AwsIGW" {
  count = var.InternetGW_name == "" ? 0 : 1

  tags ={
    Name = var.InternetGW_name
  }
}

resource "aws_route" "r" {
  count = var.NatGW_name == "" && var.InternetGW_name == "" ? 1 : 0

  route_table_id            = data.aws_route_table.RT.id
  destination_cidr_block    = var.cidr
}

resource "aws_route" "NAT_r" {
  count = var.NatGW_name == "" ? 0 : 1

  route_table_id            = data.aws_route_table.RT.id
  destination_cidr_block    = var.cidr
  nat_gateway_id = data.aws_nat_gateway.AwsNAT.id
}

resource "aws_route" "Internet_r" {
  count = var.InternetGW_name == "" ? 0 : 1

  route_table_id            = data.aws_route_table.RT.id
  destination_cidr_block    = var.cidr
  gateway_id = data.aws_internet_gateway.AwsIGW.id
}