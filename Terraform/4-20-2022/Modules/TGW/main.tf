resource "aws_ec2_transit_gateway" "tgw" {
  description = var.tgw_desc
  auto_accept_shared_attachments = var.shared_attachment
  default_route_table_association = var.rt_assoc
  default_route_table_propagation = var.rt_prop
  tags = {
    name = var.tg_name
  }
}
