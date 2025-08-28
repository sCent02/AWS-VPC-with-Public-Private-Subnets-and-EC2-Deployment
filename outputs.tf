output "ec2_public_ip" {
  description = "Public IP of the web server"
  value = aws_instance.web.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.web.public_dns
}