#!/bin/bash
echo -e "\n----------------------"  | ts '[%d-%m-%y %H:%M:%S]' >> terraria.log
echo "Running start server script."  | ts '[%d-%m-%y %H:%M:%S]' >> terraria.log
echo -e "----------------------\n"  | ts '[%d-%m-%y %H:%M:%S]' >> terraria.log
tmux new -d -s terraria "echo n | ./tmodserver/start-tModLoaderServer.sh -config ~/serverconfig.txt | tee >(ts '[%d-%m-%y %H:%M:%S]' >> terraria.log)"
