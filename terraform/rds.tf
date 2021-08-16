provider "aws" {
  region = "us-west-2"
}

variable "team-name" {
  description = "team-name"
  type        = string
  default     = "default-team-name"
}

resource "aws_db_instance" "microservice-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "${replace(var.team-name, "-", "")}db"
  username             = "admin"
  password             = "thermalsKeepMeWarm"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

output "db_name" {
  value       = aws_db_instance.microservice-db.name
  description = "Name of the instance"
}

output "db_username" {
  value       = aws_db_instance.microservice-db.username
  description = "username for the instance"
}

output "db_secret" {
  value       = aws_db_instance.microservice-db.password
  description = "secret for the instance"
}

output "db_address" {
  value       = aws_db_instance.microservice-db.address
  description = "address for the instance"
}
