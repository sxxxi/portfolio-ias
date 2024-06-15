resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets
  vpc_id = var.vpc_id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az
}

resource "aws_route_table" "public_rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "172.31.0.0/16"
    gateway_id = "local"
  }  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }  
}

resource "aws_route_table_association" "public_subnet" {
  for_each = aws_subnet.public_subnet
  subnet_id = each.value.id
  route_table_id = aws_route_table.public_rtb.id
}