# Provider Configuration
# Specifies the AWS provider and region for Terraform to manage resources in.
provider "aws" {
  region = "us-east-1"
}

# VPC and Networking Resources
# Create a VPC, subnets, and related networking infrastructure for WordPress.
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

# Networking Module (Subnets, IGW, Route Tables)
module "networking" {
  source              = "./modules/networking"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}

# Security Groups Module
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

# EC2 Module (WordPress)
module "ec2" {
  source             = "./modules/ec2"
  instance_type      = var.instance_type
  subnet_id          = module.networking.public_subnet_id
  security_group_ids = [module.security_groups.ec2_sg_id]
  key_name           = var.key_name
  db_name            = var.db_name
  db_user            = var.db_user
  db_password        = var.db_password
  db_host            = module.rds.db_endpoint
}


# RDS Module (MySQL)
module "rds" {
  source = "./modules/rds"
  #db_subnet_group_name = module.rds.db_subnet_group_name
  security_group_id = module.security_groups.rds_sg_id
  db_name           = var.db_name
  db_user           = var.db_user
  db_password       = var.db_password
  private_subnet_id = module.networking.private_subnet_id
  public_subnet_id  = module.networking.public_subnet_id
}

terraform {
  backend "s3" {
    bucket = "terraform-rds-activity-2"   # Your S3 bucket name
    key    = "terraform/state/myproject.tfstate"  # Path within the bucket to store state
    region = "us-east-1"             # Region where the S3 bucket is located
  }
}


