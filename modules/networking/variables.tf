# Defines input variables for subnets, IGW, and route tables.
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  #default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR block"
  type        = string
  #default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "Availability Zone for Public Subnet"
  type        = string
  #default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone for Private Subnet"
  type        = string
  #default     = "us-east-1b"
}