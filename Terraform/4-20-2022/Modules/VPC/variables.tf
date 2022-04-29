variable "cidr" {
    type = string
    default = "10.15.0.0/16"
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "VPC"
}