variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "tags" {
  description = "Additional tags for the repository"
  type        = map(string)
  default     = {}
}

variable "untagged_image_retention_days" {
  description = "Number of days to retain untagged images"
  type        = number
  default     = 14

  validation {
    condition     = var.untagged_image_retention_days >= 1
    error_message = "Retention must be at least one day."
  }
}