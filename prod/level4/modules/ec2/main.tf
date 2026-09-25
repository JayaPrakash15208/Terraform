resource "aws_instance" "this" {

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    var.security_group_id
  ]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              dnf install -y nginx

              systemctl enable nginx
              systemctl start nginx

              echo "<h1>Terraform Module Lab</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name      = var.name
    ManagedBy = "Terraform"
  }
}
