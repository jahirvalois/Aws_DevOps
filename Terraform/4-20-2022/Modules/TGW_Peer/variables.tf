variable "tgw_name" {
  type=string
  default="tgw-name"
}

variable "peer_tgw_name" {
  type=string
  default="peer-tgw-name"
}

variable "regions" {
    type = string
    default = "us-east-1"
}

variable "peer_regions" {
    type = string
    default = "us-west-2"
}

variable "tgw_peering_name" {
  type = string
  default = "TGW Peering Requestor"
}