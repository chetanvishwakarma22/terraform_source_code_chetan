provider "aws" {
  region = var.aws_region
}
locals {
  creationDate = formatdate("YYYY-MM-DD", timestamp())
  common_tags = {
    team     = "Developers"
    createdat = local.creationDate
  }
}
data "aws_vpc" "default" {
  default = true
}
data "aws_subnet" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
  filter {
    name   = "availability-zone"
    values = ["${var.aws_region}a"]
  }
}
data "aws_security_group" "default_sg" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}
data "aws_ami" "Amazon_Linux_2_AMI" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "dev_instance" {
  ami                   = data.aws_ami.Amazon_Linux_2_AMI.id
  instance_type         = var.instance_type
  subnet_id             = data.aws_subnet.default_subnet.id
  vpc_security_group_ids = [data.aws_security_group.default_sg.id]
  tags = merge(local.common_tags, {
    Name = "${var.tag_prefix}-EC2-${local.creationDate}"
  })
}
output "ami" {
  value = data.aws_ami.Amazon_Linux_2_AMI.id
}
