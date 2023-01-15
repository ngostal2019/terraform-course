# This values here will override the ones in the variables.tf if we provide the -var-file="dbstorage.tfvars" argument
# The file name can be of any name other than terraform.tfvars
ec2_instance_count = 5
instance_type      = "t3.xlarge"
availability_zone  = "us-east-2b"