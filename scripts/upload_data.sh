#!/bin/bash
set -o errexit
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..
. .env

FILTER=$1

if [[ -z $FILTER ]]; then
    echo 'Error: no filter set for upload_data. [scripts, config, worlds, mods, all]'
    exit
fi

if [[ $FILTER == "all" || $FILTER == "scripts" ]]; then
    echo "Uploading server admin scripts..."
    rsync -e "ssh -i $TF_VAR_server_key_pair_name.pem" ./terraform/data/* ubuntu@${SERVER_IP:_SERVER_IP}:.
fi

if [[ $FILTER == "all" || $FILTER == "config" ]]; then
    echo "Uploading config..."
    rm terraria/serverconfig.txt
    envsubst < terraria/serverconfig.txt.example > terraria/serverconfig.txt
    scp -i "${TF_VAR_server_key_pair_name}.pem" terraria/serverconfig.txt ubuntu@${SERVER_IP}:.
fi

if [[ $FILTER == "all" || $FILTER == "worlds" ]]; then
    echo "Uploading worlds..."
    read -r -p "Are you sure? Uploading worlds may delete your existing ones. Type 'yes' to continue: " response
    if [[ "$response" == "yes" ]]; then
        echo "Proceeding to upload worlds..."
        scp -i "${TF_VAR_server_key_pair_name}.pem" terraria/worlds/* ubuntu@${SERVER_IP}:~/.local/share/Terraria/tModLoader/Worlds/
    else
        echo "Skipped uploading worlds!"
    fi
fi

if [[ $FILTER == "all" || $FILTER == "mods" ]]; then
    echo "Uploading mods..."
    scp -i "${TF_VAR_server_key_pair_name}.pem" terraria/mods/* ubuntu@${SERVER_IP}:~/.local/share/Terraria/tModLoader/Mods/
fi

echo "Done!"
