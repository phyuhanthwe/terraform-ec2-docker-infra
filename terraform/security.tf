resource "aws_security_group" "demo_sg" {
  vpc_id = aws_vpc.custom_vpc.id
  name   = "demo-sg"
  tags = {
    Name = "${var.prefix}-custom-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.demo_sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.demo_sg.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "124.121.138.0/24"
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
  security_group_id = aws_security_group.demo_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}