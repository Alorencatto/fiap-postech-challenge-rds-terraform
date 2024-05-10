provider "aws" {
#   shared_credentials_file = "/home/user/.aws/credentials"
  # profile = "academy"
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "random_string" "fiap-postech-selfservice-fastfood-database-password" {
  length  = 32
  upper   = true
  numeric  = true
  special = false
}

resource "aws_security_group" "fiap-postech-selfservice-fastfood" {
  vpc_id      = "${data.aws_vpc.default.id}"
  name        = "fiap-postech-selfservice-fastfood-sg"
  description = "Allow all inbound for Postgres on Fiap postech selfservice fast food project"
  
    ingress {
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_db_instance" "default" {
  identifier             = var.identifier
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.fiap-postech-selfservice-fastfood.id]
  username               = var.username
  password               = "${random_string.fiap-postech-selfservice-fastfood-database-password.result}"
}