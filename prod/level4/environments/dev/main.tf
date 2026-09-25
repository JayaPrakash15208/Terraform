module "web_security_group" {
  source = "../../modules/security-group"
  name   = "terraform-dev-web-sg"
  vpc_id = data.aws_vpc.default.id
}

module "web" {

  source = "../../modules/ec2"

  name              = "terraform-dev-web"
  ami_id            = data.aws_ami.amazon_linux.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  security_group_id = module.web_security_group.security_group_id
}
