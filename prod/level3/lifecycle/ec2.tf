resource "aws_instance" "web" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              dnf install -y nginx

              systemctl enable nginx
              systemctl start nginx

              echo "<h1>Terraform Lifecycle Lab</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "terraform-lifecycle-web"
  }

  lifecycle {
    create_before_destroy = true
    # prevent_destroy = true
    # ignore_changes = [ tags, instance_type ]
  }
}
