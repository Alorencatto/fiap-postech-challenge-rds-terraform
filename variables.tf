variable "engine" {
  description = "The database engine"
  type = string
  default = "postgres"
}

variable "allocated_storage" {
  description = "The amount of allocated storage."
  type = number
  default = 5
}

variable "username" {
  description = "Username for the master DB user."
  default = "master"
  type = string
}

variable "password" {
  description = "password of the database"
  default = "password"
  type = string
}

variable "instance_class" {
  description = "The RDS instance class"
  default = "db.t3.micro"
  type = string
}

variable "engine_version" {
  description = "The engine version"
  default = "16.1"
  type = number
}

variable "identifier" {
  description = "The name of the RDS instance"
  default = "fiap-postech-selfservice-fastfood-database"
  type = string
}
