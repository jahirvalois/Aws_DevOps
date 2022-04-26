data "aws_security_group" "sec_group" {
  tags = {
    Name = var.sg_name
  }
}

data "aws_vpc" "VPC" {
  tags = {
      Name = var.vpc_name
  }
}

resource "aws_security_group_rule" "sg-rule" {
  type              = var.type
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  security_group_id = data.aws_security_group.sec_group.id
}