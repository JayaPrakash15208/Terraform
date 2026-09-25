output "instance_ids" {
  description = "EC2 instance IDs"

  value = {
    for name, instance in aws_instance.server :
    name => instance.id
  }
}

output "public_ips" {
  description = "EC2 public IP addresses"

  value = {
    for name, instance in aws_instance.server :
    name => instance.public_ip
  }
}

output "instance_names" {
  description = "EC2 instance names"

  value = {
    for name, instance in aws_instance.server :
    name => instance.tags.Name
  }
}
