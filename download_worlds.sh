#!/bin/bash

# source in env vars
. .env

# download worlds from Worlds/ folder used by server to .
scp -i ${TF_VAR_server_key_pair_name}.pem ubuntu@${IP}:~/.local/share/Terraria/tModLoader/Worlds/* .
