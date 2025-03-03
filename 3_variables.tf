variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-00c257e12d6828491"  # Example: Amazon Linux 2 AMI
}

variable "instance_type" {
  description = "EC2 Instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name"
  default     = "terraform_ec2_key"
}

variable "security_group_name" {
  description = "Security group name"
  default     = "terraform_security_group"
}

# Elastic IP for the NAT Gateway
variable "nat_gateway_eip" {
  description = "Elastic IP for the NAT Gateway"
  default     = ""  
}
