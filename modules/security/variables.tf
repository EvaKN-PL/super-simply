variable "vpc_id" {
    description = "ID VPC"
    type = string
  
}

variable "ingress_ports" {
    description = "List of TCP ports allowed for incoming traffic "
    type = list(number)
  
}