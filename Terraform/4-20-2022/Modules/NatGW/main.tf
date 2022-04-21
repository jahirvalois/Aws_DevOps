data "aws_subnet" "subnet_test" {
  tags = {
      Name = var.subnet_name
  }
}

resource "aws_eip" "eip" {
    vpc = true
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.eip.id
  subnet_id     = data.aws_subnet.subnet_test.id

  tags = {
    Name = var.aws_nat_gw
  }
}