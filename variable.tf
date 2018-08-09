#ACCESS

variable "aws_access_key" {
  default = "***"
}

variable "aws_secret_key" {
  default = "***"
}

resource "aws_key_pair" "testUser" {
  key_name   = "testUser"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}


# REGIONS AND SUBNETS

variable "aws_region" {
  default = "us-east-2"
}

variable "public_subnet_availability_zone" {
  default = "us-east-2a"
}

variable "private_subnet_availability_zone" {
  default = "us-east-2b"
}


# CIDR BLOCKS


variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "192.168.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "192.168.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "192.168.2.0/24"
}

# TAGS

variable "private_subnet_tag" {
  default = "terraform private subnet"
}

variable "public_subnet_tag" {
  default = "terraform public subnet"
}

### AWS Users

variable "aws_key_name" {
  default = "testUser"
}

# AMI MAP

variable "amis" {
  type = "map"
  description = "AMIs by region"
  default = {
    us-east-2 = "ami-8c122be9"
  }
}

### SECURITY GROUP TAGS

variable "db_security_group_tag"{
  default = "DB Security Group"
}

variable "web_security_group_tag" {
  default = "Web security Group"
}

resource "aws_route_table_association" "public_routing_table_association" {
  subnet_id      = "${aws_subnet.terraform_public_subnet.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}