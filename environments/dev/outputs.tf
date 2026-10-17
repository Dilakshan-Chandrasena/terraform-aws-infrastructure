output "vpc_id" {
  description = "Development VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Development public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Development private subnet IDs"
  value       = module.vpc.private_subnet_ids
}


output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = module.security_groups.alb_security_group_id
}

output "app_security_group_id" {
  description = "Application security group ID"
  value       = module.security_groups.app_security_group_id
}

output "ecr_repository_name" {
  description = "ECR repository name"
  value       = module.ecr.repository_name
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repository_url
}

output "ecr_repository_arn" {
  description = "ECR repository ARN"
  value       = module.ecr.repository_arn
}