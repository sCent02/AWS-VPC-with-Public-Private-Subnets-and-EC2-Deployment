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
  default = "10.0.2.0/24"
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  description = "Existing AWS key pair name for SSH"
  default     = "my-key" 
}