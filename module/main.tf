variable "cidr_1" {}

variable "cidr_2" {}

variable "cidr_3" {}

variable "cidr_4" {}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "test_nested" {
  name        = "test_nested"
  description = "test"
  vpc_id      = "vpc-0ef62214b4149796f"

  tags {
    name = "webapp00"
  }

  egress {
    description = "dns servers"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["${var.cidr_3}"]
    self        = false
  }

  ingress {
    description = "internet facing lbs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_4}"]
  }
}