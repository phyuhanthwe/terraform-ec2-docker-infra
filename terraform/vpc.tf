resource "aws_vpc" "custom_vpc" {
  region               = var.aws_region
  enable_dns_hostnames = true
  cidr_block           = "172.31.0.0/16"
  instance_tenancy     = "default"
  tags = {
    Name = "${var.prefix}-custom-vpc"
  }
}

resource "aws_subnet" "demo_subnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "172.31.0.0/20"
  availability_zone = var.aws_zone
  tags = {
    Name = "${var.prefix}-custom-subnet"
  }
}

resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "${var.prefix}-custom-igw"
  }
}

resource "aws_route_table" "demo_route_tabel" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = "${var.prefix}-custom-route_table"
  }
}

resource "aws_route_table_association" "demo_rt_association" {
  subnet_id      = aws_subnet.demo_subnet.id
  route_table_id = aws_route_table.demo_route_tabel.id
}

