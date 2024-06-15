resource "aws_security_group" "allow_http" {
  vpc_id = var.vpc_id

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 3000
    to_port = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 3001
    to_port = 3001
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 3002
    to_port = 3002
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = tomap({
    Name = "Allow HTTP"
  })
}

resource "aws_security_group" "allow_https" {
  vpc_id = var.vpc_id
  
  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = tomap({
    Name = "Allow HTTPS"
  })
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = var.vpc_id

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = tomap({
    Name = "Allow SSH"
  })
}

resource "aws_security_group" "allow_pg" {
  vpc_id = var.vpc_id

  ingress {
    protocol = "tcp"
    from_port = 5432
    to_port = 5432
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = tomap({
    Name = "Allow PG"
  })
}

resource "aws_security_group" "allow_amqp" {
  vpc_id = var.vpc_id
  
  ingress {
    protocol = "tcp"
    from_port = 15672
    to_port = 15672
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 5672
    to_port = 5672
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = tomap({
    Name = "Allow AMQP"
  })
}