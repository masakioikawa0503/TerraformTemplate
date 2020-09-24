# RDSの定義
resource "aws_db_instance" "tfRdsDBInstance" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.15"
    instance_class = "db.t2.micro"
    name = "TimeLine"
    username = "root"
    password = "password"
    allow_major_version_upgrade = false
    auto_minor_version_upgrade = true
    backup_retention_period = 0
    #backup_window = "15:00-16:00"
    #maintenance_window = "sun:18:00-sun:19:00"
    identifier = "aws-and-cfn-mysql"
    license_model = "general-public-license"
    monitoring_interval = 0
    multi_az = false
    port = 3306
    publicly_accessible = false
    deletion_protection = false
    tags = {
        Name = "tfRdsDBInstance"
    }
    availability_zone = aws_subnet.tfPrivateSubnet1a.availability_zone
    db_subnet_group_name = aws_db_subnet_group.tfDBSubnetGroup.id
    vpc_security_group_ids = [aws_security_group.tfdbSg.id]
    skip_final_snapshot = true
    apply_immediately = true
}

resource "aws_db_subnet_group" "tfDBSubnetGroup" {
  name = "aws-and-tf-db-subnetg"
  subnet_ids = [aws_subnet.tfPrivateSubnet1a.id, aws_subnet.tfPrivateSubnet1c.id]
  tags = {
    Name = "tfDBSubnetGroup"
  }
}