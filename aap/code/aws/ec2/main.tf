terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# --- EC2 Instances ---
resource "aws_instance" "om_web_server" {
  count                     = var.instance_count
  ami                       = var.ami_id
  instance_type             = var.instance_type
  key_name                  = var.ssh_key_name
  subnet_id                 = var.public_subnet_ids[0]  # single subnet from survey
  associate_public_ip_address = true
  vpc_security_group_ids    = [var.existing_security_group_id]    # existing SG

  tags = {
    Name = "om-web-server-${count.index + 1}"
  }
}

# --- Outputs ---
output "web_server_public_ips" {
  value = [for i in aws_instance.om_web_server : i.public_ip]
}
