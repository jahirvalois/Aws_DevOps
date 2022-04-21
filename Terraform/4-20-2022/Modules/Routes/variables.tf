variable "regions" {
    type = string
    default = "us-east-1"
}

variable "cidr" {
    type = string
    default = "10.15.1.0/24"
}

variable "RT_name" {
    type = string
    default = "RT_Test"  
}

variable "NatGW_name" {
  type = string
  default =""
}

variable "InternetGW_name" {
  type = string
  default =""
}