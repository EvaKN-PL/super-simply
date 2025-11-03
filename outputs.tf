output "instance_public_ip" {
    description = "Public IP of instance"
    value = module.web_server.public_ip
  
}