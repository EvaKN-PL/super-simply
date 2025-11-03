output "public_ip" {
    description = "Public IP EC2 instance"
    value = aws_instance.web.public_ip
  
}