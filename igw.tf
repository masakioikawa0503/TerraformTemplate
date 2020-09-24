#IGWの定義
resource "aws_internet_gateway" "tfIGW" {
  vpc_id = aws_vpc.tfVPC.id

  tags = {
    Name = "tfIGW"
  }
}