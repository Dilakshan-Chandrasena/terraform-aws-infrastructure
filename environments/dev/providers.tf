provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "terraform-aws-infrastructure"
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}