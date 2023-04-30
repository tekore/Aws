terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

// AWS provider
provider "aws" {
  region     = var.project.region
  access_key = var.project.access_key
  secret_key = var.project.secret_key
}

//Configure availabilty zones
data "aws_availability_zones" "all" {}

data "aws_ec2_instance_type_offering" "available-instance-types" {
  for_each = toset(data.aws_availability_zones.all.names)
  filter {
    name   = "instance-type"
    values = [var.vm-type.nano, var.vm-type.micro, var.vm-type.small]
  }
  filter {
    name   = "location"
    values = [each.value]
  }
  location_type = "availability-zone"
  preferred_instance_types = [var.vm-type.nano, var.vm-type.micro]
}
