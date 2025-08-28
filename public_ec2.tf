# 1. EC2 Instance
resource "aws_instance" "web" {
  ami                    = "ami-0061376a80017c383" # Amazon Linux 2023 in ap-southeast-1
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  availability_zone = "ap-southeast-1a"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name
  user_data              = file("userdata.sh")

  tags = {
    Name = "${var.project_name}-ec2"
  }
}