# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# 1. Terraform State Storage Bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }
}

# Enable versioning to allow recovery from accidental state deletion/overwrites
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# 2. DynamoDB Table for State Locking
# This is crucial to prevent concurrent state modifications
resource "aws_dynamodb_table" "terraform_locks" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform State Lock Table"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }
}
