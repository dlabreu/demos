variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "ami_id" {}
variable "instance_type" {}
variable "instance_count" {
  type    = number
  default = 1
}
variable "ssh_key_name" {}
variable "ssh_user" {}
variable "existing_security_group_id" {
  description = "The ID of the existing security group to attach to instances."
  type        = string
}
