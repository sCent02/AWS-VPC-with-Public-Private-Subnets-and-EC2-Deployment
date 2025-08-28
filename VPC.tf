# 1. Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr # 10.0.0.0/16
  tags = {
    Name = "${var.project_name}-vpc" # vpc-portfolio
  }
}

# 2. Create Public and Private Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

/*
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "${var.project_name}-private-subnet"
  }
}
*/

# 3. Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}



# 4. Create Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}