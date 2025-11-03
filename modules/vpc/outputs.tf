# ID_VPC
output "vpc_id" {
    description = "Id VPC"
    value = aws_vpc.my_vpc.id
  
}

# ID Public Subnets
output "public_subnet_id" {
    description = "ID list of public subnets"
    value = [for s in aws_aws_subnet.public : s.id]
}