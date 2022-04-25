data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnet" "subnet_test" {
  tags = {
      Name = var.subnet_name
  }
}

data "aws_security_group" "sg" {
  
  filter {
    name = "sec-group-name"
    values = [var.aws_security_group_name]
  }

  filter{
    name = "vpc-id"
    values = [data.aws_subnet.subnet_test.vpc_id]
  }

}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  associate_public_ip_address = var.public_ip
  subnet_id = data.aws_subnet.subnet_test.id
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  key_name = var.key_pair_name

  tags = {
    Name = var.aws_instance
  }
}