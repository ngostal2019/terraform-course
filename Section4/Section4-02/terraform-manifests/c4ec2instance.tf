#Availaibility Zones Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name = "opt-in-status"
    values = [ "opt-in-not-required" ]
  }
}

# Ec2 resources
resource "aws_instance" "ec2instance" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
    # Creating resources in different AZ with for_each function and converting list to set of list
    for_each = toset(data.aws_availability_zones.my_azones.names)
    availability_zone = each.key
    key_name = var.ec2_keypair
    tags = {
        Name = "for_each_Demo.${each.value}" # Or you may use each.key since we have a set of list
    }
}
  
/*
Note: using object eack.key = each.value when using for_each in a set.
Using each.key != each.value when using for_each in map
*/