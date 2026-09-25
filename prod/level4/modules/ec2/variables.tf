variable "name" {
  description = "EC2 instance name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}
