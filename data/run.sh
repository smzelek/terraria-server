#!/bin/bash
tmux new -s terraria "./1442/Linux/TerrariaServer.bin.x86_64 -config ~/serverconfig.txt | tee terraria.log"
