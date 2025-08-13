# AWS-VPS-with-Public-Private-Subnets-and-EC2-Deployment
This project provisions an AWS Virtual Private Cloud (VPC) with both **public and private subnets** using Terraform. An **EC2 instance** is deployed in the public subnet and automatically configured with Nginx to serve a simple web page. The private subnet is internet-enabled through a **NAT Gateway** for secure backend services.

Note:
I will also demonstrate the equivalent AWS Console of each HCL Block to make more sense on how I build a VPC.
