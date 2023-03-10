## Vpc 
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC"
  }
}

## First availability zone (1a)
data "aws_availability_zone" "us-east-1a" {
  name = "us-east-1a"
}

## Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

## Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 1"
  }
}

## Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 2"
  }
}

## Private Subnet 3
resource "aws_subnet" "private_subnet_3" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = data.aws_availability_zone.us-east-1a.id
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 3"
  }
}
























## Second availability zone (1b)
data "aws_availability_zone" "us-east-1b" {
  name = "us-east-1b"
}

## Public Subnet
resource "aws_subnet" "public_subneet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

## Private Subnet 1
resource "aws_subnet" "private_subnet_first" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 1"
  }
}

## Private Subnet 2
resource "aws_subnet" "private_subnet_second" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 2"
  }
}

## Private subnet 3
resource "aws_subnet" "private_subnet_third" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = data.aws_availability_zone.us-east-1b.id
  map_public_ip_on_launch = false
  tags = {
    Name = "Private Subnet 3"
  }
}

