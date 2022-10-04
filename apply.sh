#!/bin/bash

# source in env vars
. .env

# verify identity
aws sts get-caller-identity

envsubst < serverconfig.txt > data/serverconfig.txt
terraform -chdir=terraform apply

scp -i ${TF_VAR_server_key_pair_name}.pem -r ./data/* ubuntu@${IP}:.
scp -i ${TF_VAR_server_key_pair_name}.pem ${WORLD}.wld ubuntu@${IP}:~/.local/share/Terraria/tModLoader/Worlds/
scp -i ${TF_VAR_server_key_pair_name}.pem ${WORLD}.twld ubuntu@${IP}:~/.local/share/Terraria/tModLoader/Worlds/

echo "Make sure to SCP any desired mods to ubuntu@${IP}:~/.local/share/Terraria/tModLoader/Mods/"

ssh -i ${TF_VAR_server_key_pair_name}.pem -v ubuntu@${IP}
