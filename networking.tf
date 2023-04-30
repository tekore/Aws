// VPC
resource "aws_vpc" "main_network" {
  cidr_block       = var.networking.ip-range-internal4
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}

// Add Secondary subnet to VPC
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.main_network.id
  cidr_block = var.networking.ip-range-internal5
}

// Add Third subnet to VPC
resource "aws_vpc_ipv4_cidr_block_association" "third_cidr" {
  vpc_id     = aws_vpc.main_network.id
  cidr_block = var.networking.ip-range-internal6
}

// Public Subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main_network.id
  cidr_block = var.networking.ip-range-internal4
  tags = {
    Name = "Public_subnet"
  }
}

// Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main_network.id
  cidr_block = var.networking.ip-range-internal5
  tags = {
    Name = "Private_subnet"
  }
  depends_on = [aws_vpc_ipv4_cidr_block_association.secondary_cidr]
}

// Cloud VPN Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.cloud_vpn.id
  vpc      = true
}

// Internet Gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main_network.id
  tags = {
    Name = "Internet Gateway"
  }
}

// Public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_network.id
  route {
    cidr_block = var.networking.ip-range-external
    gateway_id = aws_internet_gateway.gateway.id
  }
  route {
    cidr_block = var.networking.ip-range-tunnel
    network_interface_id = aws_network_interface.cloud_vpn.id
  }
}

// Private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_network.id
  route {
    cidr_block = var.networking.ip-range-external
    network_interface_id = aws_network_interface.cloud_vpn.id
  }
}

// Set main route table
resource "aws_main_route_table_association" "public_route_association" {
  vpc_id         = aws_vpc.main_network.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_route_table.id
}

// Static addresses
resource "aws_network_interface" "cloud_vpn" {
  subnet_id = aws_subnet.public.id
  private_ips = [var.static-ips.vpn]
  source_dest_check = false
}
resource "aws_network_interface" "cloud_store" {
  subnet_id = aws_subnet.private.id
  private_ips = [var.static-ips.store]
}

// SSH Key pair
resource "aws_key_pair" "aws_key" {
  key_name   = "aws"
  public_key = var.sshkey.pub_key
}
