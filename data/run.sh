#!/bin/bash
tmux new -s terraria "./tmodserver/start-tModLoaderServer.sh -config ~/serverconfig.txt | tee >(ts '[%d-%m-%y %H:%M:%S]' >> terraria.log)"
