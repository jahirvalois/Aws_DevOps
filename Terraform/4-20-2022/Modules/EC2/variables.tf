variable "aws_instance" {
  type = string
  default="instance_name"
}

variable "public_ip" {
  type = bool
  default = true
}

variable "subnet_name" {
    type = string
    default = "subnet_name"
}

variable "aws_security_group_name" {
  type = string
  default = "sec_gp_name"
}

variable "key_pair_name" {
  type=string
  default="key_p"
}