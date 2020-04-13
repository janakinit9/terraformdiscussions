#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "hi I am $(hostname -f)" > /var/www/html/index.html
