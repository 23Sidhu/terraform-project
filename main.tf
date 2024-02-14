provider "aws" {
region = "us-east-1"
access_key = "AKIATZ7E2OTZXMJ4XU54"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.micro"
   key_name = "sid-key"
   vpc_security_group_ids = [aws_security_group.three.id]
   availability_zone = "us-south-1a"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd 
sudo chkconfig httpd on
sudo echo "Hai All This is My Zomato-1 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.micro"
   key_name = "sid-key"
   vpc_security_group_ids = [aws_security_group.three.id]
   availability_zone = "us-south-1b"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo chkconfig httpd on
sudo echo "Hai All This is My Zomato-2 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "Zomato-1"
}
}

