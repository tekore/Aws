//budget.tf
variable "budget" {
  type = map(string)
  default = {
    name = ""
    limit-amount = "1"
    limit-unit = "USD"
    period-start = "2020-01-01_00:00"
    period-end = "2087-01-1_00:00"
    time-unit = "MONTHLY"
    cost-filter = "Amazon Relational Database Service"
    threshold = 1
    email = "something@mail.com"
  }
}

//vms.tf
variable "vm-type" {
  type = map(string)
  default = {
    nano = "t2.nano"
    micro = "t2.micro"
    small = "t2.small"
  }
}

variable "tags" {
  type    = map(string)
  default = {
    vpn = "vpn"
    store = "storage"
  }
}

variable "ami-ubuntu" {
  type = map(string)
  default = {
    owner = "099720109477"
    ubuntu = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  }
}

variable "aws-network" {
  type = map(string)
  default = {
    subnetwork = "subnetwork"
    network = "network"
  }
}

variable "sg-protocol" {
  type = map(string)
  default = {
    wiki = "tcp"
    ssh = "tcp"
    vpn = "udp"
    close = "-1"
  }
}

variable "sg-ports" {
  type = map(string)
  default = {
    close = "0"
    wiki = "8800"
    ssh = "2222"
    vpn = "1114"
  }
}

// main.tf     
variable "project" {
  type = map(string)
  default = {
    region = "us-west-1"
    access_key = ""
    secret_key = ""
  }
}

//networking.tf
variable "networking" {
  type = map(string)
  default = {
    network = "network"
    mtu = "1500"
    ip-range-internal4 = "10.56.1.0/24"
    ip-range-internal5 = "10.57.1.0/24"
    ip-range-internal6 = "10.58.1.0/24"
    ip-range-tunnel = "10.56.8.0/24"
    ip-range-external = "0.0.0.0/0"
  }
}

variable "sshkey" {
  type = map(string)
  default = {
    pub_key = ""
  }
}

variable "static-ips" {
  type = map(string)
  default = {
    vpn = "10.56.1.253"
    store = "10.57.1.20"
  }
}

//iam.tf
variable "iam-storage" {
  type = map(string)
  default = {
    user-name = "suser"
    policy-name = "s-policy"
    policy-action = "S3:*"
  }
}



//route53.tf


