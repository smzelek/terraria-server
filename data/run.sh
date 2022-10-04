#!/bin/bash
tmux new -s terraria "./tmodserver/start-tModLoaderServer.sh -config ~/serverconfig.txt | tee terraria.log"
