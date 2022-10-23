#!/bin/bash

bash apply.sh

# source in env vars
. .env

scp -i ${TF_VAR_server_key_pair_name}.pem ${WORLD}.wld ubuntu@${IP}:~/.local/share/Terraria/tModLoader/Worlds/
scp -i ${TF_VAR_server_key_pair_name}.pem ${WORLD}.twld ubuntu@${IP}:~/.local/share/Terraria/tModLoader/Worlds/

echo "Make sure to SCP any desired mods to ubuntu@${IP}:~/.local/share/Terraria/tModLoader/Mods/"

ssh -i ${TF_VAR_server_key_pair_name}.pem -v ubuntu@${IP}
