resource "aws_eip" "tfm_elastic_ip" {
  depends_on = [aws_internet_gateway.tfm_igw]
  instance   = aws_instance.tfm_blue_ec2.id
  vpc        = true
  tags = {
    "Name" = "Auto-tfm-eip"
  }
}