terraform {
    # cloud {
    #   organization = "hellocloud-phyu-tfc"
    #   hostname     = "app.terraform.io"
    #   workspaces {
    #     name = "terraform-ec2-docker-infra"
    #   }
    # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.6.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.aws_region
  profile = "master-console-admin"
}