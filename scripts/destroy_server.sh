#!/bin/bash
set -o errexit
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..
. .env

terraform -chdir=terraform init
terraform -chdir=terraform destroy
