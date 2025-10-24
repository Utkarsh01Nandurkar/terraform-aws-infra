# terraform-aws-infra

Terraform project to provision:
- VPC with public/private subnets (2 AZs)
- EKS cluster (managed) with a managed node group
- ECR repository for container images
- ALB security group (example)

> This project is a sample infra stack to demonstrate Infrastructure as Code (IaC) with Terraform, EKS with node groups, and ECR.

---

## Prerequisites

1. **AWS CLI configured** (or environment variables):
   - `aws configure` or set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in env.
2. **Terraform v1.3+** installed.
3. **kubectl** installed (to access the cluster).
4. IAM permissions needed (recommended managed policy or equivalent):
   - `AmazonEKSClusterPolicy`, `AmazonEKSWorkerNodePolicy`, `AmazonEC2ContainerRegistryFullAccess`
   - `AmazonVPCFullAccess` (or granular VPC IAM actions)
   - `IAMFullAccess` for role creation (or narrower custom policy)
   - `EC2`, `ELB`, `AutoScaling`, `CloudWatch` permissions
   - NOTE: For demos you might use an admin user; in production use least privilege.

---

## How to run (local)

1. Clone this repo and `cd terraform-aws-infra`:
```bash
git clone https://github.com/Utkarsh01Nandurkar/terraform-aws-infra.git
cd terraform-aws-infra
