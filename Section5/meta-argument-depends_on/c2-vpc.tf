# Steps:
# Create a VPC
resource "aws_vpc" "tfm_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Auto-tfm-vpc"
  }
}

# Create a subnet
resource "aws_subnet" "tfm_subnet" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.tfm_vpc.id
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Auto-tfm-subnet-1"
  }
}

# Create an Internet gateway
resource "aws_internet_gateway" "tfm_igw" {
  vpc_id = aws_vpc.tfm_vpc.id
  tags = {
    "Name" = "Auto-tfm-igw"
  }
}

# Create a route table
resource "aws_route_table" "tfm_rtb" {
  vpc_id = aws_vpc.tfm_vpc.id
  tags = {
    "Name" = "Auto-tfm-rtb"
  }
}

# Allocate routes
resource "aws_route" "tfm_route" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tfm_igw.id
  route_table_id         = aws_route_table.tfm_rtb.id
}

# Route table association w/ subnets
resource "aws_route_table_association" "tfm_rtb_association" {
  route_table_id = aws_route_table.tfm_rtb.id
  subnet_id      = aws_subnet.tfm_subnet.id
}

# Create a Security group
resource "aws_security_group" "tfm_sgp" {
  name        = "ssh-http-sgp"
  description = "Allow ssh and http inbound traffic"
  vpc_id      = aws_vpc.tfm_vpc.id
  ingress {
    description = "Allow ssh on port 22"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow outbound traffics"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  ingress {
    description = "Allow http on port 80"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  tags = {
    "Name" = "Auto-tfm-ssh-http-sg"
  }
}