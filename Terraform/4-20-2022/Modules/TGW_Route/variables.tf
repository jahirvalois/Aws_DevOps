variable "regions" {
    type = string
    default = "us-east-1"
}


/* variable "tgw_route" {
  type = map(object({
    dest_cidr = string
    dest_attchment_name = string
    black_hole = bool
  }))
} */

variable "dest_attchment_name" {
  type = list(string)
}

variable "tgw_rt_name" {
  type=string
}