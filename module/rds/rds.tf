resource "aws_db_instance" "portfolio_db" {
  db_name = "portfolioDb"
  engine = "postgres"
  engine_version = "16.2"
  instance_class = "db.t3.micro"
  username = var.pguser
  password = var.pgpassword
  allocated_storage = 10
  max_allocated_storage = 11
  db_subnet_group_name = aws_db_subnet_group.portfolio_db_subnet_group.name
  vpc_security_group_ids = var.rds_security_group_ids 
  
  // For development purposes
  skip_final_snapshot = true
  publicly_accessible = true
}

resource "aws_db_subnet_group" "portfolio_db_subnet_group" {
  name = "portfolio-rds-subnet-group" 
  subnet_ids = var.subnet_group_subnet_ids
}

resource "aws_service_discovery_service" "rds_discovery" {
  name = "myrds"

  dns_config {
    namespace_id = var.service_discovery_private_dns_namespace_id
    routing_policy = "WEIGHTED"
    
    dns_records {
      type = "CNAME"
      ttl = 10
    }
  }
}

resource "aws_service_discovery_instance" "rds_discovery" {
  instance_id = "myrds"
  service_id = aws_service_discovery_service.rds_discovery.id
  
  attributes = {
    AWS_INSTANCE_CNAME = aws_db_instance.portfolio_db.address
  }
}