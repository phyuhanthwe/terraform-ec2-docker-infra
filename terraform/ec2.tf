resource "aws_instance" "demo_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = aws_key_pair.demo-key[0].key_name

  subnet_id = aws_subnet.demo_subnet.id

  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  associate_public_ip_address = true

  user_data = file("${path.module}/../scripts/install-docker.sh")

  tags = {
    Name = "${var.prefix}-demo-instance"
  }
}