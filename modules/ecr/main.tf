locals {
  common_tags = merge(var.tags, {
    Project   = "terraform-aws-infrastructure"
    ManagedBy = "Terraform"
  })
}

resource "aws_ecr_repository" "this" {
  name                 = var.repository_name
  image_tag_mutability = "IMMUTABLE"
  force_delete         = false

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(local.common_tags, {
    Name = var.repository_name
  })
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

    policy = jsonencode({
        rules = [{
        rulePriority = 1
        description  = "Expire untagged images older than the configured retention period"

        selection = {
            tagStatus   = "untagged"
            countType   = "sinceImagePushed"
            countUnit   = "days"
            countNumber = var.untagged_image_retention_days
        }

        action = {
            type = "expire"
        }
        }]
    })
}