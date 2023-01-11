#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable --now httpd
echo "<h1>Welcome To Unixcloudtrainings - App1.</h1>" | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1 
echo "<! DOCTYPE html> <html><head><title>UCT</title></head> <body style=\"background-color:rgb(250, 219, 210);\"> <h1>Welcome To Unixcloudtrainings - APP-1</h1> <p>Introduction To Terraform Course</p><p>Application Version: V1</p> <h2>Website Made With Love By Terraform</h2> </body></html>" | sudo tee /var/www/html/app1/index.html
echo "running script for region: ${region}"
echo "Using image: ${image_id}"
echo "Launching instance with: ${instance_type}"
// %{ for k, v in tags ~}
// echo "The EC2 instance is running with the tags: ${k} --> ${v}"
// %{ endfor ~}
