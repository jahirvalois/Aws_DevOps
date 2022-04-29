data "aws_ec2_transit_gateway_vpc_attachment" "attachment" {
  for_each =  var.dest_attchment_name
  filter {
    name = "tag:Name"
    values = each.value
  }
}

data "aws_vpc" "vpc" {
  for_each = data.aws_ec2_transit_gateway_vpc_attachmen.attachment.id
  id = each.value.vpc_id
}

data "aws_ec2_transit_gateway_route_table" "ec2_tgw_rt" {
   filter {
    name   = "tag:Name"
    values = [var.tgw_rt_name]
  }
}

resource "aws_ec2_transit_gateway_route" "tgw_route" {
  count = length(var.dest_attchment_name)
  destination_cidr_block = data.aws_vpc.vpc[count.index].cidr_block
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_vpc_attachment.attachment[count.index].id
  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.ec2_tgw_rt.id
}