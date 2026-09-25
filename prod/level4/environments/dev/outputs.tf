output "security_group_id" {
  value = module.web_security_group.security_group_id
}

output "instance_id" {
  value = module.web.instance_id
}

output "public_ip" {
  value = module.web.public_ip
}
