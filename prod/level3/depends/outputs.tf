output "web_instance_id" {
  value = aws_instance.web.id
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}

output "monitoring_instance_id" {
  value = aws_instance.monitoring.id
}

output "monitoring_public_ip" {
  value = aws_instance.monitoring.public_ip
}

output "name_prefix" {
  value = local.name_prefix
}
