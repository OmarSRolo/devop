variable "engine_db" {}
variable "name_db" {}
variable "password_db" {}
variable "username_db" {}
variable "allocated_storage_db" {}
variable "instance_class" {}

resource "aws_db_instance" "databases" {

  allocated_storage    = var.allocated_storage_db
  engine               = var.engine_db
  engine_version       = "13"
  instance_class       = var.instance_class
  db_name              = var.name_db
  username             = var.username_db
  password             = var.password_db
  skip_final_snapshot  = true
}

output "connection_string_db" {
  value = aws_db_instance.databases.endpoint
}
