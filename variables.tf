variable "aws_region" {
    description = "Region AWS"
    type = string
  
}

variable "vpc_cidr" {
    description = "CIDR for VPC"
    type = string
  
}

variable "public_subnet_cidrs" {
    description = "Value of CIDR for public subnet"
    type = list(string)
  
}

variable "key_name" {
    description = "Name of existing SSH key in AWS for EC2"
    type = string
}

variable "instance_type" {
    description = "Type of instance EC2"
    type = string
  
}

variable "ami_id" {
    description = "AMI number"
    type = string
  
}
