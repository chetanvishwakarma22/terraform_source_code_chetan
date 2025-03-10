variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "tag_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "dev"
}
