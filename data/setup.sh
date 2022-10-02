#!/bin/bash

sudo apt update && sudo apt install -y wget tmux unzip moreutils
wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-1442.zip
unzip terraria-server-1442.zip
chmod +x 1442/Linux/TerrariaServer.bin.x86_64

touch ~/server.log
crontab backupcron
crontab -l

bash run.sh
