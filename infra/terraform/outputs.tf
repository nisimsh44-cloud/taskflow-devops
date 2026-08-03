output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.taskflow_server.id
}

output "public_ip" {
  description = "Public IP Address"
  value       = aws_instance.taskflow_server.public_ip
}

output "public_dns" {
  description = "Public DNS Name"
  value       = aws_instance.taskflow_server.public_dns
}
