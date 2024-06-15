output "vpc_id" {
  value = var.vpc_id
}

output "portfolio_cloud_map_namespace" {
  value = aws_service_discovery_private_dns_namespace.portfolio_namespace
}

output "security_group_ids" {
  value = module.security_groups.security_group_ids
}

output "cluster_id" {
  value = aws_ecs_cluster.portfolio_cluster.id
}

output "cluster_subnet_ids" {
  value = module.subnets.public_subnet_ids
}

output "log_group" {
  value = aws_cloudwatch_log_group.log_group.name
}

output "ui_service_alb_tg_arn" {
  value = module.frontend_lb.ui_service_alb_tg_arn 
}