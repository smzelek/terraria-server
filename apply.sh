#!/bin/bash

# source in env vars
. .env

# verify identity
aws sts get-caller-identity

terraform -chdir=terraform apply
