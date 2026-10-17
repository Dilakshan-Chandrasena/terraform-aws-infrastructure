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