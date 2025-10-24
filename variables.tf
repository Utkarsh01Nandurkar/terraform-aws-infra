variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "utk-devops"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "AZs to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "Public subnets CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnets CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24","10.0.102.0/24"]
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "utk-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.27"
}

variable "node_group_instance_type" {
  description = "Instance type for node group"
  type        = string
  default     = "t3.medium"
}

variable "node_group_desired_capacity" {
  description = "Desired capacity for node group"
  type        = number
  default     = 2
}

variable "ecr_repo_name" {
  description = "ECR repo name for application images"
  type        = string
  default     = "app-repo"
}
