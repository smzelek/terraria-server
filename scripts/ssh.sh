#!/bin/bash
set -o errexit
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..
. .env

ssh -i "${TF_VAR_server_key_pair_name}.pem" -v ubuntu@${SERVER_IP}
