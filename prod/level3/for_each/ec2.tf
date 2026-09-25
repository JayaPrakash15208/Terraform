
resource "aws_key_pair" "my_key" {
  key_name   = "my-ec2-key"
  public_key = file("~/.ssh/id_rsa.pub")
}




resource "aws_instance" "server" {

  for_each                    = var.instances
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = each.value.instance_type
  key_name                    = aws_key_pair.my_key.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx

              echo "<h1>Hello from Terraform EC2</h1>" > /usr/share/nginx/html/index.html
              EOF
  tags = {
    Name = "terraform-${each.key}"
    Role = each.key
  }

}
