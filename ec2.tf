# EC2の定義

data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "tfEC2Web" {
  ami           = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = "t2.micro"
  key_name = var.aws_key_name
  subnet_id = aws_subnet.tfPublicSubnet1a.id
  vpc_security_group_ids = [aws_security_group.tfWebSg.id]
  associate_public_ip_address = "true"
  root_block_device {
    volume_type = "gp2"
    volume_size = "8"
  }
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp2"
    volume_size = "8"
  }
  tags = {
    Name = "tfEC2Web"
  }
  private_ip = "10.0.10.10"
}