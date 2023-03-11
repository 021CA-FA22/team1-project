variable "vpc_cidr_block" {
  type = string 
  default = "10.0.0.0/16"
}

variable "env_tag" {
  type    = string
  default = ""
}

variable "aws_availability_zone_1st" {
  type = string
  default = "us-east-1a"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr_1" {
  type = string 
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_2" {
  type = string
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_3" {
  type = string 
  default = "10.0.3.0/24"
}

variable "public_subneet_cidr" {
  type = string 
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr_first" {
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_second" {
  type = string
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_third" {
  type = string
  default = "10.0.3.0/24"
}