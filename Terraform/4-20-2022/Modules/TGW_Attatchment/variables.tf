variable "vpc_name" {
    type = string
    default = "VPC"
}

variable "subnet_name" {
    type = string
    default = "subnet_name"
}

variable "tgw_name" {
  type=string
  default="tgw-name"
}

variable "tgw_vpc_attachment_name" {
  type = string
  default = "vpc_attachment"
}