variable "db_name" {
  description = "The database name for WordPress"
  type        = string
  default     = "wordpressdb"
}

variable "db_user" {
  description = "The database username for WordPress"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The database password for WordPress"
  type        = string
  sensitive   = true
}

variable "security_group_id" {
  description = "The security group ID for RDS"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for RDS"
  type        = string
}
variable "public_subnet_id" {
  description = "Public subnet ID for RDS"
  type        = string
}