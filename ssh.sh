#!/bin/bash

. .env
ssh -i ${TF_VAR_server_key_pair_name}.pem -v ubuntu@${IP}
