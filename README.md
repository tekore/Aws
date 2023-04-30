![standard-readme compliant](https://img.shields.io/badge/Terraform-6B42BC?style=for-the-badge&logo=terraform&logoColor=white) ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

# Terraform Automation

Automation of AWS infrastructure.

## Table of Contents
- [Goals](#Goals)
- [Install](#install)
- [Usage](#usage)
- [Issues](#Issues)
- [Maintainers](#maintainers)

## Goals
The goals for this repository are:

1. Use Terraform to fully automate the creation of all virtual machines, networking, data storage, budgets and security groups on AWS.
2. Produce the code in such a way that's usable, readable and maintainable by third parties.
3. Ensure the code is able to be built upon and expanded to add additional infrastructure and features.
4. Keep in-line with IAC methodologies.

## Install
This project uses [Terraform](https://www.terraform.io/). You'll need to install Terraform to run this code, once Terraform is installed:
- Clone the repo:
```sh
$ git clone https://github.com/tekore/Aws
```

- Initialise Terraform
```sh
$ terraform init
```

## Usage
The provided .tfvars template "[tfvars-template](https://github.com/tekore/Aws/blob/main/tfvars-template "tfvars-template")" will need to be updated with the relevant variables needed for your install.  

Once this is done, run;
```sh
$ terraform plan --var-file="template.tfvars"
$ terraform apply --var-file="template.tfvars"
```

## Issues
- If there is no availabilty for the selected zone the terraform build will fail instead of using an available instance. Functionality for terraform to use only available instances will be included in a future push.

## Maintainers
[@Tekore](https://github.com/tekore)
