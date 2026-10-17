module "vpc" {
  source = "../../modules/vpc"

  name = "tf-platform-dev"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]

  # Keep NAT disabled initially to avoid ongoing NAT charges.
  enable_nat_gateway = false

  tags = {
    Owner = "devops-interview-dev"
  }
}

module "security_groups" {
  source   = "../../modules/security-groups"
  name     = "tf-platform-dev"
  vpc_id   = module.vpc.vpc_id
  app_port = 8080
  # Temporary access for direct ECS testing
  test_client_cidr = "116.206.244.137/32"

  tags = {
    Environment = "dev"
    Owner       = "devops-interview-dev"
  }
}

# ECR module for container image storage
module "ecr" {
  source = "../../modules/ecr"

  repository_name               = "tf-platform-dev-app"
  untagged_image_retention_days = 14

  tags = {
    Environment = "dev"
    Owner       = "devops-interview"
  }
}


# ECS module for container orchestration
module "ecs" {
  source = "../../modules/ecs"

  name = "tf-platform-dev"

  ecr_image_uri     = "${module.ecr.repository_url}:ca2383cdf55a19325c96c9e4129c45cf224ce4ff"
  subnet_ids        = module.vpc.public_subnet_ids
  security_group_id = module.security_groups.app_security_group_id

  tags = {
    Environment = "dev"
    Owner       = "devops-interview-dev"
  }
}