#!/bin/bash

sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable --now httpd
echo "<h1>Welcome To Unixcloudtrainings - App1.</h1>" | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1 
echo "<!DOCTYPE html> <html><head><title>UCT</title></head> <body style="background-color:rgb(250, 219, 210);"> <h1>Welcome To Unixcloudtrainings - APP-1</h1> <p>Terraform Course</p><p>Application Version: V1</p> </body></html>" | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html