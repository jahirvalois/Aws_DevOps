data "aws_ec2_transit_gateway" "local_tgw" {
  filter {
    name   = "tag:Name"
    values = [var.tgw_name]
  }
}

data "aws_ec2_transit_gateway" "peer_tgw" {
  filter {
    name   = "tag:Name"
    values = [var.peer_tgw_name]
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "peering" {
  peer_account_id         = data.aws_ec2_transit_gateway.peer_tgw.owner_id
  peer_region             = var.peer_regions
  peer_transit_gateway_id = data.aws_ec2_transit_gateway.peer_tgw.id
  transit_gateway_id      = data.aws_ec2_transit_gateway.local_tgw.id

  tags = {
    Name =  "${var.tgw_peering_name} - Local"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accepter" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.peering.id
  tags = {
    Name = "${var.tgw_peering_name} - Peer"
  }
  provider = aws.peer
}