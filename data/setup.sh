#!/bin/bash

sudo apt update && sudo apt install -y wget tmux unzip moreutils
wget https://github.com/tModLoader/tModLoader/releases/download/v2022.09.47.4/tModLoader.zip
unzip tModLoader.zip -d tmodserver
chmod +x tmodserver/start-tModLoaderServer.sh

crontab backupcron
crontab -l

bash run.sh
