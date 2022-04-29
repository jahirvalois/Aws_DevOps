data "aws_ec2_transit_gateway_vpc_attachment" "attachment" {
  filter {
    name = "tag:Name"
    values = [var.attachement_name]
  }
}

data "aws_ec2_transit_gateway_route_table" "ec2_tgw_rt" {
   filter {
    name   = "tag:Name"
    values = [var.tgw_rt_name]
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_association" {
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_vpc_attachment.attachment.id
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.ec2_tgw_rt.id
}