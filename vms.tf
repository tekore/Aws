// AWS Compute instances
resource "aws_instance" "cloud_vpn" {
  ami           = var.ami.ubuntu2004
  instance_type = var.vm-type.nano
  key_name         = "aws"
  tags = {
    Name = "cloud_vpn"
  }
  network_interface {
    network_interface_id = aws_network_interface.cloud_vpn.id
    device_index = 0
  }
}

resource "aws_instance" "cloud_store" {
  ami           = var.ami.ubuntu2004
  instance_type = var.vm-type.small
  key_name         = "aws"
  tags = {
    Name = "cloud_store"
  }
  network_interface {
    network_interface_id = aws_network_interface.cloud_store.id
    device_index = 0
  }
}

// Attach security groups to interfaces
resource "aws_network_interface_sg_attachment" "sg_ssh_attachment" {
  security_group_id = aws_security_group.allow_ssh.id
  network_interface_id = aws_network_interface.cloud_vpn.id
}

resource "aws_network_interface_sg_attachment" "sg_wireguard_attachment" {
  security_group_id = aws_security_group.allow_wireguard.id
  network_interface_id = aws_network_interface.cloud_vpn.id
}
