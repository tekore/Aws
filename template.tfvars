//budget
budget = {
    name = ""
    limit-amount = ""
    limit-unit = ""
    period-start = ""
    period-end = ""
    time-unit = ""
    cost-filter = ""
    threshold = 
    email = ""
}

//cloud-vms.tf
vm-type = {
  nano   = ""
  micro  = ""
  small  = ""
  medium = ""
}

tags = {
  vpn   = ""
  store = ""
}

ami = {
  ubuntu2004 = ""
  ubuntu2204 = ""
}

aws-network = {
  subnetwork = ""
  network    = ""
}


sg-protocol = {
  wiki  = ""
  ssh   = ""
  vpn   = ""
  close = ""
}

sg-ports = {
  close  = ""
  wiki   = ""
  ssh    = ""
  vpn    = ""
}

// main.tf   
project = {
  region     = ""
  access_key = ""
  secret_key = ""
}


//networking.tf
networking = {
  network            = ""
  mtu                = ""
  ip-range-internal4 = ""
  ip-range-internal5 = ""
  ip-range-internal6 = ""
  ip-range-tunnel    = ""
  ip-range-external  = ""
}

static-ips = {
  vpn   = ""
  store = ""
}

sshkey = {
  pub_key = ""
}

