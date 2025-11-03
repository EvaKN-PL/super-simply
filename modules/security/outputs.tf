output "sg_id" {
    description = "ID of SG"
    value = aws_security_group.web_traffic.id
  
}