# パブリックサブネットの定義
resource "aws_subnet" "tfPublicSubnet1a" {
  cidr_block        = "10.0.10.0/24"
  availability_zone = "ap-northeast-1a"
  vpc_id            = aws_vpc.tfVPC.id
  map_public_ip_on_launch = true
  tags = {
    Name = "tfPublicSubnet1a"
  }
}

# プライベートサブネットの定義
resource "aws_subnet" "tfPrivateSubnet1a" {
  cidr_block        = "10.0.20.0/24"
  availability_zone = "ap-northeast-1a"
  vpc_id            = aws_vpc.tfVPC.id
  tags = {
    Name = "tfPrivateSubnet1a"
  }
}

resource "aws_subnet" "tfPrivateSubnet1c" {
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-northeast-1c"
  vpc_id            = aws_vpc.tfVPC.id
  tags = {
    Name = "tfPrivateSubnet1c"
  }
}