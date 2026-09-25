# __generated__ by Terraform from "sg-0c0da14ab7fd1b19c"
resource "aws_security_group" "web" {
  description = "default VPC security group"
  name                   = "default"
  region                 = "us-east-1"
  vpc_id                 = "vpc-0ac226850e63339c4"
}

# __generated__ by Terraform
resource "aws_vpc" "main" {
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  region                               = "us-east-1"
}

# __generated__ by Terraform
resource "aws_instance" "web" {
  ami                                  = "ami-066163ff9670efe49"
  associate_public_ip_address          = true
  instance_type                        = "t3.micro"
  key_name                             = "myvpc1-keypair"
  region                               = "us-east-1"
  vpc_security_group_ids               = ["sg-0c0da14ab7fd1b19c"]
  subnet_id                            = "subnet-0e1bf5978cd9bc583"
  }

