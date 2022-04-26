data "aws_ec2_transit_gateway_vpc_attachments" "attachments" {
  filter {
    name = "tag:Name"
    values = var.attachment_names
  }
}

data "aws_ec2_transit_gateway_route_table" "tgw_rt" {
  filter {
    name = "tag:Name"
    values = var.tgw_rt_name
  }
}

resource "aws_ec2_transit_gateway_route_table_propagation" "propagation" {
  for_each = data.aws_ec2_transit_gateway_vpc_attachments.attachments.ids

  transit_gateway_attachment_id = each.value
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.tgw_rt.id
}