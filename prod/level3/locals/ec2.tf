
resource "aws_key_pair" "my_key" {
  key_name   = "my-ec2-key"
  public_key = file("~/.ssh/id_rsa.pub")
}




resource "aws_instance" "web" {

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.my_key.key_name
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx

              echo "<h1>Hello from Terraform EC2</h1>" > /usr/share/nginx/html/index.html
              EOF
  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-ec2"
    }
  )
}
