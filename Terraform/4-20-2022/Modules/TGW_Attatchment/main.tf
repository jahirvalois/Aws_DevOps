data "aws_vpc" "VPC" {
  tags = {
      Name = var.vpc_name
  }
}

data "aws_subnet" "subnet_test" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.VPC.id]
  }
  tags = {
      Name = var.subnet_name
  }
}

data "aws_ec2_transit_gateway" "ec2_tgw" {
  filter {
    name   = "tag:Name"
    values = [var.tgw_name]
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
  subnet_ids         = [data.aws_subnet.subnet_test.ids]
  transit_gateway_id = data.aws_ec2_transit_gateway.ec2_tgw.id
  vpc_id             = data.aws_vpc.VPC.id
}