output "public_subnet_ids" {
  value = [ for v in aws_subnet.public_subnet: v.id ]
}