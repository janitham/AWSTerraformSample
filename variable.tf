#ACCESS

variable "aws_access_key" {
  default = "****"
}

variable "aws_secret_key" {
  default = "****"
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