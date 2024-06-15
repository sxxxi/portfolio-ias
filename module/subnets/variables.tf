variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string 
}

variable "public_subnets" {
  type = map(object({ cidr_block=string, az=string }))
}