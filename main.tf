terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.43.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "subnets" {
  source = "./module/subnets" 
  vpc_id = var.vpc_id
  igw_id = var.igw_id
  public_subnets = var.public_subnets
}

module "security_groups" {
  source = "./module/security_group"
  vpc_id = var.vpc_id
}

module "rds" {
  source = "./module/rds" 
  pguser = ""
  pgpassword = ""
  subnet_group_subnet_ids = module.subnets.public_subnet_ids
  rds_security_group_ids = [
    module.security_groups.security_group_ids.allow_pg
  ]
  service_discovery_private_dns_namespace_id = aws_service_discovery_private_dns_namespace.portfolio_namespace.id
}

resource "aws_service_discovery_private_dns_namespace" "portfolio_namespace" {
  name = "portfolio"
  vpc = var.vpc_id
}

resource "aws_ecs_cluster" "portfolio_cluster" {
  name = "portfolio-cluster"
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/ecs/portfolio"
}

module "frontend_lb" {
  source = "./module/frontend_lb" 
  vpc_id = var.vpc_id
  lb_sg_ids = [ module.security_groups.security_group_ids.allow_http ]
  lb_subnet_ids = [ for subnet_id in module.subnets.public_subnet_ids : subnet_id ]
}