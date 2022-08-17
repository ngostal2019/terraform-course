# Ec2 resources
resource "aws_instance" "ec2instance" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    # instance_type = var.instance_type_list[1] #List
    # instance_type = var.instance_type_map["prod"] # Map
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
    key_name = var.ec2_keypair
    count = 2 # Number of instances to launch
    tags = {
        Name = "Count-Demo-${count.index}"  # count.index follow an incremental value number
    }
}

