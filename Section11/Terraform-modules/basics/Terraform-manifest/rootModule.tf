module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["one", "two"])
  name     = "terraform-${each.value}-module"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-08c8f83c53078dceb"]
  subnet_id              = "subnet-0c306afd7b688e62c"
  user_data              = file("app1-install.sh")

  tags = {
    Name        = "Tfm-module-${each.key}"
    Terraform   = "true"
    Environment = "dev"
  }
}