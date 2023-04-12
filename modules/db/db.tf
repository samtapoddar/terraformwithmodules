resource "aws_db_instance" "db" {
  identifier        = var.db_name
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  allocated_storage = 10
  username          = var.db_username
  password          = var.db_password
#   db_subnet_group_name = aws_db_subnet_group.example-subnet.name

  tags = {
    Name = var.db_name
  }
}

# resource "aws_db_subnet_group" "example-subnet" {
#   name       = "example-subnet"
#   subnet_ids = var.subnet_ids
# }

output "db_endpoint" {
  value = aws_db_instance.db.endpoint
}