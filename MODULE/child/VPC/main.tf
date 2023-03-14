## Vpc 
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  tags = {
    "Name" = "${title("${var.env_tag}")} MyVPC"
  }
}

####### DATA SOURCE FOR AVAILABILITY ###########
data "aws_availability_zone" "first_availability_zone" {
  name = "us-east-1a"
}

data "aws_availability_zone" "second_availability_zone" {
  name = "us-east-1b"
}

## Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zone.first_availability_zone.id
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${title("${var.env_tag}")} Public Subnet"
  }
}

## Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_1
  availability_zone       = data.aws_availability_zone.first_availability_zone.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 1"
  }
}

## Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_2
  availability_zone       = data.aws_availability_zone.first_availability_zone.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 2"
  }
}

## Private Subnet 3
resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_3
  availability_zone       = data.aws_availability_zone.first_availability_zone.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 3"
  }
}

## Public Subnet
resource "aws_subnet" "public_subneet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subneet_cidr
  availability_zone       = data.aws_availability_zone.second_availability_zone.id
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${title("${var.env_tag}")} Public Subneet"
  }
}

## Private Subnet 1
resource "aws_subnet" "private_subneet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subneet_cidr_1
  availability_zone       = data.aws_availability_zone.second_availability_zone.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subneet 1"
  }
}

## Private Subnet 2
resource "aws_subnet" "private_subneet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subneet_cidr_2
  availability_zone       = data.aws_availability_zone.second_availability_zone.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subneet 2"
  }
}

## Private subnet 3
resource "aws_subnet" "private_subneet_3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subneet_cidr_3
  availability_zone       = data.aws_availability_zone.second_availability_zone.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subneet 3"
  }
}