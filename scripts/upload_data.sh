#!/bin/bash
set -o errexit
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..
. .env

scp -i "${TF_VAR_server_key_pair_name}.pem" worlds/* ubuntu@${SERVER_IP}:~/.local/share/Terraria/tModLoader/Worlds/
scp -i "${TF_VAR_server_key_pair_name}.pem" mods/* ubuntu@${SERVER_IP}:~/.local/share/Terraria/tModLoader/Mods/
