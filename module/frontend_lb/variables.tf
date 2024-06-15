variable "vpc_id" {
  type = string  
}

variable "lb_sg_ids" {
  type = list(string)
}

variable "lb_subnet_ids" {
  type = list(string) 
}