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

#
#resource "aws_s3_bucket" "terraform_state" {
#  bucket = "${team_name}-terraform-state"
#
#  # Prevent accidental deletion of this S3 bucket
#  lifecycle {
#    prevent_destroy = true
#  }
#
#  # Enable versioning so we can see the full revision history of our
#  # state files
#  versioning {
#    enabled = true
#  }
#
#  # Enable server-side encryption by default
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        sse_algorithm = "AES256"
#      }
#    }
#  }
#}
#
#resource "aws_dynamodb_table" "terraform_locks" {
#    name         = "terraform-up-and-running-locks"
#    billing_mode = "PAY_PER_REQUEST"
#    hash_key     = "LockID"
#
#    attribute {
#      name = "LockID"
#      type = "S"
#    }
#}
#
#terraform {
#    backend "s3" {
#  # Replace this with your bucket name!
#    bucket         = "terraform-up-and-running-state"
#    key            = "global/s3/terraform.tfstate"
#    region         = "us-east-2"
#
#  # Replace this with your DynamoDB table name!
#    dynamodb_table = "terraform-up-and-running-locks"
#    encrypt        = true
#    }
#}
#
#output "s3_bucket_arn" {
#    value       = aws_s3_bucket.terraform_state.arn
#    description = "The ARN of the S3 bucket"
#}
#
#output "dynamodb_table_name" {
#    value       = aws_dynamodb_table.terraform_locks.name
#    description = "The name of the DynamoDB table"
#}
