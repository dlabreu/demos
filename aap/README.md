---

# AWS Infrastructure Deployment

This directory contains the full infrastructure-as-code (IaC) setup for deploying an AWS web environment using **Terraform** for provisioning and **Ansible** for configuration management.

---

## 📁 Directory Structure

```
/runner/project/aws/
├── infra.yaml             # MASTER PLAYBOOK (Ansible entry point)
├── deploy_web.yml         # ANSBLE CONFIGURATION PLAYBOOK (Existing)
├── index.html.j2          # WEBPAGE TEMPLATE (Existing)
├── vpc/                   # VPC PROVISIONING (Terraform)
│   ├── main.tf            # Defines VPC resources (VPC, subnets, etc.)
│   ├── variables.tf       # VPC input variables (e.g., vpc_cidr)
│   └── outputs.tf         # Exports VPC identifiers (vpc_id, subnet_ids)
└── ec2/                   # EC2/ALB PROVISIONING (Terraform)
    ├── main.tf            # Defines EC2, ALB, and Security Group resources
    ├── variables.tf       # EC2/ALB input variables (ami_id, key_name)
    └── outputs.tf         # Exports ALB DNS name and EC2 IPs
```

---

## 🧩 Components Overview

### **1. Terraform – Infrastructure Provisioning**

#### **VPC Module (`/vpc/`)**

Responsible for the network layer:

* Creates a **VPC**.
* Defines **public and private subnets**.
* Configures **Internet Gateway** and **route tables**.
* Outputs key identifiers (e.g. `vpc_id`, `subnet_ids`).

#### **EC2 Module (`/ec2/`)**

Responsible for compute and load balancing:

* Provisions **EC2 instances** for web servers.
* Configures an **Application Load Balancer (ALB)**.
* Sets up **security groups** for inbound and outbound traffic.
* Exports **ALB DNS name** and **EC2 IP addresses**.

---

### **2. Ansible – Configuration Management**

#### **Master Playbook (`infra.yaml`)**

Acts as the main entry point that orchestrates:

* Terraform provisioning of the VPC and EC2 layers.
* Ansible configuration steps for deployed instances.

#### **Web Configuration (`deploy_web.yml`)**

Handles post-provisioning setup:

* Installs required web packages.
* Deploys the HTML page using `index.html.j2`.
* Ensures the web service is running and enabled.

#### **Template (`index.html.j2`)**

A Jinja2 HTML template rendered and deployed by Ansible, representing the web application's landing page.

---

## ⚙️ Deployment Workflow

1. **Provision Infrastructure**

   ```bash
   cd /runner/project/aws/vpc
   terraform init && terraform apply -auto-approve

   cd ../ec2
   terraform init && terraform apply -auto-approve
   ```

2. **Configure with Ansible**

   ```bash
   ansible-playbook -i <inventory> infra.yaml
   ```

3. **Access the Application**
   Once completed, retrieve the ALB DNS name:

   ```bash
   terraform output -state=ec2/terraform.tfstate alb_dns_name
   ```

   Visit the DNS URL in your browser to access the deployed webpage.

---

## 🧾 Notes

* Ensure that your AWS credentials are properly configured (via `AWS_PROFILE`, `AWS_ACCESS_KEY_ID`, etc.).
* Terraform state files are stored locally by default — configure remote state (e.g., S3 backend) for team collaboration.
* The `infra.yaml` playbook assumes Terraform has already been initialized and applied successfully.

---
