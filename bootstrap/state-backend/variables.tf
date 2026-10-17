variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"

  validation {
    condition     = length(var.aws_region) > 0
    error_message = "The AWS region must be a non-empty string."
  }
}

variable "state_bucket_name" {
  description = "The name of the S3 bucket to store Terraform state."
  type        = string
  default     = "my-terraform-state-bucket"

  validation {
    condition = (
      length(var.state_bucket_name) >= 3 &&
      length(var.state_bucket_name) <= 63 &&
      can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.state_bucket_name))
    )
    error_message = "Use 3–63 lowercase letters, numbers, or hyphens; the name must start and end with a letter or number."
  }
}