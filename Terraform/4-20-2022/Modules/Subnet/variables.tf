variable "region" {
    type = string
    default = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "VPC"
}

variable "subnet_cidr" {
    type = string
    default = "10.15.1.0/24"
}

variable "subnet_name" {
    type = string
    default = "subnet_name"
}