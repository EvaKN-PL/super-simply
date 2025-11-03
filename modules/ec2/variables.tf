variable "subnet_id" {
    description = "Subnets ID"
    type = string
  
}

variable "security_group_ids" {
    description = "List IDs SG"
    type = list(string)
}

variable "key_name" {
    description = "Name of SSH key on AWS account"
    type = string
  
}

variable "instance_type" {
    description = "Type of instance"
    type = string
  
}

variable "ami_id" {
    description = "Number of AMI"
    type = string
  
}

