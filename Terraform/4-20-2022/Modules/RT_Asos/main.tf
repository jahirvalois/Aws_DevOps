data "aws_route_table" "RT" {
  tags = {
      Name = var.RT_name
  }
}

data "aws_subnet" "subnet_test" {
  tags = {
      Name = var.subnet_name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = data.aws_subnet.subnet_test.id
  route_table_id = data.aws_route_table.RT.id
}