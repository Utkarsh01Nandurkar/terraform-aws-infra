#########################
# VPC - using community module
#########################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.0"

  name = "${var.project}-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Project = var.project
    Owner   = "UtkarshN"
  }
}

#########################
# EKS - using community module
#########################
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    default_nodes = {
      desired_capacity = var.node_group_desired_capacity
      max_capacity     = var.node_group_desired_capacity + 1
      min_capacity     = 1

      instance_type = var.node_group_instance_type

      key_name = "" # optional: set your SSH key name if needed
    }
  }

  tags = {
    Project = var.project
  }

  manage_aws_auth = true
}

#########################
# ECR repository
#########################
resource "aws_ecr_repository" "app" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"
  scan_on_push         = true

  tags = {
    Project = var.project
  }
}

#########################
# Example Security Group for ALB (optional)
#########################
resource "aws_security_group" "alb_sg" {
  name        = "${var.project}-alb-sg"
  description = "Allow HTTP inbound for ALB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = var.project
  }
}
