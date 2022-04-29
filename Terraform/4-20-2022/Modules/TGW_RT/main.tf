data "aws_ec2_transit_gateway" "ec2_tgw" {
  filter {
    name   = "tag:Name"
    values = [var.tgw_name]
  }
}

resource "aws_ec2_transit_gateway_route_table" "tgw_rt" {
  transit_gateway_id = data.aws_ec2_transit_gateway.ec2_tgw.id
  tags = {
    Name = var.tgw_rt_name
  }
}