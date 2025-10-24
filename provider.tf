# Provider config is in versions.tf, this file contains data or aliases if needed.

# Optionally allow a second provider alias (e.g., for eks)
provider "aws" {
  region = var.aws_region
}
