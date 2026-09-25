variable "aws_region" {
  description = "aws region"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
