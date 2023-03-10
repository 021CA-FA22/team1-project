##########        EC2 for the Jenkins CICD        ##############

locals {
  ami_id = data.aws_ami.amznlx2.id
  ports  = [80, 443, 53, 23, 3389, 22, 50, 60, 70, 8080]
}

## VPC
resource "aws_vpc" "jenkins_vpc" {
  cidr_block           = "20.0.0.0/16"
  enable_dns_hostnames = true
}

## Public Subnet
resource "aws_subnet" "public_subnet" {
  cidr_block        = "20.0.1.0/24"
  vpc_id            = aws_vpc.jenkins_vpc.id
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "Public Subnet"
  }
}

## Private Subnet
resource "aws_subnet" "private_subnet" {
  cidr_block        = "20.0.2.0/24"
  vpc_id            = aws_vpc.jenkins_vpc.id
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "Private Subnet"
  }
}

## Internet Gateway
resource "aws_internet_gateway" "jenkins_ig" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags = {
    "Name" = "jenkins_internet_gateway"
  }
}

## Route Table
resource "aws_route_table" "jenkins_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_ig.id
  }
  tags = {
    "Name" = "Public Route Table"
  }
}

## Route Table ASS
resource "aws_route_table_association" "jenkins_ass" {
  route_table_id = aws_route_table.jenkins_rt.id
  subnet_id      = aws_subnet.public_subnet.id
}

## Security group
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow 80 and 22 ports into web server"
  vpc_id      = aws_vpc.jenkins_vpc.id

  dynamic "ingress" {
    for_each = local.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_sg"
  }
}

## EC2
resource "aws_instance" "jenkins" {
  ami                         = local.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.jenkins_sg.id]
  key_name                    = "jenkins-key"
  user_data                   = file("userdata")
}