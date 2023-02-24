# This values here will override the ones in the variables.tf if we provide the -var-file="app.tfvars" argument
# The file name can be of any name other than terraform.tfvars
ec2_instance_count = 2
instance_type      = "t3.micro"
availability_zone  = "us-east-2f"