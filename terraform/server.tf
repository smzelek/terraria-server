resource "aws_instance" "terraria_server" {
  ami                  = local.amazon_ubuntu_ami
  instance_type        = "t3a.small"
  iam_instance_profile = aws_iam_instance_profile.terraria_server_profile.name
  key_name             = var.server_key_pair_name
  subnet_id            = aws_subnet.terraria_server_subnet.id
  vpc_security_group_ids = [
    aws_security_group.allow_trusted_ssh.id,
    aws_security_group.allow_all_players.id
  ]
  monitoring = true
  tags = {
    Name = "terraria_server"
  }
}
