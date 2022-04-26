variable "sg_name" {
  type = string
  default = "sg-name"
}

variable "type" {
  type = string
  default = "ingress"
}

variable "from_port" {
  type = number
  default = 0
}

variable "to_port" {
  type = number
  default = 65535
}

variable "protocol" {
  type = string
  default = "tcp"
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}