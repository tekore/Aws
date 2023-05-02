// AWS EC2
resource "aws_instance" "cloud_vpn" {
  ami		= data.aws_ami.ubuntu.id
  instance_type = var.vm-type.nano
  key_name         = "aws"
  tags = {
    Name = "cloud_vpn"
  }
  network_interface {
    network_interface_id = aws_network_interface.cloud_vpn.id
    device_index = 0
  }
  depends_on = [data.aws_ami.ubuntu]
}

resource "aws_instance" "cloud_store" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vm-type.small
  key_name         = "aws"
  tags = {
    Name = "cloud_store"
  }
  network_interface {
    network_interface_id = aws_network_interface.cloud_store.id
    device_index = 0
  }
  depends_on = [data.aws_ami.ubuntu]
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

// Up-To-Date Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = [var.ami-ubuntu.owner]
  filter {
    name   = "name"
    values = [var.ami-ubuntu.ubuntu]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
