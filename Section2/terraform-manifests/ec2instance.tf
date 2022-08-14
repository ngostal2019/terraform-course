resource "aws_instance" "ec2instance" {
    ami = "ami-051dfed8f67f095f5"
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
        Name = "ec2-instance-demo"
    }
}