#!/bin/bash
set -o errexit
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..
. .env

terraform -chdir=terraform init
terraform -chdir=terraform apply
_SERVER_IP=$(terraform -chdir=terraform output -json | jq -r '.server_ip.value')

sed -i "s/SERVER_IP=.*/SERVER_IP=${_SERVER_IP}/g" .env

ssh -i "${TF_VAR_server_key_pair_name}.pem" ubuntu@${_SERVER_IP} 'mkdir -p /home/ubuntu/.local/share/Terraria/tModLoader/Mods/'
ssh -i "${TF_VAR_server_key_pair_name}.pem" ubuntu@${_SERVER_IP} 'mkdir -p /home/ubuntu/.local/share/Terraria/tModLoader/Worlds/'
