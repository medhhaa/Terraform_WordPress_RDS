variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be deployed"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the EC2 instance"
  type        = list(string)
}

variable "key_name" {
  description = "The name of the SSH key to access the instance"
  type        = string
}

variable "db_name" {
  description = "The database name for WordPress"
  type        = string
}

variable "db_user" {
  description = "The database username for WordPress"
  type        = string
}

variable "db_password" {
  description = "The database password for WordPress"
  type        = string
  sensitive   = true
}

variable "db_host" {
  description = "The RDS endpoint"
  type        = string
}