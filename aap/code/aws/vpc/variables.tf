# --- General Configuration ---
variable "region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "eu-west-1"
}

# --- VPC Configuration ---
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets (must be 3)."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  validation {
    condition     = length(var.public_subnet_cidrs) == 3
    error_message = "The public_subnet_cidrs list must contain exactly 3 CIDR blocks (one for each AZ)."
  }
}

# --- EC2 and SSH Configuration (optional for later) ---
variable "ami_id" {
  description = "The ID of the AMI to use (e.g., Fedora, RHEL, or Amazon Linux)."
  type        = string
  default     = "ami-0abcdef1234567890"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "The number of instances to launch behind the ALB."
  type        = number
  default     = 3
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair used for EC2 access."
  type        = string
  default     = "om_ansible_key"
}

variable "ssh_user" {
  description = "Default SSH user for EC2 instances (e.g., ec2-user)."
  type        = string
  default     = "ec2-user"
}

# --- Security Group Configuration ---
variable "allow_ssh_cidr" {
  description = "CIDR blocks allowed to access SSH."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_http_cidr" {
  description = "CIDR blocks allowed to access HTTP."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
