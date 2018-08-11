#ACCESS

variable "aws_access_key" {
  default = "**"
}

variable "aws_secret_key" {
  default = "**"
}

resource "aws_key_pair" "aws_terraform" {
  key_name   = "aws_terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2HEuDGn57F72OMXboI8yv7nsy2uZfRTLOn8Ls/ShG3cxAF8rlycDdkI2twuXOpAJVYtDM02diwLhNnPyJEb0EHRv8biKp28b59F+ccx7Bs4DvGh5dOiBWxMLPx0yK1NuUvEu4w7z+h4h+gll3hH8MZk2Vq7DkL2uF4oyCy1ik/J0vfpB2Lqw0JxAJONKGakCO18nsjmlUHRX0HyIUkvhTMxrrtO6du3M4k48RDCExDb9+Z/r7rv8rvPhCBcfgfP+5x9lXSg/6/uuYMR+SuipJZ0EATA3suLZrDkm2hUf4iVn6YZzEjnPMYBB0jYu/aELVoaDBViGUE1XrgWSQ9wIZ email@example.com"
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

variable "all_cidr" {
  description = "CIDR matches all"
  default = "0.0.0.0/0"
}

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
  default = "aws_terraform"
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