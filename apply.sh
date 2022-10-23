#!/bin/bash

# source in env vars
. .env

# verify identity
aws sts get-caller-identity
terraform -chdir=terraform apply

envsubst < serverconfig.txt > data/serverconfig.txt
scp -i ${TF_VAR_server_key_pair_name}.pem -r ./data/* ubuntu@${IP}:.
