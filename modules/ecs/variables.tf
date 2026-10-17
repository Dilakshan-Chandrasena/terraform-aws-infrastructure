variable "name" {
  description = "Name prefix for ECS resources"
  type        = string
}

variable "tags" {
  description = "Tags applied to ECS resources"
  type        = map(string)
  default     = {}
}

variable "ecr_image_uri" {
  description = "Full ECR image URI, including the immutable image tag"
  type        = string
}

variable "subnet_ids" {
  description = "Public subnets for the ECS Fargate tasks"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group attached to the ECS tasks"
  type        = string
}