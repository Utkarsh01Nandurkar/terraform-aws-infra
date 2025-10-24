output "vpc_id" {
  description = "VPC ID created"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnet ids"
  value       = module.vpc.private_subnets
}

output "eks_cluster_id" {
  description = "EKS cluster id/name"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_kubeconfig_certificate_authority_data" {
  description = "CA data for kubeconfig"
  value       = module.eks.cluster_certificate_authority_data
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}
