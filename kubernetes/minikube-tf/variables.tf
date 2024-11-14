variable "sg_name" {
  type        = string
  description = "The name of the security group"
}

variable "vpc_ssh_inbound_cidr" {
  type        = string
  description = "CIDR block for inbound SSH access"
}

variable "app_ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type"
}

variable "associate_pub_ip" {
  type        = bool
  description = "Whether to associate a public IP"
}

variable "ssh_key_name" {
  type        = string
  description = "The SSH key name"
}

variable "instance_name" {
  type        = string
  description = "The name tag for the EC2 instance"
}