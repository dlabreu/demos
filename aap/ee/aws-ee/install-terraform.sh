#!/usr/bin/env bash
set -eux

# Get latest Terraform version
TERRAFORM_VER=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform \
  | python3 -c "import sys, json; print(json.load(sys.stdin)['current_version'])")

echo "Installing Terraform ${TERRAFORM_VER}"

# Download and install
curl -fsSL "https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip" -o /tmp/terraform.zip
unzip -o /tmp/terraform.zip -d /usr/local/bin
chmod +x /usr/local/bin/terraform
rm -f /tmp/terraform.zip

terraform version