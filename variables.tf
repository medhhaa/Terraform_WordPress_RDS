variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "SSH Key Name"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "WordPress Database Name"
  type        = string
  default     = "wordpressdb"
}

variable "db_user" {
  description = "WordPress Database User"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "WordPress Database Password"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Storage size for RDS"
  type        = number
  default     = 20
}

variable "instance_class" {
  description = "Instance type for RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR block"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "Availability Zone for Public Subnet"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone for Private Subnet"
  type        = string
  default     = "us-east-1b"
}