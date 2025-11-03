# VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      Name = "VPC-${var.env_tag}"
      Environment = "var.env_tag"
    }
  
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name = "IGW-${var.env_tag}"
    }
  
}

# Public subnets
resource "aws_subnet" "public" {
    for_each = toset(var.public_subnet_cidrs)
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = each.key
    map_public_ip_on_launch = true

    tags = {
      Name = "Public-Subnet-${var.env_tag}-${replace(each.key, ".", "-")}"
    }
  
}

# Route Table
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id

    }

    tags = {
      Name = "Public-Route-Table-${var.env_tag}"
    }
  
}

# Association 
resource "aws_route_table_association" "public" {
    for_each = aws_subnet.public
    subnet_id = each.value.id
    route_table_id = aws_route_table.rt.id
  
}