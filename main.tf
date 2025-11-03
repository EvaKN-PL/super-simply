terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"

}

provider "aws" {

    region = var.aws_region
  
}

# Calling the VPC module

module "network" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidrs = var.public_subnet_cidrs
    env_tag = "dev"
}

# Calling the security module
module "web_security_group" {
    source = "./modules/security"
    vpc_id = module.network.vpc_id
    ingress_ports = [22, 80]

  
}

# Calling the EC2 module
module "web_server" {
  source = "./modules/ec2"
  subnet_id = module.network.public_subnet_id[0]
  security_group_ids = [module.web_security_group.sg_id]
  key_name = var.key_name
  instance_type = var.instance_type
  ami_id = var.ami_id
}