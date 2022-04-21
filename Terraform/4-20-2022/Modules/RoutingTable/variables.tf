variable "regions" {
    type = string
    default = "us-east-1"
}

variable "vpc_name" {
    type = string
    default = "VPC"
}

variable "cidr" {
    type = string
    default = "10.15.1.0/24"
}

variable "RT" {
    type = string
    default = "RT_Test"  
}