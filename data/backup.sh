#!/bin/bash

echo "Attempting server backup." | ts
tmux send-keys -t terraria "say beep-boop. Backing up the world." C-m | ts
tmux send-keys -t terraria "save" C-m | ts
tmux send-keys -t terraria "say boop-beep. Backup complete." C-m | ts
echo "Server backup complete." | ts 
