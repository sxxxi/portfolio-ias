variable "pguser" {
  type = string 
}

variable "pgpassword" {
  type = string 
}

variable "rds_security_group_ids" {
  type = list(string)
}

variable "subnet_group_subnet_ids" {
  type = list(string)
}

variable "service_discovery_private_dns_namespace_id" {
  type = string
}