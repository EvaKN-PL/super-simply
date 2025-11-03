# WEB Server
resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_group_ids

    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install nginx -y
                systemctl start nginx
                systemctl enable nginx
                echo "<h1>Welcome on my site</h1>" > /usr/share/nginx/html/index.html
                EOF
  
}