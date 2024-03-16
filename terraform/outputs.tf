output "server_ip" {
  value       = aws_eip.terraria_server_ip.public_ip
}
