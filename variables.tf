variable "project_name" {
  default = "v-portfolio"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_type" {
  description = "Small compute resource for testing purposes only."
  default = "t3.small"
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to SSH"
  type = string
  default = "0.0.0.0/0"
}

variable "key_name" {
  description = "Existing AWS key pair name for SSH"
  default     = "Training_Linux"  # Put your own .pem file
}