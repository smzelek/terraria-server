resource "aws_vpc" "terraria_server_network" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraria_server_network"
  }
}

resource "aws_subnet" "terraria_server_subnet" {
  cidr_block        = cidrsubnet(aws_vpc.terraria_server_network.cidr_block, 3, 1)
  vpc_id            = aws_vpc.terraria_server_network.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "terraria_server_subnet"
  }
}

resource "aws_eip" "terraria_server_ip" {
  instance = aws_instance.terraria_server.id
  vpc      = true
}

resource "aws_internet_gateway" "terraria_server_gateway" {
  vpc_id = aws_vpc.terraria_server_network.id
}

resource "aws_route_table" "terraria_server_route_table" {
  vpc_id = aws_vpc.terraria_server_network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraria_server_gateway.id
  }
}

resource "aws_route_table_association" "terraria_server_subnet_association" {
  subnet_id      = aws_subnet.terraria_server_subnet.id
  route_table_id = aws_route_table.terraria_server_route_table.id
}

resource "aws_security_group" "allow_trusted_ssh" {
  name        = "allow_trusted_ssh"
  description = "Allow Steve to connect to the Terraria server via SSH on whitelisted machines."

  vpc_id = aws_vpc.terraria_server_network.id

  ingress {
    description = "Incoming SSH traffic."
    cidr_blocks = var.trusted_ssh
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    description = "All outgoing traffic."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all_players" {
  name        = "allow_all_players"
  description = "Allow players to connect to the default port for the Terraria server."

  vpc_id = aws_vpc.terraria_server_network.id

  ingress {
    description = "Incoming Terraria connection traffic."
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 7777
    to_port     = 7777
    protocol    = "tcp"
  }

  egress {
    description = "All outgoing traffic."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
