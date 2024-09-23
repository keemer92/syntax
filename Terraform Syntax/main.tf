#EC2
resource "aws_instance" "example name for Terraform" {
  ami           = "Find the AMI you want to use and note its ID"
  instance_type = "t2.micro"
}

#S3bucket
resource "aws_s3_bucket" "Unique Terraform Name" {
  bucket = "Globally Unique name"  # Replace with a unique bucket name

  tags = {
    Name = "example-bucket"
  }
}

# Create a VPC
resource "aws_vpc" "Unique Terrraform Name" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block. Network size

  tags = {
    Name = "example-vpc"
  }
}

# Create a Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"  # Adjust based on your region

  tags = {
    Name = "MySubnet"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Create a Route Table
resource "aws_route_table" "Unique Terraform Name" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Create a Security Group
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22  # Allow SSH access
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change to a more restricted CIDR for security
  }

  ingress {
    from_port   = 80  # Allow HTTP access
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

resource "aws_iam_group" "example" {
  name = "example-group"
}

# Output the VPC ID, Subnet ID, and Security Group ID
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "security_group_id" {
  value = aws_security_group.my_security_group.id
}


resource "aws_iam_role" "example" {
  name               = "example_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}


