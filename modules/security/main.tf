# SG
resource "aws_security_group" "web_traffic" {
    name = "web-traffic-sg"
    description = "Allow for ports 80 and 22"
    vpc_id = var.vpc_id

    # Ingress rules
    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
            description = "Access to port ${ingress.value}"
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]  # for test
        }
    }

    # Egress rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Web-SG"
    }
  
}

