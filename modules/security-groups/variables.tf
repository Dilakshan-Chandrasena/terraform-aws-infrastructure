variable "name" {
  description = "Name prefix for security groups"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where security groups will be created"
  type        = string
}

variable "app_port" {
  description = "Port used by the application"
  type        = number
  default     = 8080
}

variable "allowed_http_cidrs" {
  description = "CIDR blocks permitted to access HTTP and HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Additional resource tags"
  type        = map(string)
  default     = {}
}

variable "test_client_cidr" {
  description = "Public IPv4 CIDR allowed to test the application directly"
  type        = string
  default     = null
}