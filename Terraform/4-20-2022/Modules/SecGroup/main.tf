data "aws_vpc" "VPC" {
  tags = {
      Name = var.vpc_name
  }
}

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.desc
  vpc_id      = data.aws_vpc.VPC.id


  tags = {
    Name = var.sg_name
  }
}