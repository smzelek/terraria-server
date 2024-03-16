#!/bin/bash
set -o errexit
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..
. .env

terraform -chdir=terraform init
terraform -chdir=terraform apply
_SERVER_IP=$(terraform -chdir=terraform output -json | jq -r '.server_ip.value')

rm data/serverconfig.txt
envsubst < data/serverconfig.txt.example > data/serverconfig.txt
rsync -e "ssh -i $TF_VAR_server_key_pair_name.pem" -av --exclude=serverconfig.txt.example ./data/* ubuntu@${_SERVER_IP}:.

ssh -i "${TF_VAR_server_key_pair_name}.pem" ubuntu@${_SERVER_IP} 'mkdir -p ~/.local/share/Terraria/tModLoader/Mods/'
ssh -i "${TF_VAR_server_key_pair_name}.pem" ubuntu@${_SERVER_IP} 'mkdir -p ~/.local/share/Terraria/tModLoader/Worlds/'

echo "Server IP: ${_SERVER_IP}"
echo "Store this in your .env"
