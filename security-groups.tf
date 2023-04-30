// SSH
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main_network.id
  ingress {
    description      = "Allow SSH"
    from_port        = var.sg-ports.ssh
    to_port          = var.sg-ports.ssh
    protocol         = var.sg-protocol.ssh
    cidr_blocks      = [var.networking.ip-range-external]
  }
  egress {
    from_port        = var.sg-ports.close
    to_port          = var.sg-ports.close
    protocol         = var.sg-protocol.close
    cidr_blocks      = [var.networking.ip-range-external]
  }
  tags = {
    Name = "allow_ssh"
  }
  depends_on = [aws_vpc.main_network]
}

//Wireguard
resource "aws_security_group" "allow_wireguard" {
  name        = "allow_wireguard"
  description = "Allow wireguard inbound traffic"
  vpc_id      = aws_vpc.main_network.id
  ingress {
    description      = "Allow wireguard"
    from_port        = var.sg-ports.vpn
    to_port          = var.sg-ports.vpn
    protocol         = var.sg-protocol.vpn
    cidr_blocks      = [var.networking.ip-range-external]
  }
  egress {
    from_port        = var.sg-ports.close
    to_port          = var.sg-ports.close
    protocol         = var.sg-protocol.close
    cidr_blocks      = [var.networking.ip-range-external]
  }
  tags = {
    Name = "allow_wireguard"
  }
  depends_on = [aws_vpc.main_network]
}
