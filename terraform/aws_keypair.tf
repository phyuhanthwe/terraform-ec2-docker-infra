resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "demo-key" {
  count      = var.create_ec2_keypair ? 1 : 0
  key_name   = "${var.ec2_keypair_name}-keypair"
  public_key = tls_private_key.rsa-key.public_key_openssh

  tags = merge(
    { Name = "${var.friendly_name}-keypair" },
    { Name = "${var.ec2_keypair_name}-keypair" },
    var.common_tags
  )
}

resource "local_file" "ssh-private-key" {
  filename = "${path.root}/generated-key/${var.ec2_keypair_name}-key.pem"
  content  = tls_private_key.rsa-key.private_key_openssh

  provisioner "local-exec" {
    command = "chmod 400 ${path.root}/generated-key/${var.ec2_keypair_name}-key.pem"
  }
}