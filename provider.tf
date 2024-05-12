terraform {

  required_version = "~> 1.0"

  # --- At first terraform init must comment this block
  backend "s3" {
    bucket         = "postech-challenge-3-state-rds"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "alias/terraform-bucket-key"
    dynamodb_table = "postech-challenge-3-state-rds"
  }
  # --- At first terraform init must comment this block
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}