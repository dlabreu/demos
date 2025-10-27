variable "aws_region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "eu-central-1"
}

variable "s3_bucket_name" {
  description = "The unique name for the S3 bucket used to store Terraform state."
  type        = string
  default     = "om-tf-state-prod" # IMPORTANT: CHANGE THIS TO A UNIQUE GLOBAL NAME
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for state locking."
  type        = string
  default     = "om-terraform-lock-table"
}
