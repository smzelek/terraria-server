locals {
  aws_region        = "us-east-1"
  amazon_ubuntu_ami = "ami-08c40ec9ead489470"
}

variable "trusted_ssh" {
    description = "CIDR Blocks allowed to SSH into the server."
    type = list(string)
}

variable "server_key_pair_name" {
    description = "Key pair for SSHing into the server."
    type = string
}
