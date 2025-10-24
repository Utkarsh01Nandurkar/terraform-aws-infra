# Terraform AWS Infrastructure

### Overview
Infrastructure as Code (IaC) project to provision a secure AWS environment using Terraform.
Deploys a VPC, Subnets, EC2, and S3 Bucket with IAM roles and outputs.

### Features
- Modular Terraform code
- Remote backend for state management
- Auto-tagging for cost tracking
- Output variables for easy integration

### Architecture
AWS Cloud  
→ VPC → Public Subnet → EC2 Instance  
→ S3 for storage → IAM Roles for access control  

### Commands
```bash
terraform init
terraform plan
terraform apply -auto-approve
