#!/bin/bash
set -o errexit
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..
. .env

# download worlds from Worlds/ folder used by server to .
scp -i "${TF_VAR_server_key_pair_name}.pem" ubuntu@${SERVER_IP}:~/.local/share/Terraria/tModLoader/Worlds/* .
