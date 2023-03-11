## Vpc 
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "${title("${var.env_tag}")} MyVPC"
  }
}

## First availability zone (1a)
data "aws_availability_zone" "us-east-1a" {
  name = var.aws_availability_zone_1st
}

## Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${title("${var.env_tag}")} Public Subnet"
  }
}

## Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_1
  availability_zone       = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 1"
  }
}

## Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_2
  availability_zone       = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 2"
  }
}

## Private Subnet 3
resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_3
  availability_zone       = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 3"
  }
}

## Second availability zone (1b)
data "aws_availability_zone" "us-east-1b" {
  name = var.aws_availability_zone_2nd
}

## Public Subnet
resource "aws_subnet" "public_subneet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subneet_cidr
  availability_zone       = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${title("${var.env_tag}")} Public Subnet"
  }
}

## Private Subnet 1
resource "aws_subnet" "private_subnet_first" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_first
  availability_zone       = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 1"
  }
}

## Private Subnet 2
resource "aws_subnet" "private_subnet_second" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_second
  availability_zone       = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 2"
  }
}

## Private subnet 3
resource "aws_subnet" "private_subnet_third" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_third
  availability_zone       = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${title("${var.env_tag}")} Private Subnet 3"
  }
}