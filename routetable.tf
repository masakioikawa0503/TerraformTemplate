# ルートテーブル、デフォルトルートの定義
resource "aws_route_table" "tfPublicSubnetRouteTable" {
  vpc_id = aws_vpc.tfVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tfIGW.id
  }
  tags = {
      Name = "tfPublicSubnetRouteTable"
  }
}

# ルートテーブルとサブネットの紐づけ
resource "aws_route_table_association" "tfRouteTableAssociation" {
  subnet_id      = aws_subnet.tfPublicSubnet1a.id
  route_table_id = aws_route_table.tfPublicSubnetRouteTable.id
}