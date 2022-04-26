variable "attachment_names" {
  type=list(string)
}

variable "regions" {
    type = string
    default = "us-east-1"
}

variable "tgw_rt_name" {
    type = string
}