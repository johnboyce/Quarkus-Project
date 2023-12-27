variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "cluster_name" {
  type        = string
  description = "ECS Cluster name"
  default     = "Quarkus-Project-Cluster"
}

variable "ecr_name" {
  type        = string
  description = "ECR Repository name"
  default     = "quarkus-project"
}

variable "image_tag" {
  type        = string
  default     = "latest"
  description = "Docker image tag"
}

variable "ecs_alb_name" {
  type        = string
  description = "ALB for Quarkus Project"
  default     = "quarkus-ecs-alb"
}

variable "aws_sg_name" {
  type        = string
  description = "security group name"
  default     = "quarkus_ecs_sg"
}

variable "app_port" {
  type        = number
  description = "Port number of the application container"
  default     = 80
}

variable "health_check_path" {
  type    = string
  default = "/"
}
