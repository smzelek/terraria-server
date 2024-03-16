#!/bin/bash

sudo apt update && sudo apt install -y wget tmux unzip moreutils
wget https://github.com/tModLoader/tModLoader/releases/download/v2024.01.3.0/tModLoader.zip
unzip tModLoader.zip -d tmodserver
chmod +x tmodserver/start-tModLoaderServer.sh
