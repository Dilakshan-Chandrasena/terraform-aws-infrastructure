output "alb_security_group_id" {
  description = "Security group ID for the load balancer"
  value       = aws_security_group.alb.id
}

output "app_security_group_id" {
  description = "Security group ID for application resources"
  value       = aws_security_group.app.id
}