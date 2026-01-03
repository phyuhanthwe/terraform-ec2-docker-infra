variable "prefix" {
  type    = string
  default = "demo"
}

variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "aws_zone" {
  type    = string
  default = "ap-southeast-1a"
}

variable "create_ec2_keypair" {
  type    = bool
  default = true
}

variable "ec2_keypair_name" {
  type    = string
  default = ""
}

variable "friendly_name" {
  type    = string
  default = "demo"
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

# locals {
#   username = "ec2-instance-user"
# }