# 2. Security Group
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id
  name   = "${var.project_name}-sg"

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# Updated block of code for best practice purposes
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Ingress rule: HTTP
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = var.ssh_allowed_cidr #0.0.0.0/0
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# Ingress rule: All traffic
resource "aws_vpc_security_group_ingress_rule" "allow_public_traffic_ipv4" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = var.ssh_allowed_cidr #0.0.0.0/0
  ip_protocol       = "-1"
}

# Egress rule: Allow all outbound
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = var.ssh_allowed_cidr #0.0.0.0/0
  ip_protocol       = "-1" # semantically equivalent to all ports
}