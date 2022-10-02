resource "aws_instance" "terraria_server" {
  ami           = local.amazon_ubuntu_ami
  instance_type = "t2.small"
  key_name      = var.server_key_pair_name
  subnet_id     = aws_subnet.terraria_server_subnet.id
  vpc_security_group_ids = [
    aws_security_group.allow_trusted_ssh.id,
    aws_security_group.allow_all_players.id
  ]
  monitoring = true
}

resource "null_resource" "test" {
  provisioner "file" {
    source      = "./data/"
    destination = "."
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = aws_eip.terraria_server_ip.public_ip
    timeout     = "20s"
    private_key = file("./${var.server_key_pair_name}.pem")
  }
}
